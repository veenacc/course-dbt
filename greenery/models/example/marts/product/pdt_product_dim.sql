{{
    config(
    materialized='table'
    )
}}

with pdt_products_dim AS(
    select * 
    from{{ref('products')}}
)
SELECT
product_id,
product_name,
product_price,
inventory
FROM pdt_products_dim