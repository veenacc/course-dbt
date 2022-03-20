{{
    config(
    materialized='table'
    )
}}

with int_core_orders_fact as (
select *
from {{ref('orders')}} 
)
SELECT
    order_id,
    user_id,
    promo_id,
    address_id,
    created_at,
    order_cost,
    shipping_cost,
    order_total,
    tracking_id,
    shipping_service,
    estimated_delivery_at,
    order_delivered_at,
    order_status
FROM int_core_orders_fact