--Business question:Which sellers deliver fastest? Who are the top sellers? Which states have seller gaps?
{{
    config(
        tags= ['sellers']
    )
    
    }}


select
    seller_id,
    city as seller_city,
    state as seller_state
from {{ ref('stg_olist_sellers') }}