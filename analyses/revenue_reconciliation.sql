select
    (select sum(total_payment_value) from {{ ref('int_orders_enriched') }}) as enriched_total,
    (select sum(lifetime_value) from {{ ref('dim_customers') }}) as customers_total