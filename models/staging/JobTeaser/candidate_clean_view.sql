WITH ls AS (
SELECT * 
,ROW_NUMBER()OVER(PARTITION BY user_id, shortlist_id ORDER BY receive_time DESC) AS last_status
FROM {{ ref('stg_JobTeaser__candidate_status') }}
)
SELECT *
FROM ls
WHERE last_status = 1
ORDER BY user_id 
