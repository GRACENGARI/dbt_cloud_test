select
    p.product_id,
    p.category_name as product_category_name,
    pc.category_name_en as product_category_name_english,
    p.weight_g
from {{ ref('stg_olist_products') }} p
left join {{ ref('stg_olist_product_category') }} pc
    on p.category_name = pc.category_name