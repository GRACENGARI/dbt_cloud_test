select
    order_id,
    count(*) as payment_count,
    sum(payment_value) as total_payment_value,
    max(payment_installments) as max_installments,
    min(payment_type) as primary_payment_type
from {{ ref('stg_olist_order_payments') }}
group by order_id