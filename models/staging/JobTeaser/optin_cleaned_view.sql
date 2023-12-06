WITH sb AS (
SELECT *
,ROW_NUMBER()OVER(PARTITION BY user_id ORDER BY receive_time DESC) AS rn
FROM {{ref('stg_JobTeaser__optin')}}
)

SELECT 
* 
FROM sb
WHERE rn = 1
