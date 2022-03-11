{{
    config(
    materialized='table'
    )
}}
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
    delivered_at As order_delivered_at,
    status As order_status
FROM {{source('tutorial','orders')}}