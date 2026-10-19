select
    concat(order_id, '-', cast(order_item_id as string)) as order_item_key,
    *
from {{ ref('int_order_items_enriched') }}