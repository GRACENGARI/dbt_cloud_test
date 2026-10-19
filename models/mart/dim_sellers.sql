select
    seller_id,
    city as seller_city,
    state as seller_state
from {{ ref('stg_olist_sellers') }}