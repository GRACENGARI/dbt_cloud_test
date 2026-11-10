--Business Question:How many orders per month? What’s the average delivery time? How many were delivered late or cancelled? What’s the average order value?
{{
    config(
        tags= ['orders']
    )
    
    }}

select
    *,
    date_diff(date(delivered_at), date(purchased_at), day) as days_to_deliver,
    date_diff(date(delivered_at), date(estimated_delivery_at), day) as days_vs_estimate,
    coalesce(delivered_at > estimated_delivery_at, false) as is_late
from {{ ref('int_orders_enriched') }}