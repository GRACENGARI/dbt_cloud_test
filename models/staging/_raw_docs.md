{% docs customer_unique_id %} Identifies a real person across orders. Do not confuse with customer_id, which is generated per order. Use customer_unique_id for repeat-customer and retention analysis. {% enddocs %}

{% docs order_items_grain %} One row per item in an order. order_item_number is only a sequence number inside an order (1, 2, 3...), so the unique key is order_id + order_item_number. {% enddocs %}

{% docs order_status_meaning %} Lifecycle of an order: created, approved, invoiced, processing, shipped, delivered. Orders can also end as canceled or unavailable. {% enddocs %}