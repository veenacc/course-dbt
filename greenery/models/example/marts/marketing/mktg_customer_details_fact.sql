{{
    config(
    materialized='table'
    )
}}

with mktg_customer_details_fact as (
select uo.*,ue.num_of_visits,
ue.num_of_checkouts,
ue.num_of_page_views,
ue.num_of_addtocart
from {{ref('int_mktg_user_order_details')}} as uo
left join {{ref('int_mktg_user_event_details')}} as ue
on uo.user_id=ue.user_id
)
SELECT
    user_id,total_num_of_orders, total_order_spend,
    num_of_orders_with_promo,
    total_order_spend_with_promo,
    num_of_visits,
    num_of_checkouts,
    num_of_page_views,
    num_of_addtocart,
    case when total_num_of_orders>1 then 1 else 0 end as repeat_customer
FROM mktg_customer_details_fact
