{{
    config(
    materialized='table'
    )
}}

with core_order_detail_fact as (
    select o.*,u.zipcode,
    u.state,
    u.country
    from {{ref('int_core_orders_fact')}} as o
    left join {{ref('core_user_dim')}} as u
    on o.user_id=u.user_id
)
SELECT
    order_id,
    user_id,
    zipcode,
    state,
    country,
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
FROM core_order_detail_fact