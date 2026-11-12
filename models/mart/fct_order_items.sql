{{
    config(
        tags=['order_item']
    )
}}

select
    concat(i.order_id, '-', cast(i.order_item_number as string)) as order_item_key,
    i.*,
    cast(o.purchased_at as timestamp) as purchased_at,
    c.customer_unique_id
from {{ ref('int_order_items_enriched') }} as i
left join {{ ref('fct_orders') }} as o
    on i.order_id = o.order_id
left join {{ ref('stg_olist_customers') }} as c
    on o.customer_id = c.customer_id