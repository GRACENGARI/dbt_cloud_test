with source as (
    select * from {{ source('olist_raw', 'geolocation') }}
),
renamed as (
    select
        {{standardize_text('cast(geolocation_zip_code_prefix as string)')}}as zip_code_prefix,
        geolocation_lat as lat,
        geolocation_lng as lng,
        {{standardize_text('geolocation_city')}} as city,
        {{standardize_text('geolocation_state')}} as state
    from source

)
select * from renamed 