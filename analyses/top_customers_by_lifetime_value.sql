select
    customer_unique_id,
    customer_state,
    total_orders,
    lifetime_value
from {{ ref('dim_customers') }}
order by lifetime_value desc
