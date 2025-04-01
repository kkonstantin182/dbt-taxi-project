WITH trips_with_tips AS (

SELECT 
    taxi_id
    ,SUM(tips) AS tips_sum
FROM {{ ref('stg_taxi_trips') }}
WHERE EXTRACT(YEAR FROM trip_start_timestamp) = 2018
    AND EXTRACT(month FROM trip_start_timestamp) = 4
GROUP BY taxi_id
ORDER BY 2 DESC
LIMIT 3
)

SELECT taxi_id
FROM trips_with_tips
