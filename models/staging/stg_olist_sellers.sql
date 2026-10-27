with source as (
    select * from {{ source('olist_raw', 'sellers') }}
),

renamed as (
    select
        seller_id,
        cast(seller_zip_code_prefix as  string) as zip_code_prefix,
        lower(trim(seller_city)) as city,
        upper(trim(seller_state)) as state
    from source
)

select * from renamed