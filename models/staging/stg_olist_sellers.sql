with source as (
    select * from {{ source('olist_raw', 'sellers') }}
),

renamed as (
    select
        seller_id,
       {{standardize_text('cast(seller_zip_code_prefix as  string)')}} as zip_code_prefix,
        {{standardize_text('seller_city')}} as city,
        {{standardize_text('seller_state')}} as state
    from source
)

select * from renamed