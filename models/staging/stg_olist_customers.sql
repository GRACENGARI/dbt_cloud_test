with source as (
    select * from {{ source('olist_raw', 'customers') }}
),

renamed as (
    select
    customer_id,
        customer_unique_id,
        {{standardize_text('cast(customer_zip_code_prefix as string)')}} as zip_code_prefix,
        {{standardize_text('customer_city')}} as city,
        {{standardize_text('customer_state')}} as state
from source
    
)

select * from renamed