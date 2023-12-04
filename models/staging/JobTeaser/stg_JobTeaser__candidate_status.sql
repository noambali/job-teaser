with 

source as (

    select * from {{ source('JobTeaser', 'candidate_status') }}

),

renamed as (

    select
        user_id,
        receive_time,
        shortlist_id,
        status_update,
        cause,
        school_id,
        current_sign_in_at

    from source

)

select * from renamed
