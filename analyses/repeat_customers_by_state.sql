select
    customer_state,
    count(*) as total_customers,
    countif(total_orders > 1) as repeat_customers,
    round(countif(total_orders > 1) / count(*) * 100, 1) as repeat_rate_pct
from {{ ref('dim_customers') }}
group by customer_state
order by repeat_rate_pct desc