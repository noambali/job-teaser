with 

source as (

    select * from `JobTeaser.dim_schools`

),

renamed as (

    select
        school_id,
        is_cc,
        intranet_school_id,
        jt_country,
        jt_intranet_status,
        jt_school_type

    from source

)

select * from renamed
