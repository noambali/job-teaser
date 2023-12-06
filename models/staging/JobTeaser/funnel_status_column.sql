WITH sub AS (

SELECT 

user_id
,jt_country
,jt_school_type
,is_cc
,jt_school_type_name
,subscribed_column
,optin_cause
,opt_receive_time


FROM {{ref('funnel_status')}}

UNION ALL

SELECT 
user_id
,jt_country
,jt_school_type
,is_cc
,jt_school_type_name
,optin_column
,optin_cause
,opt_receive_time

FROM {{ref('funnel_status')}}

UNION ALL

SELECT 

user_id
,jt_country
,jt_school_type
,is_cc
,jt_school_type_name
,shortlisted_column
,optin_cause
,opt_receive_time 


FROM {{ref('funnel_status')}}

UNION ALL

SELECT 

user_id
,jt_country
,jt_school_type
,is_cc
,jt_school_type_name
,interested_column
,optin_cause
,opt_receive_time


FROM {{ref('funnel_status')}}


UNION ALL

SELECT 

user_id
,jt_country
,jt_school_type
,is_cc
,jt_school_type_name
,approved_column
,optin_cause
,opt_receive_time

FROM {{ref('funnel_status')}})

SELECT *
FROM sub
WHERE subscribed_column IS NOT NULL