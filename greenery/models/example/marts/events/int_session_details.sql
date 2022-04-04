{{
    config(
    materialized='table'
    )
}}

with int_session_details as (
   select session_id,user_id,country,date(min(created_at)) as session_date, 
   date_part('year',created_at) as session_year, 
date_part('month',created_at) as session_month,date_part('week',created_at) as session_week
from {{ref('int_conversion_data')}}
group by 1,2,3,5,6,7
   
)
SELECT * 
FROM int_session_details