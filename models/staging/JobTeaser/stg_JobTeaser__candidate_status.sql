with 

source as (

    select * from {{ source('JobTeaser', 'candidate_status') }}

)

