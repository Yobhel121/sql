with tb as(
    select
      trans_date,
      trans_amount
    from(
        select *, row_number() over (partition by shop_id, record_time, trans_amount order by dt desc ) n from ods.rpa_tb_account_fee
        where income_expense_type = '支出' and trans_type = '扣款'
    ) t1 where n = 1
),
tm as (
    select
      t.trans_date,
      cast(sum(case when t.platform='万相台' then t.operate_amount else 0 end) as decimal(10,2)) as wanxiangtai
    from(
        SELECT *,row_number() over(partition by shop_id,platform,trans_date order by trans_date) rn from ods.rpa_tm_promotion_fee
        where income_expense_type = '支出' and trans_type = '扣款' and trans_date >= '2022-12-28'
    ) t
    where t.rn = 1
    group by t.trans_date
),
all_data as(
    select
        trans_date,sum(trans_amount) sss
    from (
        select trans_date,trans_amount from tb
        union all
        select trans_date,wanxiangtai trans_amount from tm
    )tttt
    where trans_date > date_sub('2025-08-20',30)
    group by trans_date
)
,finl_data as(
    select
        cal_date,
        sum(wanxiang_platform) sss
    from ads.financial_ledger_report_metrics_updatetime
    where cal_date > date_sub('2025-08-20',30)
    group by cal_date
)
select trans_date,aa.sss ods_wanxiangtai,bb.sss ads_wanxiangtai  from all_data aa join finl_data bb on aa.trans_date = bb.cal_date where abs(aa.sss-bb.sss) > 1;


select biz_day,sum(wanxiangtai) from dws.fin_omni_channel_promotion_fee
group by biz_day;


select * from jky.qm_trades_fullinfo;


select platCode from jky.qm_trades_fullinfo_goodsdetail where




with tmp as (
    select
      a.biz_day,
      a.shop_id,
      a.business_cate,
      b.wanxiangtai
    from
      (
        select
          *
        from
          dws.trd_tmcs_amount
        where
          dt = (
            select
              max(dt)
            from
              dws.trd_tmcs_amount
          )
      ) a
      LEFT JOIN (
        select
          *
        from
          dws.fin_tmcs_promotion_fee
        where
          dt = (
            select
              max(dt)
            from
              dws.fin_tmcs_promotion_fee
          )
      ) b on a.biz_day = b.biz_day
      and a.shop_id = b.shop_id
      and a.business_cate = b.business_cate

#     union all
#     select
#       biz_day,
#       shop_id,
#       business_cate,
#       sum(wanxiangtai) wanxiangtai
#     from
#       dws.fin_tb_promotion_fee_new
#     where
#       dt = (
#         select
#           max(dt)
#         from
#           dws.fin_tb_promotion_fee_new
#       )
#     group by
#       biz_day,
#       shop_id,
#       business_cate
)
select biz_day,sum(wanxiangtai) from tmp
where biz_day like '2025-08%'
group by biz_day

;



select promotion_date,sum() from dwd.fin_tmcs_promotion_performance group by promotion_date;