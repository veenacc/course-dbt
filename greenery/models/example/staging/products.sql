{{
    config(
    materialized='table'
    )
}}
SELECT
product_id,
name As product_name,
price As product_price,
inventory
FROM {{source('tutorial','products')}}