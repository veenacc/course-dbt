/* week 4 product funnel performance*/

select session_year,session_month,session_week,country,count(session_id) as total,
  count(case when ((page_view_event>0) or (add_to_cart_event>0) or (checkout_event>0)) then 1 else null end) as funnel_top,
  count(case when ((add_to_cart_event>0) or (checkout_event>0)) then 1 else null end) as funnel_mid,
  count(case when (checkout_event>0) then 1 else null end) as funnel_end
from dbt.dbt_veena_cc.core_product_funnel_fact  
group by 1,2,3,4



/** Part 3 3B **/

Tool used:
DBT for data modeling and transformation
Dagster for scheduling if there are legacy data systems existing within the organisation or dbt cloud if all data is transformed and modelled through DBT 
	-(since DBT cloud only allows for scheduling and governing DBT jobs)


Production steps:

Run dbt seed 
Run dbt snapshot
run operation for obfuscation and other information security purposes

load run metadata to data storage -run_results.json

run dbt on staging files
run test 
load run metadata to data storage - run_results.json
send an automated alert system in case of serious data issues/ fails in the metadata

run snapshot -freshness
run dbt source freshness
load run metadata to data storage - source.json
send an automated alert system in case of serious data freshness issues in the metadata

Run dbt on rest of the projects 
load result to data storage - run_results.json
run test
load result to data storage - run_results.json
send an automated alert system in case of serious data issues/fails in the metadata

Run dbt docs generate
load result to data storage -catalog 

Load manifest.json metadata of the entire project to data storage

/*** end***/
