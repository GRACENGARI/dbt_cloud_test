select
    date_trunc(first_order_at, month) as first_order_month,
    count(*) as new_customers,
    sum(lifetime_value) as total_value
from {{ ref('dim_customers') }}
group by first_order_month
order by first_order_month