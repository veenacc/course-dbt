{{
    config(
    materialized='table'
    )
}}

with mktg_user_dim as (
    select u.*,a.* from {{ref('users')}} As u
    left join {{ref('addresses')}} As a
    on u.address_id=a.address_id
)
SELECT
    user_id,
    first_name,
    last_name,
    email,
    phone_number,
    created_at,
    updated_at,
    zipcode,
    state,
    country
FROM mktg_user_dim