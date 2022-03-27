{{
    config(
    materialized='table'
    )
}}

with int_conversion_data as (
    select e.*, o.product_id as order_pdt_id
from {{ref('pdt_event_details_fact')}} as e
left join {{ref('order_items')}} as o
on e.order_id=o.order_id
   
)
SELECT * ,coalesce(product_id,order_pdt_id) as final_product_id
FROM int_conversion_data