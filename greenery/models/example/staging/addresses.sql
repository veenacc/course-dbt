{{
    config(
    materialized='table'
    )
}}
SELECT
    address_id,
    address As user_address,
    zipcode,
    state,
    country
FROM {{source('tutorial','addresses')}}