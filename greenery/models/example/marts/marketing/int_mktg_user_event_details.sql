{{
    config(
    materialized='table'
    )
}}

with int_mktg_user_event_details as (
select *
from {{ref('events')}} 
)
SELECT
    user_id,count(distinct session_id)as num_of_visits,
    /*count(case when event_type='checkout' then 1 else null end)as num_of_checkouts,
    count(case when event_type='page_view' then 1 else null end ) as num_of_page_views,
    count(case when event_type='add_to_cart' then 1 else null end ) as num_of_addtocart */
    {{ event_type_pivot() }} 
FROM int_mktg_user_event_details
group by user_id