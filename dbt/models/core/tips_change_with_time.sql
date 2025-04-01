WITH trips_with_tips AS(
-- Select only cars who get highest tips on April 2018 and calculate tips
    SELECT 
        taxi_id
        ,FORMAT_TIMESTAMP('%Y-%m', trip_start_timestamp) AS year_month
        ,SUM(tips) AS tips_sum

    FROM {{ ref('stg_taxi_trips') }}
    WHERE taxi_id IN (SELECT taxi_id FROM {{ ref('top_three_cars') }})
    GROUP BY 1 ,2
),

tips_change_compared_to_prev_month AS (
-- Calculate tips difference in % between current and previous month
    SELECT
        taxi_id
        ,year_month
        ,tips_sum
        ,((tips_sum - LAG(tips_sum) OVER (PARTITION BY taxi_id ORDER BY year_month)) / NULLIF(LAG(tips_sum) OVER (PARTITION BY taxi_id ORDER BY year_month), 0)) * 100 AS tips_change
    FROM trips_with_tips
    ORDER BY taxi_id, year_month

)

SELECT
  taxi_id
  ,year_month
  ,ROUND(tips_sum,1) AS tips_sum
  ,ROUND(COALESCE(tips_change,0),1) AS tips_change
FROM tips_change_compared_to_prev_month
ORDER BY taxi_id, year_month