{{
    config(
    materialized='table'
    )
}}

with core_product_funnel_fact as (
  select o.*, 
  {{ dbt_utils.star(from=ref('int_session_details'), except=["session_id"]) }}
from {{ref('overall_conversion_fact')}} as o
left join {{ref('int_session_details')}} as s 
on o.session_id=s.session_id
   
)
SELECT * 
FROM core_product_funnel_fact