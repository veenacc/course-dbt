{{
    config(
    materialized='table'
    )
}}

with int_mktg_user_orders_details as (
select *
from {{ref('orders')}} 
)
SELECT
    user_id,count(order_id) as total_num_of_orders, sum(order_total) as total_order_spend,
    count(case when promo_id is not null then 1 else null end) as num_of_orders_with_promo,
    sum(case when promo_id is not null then order_total else 0 end) as total_order_spend_with_promo
FROM int_mktg_user_orders_details
group by user_id