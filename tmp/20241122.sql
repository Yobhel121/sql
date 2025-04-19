
with t1 as (
    select
        customer,
        platform,
        shop_name,
        date_format(dialog_time,'%Y-%m-%d') dt,
        count(1) as cnt
    from rpa_data.yy_dialogue_records
    where dialogue_status = '售前'
    group by customer, platform, shop_name, date_format(dialog_time,'%Y-%m-%d')
),t2 as(
    select
        customer,
        platform,
        shop_name,
        dt,
        cnt,
        lead(dt,1,0) over (partition by customer,platform,shop_name order by dt) as next_dt,
        lead(cnt,1,0) over (partition by customer,platform,shop_name order by dt) as next_cnt,
        lead(dt,2,0) over (partition by customer,platform,shop_name order by dt) as next_next_dt,
        lead(cnt,2,0) over (partition by customer,platform,shop_name order by dt) as next_next_cnt
    #     SUM(cnt) OVER (partition by customer,platform,shop_name ORDER BY st RANGE BETWEEN 259200 PRECEDING AND CURRENT ROW) AS total_last_3_days
    from t1
)
select
    customer,
   platform,
   shop_name,
   dt,
   cnt + if(datediff(str_to_date(next_dt,'%Y-%m-%d'), str_to_date(dt,'%Y-%m-%d')) < 3, next_cnt, 0) + if(datediff(str_to_date(next_next_dt,'%Y-%m-%d'), str_to_date(dt,'%Y-%m-%d')) < 3, next_next_cnt, 0)
from t2
;


select distinct account,account_id from rpa_data.dy_promotion_fee_consumption where biz_day ='2024-12-25' and account_id = '1817413192705225';