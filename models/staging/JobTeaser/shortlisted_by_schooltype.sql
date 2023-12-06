WITH sub AS(
  SELECT 
  user_id
  ,jt_school_type_name
  ,subscribed_column
  FROM {{ref('funnel_status_column')}} 
  WHERE subscribed_column = 'Shortlisted'
  )

SELECT 
COUNT (DISTINCT user_id) as user_id
,jt_school_type_name
FROM sub 
GROUP BY jt_school_type_name