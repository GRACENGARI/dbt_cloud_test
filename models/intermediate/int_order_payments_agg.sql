select
    order_id,
    count(*) as payment_count,
    sum(total_payment_value) as total_payment_value,
    max(instalment_count) as max_installments,
    min(primary_payment_type) as primary_payment_type
from {{ ref('stg_olist_order_payments') }}
group by order_id