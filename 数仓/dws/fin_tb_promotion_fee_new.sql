insert overwrite dws.fin_tb_promotion_fee_new

select
  a.biz_day,
  b.jky_shop_id shop_id,
  a.business_cate,
  sum(taobao_customer) taobao_customer,
  sum(pinxiaobao) pinxiaobao,
  sum(wanxiangtai) wanxiangtai,
  sum(commission) commission,
  sum(guanghe_commission)guanghe_commission,
  '${yd}'dt
from
  (
    -- 淘宝客
    select
      biz_day,
      shop_id,
      business_cate,
      settlement_total_expense taobao_customer,
      0 pinxiaobao,
      0 wanxiangtai,
      0 commission,
   0 guanghe_commission
    from
      dwd.tb_product_analysis
    where
      dt = '${yd}'
    union all
    -- cps账户明细
    select
      biz_day,
      shop_id,
      '' business_cate,
      taobao_customer,
      0 pinxiaobao,
      0 wanxiangtai,
      0 commission,
   0 guanghe_commission
    from
      dwd.fin_tb_cps_account_fee
    where
      dt = '${yd}'
      and ! (
        shop_id = '117626295'
        and biz_day >= '2025-03-01'
      )
    union all
    -- 品销宝
    select
      biz_day,
      shop_id,
      business_cate,
      0 taobao_customer,
      trans_amount / number pinxiaobao,
      0 wanxiangtai,
      0 commission,
   0 guanghe_commission
    from
      dwd.fin_tb_trans_log
    where
      dt = '${yd}'
    union all
    -- 天猫官旗店万相台花费
    select
      biz_day,
      shop_id,
      business_cate,
      0 taobao_customer,
      0 pinxiaobao,
      total_cost wanxiangtai,
      0 commission,
   0 guanghe_commission
    from
      (
        -- 链接花费扣减掉多余得优惠花费
        select
          c.*,
          d.total_consumption,
          d.trans_amount,
          d.chayi,
          d.number,
          c.cost - ifnull(d.chayi / number, 0) total_cost
        from
          (
            select
              biz_day,
              shop_id,
              business_cate,
              plan_id,
              plan_name,
              cost
            from
              dwd.tb_plan_scenarios
            where
              shop_id = '117626295'
              and biz_day >= '2025-01-01'
              and dt = '${yd}'
          ) c
          left join (
            -- 计算链接合计花费与财务核对花费差异
            select
              a.*,
              b.trans_amount,
              a.total_consumption - b.trans_amount chayi
            from
              -- 求和每日花费
              (
                select
                  biz_day,
                  shop_id,
                  sum(cost) total_consumption,
                  count(plan_id) number
                from
                  dwd.tb_plan_scenarios
                where
                  shop_id = '117626295'
                  and biz_day >= '2025-01-01'
                  and dt = '${yd}'
                group by
                  biz_day,
                  shop_id
              ) a -- 取财务核对花费
              left join (
                select
                  trans_date,
                  shop_id,
                  sum(trans_amount) trans_amount
                from
                  dwd.fin_tb_account_fee
                where
                  dt = '${yd}'
                  and shop_id = '117626295'
                  and trans_date >= '2025-03-01'
                group by
                  trans_date,
                  shop_id
              ) b on a.biz_day = b.trans_date
              and a.shop_id = b.shop_id
          ) d on c.biz_day = d.biz_day
          and c.shop_id = d.shop_id
      )
    union all
    -- 除官旗2025年1月之后的所有店铺数据
    -- 账户明细万相台
    select
      trans_date as biz_day,
      case
        when shop_id = '-1' then '14580755'
        else shop_id
      end shop_id,
      '' business_cate,
      0 taobao_customer,
      0 pinxiaobao,
      trans_amount as wanxiangtai,
      0 commission,
   0 guanghe_commission
    from
      dwd.fin_tb_account_fee
    where
      dt = '${yd}'
      and ! (
        shop_id = '117626295'
        and trans_date >= '2025-01-01'
      )
    union all
    -- 优惠卷花费
    select
      biz_day,
      shop_id,
      '' business_cate,
      0 taobao_customer,
      0 pinxiaobao,
      operate_amount as wanxiangtai,
      0 commission,
  0 guanghe_commission
    from
      dwd.fin_tb_coupon_usage
    where
      dt = '${yd}'
      and biz_day < '2025-03-01'
      and usage_method = '扣款'
      and ! (
        shop_id = '117626295'
        and biz_day >= '2025-01-01'
      )
    union all
    -- 专款现金交易
    select
      date_sub(date_format(account_time, 'yyyy-MM-dd'), 1) biz_day,
      shop_id,
      '' business_cate,
      0 taobao_customer,
      0 pinxiaobao,
      operate_amount wanxiangtai,
      0 commission,
  0 guanghe_commission
    from
      dwd.fin_tb_special_trans
    where
      dt = '${yd}'
      and date_sub(date_format(account_time, 'yyyy-MM-dd'), 1) < '2025-03-01'
      and trans_type = '扣款'
      and income_expense_type = '支出'
      and ! (
        shop_id = '117626295'
        and date_format(account_time, 'yyyy-MM-dd') >= '2025-01-01'
      )
    union all
    -- 达人佣金
    select
      biz_day,
      shop_id,
      order_cate,
      0 taobao_customer,
      0 pinxiaobao,
      0 wanxiangtai,
      sum(ifnull(estimated_commission, 0)) - sum(ifnull(refund_commission, 0)) commission,
  0 guanghe_commission
    from
      (
        select
          pay_time biz_day,
          shop_id,
          order_cate,
          main_order_id,
          sub_order_id,
          product_id,
          estimated_commission,
          0 refund_commission
        from
          dwd.fin_tb_unpaid_order_commission
        where
          dt = '${yd}'
        union all
        -- 退款达人佣金
        select
          complete_time biz_day,
          shop_id,
          order_cate,
          main_order_id,
          sub_order_id,
          product_id,
          0 estimated_commission,
          (
            ifnull(estimated_commission, 0) - ifnull(refund_estimated_commission, 0)
          ) refund_commission
        from
          dwd.fin_tb_unpaid_order_commission
        where
          dt = '${yd}'
          and ! (
            complete_time < '2024-03-17'
            and shop_id = '117626295'
          )
      )
    group by
      biz_day,
      shop_id,
      order_cate
  union all
  -- 光合
  select order_complete_time,shop_id,business_cate,0 taobao_customer,
      0 pinxiaobao,
      0 wanxiangtai,
      0 commission,
  estimated_commission guanghe_commission
  from dwd.fin_tb_gh_product_promotion where dt='${yd}'
  ) a
  left join (
    select
      *
    from
      dim.jky_shop_ref
    where
      shop_id is not null
      and dt = '${yd}'
  ) b on a.shop_id = b.shop_id
where
  b.jky_shop_id is not null -- a.biz_day = '2025-03-20'
GROUP by
  a.biz_day,
  b.jky_shop_id,
  a.business_cate
order by
  b.jky_shop_id;