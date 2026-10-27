with source as (
    select * from {{ source('olist_raw', 'orders') }}
),

renamed as (
    select
        order_id,
        customer_id,
        order_status,
        safe_cast(order_purchase_timestamp as timestamp) as order_purchased_at,
        safe_cast(order_approved_at as timestamp) as order_approved_at,
        safe_cast(order_delivered_carrier_date as timestamp) as order_delivered_to_carrier_at,
        safe_cast(order_delivered_customer_date as timestamp) as order_delivered_at,
        safe_cast(order_estimated_delivery_date as timestamp) as order_estimated_delivery_at
    from source
)

select * from renamed