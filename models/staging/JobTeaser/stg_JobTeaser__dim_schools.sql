with 

source as (

    select * from {{ source('JobTeaser', 'dim_schools') }}

),
