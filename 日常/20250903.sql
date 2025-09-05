# TMPPD
# 0159
# 13664934
# 14767129
# 11207308
# 0160
# 13664935


with tmp as (
    select
      biz_day,
      shop_id,
      business_cate,
      cast(0 as decimal(10, 2)) rspgmv,
      cast(0 as decimal(10, 2)) GMV,
      cast(0 as decimal(10, 2)) goods_coat,
      cast(0 as decimal(10, 2)) refund_amount,
      cast(0 as decimal(10, 2)) GSV,
      cast(0 as decimal(10, 2)) supply_price_amount,
      cast(0 as decimal(10, 2)) refund_supply_price_amount,
      cast(0 as decimal(10, 2)) supply_amount_gsv,
      cast(0 as decimal(10, 2)) maobao,
      cast(0 as decimal(10, 4)) maobao_supply,
      cast(0 as decimal(10, 2)) jtk_amount,
      cast(0 as decimal(10, 2)) jzt_amount,
      cast(0 as decimal(10, 2)) gift_amount,
      cast(0 as decimal(10, 2)) cid_consume,
      cast(0 as decimal(10, 2)) brand_zone,
      cast(0 as decimal(10, 2)) chip_launch,
      cast(0 as decimal(10, 2)) shopp_contact,
      cast(0 as decimal(10, 2)) haitou,
      cast(0 as decimal(10, 2)) express_train,
      cast(0 as decimal(10, 2)) fund_details,
      cast(0 as decimal(10, 2)) gravity_cube,
      cast(0 as decimal(10, 2)) direct_train,
      sum(wanxiangtai),
      sum(taobao_customer) taobao_customer,
      sum(pinxiaobao),
      cast(0 as decimal(10, 2)) e_niu_cost,
      sum(expert_commission),
      cast(0 as decimal(10, 2)) qianchuan_pc,
      cast(0 as decimal(10, 2)) feel_free_push,
      cast(0 as decimal(10, 2)) ddjb_commission_fee,
      cast(0 as decimal(10, 2)) full_site_promotion,
      cast(0 as decimal(10, 2)) platform_promotion_fee,
      cast(0 as decimal(10, 2)) only_enjoy_customer,
      cast(0 as decimal(10, 2)) promotion_expenses,
      cast(0 as decimal(10, 2)) hp_resource,
      cast(0 as decimal(10, 2)) platform_commission,
      cast(0 as decimal(10, 2)) cg_distribution_commission,
      cast(0 as decimal(10, 2)) xhs_promotion,
      cast(0 as decimal(10, 2)) gmv_taste,
      cast(0 as decimal(10, 2)) refund_amount_taste,
      cast(0 as decimal(10, 2)) gsv_taste,
      cast(0 as decimal(10, 2)) rsp_gmv_taste,
      cast(0 as decimal(10, 2)) supply_gmv_taste,
      cast(0 as decimal(10, 2)) supply_refund_amount_taste,
      cast(0 as decimal(10, 2)) supply_gsv_taste,
      sum(guanghe_commission) guanghe_commission,
      cast(0 as double) non_food_gift_inventory
    from
      dws.fin_tb_promotion_fee_new
    where
      dt = '2025-09-03'
    group by
      biz_day,
      shop_id,
      business_cate
)select sum(taobao_customer) from tmp
where shop_id in ('0159','13664934','0160','14767129','11207308')
and biz_day like '2025-08%'
;

select  distinct dt from  dws.fin_tb_promotion_fee_new;



insert overwrite dwd.tb_product_analysis
select
  a.biz_day,
  a.shop_id,
  case
     when a.shop_id !='117626295' then ''
    when b.business_cate like '%调味%' then '02调味'
    when b.business_cate like '%辅食%' then '01主/辅食'
    when b.business_cate like '%零食%' then '04零食'
    when b.business_cate like '%生鲜%' then '03生鲜/水产'
    when b.business_cate like '%活动%' then '天猫内容组'
    else '天猫内容组'
  end business_cate,
  a.product_id,
  a.title,
  a.commission_paid,
  a.settlement_commission,
  settlement_service_fee,
  a.settlement_total_expense,
  '${yd}'dt
from
  (
    select
      *
    from
      (
        select
          *,
          row_number() over (
            partition by biz_day,
            shop_id,
            product_id,
            commission_paid
            order by
              biz_day
          ) rn
        from
          ods.tb_product_analysis
      )
    where
      rn = 1 and settlement_total_expense !='0.00'
  ) a
  left join (
   select * from (select *,row_number() over (partition by str_day,shop_id,product_id,business_cate order by dt desc)rn
           from `ods`.`fill_tb_product_business`) where rn=1 and dt = '${yd}'
  ) b on a.shop_id = b.shop_id
  and a.product_id = b.product_id;