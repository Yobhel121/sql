
with all_order_item as (
    select a.* from dwd.trd_pay_item a
    left join (select distinct order_id from dwd.trd_rfd_item)b on a.order_id = b.order_id
    where b.order_id is null and a.plat_name = '天猫商城'
), user_row as (
    select * from(select row_number() over (partition by user_id,first_cate order by pay_time) n,* from all_order_item)t
),first_user as (
    select * from user_row where pay_time like '2025-01%' and n = 1
),final_order as (
    select a.* from all_order_item a left join first_user b on a.user_id = b.user_id and  a.first_cate = b.first_cate  where a.pay_time > '2025-01-01 00:00:00' and a.pay_time < '2025-07-01 00:00:00'
),res_a as (
    select first_cate,count(distinct user_id) cnt from first_user group by first_cate
),res_b as (
    select first_cate,sum(total_amt) from final_order group by first_cate
)
select * from res_a a left join res_b b on a.first_cate = b.first_cate
;


with all_order_item as (
    select a.* from dwd.trd_pay_item a
    left join (select distinct trade_no from ods.jky_qm_trades_fullinfo where trade_type in(8,12))b on a.order_id = b.trade_no
    where b.trade_no is null and a.plat_name = '天猫商城'
), user_row as (
    select * from(select row_number() over (partition by user_id,first_cate order by pay_time) n,* from all_order_item)t
),first_user as (
    select * from user_row where pay_time like '2025-01%' and n = 1
),final_order as (
    select a.*,sum(a.total_amt) over(partition by a.plat_order_id) amt from all_order_item a join first_user b on a.user_id = b.user_id and  a.first_cate = b.first_cate  where a.pay_time > '2025-01-01 00:00:00' and a.pay_time < '2025-07-01 00:00:00'
),res_a as (
    select first_cate,count(distinct user_id) cnt from first_user group by first_cate
),res_b as (
    select first_cate,sum(amt) t_amt from final_order group by first_cate
)
select *,t_amt/cnt from res_a a left join res_b b on a.first_cate = b.first_cate
;

select  row_number() over (partition by user_id,first_cate order by pay_time),* from dwd.trd_pay_item where user_id = 'C202409028232';


