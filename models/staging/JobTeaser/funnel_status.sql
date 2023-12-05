SELECT * 
,CASE
  WHEN user_id IS NOT NULL THEN 'Subscribed users'
 END AS subscribed_column
,CASE
  WHEN active = True THEN 'Opt-in' 
  END AS optin_column
,CASE 
  WHEN shorlisted_user_id IS NOT NULL THEN 'Shortlisted'
  END AS shortlisted_column
,CASE
  WHEN status_update = 'interested' THEN 'Interested'
  END AS interested_column 
,CASE
  WHEN status_update = 'approved' THEN 'Approved'
  END AS approved_column
,CASE
  WHEN status_update = 'declined' THEN 'Declined'
  END AS declined_column 
,CASE jt_school_type
  WHEN 1 THEN 'Engineer schools / TU'
  WHEN 2 THEN 'Business schools / Business universities'
  ELSE 'Other' 
END AS jt_school_type_name
,CASE
  WHEN is_cc = TRUE THEN 1
  ELSE 0
  END AS is_cc_num
,CASE
  WHEN short_cause = 'email-click' AND status_update = 'interested'  THEN 'Interested'
  WHEN short_cause = 'email-click' AND status_update = 'not interested' THEN 'Not Interested'
  WHEN short_cause = 'auto-timeout'  OR short_cause = 'auto-creation' THEN 'No answer'
  END AS student_response
FROM {{ref('optin_candidate_merged')}}