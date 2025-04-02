{{ config(
    materialized='incremental',
    unique_key= ['year_month', 'taxi_id']
) }}


WITH trips_with_tips AS (
    -- Select only 3 ids who has max tips on Apr, 2018 
    SELECT 
        taxi_id,
        FORMAT_TIMESTAMP('%Y-%m', trip_start_timestamp) AS year_month,
        SUM(tips) AS tips_sum
    FROM {{ ref('stg_taxi_trips') }}
    WHERE taxi_id IN (SELECT taxi_id FROM {{ ref('top_three_cars') }})
    
    GROUP BY 1, 2
),

tips_change_compared_to_prev_month AS (
    SELECT
    -- Calculate the % change of tips between current and previous month.
    -- Usage of incremental model.
        taxi_id,
        year_month,
        tips_sum,
        ((tips_sum - LAG(tips_sum) OVER (PARTITION BY taxi_id ORDER BY year_month)) / 
         NULLIF(LAG(tips_sum) OVER (PARTITION BY taxi_id ORDER BY year_month), 0)) * 100 AS tips_change
    FROM trips_with_tips

    {% if is_incremental() %}
    -- Only add new data (avoid reprocessing old rows)
    WHERE year_month > (SELECT MAX(year_month) FROM {{ this }})
    {% endif %}
)

SELECT 
    taxi_id,
    year_month,
    ROUND(tips_sum, 1) AS tips_sum,
    ROUND(COALESCE(tips_change, 0), 1) AS tips_change
FROM tips_change_compared_to_prev_month 
ORDER BY 1, 2

