with 

source as (

    select * from {{ source('JobTeaser', 'optin') }}

),

renamed as (

    select

    from source

)

select * from renamed
