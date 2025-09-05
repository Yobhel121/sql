/*
CREATE TABLE `sale_spu_report_trend` (
  `__adb_auto_id__` bigint AUTO_INCREMENT,
  `cal_date` date COMMENT '统计日期',
  `sku` varchar(50) COMMENT 'SKU编号',
  `sku_name` varchar(50) COMMENT 'SKU名称',
  `spec_no` varchar(50) COMMENT '规格编号',
  `first_level` varchar(50) COMMENT '一级分类',
  `second_level` varchar(50) COMMENT '二级分类',
  `cate_2` varchar(50) COMMENT '二级品类',
  `strategy_level` varchar(50) COMMENT '战略分级',
  `channel_strategic_grading` varchar COMMENT '战略分级（渠道）',
  `spu_id` varchar(50) COMMENT 'SPU ID（货）',
  `spu_name` varchar(50) COMMENT 'SPU名称（货）',
  `gift_flag` varchar(50) COMMENT '赠品标识',
  `product_price_rsp` double COMMENT 'rsp价格',
  `brand_name` varchar(50) COMMENT '品牌',
  `department_1` varchar(50) COMMENT '一级渠道',
  `department_2` varchar(50) COMMENT '二级渠道',
  `department_3` varchar(50) COMMENT '三级渠道',
  `department_4` varchar(50) COMMENT '四级渠道',
  `gsv` double COMMENT 'GSV',
  `gmv` double COMMENT 'GMV',
  `supply_amount_gsv` double COMMENT '供货价GSV',
  `sell_count_gmv` double COMMENT 'GMV销量',
  `sell_count_rfd` double COMMENT '退款数量',
  `sell_count_gsv` double COMMENT 'GSV销量',
  `rsp_gmv` double COMMENT 'RSPGMV',
  `rsp_gsv` double COMMENT 'RSPGSV',
  `update_time` timestamp,
  `cate_1` varchar(50) COMMENT '一级品类',
  PRIMARY KEY (`__adb_auto_id__`)
) DISTRIBUTE BY HASH(`__adb_auto_id__`) INDEX_ALL='Y' STORAGE_POLICY='HOT' ENGINE='XUANWU' TABLE_PROPERTIES='{"format":"columnstore"}' COMMENT='渠道趋势指标表'

*/
insert
overwrite ads.sale_spu_report_trend
select t1.`cal_date`,                                                                                 -- 统计日期
       t1.`goods_no`,                                                                                 -- '货品编号',
       t1.goods_name,                                                                                 -- SKU名称
       t1.sku_field5,                                                                                 -- 规格编号
       t1.first_level,                                                                                -- 二级分类
       t1.second_level,                                                                               -- 二级分类
       t1.goods_field22,                                                                              -- 二级品类
       t1.goods_field17,                                                                              -- 战略分级(货)
       t1.goods_field28,                                                                              -- 渠道战略分级(货)
       t1.goods_field2,                                                                               -- SPU ID（货）
       t1.goods_field3,                                                                               -- SPU名称（货）
       CASE WHEN IFNULL(t1.gift_flag, '') = '' THEN '正品' ELSE t1.gift_flag END AS gift_flag,        -- 赠品标识
       t1.product_price_rsp,                                                                          -- rsp价格
       t1.brand_name,                                                                                 -- 品牌
       t1.`department_1`,                                                                             -- 一级部门（组织架构）
       t1.`department_2`,                                                                             -- 二级渠道（组织架构）
       t1.`department_3`,                                                                             -- 三级渠道
       t1.`department_4`,                                                                             -- 四级渠道
       sum(gsv)                                                                  as gsv,              -- gsv
       sum(t1.`gmv`)                                                             as gmv,              -- gmv
       sum(t1.supply_amount_gsv)                                                 as supply_amount_gsv,
       sum(t1.`sell_count_gmv`)                                                  as `sell_count_gmv`, -- '销售数量_gmv',
       sum(t1.`sell_count_rfd`)                                                  as `sell_count_rfd`, -- '销售数量_rfd',
       sum(t1.`sell_count_gsv`)                                                  as `sell_count_gsv`, -- '销售数量_gsv',
       sum(t1.`rspgmv`)                                                             `rspgmv`,         -- rspgmv
       sum(case
               when (t1.gift_flag = '尝鲜装拉新' or IFNULL(t1.gift_flag, '') = '')
                   then t1.product_price_rsp * t1.sell_count_gsv
               else 0 end)                                                          `rspgsv`,         -- rspgsv
       current_timestamp,
       goods_field26                                                                                  -- 一级品类
from (select t1.`cal_date`,                                                                        -- 统计日期
             t2.`goods_no`,                                                                        -- '货品编号',
             t2.goods_name,                                                                        -- SKU名称
             t1.sku_field5,                                                                        -- 规格编号
             t2.first_level,                                                                       -- 一级分类
             t2.second_level,                                                                      -- 二级分类
             t2.goods_field26,                                                                     -- 一级品类
             t2.goods_field22,                                                                     -- 二级品类
             t2.goods_field17,                                                                     -- 战略分级(货)
             t2.goods_field28,                                                                     -- 渠道战略分级(货)
             t2.goods_field2,                                                                      -- SPU ID（货）
             t2.goods_field3,                                                                      -- SPU名称（货）
             t1.gift_flag,                                                                         -- 赠品标识
             t1.product_price_rsp,                                                                 -- rsp价格
             t2.brand_name,                                                                        -- 品牌
             t1.`department_1`,                                                                    -- 一级部门（组织架构）
             t1.`department_2`,                                                                    -- 二级渠道（组织架构）
             t1.`department_3`,                                                                    -- 三级渠道
             t1.`department_4`,                                                                    -- 四级渠道
             sum(t1.`gmv` - t1.`rfd_amt`)                                 as gsv,                  -- gsv
             sum(t1.`gmv`)                                                as gmv,                  -- gmv
             sum(t1.`supply_price_gmv` - t1.`refund_amount_supply_price`) as `supply_amount_gsv `, -- GSV-供货价
             sum(t1.`sell_count_gmv`)                                     as `sell_count_gmv`,     -- '销售数量_gmv',
             sum(t1.`sell_count_rfd`)                                     as `sell_count_rfd`,     -- '销售数量_rfd',
             sum(t1.`sell_count_gmv` - t1.`sell_count_rfd`)               as `sell_count_gsv`,     -- '销售数量_gsv',
             sum(t1.`rspgmv`)                                                `rspgmv`              -- rspgmv
      from (
-- 非 孩子王乐友POS业务分类的GMV相关数据
               SELECT
                   LEFT (case when (t1.`department_1` = '线下营销中心' or (department_3 like '%线上分销%' and t1.department_3 not in ('线上分销-代运营', '线上分销-私域'))) then t1.send_time else t1.pay_time end, 10) as `cal_date`, -- 支付日期
                   t1.sku_field5,                                                                                                                                                                                                      -- 规格编号
                   t1.`goods_no`,                                                                                                                                                                                                      -- '货品编号',
                   t1.gift_flag,                                                                                                                                                                                                       -- 赠品标识
                   t1.product_price_rsp,                                                                                                                                                                                               -- rsp价格
                   sum (t1.`sell_count`) as `sell_count_gmv`,                                                                                                                                                                          -- '销售数量_gmv',
                   0 as `sell_count_rfd`,                                                                                                                                                                                              -- '销售数量_退款',
                   t1.`department_1`,                                                                                                                                                                                                  -- 一级部门（组织架构）
                   t1.`department_2`,                                                                                                                                                                                                  -- 二级渠道（组织架构）
                   t1.`department_3`,                                                                                                                                                                                                  -- 三级渠道
                   t1.`department_4`,                                                                                                                                                                                                  -- 四级渠道
                   -- sum(case when t1.sell_count * t1.product_price - t1.discount_total = 0 then 0 else t1.product_price_rsp * t1.sell_count end) `rspgmv`, -- rspgmv
                   sum (case when (t1.gift_flag = '尝鲜装拉新' or t1.gift_flag is null) then t1.product_price_rsp * t1.sell_count else 0 end) `rspgmv`,                                                                                -- rspgmv
                   case when (t1.department_3='线上分销-批采' or t1.department_1 = '线下营销中心') then sum (t1.sell_count * t1.product_price - t1.discount_total) else sum (t1.share_favourable_after_fee) end `gmv`,                 -- gmv
                   sum (case when t1.department_3 like '%线上分销%' and t1.department_3 in ('线上分销-代运营', '线上分销-私域') then t1.product_price_rsp * t1.sell_count*0.5 else 0 end) as `supply_price_gmv`,                       -- '供货价GMV',
                   0 as `refund_amount_supply_price`,                                                                                                                                                                                  -- '供货价退款金额',
                   0 as `rfd_amt`                                                                                                                                                                                                      -- 退款金额
               from
                   `dws`.`trd_erp_pay_order_sku` t1 -- 交易域-吉客云&聚水潭订单支付表
               where
                   t1.trade_type_explain not in ('售后退货'
                   , '仅退款')
                 and (t1.business_cate not in ('孩子王'
                   , '乐友')
                  or t1.business_cate is null)
                 and t1.money_type = 'gmv'
                 and t1.send_shop_type = '非寄样'
                 and LEFT (case when (t1.`department_1` = '线下营销中心'
                  or (department_3 like '%线上分销%'
                 and t1.department_3 not in ('线上分销-代运营'
                   , '线上分销-私域'))) then t1.send_time else t1.pay_time end
                   , 10)>= '2024-01-01'
               group by
                   LEFT (case when (t1.`department_1` = '线下营销中心' or (department_3 like '%线上分销%' and t1.department_3 not in ('线上分销-代运营', '线上分销-私域'))) then t1.send_time else t1.pay_time end, 10), -- 支付日期
                   t1.sku_field5,                                                                                                                                                                                        -- 规格编号
                   t1.`goods_no`,                                                                                                                                                                                        -- '货品编号',
                   t1.gift_flag,                                                                                                                                                                                         -- 赠品标识
                   t1.product_price_rsp,                                                                                                                                                                                 -- rsp价格
                   t1.`expense_center_code`,                                                                                                                                                                             -- 费用中心编码
                   t1.`department_1`,                                                                                                                                                                                    -- 一级部门（组织架构）
                   t1.`department_2`,                                                                                                                                                                                    -- 二级渠道（组织架构）
                   t1.`department_3`,                                                                                                                                                                                    -- 三级渠道
                   t1.`department_4`                                                                                                                                                                                     -- 四级渠道


               union all
-- 非 孩子王、乐友POS业务分类的退款相关数据
               SELECT
                   LEFT (ifnull(t1.cancel_time, t1.pay_time), 10) as `cal_date`,                                                                                                                  -- 支付日期
                   t1.sku_field5,                                                                                                                                                                 -- 规格编号
                   t1.`goods_no`,                                                                                                                                                                 -- '货品编号',
                   t1.gift_flag,                                                                                                                                                                  -- 赠品标识
                   t1.product_price_rsp,                                                                                                                                                          -- rsp价格
                   0 as `sell_count_gmv`,                                                                                                                                                         -- '销售数量_gmv',
                   sum (case when t1.trade_type_explain in ('售后退货', '仅退款') then -t1.`sell_count` when t1.trade_status_explain in ('已取消') then t1.`sell_count` end) as `sell_count_rfd`, -- '销售数量_退款',
                   t1.`department_1`,                                                                                                                                                             -- 一级部门（组织架构）
                   t1.`department_2`,                                                                                                                                                             -- 二级渠道（组织架构）
                   t1.`department_3`,                                                                                                                                                             -- 三级渠道
                   t1.`department_4`,                                                                                                                                                             -- 四级渠道
                   0 as `rspgmv`,                                                                                                                                                                 -- rspgmv
                   0 as `gmv`,                                                                                                                                                                    -- gmv
                   0 as `supply_price_gmv`,                                                                                                                                                       -- '供货价GMV',
                   sum (case when t1.trade_type_explain in ('售后退货', '仅退款') and t1.department_3 like '%线上分销%' and t1.department_3 in ('线上分销-代运营', '线上分销-私域') then -t1.product_price_rsp * t1.sell_count*0.5
                   when t1.trade_status_explain in ('已取消') and t1.department_3 like '%线上分销%' and t1.department_3 in ('线上分销-代运营', '线上分销-私域') then t1.product_price_rsp * t1.sell_count*0.5
                   else 0 end) as `refund_amount_supply_price`,                                                                                                                                   -- '供货价退款金额',
                   sum (case when t1.trade_type_explain in ('售后退货', '仅退款') and (t1.department_3='线上分销-批采' or t1.department_1 = '线下营销中心') then - (t1.sell_count * t1.product_price - t1.discount_total)
                   when t1.trade_type_explain in ('售后退货', '仅退款') and (t1.department_3 <> '线上分销-批采' and t1.department_1 <> '线下营销中心') then -t1.share_favourable_after_fee
                   when t1.trade_status_explain in ('已取消') and (t1.department_3='线上分销-批采' or t1.department_1 = '线下营销中心') then (t1.sell_count * t1.product_price - t1.discount_total)
                   when t1.trade_status_explain in ('已取消') and (t1.department_3 <> '线上分销-批采' and t1.department_1 <> '线下营销中心') then t1.share_favourable_after_fee
                   end) `rfd_amt`                                                                                                                                                                 -- 退款金额
               from `dws`.`trd_erp_pay_order_sku` t1 -- 交易域-吉客云&聚水潭订单支付表
               where
                   (t1.trade_type_explain in ('售后退货'
                   , '仅退款')
                  or t1.trade_status_explain in ('已取消'))
                 and (t1.business_cate not in ('孩子王'
                   , '乐友')
                  or t1.business_cate is null)
                 and LEFT (ifnull(t1.cancel_time
                   , t1.pay_time)
                   , 10) >= '2024-01-01'
                 and t1.money_type = 'rfd'
                 and t1.send_shop_type = '非寄样'
               group by
                   LEFT (ifnull(t1.cancel_time, t1.pay_time), 10), -- 退款日期
                   t1.sku_field5,                                  -- 规格编号
                   t1.`goods_no`,                                  -- '货品编号',
                   t1.gift_flag,                                   -- 赠品标识
                   t1.product_price_rsp,                           -- rsp价格
                   t1.`department_1`,                              -- 一级部门（组织架构）
                   t1.`department_2`,                              -- 二级渠道（组织架构）
                   t1.`department_3`,                              -- 三级渠道
                   t1.`department_4` -- 四级渠道
           ) t1
               left join
           (select distinct goods_no,      -- SKU
                            goods_name,    -- SKU名称
                            sku_field5,    -- 规格编号
                            brand_name,    -- 品牌
                            first_level,   -- 一级分类
                            second_level,  -- 二级分类
                            goods_field26, -- 一级品类
                            goods_field22, -- 二级品类
                            goods_field17, -- 战略分级(货)
                            goods_field28, -- 渠道战略分级(货)
                            goods_field2,  -- SPU ID（货）
                            goods_field3   -- SPU名称（货）
            from dim.jky_storage_goodsinfo
            where dt = '${yd}'
              and is_delete = 0
              and sku_is_blockup = 0) t2
           on t1.sku_field5 = t2.sku_field5
      group by t1.`cal_date`,        -- 统计日期
               t2.`goods_no`,        -- '货品编号',
               t2.goods_name,        -- SKU名称
               t1.sku_field5,        -- 规格编号
               t2.first_level,       -- 一级分类
               t2.second_level,      -- 二级分类
               t2.goods_field26,     -- 一级品类
               t2.goods_field22,     -- 二级品类
               t2.goods_field17,     -- 战略分级(货)
               t2.goods_field28,     -- 渠道战略分级(货)
               t2.goods_field2,      -- SPU ID（货）
               t2.goods_field3,      -- SPU名称（货）
               t1.gift_flag,         -- 赠品标识
               t2.brand_name,        -- 品牌
               t1.product_price_rsp, -- rsp价格
               t1.`department_1`,    -- 一级部门（组织架构）
               t1.`department_2`,    -- 二级渠道（组织架构）
               t1.`department_3`,    -- 三级渠道
               t1.`department_4`     -- 四级渠道

      union all

      select t1.biz_day                as cal_date,
             t3.`goods_no`,                                 -- '货品编号',
             t3.goods_name,                                 -- SKU名称
             t1.product_code,                               -- 规格编号
             t3.first_level,                                -- 一级分类
             t3.second_level,                               -- 二级分类
             t3.goods_field26,                              -- 一级品类
             t3.goods_field22,                              -- 二级品类
             t3.goods_field17,                              -- 战略分级(货)
             t3.goods_field28,                              -- 渠道战略分级(货)
             t3.goods_field2,                               -- SPU ID（货）
             t3.goods_field3,                               -- SPU名称（货）
             t1.gift_flag,                                  -- 赠品标识
             t1.product_price_rsp,                          -- rsp价格
             t3.brand_name,                                 -- 品牌
             t2.department_1,                               -- 一级渠道
             t2.department_2,                               -- 二级渠道
             t2.department_3,                               -- 三级渠道
             t2.department_4,                               -- 三级渠道
             SUM(t1.gsv)               as gsv,
             SUM(t1.gmv)               as gmv,
             SUM(t1.supply_amount_gsv) as supply_amount_gsv,
             sum(t1.`sell_count_gmv`)  as `sell_count_gmv`, -- '销售数量_gmv',
             sum(t1.`sell_count_rfd`)  as `sell_count_rfd`, -- '销售数量_rfd',
             sum(t1.`sell_count_gsv`)  as `sell_count_gsv`, -- '销售数量_gsv',
             SUM(t1.rspgmv)            as rspgmv
      from (
-- 京东自营
               select biz_day,
                      shop_id,
                      ''                                                                as business_cate,
                      price1                                                            as product_price_rsp,
                      product_code, -- 规格编码
                      gift_flag,
                      SUM(revenue)                                                      as gmv,
                      sum(cost - cast(cost * proportion as double))                     as supply_amount_gsv,
                      SUM(rspgmv)                                                       as rspgmv,
                      SUM(revenue - revenue * proportion)                               as gsv,
                      SUM(financial_sales_volume)                                       as sell_count_gmv,
                      SUM(financial_sales_volume * proportion)                          as sell_count_rfd,
                      SUM(financial_sales_volume - financial_sales_volume * proportion) as sell_count_gsv
               from (-- 计算商品成本,rsp_gmv
                        select a.*,
                               case when flag_data like '%便携装%' and revenue > 0 then '尝鲜装拉新' end as gift_flag,
                               cast(financial_sales_volume * price1 as double)                              rspgmv,
                               isnull(h.proportion, 0)                                                      proportion -- 退款比例
                        from (select e.biz_day,
                                     flag_data,
                                     concat(left(e.biz_day, 7), '-', '01') month,
                                     case when f.jky_shop_id is null then e.shop_id else f.jky_shop_id end shop_id,
                                     e.product_id,
                                     e.product_name,
                                     e.financial_sales_volume,
                                     e.revenue,
                                     e.product_code,
                                     e.operation,
                                     e.cost,
                                     g.price1
                              from (select *
                                    from dwd.trd_jd_autarky_product_performance
                                    where 1 = 1
                                      and revenue != 0 and biz_day>= '2024-01-01' and biz_day < '2025-08-12'
                                    union all
                                    select
                                        biz_day, shop_id, sku, product_name, trans_product_cnt, trans_amount, trans_product_cnt * purchase_cost, 0, product_code, operation, first_category, status, purchase_cost, category, margin_fixed_rate, margin_ad_rate, margin_purchase_rebate_rate, dt
                                    from
                                        dwd.trd_jd_autarky_product
                                    where
                                        1=1
                                      and trans_product_cnt != 0
                                      and biz_day >= '2025-08-12') e
                                       left join (select * from dim.jky_storage_goodsinfo where sku_field5 is not null) g
                                                 on e.product_code = g.sku_field5 -- 关联jky商品表
                                       left join (select * from dim.jky_shop_ref where shop_id is not null and dt = '${yd}') f
                                                 on e.shop_id = f.shop_id) a -- 关联成本
                                 left join (select *
                                            from dim.dim_cost_ratio_of_each_platform
                                            where dt = '${yd}' and cost_code = '3') h on a.shop_id = h.shop_id
                        where a.biz_day >= h.date and a.biz_day <= h.end_date
                           or h.date is null) -- 各平台费比,取退款比例
               group by biz_day,
                        shop_id,
                        price1,
                        product_code,
                        gift_flag

               union all

-- 天猫超市
               select biz_day,
                      shop_id,
                      business_cate,
                      product_price_rsp,
                      product_code,
                      gift_flag,
                      SUM(gmv) as                gmv,
                      SUM((ifnull(pay_product_cnt, 0) - ifnull(refund_success_product_cnt, 0)) *
                          mao_chao_supply_price) supply_amount_gsv,
                      SUM(rspgmv)                rspgmv,
                      SUM(gsv)                   gsv,
                      SUM(sell_count)            sell_count_gmv, -- 商品数量
                      0        as                sell_count_rfd, -- 商品数量
                      SUM(sell_count)            sell_count_gsv  -- 商品数量
               from (select a.biz_day,
                            case when e.jky_shop_id is null then a.shop_id else e.jky_shop_id end               shop_id,
                            case
                                when a.shop_id = '110902946' then '母婴'
                                when a.shop_id = '111027414' then '调味'
                                when a.shop_id = '114000864' then '冷冻寄售'
                                when a.shop_id = '114732615' then '冷冻商家仓'
                                else '盘货商家'
                                end                                                                          as business_cate,
                            ifnull(f.price1, 0)                                                              as product_price_rsp,
                            a.product_code,                                                                                -- 规格编码
                            case when f.flag_data like '%便携装%' and a.pay_amount > 0 then '尝鲜装拉新' end as gift_flag,
                            pay_product_cnt,
                            refund_success_product_cnt,
                            mao_chao_supply_price,
                            a.pay_amount                                                                     as gmv,
                            a.pay_product_cnt * ifnull(f.price1, 0)                                          as rspgmv,
                            ifnull(pay_amount, 0) - ifnull(refund_success_amount, 0)                         as gsv,
                            ifnull(pay_product_cnt, 0) - ifnull(refund_success_product_cnt, 0)               as sell_count -- 商品数量
                     from dwd.trd_tmcs_product a
                              left join (select * from dim.jky_storage_goodsinfo where sku_field5 is not null) f
                                        on a.product_code = f.sku_field5
                              left join (select * from dim.jky_shop_ref where shop_id is not null and dt = '${yd}') e
                                        on a.shop_id = e.shop_id
                     where a.biz_day >= '2024-01-01')
               group by biz_day,
                        shop_id,
                        business_cate,
                        product_price_rsp,
                        product_code,
                        gift_flag) t1

               left join
           (select *
            from ods.fill_expense_center_mapping
            where dt = '${yd}') t2
           on t1.shop_id = t2.shop_id and ifnull(t1.business_cate, '') = ifnull(t2.business_cate, '')
               and date (t1.biz_day)>= date(t2.start_date) and date(t1.biz_day) <= date(t2.end_date)
left join
(
select
distinct
goods_no, -- SKU
goods_name, -- SKU名称
sku_field5, -- 规格编号
brand_name, -- 品牌
first_level, -- 一级分类
second_level, -- 二级分类
goods_field26,  -- 一级品类
goods_field22, -- 二级品类
goods_field17, -- 战略分级(货)
goods_field28, -- 渠道战略分级(货)
goods_field2, -- SPU ID（货）
goods_field3 -- SPU名称（货）
from dim.jky_storage_goodsinfo where dt = '${yd}' and is_delete = 0 and sku_is_blockup = 0
) t3
on t1.product_code = t3.sku_field5

group by
    t1.biz_day,
    t3.`goods_no`,        -- '货品编号',
    t3.goods_name,        -- SKU名称
    t1.product_code,      -- 规格编号
    t3.first_level,       -- 一级分类
    t3.second_level,      -- 二级分类
    t3.goods_field22,     -- 二级品类
    t3.goods_field17,     -- 战略分级(货)
    t3.goods_field28,     -- 渠道战略分级(货)
    t3.goods_field2,      -- SPU ID（货）
    t3.goods_field3,      -- SPU名称（货）
    t1.gift_flag,         -- 赠品标识
    t1.product_price_rsp, -- rsp价格
    t3.brand_name,        -- 品牌
    t2.department_1,      -- 一级渠道
    t2.department_2,      -- 二级渠道
    t2.department_3,      -- 三级渠道
    t2.department_4       -- 四级渠道

union all
-- 孩子王乐友POS
select DATE_FORMAT(t1.pay_time, 'YYYY-MM-dd') as cal_date,
       t3.`goods_no`,                                       -- '货品编号',
       t3.goods_name,                                       -- SKU名称
       t1.goods_no,                                         -- 规格编号
       t1.first_level,                                      -- 一级分类
       t1.second_level,                                     -- 二级分类
       t3.goods_field26,                                    -- 一级品类
       t3.goods_field22,                                    -- 二级品类
       t3.goods_field17,                                    -- 战略分级(货)
       t3.goods_field28,                                    -- 渠道战略分级(货)
       t3.goods_field2,                                     -- SPU ID（货）
       t3.goods_field3,                                     -- SPU名称（货）
       ''                                     as gift_flag, -- 赠品标识
       t3.price1,                                           -- rsp价格
       t3.brand_name,                                       -- 品牌
       t1.department_1,
       t1.department_2,
       t1.department_3,
       t1.department_4,
       sum(t1.gmv)                            as gsv,
       sum(t1.gmv)                            as gmv,
       0                                      as supply_amount_gsv,
       sum(t1.sell_count)                     as sell_count_gmv,
       0                                      as sell_count_rfd,
       sum(t1.sell_count)                     as sell_count_gsv,
       sum(t1.product_price_rsp)              as rspgmv
from dws.trd_haiziwang_leyou_pay_order_sku t1
         left join
     (select distinct goods_no,      -- SKU
                      goods_name,    -- SKU名称
                      sku_field5,    -- 规格编号
                      brand_name,    -- 品牌
                      price1,        -- rsp
                      goods_field26, -- 一级品类
                      goods_field22, -- 二级品类
                      goods_field17, -- 战略分级(货)
                      goods_field28, -- 渠道战略分级(货)
                      goods_field2,  -- SPU ID（货）
                      goods_field3   -- SPU名称（货）
      from dim.jky_storage_goodsinfo
      where dt = '${yd}'
        and is_delete = 0
        and sku_is_blockup = 0) t3
     on t1.goods_no = t3.sku_field5
where DATE_FORMAT(t1.pay_time, 'YYYY-MM-dd') >= '2024-01-01'
group by DATE_FORMAT(t1.pay_time, 'YYYY-MM-dd'),
         t3.`goods_no`,    -- '货品编号',
         t3.goods_name,    -- SKU名称
         t1.goods_no,      -- 规格编号
         t1.first_level,   -- 一级分类
         t1.second_level,  -- 二级分类
         t3.goods_field26, -- 一级品类
         t3.goods_field22, -- 二级品类
         t3.goods_field17, -- 战略分级(货)
         t3.goods_field28, -- 渠道战略分级(货)
         t3.goods_field2,  -- SPU ID（货）
         t3.goods_field3,  -- SPU名称（货）
         t3.price1,        -- rsp价格
         t3.brand_name,    -- 品牌
         t1.department_1,
         t1.department_2,
         t1.department_3,
         t1.department_4

union all

select a.biz_day     as cal_date,
       ''            as `goods_no`,    -- '货品编号',
       ''            as goods_name,    -- SKU名称
       ''            as goods_no,      -- 规格编号
       ''            as first_level,   -- 一级分类
       ''            as second_level,  -- 二级分类
       ''            as goods_field26, -- 一级品类
       ''            as goods_field22, -- 二级品类
       ''            as goods_field17, -- 战略分级(货)
       ''            as goods_field28, -- 渠道战略分级(货)
       ''            as goods_field2,  -- SPU ID（货）
       ''            as goods_field3,  -- SPU名称（货）
       ''            as gift_flag,     -- 赠品标识
       null          as price1,        -- rsp价格
       ''            as brand_name,    -- 品牌
       b.department_1,
       b.department_2,
       b.department_3,
       b.department_4,
       sum(a.gmv)    as gsv,
       sum(a.gmv)    as gmv,
       0             as supply_amount_gsv,
       0             as sell_count_gmv,
       0             as sell_count_rfd,
       0             as sell_count_gsv,
       sum(a.rspgmv) as rspgmv
from (
-- 鲸钻客
         select biz_day,
                shop_id,
                '' as                                 business_cate,
                cast(actual_profit as decimal(10, 2)) rspgmv,
                cast(actual_profit as decimal(10, 2)) GMV,
                cast(actual_profit as decimal(10, 2)) GSV
         from dwd.trd_jzk_actual_profit
         where dt = (select max(dt) from dwd.trd_jzk_actual_profit)

-- 有赞 11218477 心选业务 

         UNION ALL

         select biz_day,
                shop_id,
                business_cate,
                cast(gmv as decimal(10, 2)) rspgmv,
                cast(gmv as decimal(10, 2)) GMV,
                cast(gmv as decimal(10, 2)) GSV
         from dws.fin_syyz_order_details
         where dt = (select max(dt) from dws.fin_syyz_order_details)) a
         left join
     (select *, case when business_cate is null then '' else business_cate end business_cate1
      from ods.fill_expense_center_mapping
      where dt = '${yd}') b
     on a.shop_id = b.shop_id and ifnull(a.business_cate) = b.business_cate1
         and date (a.biz_day)>= date (b.start_date) and date (a.biz_day) <= date (b.end_date)
where a.shop_id is not null and a.biz_day>='2024-01-01'
group by
    a.biz_day,
    b.department_1, -- 一级部门（组织架构）
    b.department_2, -- 二级渠道（组织架构）
    b.department_3, -- 三级渠道
    b.department_4  -- 四级渠道（店铺名称+业务分类）

union all
-- 补录数据
select biz_day,
       ''                                                                              as `goods_no`,    -- '货品编号',
       ''                                                                              as goods_name,    -- SKU名称
       ''                                                                              as goods_no,      -- 规格编号
       ''                                                                              as first_level,   -- 一级分类
       ''                                                                              as second_level,  -- 二级分类
       ''                                                                              as goods_field26, -- 一级品类
       ''                                                                              as goods_field22, -- 二级品类
       ''                                                                              as goods_field17, -- 战略分级(货)
       ''                                                                              as goods_field28, -- 渠道战略分级(货)
       ''                                                                              as goods_field2,  -- SPU ID（货）
       ''                                                                              as goods_field3,  -- SPU名称（货）
       ''                                                                              as gift_flag,     -- 赠品标识
       null                                                                            as price1,        -- rsp价格
       ''                                                                              as brand_name,    -- 品牌
       department_1,
       department_2,
       department_3,
       department_4,
       sum(case when budget_subject_code in ('4') then ft_value_center_get else 0 end) as gsv,-- GSV
       sum(case when budget_subject_code in ('2') then ft_value_center_get else 0 end) as gmv,-- GMV
       0                                                                               as supply_amount_gsv,
       0                                                                               as sell_count_gmv,
       0                                                                               as sell_count_rfd,
       0                                                                               as sell_count_gsv,
       sum(case when budget_subject_code in ('1') then ft_value_center_get else 0 end) as rsp_gmv-- RSPGMV
from ads.bud_fin_import_items_middle_ft_last
WHERE biz_day >= '2024-01-01'
  AND budget_subject_code IN ('1', '2', '4')
group by biz_day,
         department_1,
         department_2,
         department_3,
         department_4 ) t1
group by
    t1.`cal_date`,    -- 统计日期
    t1.`goods_no`,    -- '货品编号',
    t1.goods_name,    -- SKU名称
    t1.sku_field5,    -- 规格编号
    t1.first_level,   -- 一级分类
    t1.second_level,  -- 二级分类
    t1.goods_field22, -- 二级品类
    t1.goods_field17, -- 战略分级(货)
    t1.goods_field28, -- 渠道战略分级(货)
    t1.goods_field2,  -- SPU ID（货）
    t1.goods_field3,  -- SPU名称（货）
    CASE WHEN IFNULL(t1.gift_flag, '') = '' THEN '正品' ELSE t1.gift_flag
END, -- 赠品标识
   		t1.product_price_rsp, -- rsp价格
   		t1.brand_name, -- 品牌
      	t1.`department_1`,										-- 一级部门（组织架构）
      	t1.`department_2`,										-- 二级渠道（组织架构）
      	t1.`department_3`,										-- 三级渠道
      	t1.`department_4`,										-- 四级渠道
      	goods_field26  -- 一级品类
      	;


-- 3. 插入数据到新表
INSERT INTO `ads`.`ads_category_new_customer_repurchase_analysis`
SELECT
  CAST(mcnc.first_purchase_month AS VARCHAR(10)) AS first_purchase_month,
  CAST(mcnc.category AS VARCHAR(100)) AS first_purchase_category,
  CAST(mcnc.shop_id AS VARCHAR(50)) AS shop_id,
  CAST(mcnc.shop_name AS VARCHAR(100)) AS shop_name,
  CAST(mcnc.new_customers_count AS BIGINT) AS new_customers_count,
  CAST(crs.repurchase_month AS VARCHAR(10)) AS repurchase_month,
  CAST(crs.repurchase_category AS VARCHAR(100)) AS repurchase_category,
  CAST(crs.months_after_first_purchase AS INT) AS months_after_first_purchase,
  CAST(crs.repurchase_customers AS BIGINT) AS repurchase_customers,
  CAST(crs.total_repurchase_amount AS DECIMAL(38,2)) AS total_repurchase_amount,
  CAST(crs.avg_repurchase_amount AS DECIMAL(38,2)) AS avg_repurchase_amount,
  CAST(crs.total_repurchase_orders AS BIGINT) AS total_repurchase_orders,
  CAST(
    CASE
      WHEN crs.repurchase_category = mcnc.category THEN '同品类复购'
      ELSE '跨品类复购'
    END AS VARCHAR(20)
  ) AS repurchase_type,
  CAST(CURRENT_TIMESTAMP() AS TIMESTAMP) AS etl_time
FROM (
  -- 计算每个品类每个店铺每个月的总新客数
  SELECT
    first_purchase_month,
    category,
    shop_id,
    shop_name,
    COUNT(DISTINCT user_id) AS new_customers_count
  FROM (
    -- 去重获取每个用户每个品类的首次购买记录
    SELECT
      user_id,
      category,
      first_purchase_month,
      shop_id,
      shop_name
    FROM (
      -- 获取每个用户在每个品类的首次购买记录（含店铺信息）
      SELECT
        user_id,
        first_cate AS category,
        DATE_FORMAT(MIN(pay_time), 'yyyy-MM') AS first_purchase_month,
        -- 获取首次购买时的店铺信息
        FIRST_VALUE(shop_id) OVER (PARTITION BY user_id, first_cate ORDER BY pay_time) AS shop_id,
        FIRST_VALUE(shop_name) OVER (PARTITION BY user_id, first_cate ORDER BY pay_time) AS shop_name
      FROM `dws`.`trd_pay_item`
      WHERE user_id IS NOT NULL
        AND user_id != ''
        AND first_cate IS NOT NULL
        AND first_cate != ''
        AND shop_id IS NOT NULL
        AND shop_name IS NOT NULL
        AND (gift_flag IS NULL OR gift_flag = '')
      GROUP BY user_id, first_cate, shop_id, shop_name, pay_time
    ) t
    GROUP BY user_id, category, first_purchase_month, shop_id, shop_name
  ) dfp
  WHERE first_purchase_month IS NOT NULL
    AND category IS NOT NULL
    AND shop_id IS NOT NULL
    AND shop_name IS NOT NULL
  GROUP BY first_purchase_month, category, shop_id, shop_name
) mcnc
LEFT JOIN (
  -- 汇总复购数据（按店铺分组）
  SELECT
    crd.first_purchase_month,
    crd.first_purchase_category,
    crd.shop_id,
    crd.shop_name,
    crd.repurchase_month,
    crd.repurchase_category,
    CAST(TIMESTAMPDIFF(
      MONTH,
      STR_TO_DATE(CONCAT(crd.first_purchase_month, '-01'), '%Y-%m-%d'),
      STR_TO_DATE(CONCAT(crd.repurchase_month, '-01'), '%Y-%m-%d')
    ) AS SIGNED INTEGER) AS months_after_first_purchase,
    CAST(COUNT(DISTINCT crd.user_id) AS BIGINT) AS repurchase_customers,
    CAST(SUM(crd.repurchase_amount) AS DECIMAL(38,2)) AS total_repurchase_amount,
    CAST(SUM(crd.repurchase_amount) / NULLIF(COUNT(DISTINCT crd.user_id), 0) AS DECIMAL(38,2)) AS avg_repurchase_amount,
    CAST(COUNT(DISTINCT crd.order_id) AS BIGINT) AS total_repurchase_orders
  FROM (
    -- 获取复购数据（含店铺信息）
    SELECT
      dfp.first_purchase_month,
      dfp.category AS first_purchase_category,
      dfp.shop_id,
      dfp.shop_name,
      DATE_FORMAT(tpi.pay_time, 'yyyy-MM') AS repurchase_month,
      tpi.first_cate AS repurchase_category,
      dfp.user_id,
      tpi.order_id,
      COALESCE(SUM(tpi.total_amt), 0) AS repurchase_amount
    FROM (
      -- 去重获取每个用户每个品类的首次购买记录
      SELECT
        user_id,
        category,
        first_purchase_month,
        shop_id,
        shop_name
      FROM (
        -- 获取每个用户在每个品类的首次购买记录（含店铺信息）
        SELECT
          user_id,
          first_cate AS category,
          DATE_FORMAT(MIN(pay_time), 'yyyy-MM') AS first_purchase_month,
          FIRST_VALUE(shop_id) OVER (PARTITION BY user_id, first_cate ORDER BY pay_time) AS shop_id,
          FIRST_VALUE(shop_name) OVER (PARTITION BY user_id, first_cate ORDER BY pay_time) AS shop_name
        FROM `dws`.`trd_pay_item`
        WHERE user_id IS NOT NULL
          AND user_id != ''
          AND first_cate IS NOT NULL
          AND first_cate != ''
          AND shop_id IS NOT NULL
          AND shop_name IS NOT NULL
          AND (gift_flag IS NULL OR gift_flag = '')
        GROUP BY user_id, first_cate, shop_id, shop_name, pay_time
      ) t
      GROUP BY user_id, category, first_purchase_month, shop_id, shop_name
    ) dfp
    JOIN `dws`.`trd_pay_item` tpi ON dfp.user_id = tpi.user_id
    WHERE DATE_FORMAT(tpi.pay_time, 'yyyy-MM') > dfp.first_purchase_month
      AND tpi.first_cate IS NOT NULL
      AND tpi.shop_id IS NOT NULL
      AND (tpi.gift_flag IS NULL OR tpi.gift_flag = '')
      AND tpi.pay_time IS NOT NULL
    GROUP BY dfp.first_purchase_month, dfp.category,
             dfp.shop_id, dfp.shop_name, DATE_FORMAT(tpi.pay_time, 'yyyy-MM'),
             tpi.first_cate, dfp.user_id, tpi.order_id
  ) crd
  WHERE crd.first_purchase_month IS NOT NULL
    AND crd.repurchase_month IS NOT NULL
  GROUP BY crd.first_purchase_month, crd.first_purchase_category,
           crd.shop_id, crd.shop_name, crd.repurchase_month, crd.repurchase_category
) crs ON mcnc.first_purchase_month = crs.first_purchase_month
  AND mcnc.category = crs.first_purchase_category
  AND mcnc.shop_id = crs.shop_id
WHERE mcnc.first_purchase_month IS NOT NULL
  AND mcnc.category IS NOT NULL
  AND mcnc.shop_id IS NOT NULL
ORDER BY mcnc.first_purchase_month, mcnc.category, mcnc.shop_name, crs.repurchase_month;