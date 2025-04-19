CREATE TABLE dws.fin_tb_shop_promotion
(
    shop_id   varchar(100) COMMENT '店铺id',
    biz_day   date COMMENT '日期',
    pxb_cost  decimal(10, 2) COMMENT '品销宝花费(元)',
    ztc_cost  decimal(10, 2) COMMENT '直通车花费（元）',
    ylmf_cost decimal(10, 2) COMMENT '引力魔方花费（元）',
    wxt_cost  decimal(10, 2) COMMENT '万相台花费（元）',
    total_cost  decimal(10, 2) COMMENT '总花费（元）',
    dt        date COMMENT '分区字段'
) PARTITION BY VALUE(dt) comment '财务域-淘宝店铺每日推广费汇总';
insert OVERWRITE dws.fin_tb_shop_promotion
select
    t1.shop_id
    ,t1.biz_day
    ,nvl(ztc_cost,0)
    ,nvl(ylmf_cost,0)
    ,nvl(wxt_cost,0)
    ,nvl(pxb_cost,0)
    ,nvl(ztc_cost,0) + nvl(ylmf_cost,0) + nvl(wxt_cost,0) + nvl(pxb_cost,0)
    ,'2024-10-13'
from(select * from dwd.fin_tb_promotion where dt = '2024-10-13')t1
left join(
    select
        shop_id
        ,DATE_FORMAT(DATE_SUB(operate_time, INTERVAL 1 DAY), '%Y%m%d') biz_day
        ,sum(trans_amount) as pxb_cost
    from dwd.fin_tb_trans_log
    where dt = '2024-10-13' and trans_type = '支出'
    group by shop_id,DATE_FORMAT(DATE_SUB(operate_time, INTERVAL 1 DAY), '%Y%m%d')
)t2 on t1.shop_id = t2.shop_id and t1.biz_day = t2.biz_day
;

CREATE TABLE dws.trd_tb_shop_sale
(
    shop_id  varchar(100) COMMENT '店铺id',
    biz_day  date COMMENT '日期',
    warm_gmv decimal(10, 2) COMMENT '常温GMV',
    cold_gmv decimal(10, 2) COMMENT '冷链GMV',
    pay_amt  decimal(10, 2) COMMENT '支付金额',
    rfd_amt  decimal(10, 2) COMMENT '退款金额',
    dt       date COMMENT '分区字段'
) PARTITION BY VALUE(dt) comment '订单域-淘宝店铺每日销售情况';
insert OVERWRITE dws.trd_tb_shop_sale
select
    t1.shop_id
    ,t1.biz_day
    ,nvl(t1.warn_gmv,0) + nvl(t2.warn_gmv,0)
    ,nvl(t1.cold_gmv,0) + nvl(t2.cold_gmv,0)
    ,nvl(t1.warn_gmv,0) + nvl(t1.cold_gmv,0)
    ,nvl(t2.warn_gmv,0) + nvl(t2.cold_gmv,0)
    ,'2024-10-13'
from(
    select
        shop_id
        ,biz_day
        ,sum(case when temperature_chain_flag = '常温' then pay_amt else 0 end) warn_gmv
        ,sum(case when temperature_chain_flag != '常温' then pay_amt else 0 end) cold_gmv
    from(
        select
            shop_id
            ,date_format(pay_time,'%Y-%m-%d') as biz_day
            ,temperature_chain_flag
            ,actual_pay_amount pay_amt
        from dwd.trd_tb_unpaid_order where dt = '2024-10-13'
        union all
        select
            shop_id
            ,date_format(pay_time,'%Y-%m-%d')
            ,temperature_chain_flag
            ,pay_amount
        from dwd.trd_tb_living where dt = '2024-10-14' and product_first_cate != '购物金'
    )tmp group by shop_id,biz_day
)t1
left join(
    select
        shop_id
        ,biz_day
        ,sum(case when temperature_chain_flag = '常温' then pay_amt else 0 end) warn_gmv
        ,sum(case when temperature_chain_flag != '常温' then pay_amt else 0 end) cold_gmv
    from(
        select
            shop_id
            ,date_format(complete_time,'%Y-%m-%d') as biz_day
            ,temperature_chain_flag
            ,abs(refund_amount) pay_amt
        from dwd.trd_tb_unpaid_order where dt = '2024-10-13' and refund_amount is not null
        union all
        select
            shop_id
            ,date_format(refund_success_time,'%Y-%m-%d')
            ,temperature_chain_flag
            ,refund_amount
        from dwd.trd_tb_living where dt = '2024-10-14' and product_first_cate != '购物金' and refund_amount is not null
    )tmp group by shop_id,biz_day
)t2 on t1.shop_id = t2.shop_id and t1.biz_day = t2.biz_day;

























select length('2023/3/23 23:46')
select DATE_FORMAT('2023-03-23 23:46', '%Y-%m-%d %H:%i:%s')



select complete_time,case when length(complete_time) = 1 then null when length(complete_time) <= 15 then DATE_FORMAT(complete_time, '%Y-%m-%d %H:%i:%s') else complete_time end from dwd.trd_tb_unpaid_order where status in('订单有退款','订单售中退款关闭');

select distinct status from dwd.trd_tb_unpaid_order;

select distinct temperature_chain_flag from dwd.trd_tb_unpaid_order;
select distinct temperature_chain_flag from dwd.trd_tb_living;


select * from dwd.trd_tb_living;
select if(confirm_time in('-',''),null,confirm_time),confirm_time from dwd.trd_tb_living;