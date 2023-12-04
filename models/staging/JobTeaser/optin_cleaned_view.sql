WITH sb AS (
SELECT *
,ROW_NUMBER()OVER(PARTITION BY user_id ORDER BY receive_time DESC) AS rn
FROM {{source("JobTeaser", "optin")}} 
)

SELECT 
* 
FROM sb
WHERE rn = 1
