{{
    config(
    materialized='table'
    )
}}

with core_products_dim AS(
    select * 
    from{{ref('products')}}
)
SELECT
product_id,
product_name,
product_price,
inventory
FROM core_products_dim