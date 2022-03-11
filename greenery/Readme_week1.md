
/* Read me file with question and answers in week1 project */


----Q1: How many users do we have?
----Ans=130 users
    select count(distinct user_id) As number_of_users
    from dbt.dbt_veena_cc.users


---- Q2: On average, how many orders do we receive per hour?
----Ans=7.5 orders
    with avgorder as 
    (
    select date_trunc('hour',created_at) as hourly, count(order_id) as numberoforders
    from dbt.dbt_veena_cc.orders
    group by date_trunc('hour',created_at)
    order by hourly asc
    )
    select avg(numberoforders) as avgorderperhr
    from avgorder

---- Q3: On average, how long does an order take from being placed to being delivered?
-----Ans=3days 21 hrs
    select 
    date_trunc('hour',avg(order_delivered_at-created_at)) as days_to_deliver
    from 
        dbt.dbt_veena_cc.orders
    where order_status='delivered'
    
    /* better time difference code ?
    SELECT 
        DATE_PART('day', '2011-12-30 08:55'::timestamp - '2011-12-27 10:55'::timestamp)
        * 24 + 
        DATE_PART('hour', '2011-12-30 08:55'::timestamp - '2011-12-27 10:55'::timestamp);
        */

--- Q4: How many users have only made one purchase? Two purchases? Three+ purchases?
----Ans= 1 order->25 users; 2 orders->28 users; >=3orders->71 users
    with user_orders as (
    select  user_id,
    case
        when count( order_id) =1 then '1'
        when count( order_id) =2 then '2'
        when count( order_id) >=3 then '>=3'
        end as user_order_count
    from dbt.dbt_veena_cc.orders
    group by user_id
    order by user_order_count desc )

    select  count(user_id) as user_count,user_order_count
    from user_orders
    group by user_order_count

---- Q5: On average, how many unique sessions do we have per hour?
---- Ans= avg distinct session per hr = 16.3275
    with session_table as (
    select  count(distinct session_id) as session_count, date_trunc('hour',created_at) as hourly
    from dbt.dbt_veena_cc.events
    group by date_trunc('hour',created_at) 
    )
    select avg(session_count)
    from session_table

