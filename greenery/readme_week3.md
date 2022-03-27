/* overall conversion rate */

select 
(count(case when order_count>0 then 1 else null end)/(count(session_id)*1.0))*100 as overall_conversion_fact
from dbt.dbt_veena_cc.overall_conversion_fact
Ans : 62.46%


/*conversion rate by product */
select final_product_id,
(count(case when order_count>0 then 1 else null end)/(count(case when page_view_event>0 then 1 else null end)*1.0))*100 as pdt_conversion_rate
from dbt.dbt_veena_cc.pdt_conversion_fact
group by 1