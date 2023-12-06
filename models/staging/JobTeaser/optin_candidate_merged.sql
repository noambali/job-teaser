SELECT 
optin.user_id
,optin.receive_time as opt_receive_time
,optin.cause as optin_cause
,optin.active
,optin.school_id
,optin.current_sign_in_at as opt_last_connection
,optin.resume_uploaded
,shortlisted.user_id as shorlisted_user_id
,shortlisted.receive_time as short_receive_time
,shortlisted.shortlist_id
,status_update
,shortlisted.cause as short_cause
,shortlisted.current_sign_in_at as short_last_connection
,is_cc
,intranet_school_id
, jt_country
, jt_intranet_status
, jt_school_type
FROM {{ref('optin_cleaned_view')}} optin
LEFT JOIN  {{ref('candidate_clean_view')}} shortlisted
USING (user_id)
LEFT JOIN {{ref('stg_JobTeaser__dim_schools')}} schools
on optin.school_id = schools.school_id