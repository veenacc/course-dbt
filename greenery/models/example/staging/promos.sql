{{
    config(
    materialized='table'
    )
}}
SELECT
promo_id,
discount,
status As promo_status
FROM {{source('tutorial','promos')}}