select
    oi.order_id,
    oi.order_item_number,
    oi.product_id,
    oi.seller_id,
    oi.shipping_limit_at,
    oi.item_price,
    oi.freight_amount,
    oi.item_price + oi.freight_amount as item_total,
    p.category_name as product_category_name,
    pc.category_name_en as product_category_name_english,
    s.city as seller_city,
    s.state as seller_state
from {{ ref('stg_olist_order_items') }} oi
left join {{ ref('stg_olist_products') }} p
    on oi.product_id = p.product_id
left join {{ ref('stg_olist_product_category') }} pc
    on p.category_name = pc.category_name
left join {{ ref('stg_olist_sellers') }} s
    on oi.seller_id = s.seller_id