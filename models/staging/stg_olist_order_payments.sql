with source as (
    select * from {{ source('olist_raw', 'order_payments') }}
),

renamed as (
    select
        order_id,
        payment_sequential as payment_sequence_number,
        {{standardize_text('payment_type')}}as primary_payment_type,
        payment_installments as instalment_count,
        payment_value as total_payment_value
    from source
)

select * from renamed