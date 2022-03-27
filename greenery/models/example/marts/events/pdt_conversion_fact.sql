{{
    config(
    materialized='table'
    )
}}

with pdt_conversion_fact as (
    select *
    FROM {{ref('int_conversion_data')}}
)
select 
    session_id, final_product_id, count(order_id) as order_count,
    /*count(case when event_type='add_to_cart' then 1 else null end) as add_to_cart_event,
    count(case when event_type='checkout' then 1 else null end) as checkout_event,
    count(case when event_type='page_view' then 1 else null end) as page_view_event,
    count(case when event_type='package_shipped' then 1 else null end) as package_shipped_event */
    {{ event_type_pivot() }} 
FROM pdt_conversion_fact
group by 1,2