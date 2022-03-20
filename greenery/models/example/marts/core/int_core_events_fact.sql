{{
    config(
    materialized='table'
    )
}}

with int_core_events_fact as (
    select *
    from {{ref('events')}}
)
SELECT
    event_id,
    session_id,
    user_id,    
    page_url,
    created_at,
    event_type,
    order_id,
    product_id
FROM int_core_events_fact