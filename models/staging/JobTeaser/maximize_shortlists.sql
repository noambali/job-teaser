WITH subq AS(SELECT 
shortlist_id
,count(distinct user_id) as total_students
FROM {{ref("funnel_status")}} 
GROUP BY shortlist_id)

SELECT
*
FROM subq
where subq.total_students <= 20
