{{
    config(
    materialized='table'
    )
}}

with pdt_event_details_fact as (
    select e.*,u.zipcode,
    u.state,
    u.country,
    p.product_name,
    o.promo_id
    from {{ref('events')}} as e
    left join {{ref('core_user_dim')}} as u
    on e.user_id=u.user_id
    left join {{ref('pdt_product_dim')}} as p
    on e.product_id=p.product_id
    left join {{ref('int_core_orders_fact')}} as o
    on e.order_id=o.order_id
)
SELECT
    event_id,
    session_id,
    user_id,  
    zipcode,
    state,
    country,  
    page_url,
    created_at,
    event_type,
    order_id,
    product_id,
    product_name,
    promo_id
FROM pdt_event_details_fact