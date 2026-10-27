with source as (
    select * from {{ source('olist_raw', 'order_payments') }}
),

renamed as (
    select
        order_id,
        payment_sequential as payment_sequence_number,
        lower(trim(payment_type)) as payment_type,
        payment_installments as instalment_count,
        payment_value as payment_amount
    from source
)

select * from renamed