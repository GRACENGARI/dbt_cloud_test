select
    customer_unique_id,
    min(customer_city) as customer_city,
    min(customer_state) as customer_state,
    min(purchased_at) as first_order_at,
    max(purchased_at) as last_order_at,
    count(distinct order_id) as total_orders,
    sum(total_payment_value) as lifetime_value
from {{ ref('int_orders_enriched') }}
group by customer_unique_id