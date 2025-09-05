select
  b.department_1,
  -- 一级部门（组织架构）
  b.department_2,
  -- 二级渠道（组织架构）
  b.department_3,
  -- 三级渠道
  b.department_4,
  -- 四级渠道（店铺名称+业务分类）
  b.expense_center,
  -- 费用中心名称
  b.expense_center_code,
  -- 费用中心编号
  a.biz_day,
  a.shop_id,
  a.business_cate,
  a.GMV,
  a.goods_coat,
  a.refund_amount,
  a.GSV,
  a.supply_price_amount,
  a.refund_supply_price_amount,
  a.supply_amount_gsv,
  a.rspgmv,
  a.gmv_taste,
  a.refund_amount_taste,
  a.gsv_taste,
  a.rsp_gmv_taste,
  a.supply_gmv_taste,
  a.supply_refund_amount_taste,
  a.supply_gsv_taste,
  a.maobao,
  a.maobao_supply,
  a.jtk_amount,
  a.jzt_amount,
  a.gift_amount,
  a.cid_consume,
  a.brand_zone,
  a.chip_launch,
  a.shopp_contact,
  a.haitou,
  express_train,
  a.fund_details,
  a.direct_train,
  a.gravity_cube,
  a.wanxiangtai,
  a.taobao_customer,
  a.pinxiaobao,
  a.e_niu_cost,
  a.expert_commission,
  a.qianchuan_pc,
  a.feel_free_push,
  a.ddjb_commission_fee,
  a.full_site_promotion,
  a.platform_promotion_fee,
  a.only_enjoy_customer,
  a.promotion_expenses,
  a.hp_resource,
  a.platform_commission,
  a.cg_distribution_commission,
  a.xhs_promotion,
  a.guanghe_commission,
  a.non_food_gift_inventory,
  '${yd}' dt
from
  (
    select
      biz_day,
      shop_id,
      '' business_cate,
      rspgmv,
      GMV,
      goods_coat,
      refund_amount,
      (GMV - refund_amount) GSV,
      supply_price_amount,
      refund_supply_price_amount,
      (supply_price_amount - refund_supply_price_amount) supply_amount_gsv,
      maobao,
      maobao_supply,
      jtk_amount,
      jzt_amount,
      gift_amount,
      cid_consume,
      brand_zone,
      chip_launch,
      shopp_contact,
      haitou,
      express_train,
      cast(0 as double) fund_details,
      cast(0 as double) gravity_cube,
      cast(0 as double) direct_train,
      cast(0 as double) wanxiangtai,
      cast(0 as double) taobao_customer,
      cast(0 as double) pinxiaobao,
      cast(0 as double) e_niu_cost,
      cast(0 as double) expert_commission,
      cast(0 as double) qianchuan_pc,
      cast(0 as double) feel_free_push,
      cast(0 as double) ddjb_commission_fee,
      cast(0 as double) full_site_promotion,
      cast(0 as double) platform_promotion_fee,
      cast(0 as double) only_enjoy_customer,
      cast(0 as double) promotion_expenses,
      cast(0 as double) hp_resource,
      cast(0 as double) platform_commission,
      cast(0 as double) cg_distribution_commission,
      cast(0 as double) xhs_promotion,
      gmv_taste,
      refund_amount_taste,
      gsv_taste,
      rsp_gmv_taste,
      supply_gmv_taste,
      supply_refund_amount_taste,
      supply_gsv_taste,
      0 guanghe_commission,
      non_food_gift_inventory
    from
      `dws`.`fin_jd_GMV_promotion_fee`
    where
      dt = (
        select
          max(dt)
        from
          dws.fin_jd_GMV_promotion_fee
      )
    union all
    select
      a.biz_day,
      a.shop_id,
      a.business_cate,
      rspgmv,
      a.pay_amount,
      goods_coat - refund_goods_coat goods_cost,
      a.refund_success_amount,
      a.gsv,
      a.supply_amount,
      a.refund_supply_amount,
      a.supply_amount_gsv,
      a.maobao,
      a.maobao_supply,
      cast(0 as double) jtk_amount,
      cast(0 as double) jzt_amount,
      cast(0 as double) gift_amount,
      cast(0 as double) cid_consume,
      cast(0 as double) brand_zone,
      cast(0 as double) chip_launch,
      cast(0 as double) shopp_contact,
      cast(0 as double) haitou,
      cast(0 as double) express_train,
      b.fund_details,
      b.gravity_cube,
      b.direct_train,
      b.wanxiangtai,
      b.taobao_customer,
      cast(0 as double) pinxiaobao,
      cast(0 as double) e_niu_cost,
      cast(0 as double) expert_commission,
      cast(0 as double) qianchuan_pc,
      cast(0 as double) feel_free_push,
      cast(0 as double) ddjb_commission_fee,
      cast(0 as double) full_site_promotion,
      cast(0 as double) platform_promotion_fee,
      cast(0 as double) only_enjoy_customer,
      cast(0 as double) promotion_expenses,
      cast(0 as double) hp_resource,
      cast(0 as double) platform_commission,
      cast(0 as double) cg_distribution_commission,
      cast(0 as double) xhs_promotion,
      gmv_taste,
      refund_amount_taste,
      gsv_taste,
      rsp_gmv_taste,
      supply_gmv_taste,
      supply_refund_amount_taste,
      supply_gsv_taste,
      0 guanghe_commission,
      cast(0 as double) non_food_gift_inventory
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
    union all
    -- 抖音随心推，千川
    select
      biz_day,
      shop_id,
      IFNULL(business_cate, ''),
      cast(0 as double) rspgmv,
      cast(0 as double) GMV,
      cast(0 as double) goods_coat,
      cast(0 as double) refund_amount,
      cast(0 as double) GSV,
      cast(0 as double) supply_price_amount,
      cast(0 as double) refund_supply_price_amount,
      cast(0 as double) supply_amount_gsv,
      cast(0 as double) maobao,
      cast(0 as double) maobao_supply,
      cast(0 as double) jtk_amount,
      cast(0 as double) jzt_amount,
      cast(0 as double) gift_amount,
      cast(0 as double) cid_consume,
      cast(0 as double) brand_zone,
      cast(0 as double) chip_launch,
      cast(0 as double) shopp_contact,
      cast(0 as double) haitou,
      cast(0 as double) express_train,
      cast(0 as double) fund_details,
      cast(0 as double) gravity_cube,
      cast(0 as double) direct_train,
      cast(0 as double) wanxiangtai,
      cast(0 as double) taobao_customer,
      cast(0 as double) pinxiaobao,
      cast(0 as double) e_niu_cost,
      sum(expert_commission) expert_commission,
      sum(qianchuan_pc) qianchuan_pc,
      sum(feel_free_push) feel_free_push,
      cast(0 as double) ddjb_commission_fee,
      cast(0 as double) full_site_promotion,
      cast(0 as double) platform_promotion_fee,
      cast(0 as double) only_enjoy_customer,
      cast(0 as double) promotion_expenses,
      cast(0 as double) hp_resource,
      cast(0 as double) platform_commission,
      cast(0 as double) cg_distribution_commission,
      cast(0 as double) xhs_promotion,
      cast(0 as double) gmv_taste,
      cast(0 as double) refund_amount_taste,
      cast(0 as double) gsv_taste,
      cast(0 as double) rsp_gmv_taste,
      cast(0 as double) supply_gmv_taste,
      cast(0 as double) supply_refund_amount_taste,
      cast(0 as double) supply_gsv_taste,
      0 guanghe_commission,
      cast(0 as double) non_food_gift_inventory
    from
      dws.fin_dy_promotion_fee
    where
      dt = (
        select
          max(dt)
        from
          dws.fin_dy_promotion_fee
      )
      and shop_id != '/'
    group by
      biz_day,
      shop_id,
      business_cate
    union all
    -- 京东pop推广费
    select
      biz_day,
      shop_id,
      '' business_cate,
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
      jtk_amount,
      jzt_amount,
      gift_amount,
      cid_consume,
      brand_zone,
      chip_launch,
      shopp_contact,
      haitou,
      express_train,
      cast(0 as decimal(10, 2)) fund_details,
      cast(0 as decimal(10, 2)) gravity_cube,
      cast(0 as decimal(10, 2)) direct_train,
      cast(0 as decimal(10, 2)) wanxiangtai,
      cast(0 as decimal(10, 2)) taobao_customer,
      cast(0 as decimal(10, 2)) pinxiaobao,
      cast(0 as decimal(10, 2)) e_niu_cost,
      cast(0 as decimal(10, 2)) expert_commission,
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
      0 guanghe_commission,
      cast(0 as double) non_food_gift_inventory
    from
      dws.fin_jd_promotion_fee
    where
      dt = (
        select
          max(dt)
        from
          dws.fin_jd_promotion_fee
      )
      and shop_id not in('11809520', 'JDZYSX', 'JD0237')
    union all
    -- 快手磁力金牛,小红书推广费
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
      cast(0 as decimal(10, 2)) wanxiangtai,
      cast(0 as decimal(10, 2)) taobao_customer,
      cast(0 as decimal(10, 2)) pinxiaobao,
      e_niu_cost,
      expert_commission,
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
      xhs_promotion,
      cast(0 as decimal(10, 2)) gmv_taste,
      cast(0 as decimal(10, 2)) refund_amount_taste,
      cast(0 as decimal(10, 2)) gsv_taste,
      cast(0 as decimal(10, 2)) rsp_gmv_taste,
      cast(0 as decimal(10, 2)) supply_gmv_taste,
      cast(0 as decimal(10, 2)) supply_refund_amount_taste,
      cast(0 as decimal(10, 2)) supply_gsv_taste,
      0 guanghe_commission,
      cast(0 as double) non_food_gift_inventory
    from
      dws.fin_ks_xhs_promotion_fee
    where
      dt = (
        select
          max(dt)
        from
          dws.fin_ks_xhs_promotion_fee
      )
    union all
    -- 唯品会，拼多多，爱库存，线上孩子王
    select
      biz_day,
      shop_id,
      '' business_cate,
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
      direct_train,
      cast(0 as decimal(10, 2)) wanxiangtai,
      cast(0 as decimal(10, 2)) taobao_customer,
      cast(0 as decimal(10, 2)) pinxiaobao,
      cast(0 as decimal(10, 2)) e_niu_cost,
      cast(0 as decimal(10, 2)) expert_commission,
      cast(0 as decimal(10, 2)) qianchuan_pc,
      cast(0 as decimal(10, 2)) feel_free_push,
      ddjb_commission_fee,
      full_site_promotion,
      platform_promotion_fee,
      only_enjoy_customer,
      promotion_expenses,
      hp_resource,
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
      0 guanghe_commission,
      cast(0 as double) non_food_gift_inventory
    from
      dws.fin_eb_xls_promotion_fee
    where
      dt = (
        select
          max(dt)
        from
          dws.fin_eb_xls_promotion_fee
      )
    union all
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
      sum(taobao_customer),
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
      dt = (
        select
          max(dt)
        from
          dws.fin_tb_promotion_fee_new
      )
    group by
      biz_day,
      shop_id,
      business_cate
    union all
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
      cast(0 as decimal(10, 2)) wanxiangtai,
      cast(0 as decimal(10, 2)) taobao_customer,
      cast(0 as decimal(10, 2)) pinxiaobao,
      cast(0 as decimal(10, 2)) e_niu_cost,
      cast(0 as decimal(10, 2)) expert_commission,
      cast(0 as decimal(10, 2)) qianchuan_pc,
      cast(0 as decimal(10, 2)) feel_free_push,
      cast(0 as decimal(10, 2)) ddjb_commission_fee,
      cast(0 as decimal(10, 2)) full_site_promotion,
      cast(0 as decimal(10, 2)) platform_promotion_fee,
      cast(0 as decimal(10, 2)) only_enjoy_customer,
      cast(0 as decimal(10, 2)) promotion_expenses,
      cast(0 as decimal(10, 2)) hp_resource,
      platform_commission,
      (
        cg_distribution_commission - cg_distribution_promotion_subsidy
      ) cg_distribution_commission,
      cast(0 as decimal(10, 2)) xhs_promotion,
      cast(0 as decimal(10, 2)) gmv_taste,
      cast(0 as decimal(10, 2)) refund_amount_taste,
      cast(0 as decimal(10, 2)) gsv_taste,
      cast(0 as decimal(10, 2)) rsp_gmv_taste,
      cast(0 as decimal(10, 2)) supply_gmv_taste,
      cast(0 as decimal(10, 2)) supply_refund_amount_taste,
      cast(0 as decimal(10, 2)) supply_gsv_taste,
      0 guanghe_commission,
      cast(0 as double) non_food_gift_inventory
    from
      dws.fin_syyz_dy_commission
    where
      dt = (
        select
          max(dt)
        from
          dws.fin_syyz_dy_commission
      )
    union all
    -- 鲸钻客
    select
      biz_day,
      shop_id,
      '' business_cate,
      cast(actual_profit as decimal(10, 2)) rspgmv,
      cast(actual_profit as decimal(10, 2)) GMV,
      cast(0 as decimal(10, 2)) goods_coat,
      cast(0 as decimal(10, 2)) refund_amount,
      cast(actual_profit as decimal(10, 2)) GSV,
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
      cast(0 as decimal(10, 2)) wanxiangtai,
      cast(0 as decimal(10, 2)) taobao_customer,
      cast(0 as decimal(10, 2)) pinxiaobao,
      cast(0 as decimal(10, 2)) e_niu_cost,
      cast(0 as decimal(10, 2)) expert_commission,
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
      0 guanghe_commission,
      cast(0 as double) non_food_gift_inventory
    from
      dwd.trd_jzk_actual_profit
    where
      dt = (
        select
          max(dt)
        from
          dwd.trd_jzk_actual_profit
      ) -- 有赞 11218477 心选业务
    UNION ALL
    select
      biz_day,
      shop_id,
      business_cate,
      cast(gmv as decimal(10, 2)) rspgmv,
      cast(gmv as decimal(10, 2)) GMV,
      cast(0 as decimal(10, 2)) goods_coat,
      cast(0 as decimal(10, 2)) refund_amount,
      cast(gmv as decimal(10, 2)) GSV,
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
      cast(0 as decimal(10, 2)) wanxiangtai,
      cast(0 as decimal(10, 2)) taobao_customer,
      cast(0 as decimal(10, 2)) pinxiaobao,
      cast(0 as decimal(10, 2)) e_niu_cost,
      cast(0 as decimal(10, 2)) expert_commission,
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
      0 guanghe_commission,
      cast(0 as double) non_food_gift_inventory
    from
      dws.fin_syyz_order_details
    where
      dt = (
        select
          max(dt)
        from
          dws.fin_syyz_order_details
      )
  ) a
  left join (
    select
      *,
      case
        when business_cate is null then ''
        else business_cate
      end business_cate1
    from
      ods.fill_expense_center_mapping
    where
      dt = '${yd}'
  ) b on a.shop_id = b.shop_id
  and ifnull(a.business_cate) = b.business_cate1
  and date(a.biz_day) >= date(b.start_date)
  and date(a.biz_day) <= date(b.end_date)
where
  a.shop_id is not null -- and  a.biz_day='2025-01-07'  and b.department_1 is null ;