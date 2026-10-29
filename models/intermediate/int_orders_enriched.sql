with items as (
    select
        order_id,
        count(*) as item_count,
        sum(item_price) as items_value,
        sum(freight_amount) as freight_value
    from {{ ref('int_order_items_enriched') }}
    group by order_id
)

select
    o.order_id,
    o.customer_id,
    c.customer_unique_id,
    c.city as customer_city,
    c.state as customer_state,
    o.order_status,
    o.order_purchased_at as purchased_at,
    o.order_approved_at as approved_at,
    o.order_delivered_to_carrier_at as delivered_to_carrier_at,
    o.order_delivered_at as delivered_at,
    o.order_estimated_delivery_at as estimated_delivery_at,
    coalesce(i.item_count, 0) as item_count,
    coalesce(i.items_value, 0) as items_value,
    coalesce(i.freight_value, 0) as freight_value,
    p.total_payment_value,
    p.max_installments,
    p.primary_payment_type,
    r.avg_review_score
from {{ ref('stg_olist_orders') }} o
left join {{ ref('stg_olist_customers') }} c
    on o.customer_id = c.customer_id
left join items i
    on o.order_id = i.order_id
left join {{ ref('int_order_payments_agg') }} p
    on o.order_id = p.order_id
left join {{ ref('int_order_reviews_agg') }} r
    on o.order_id = r.order_id