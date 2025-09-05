insert overwrite dws.trd_erp_pay_order_sku
SELECT
    t1.erp,                     -- erp系统
    t1.trade_no,                -- 订单编号
    t1.trade_id,                -- 外部编码
    t1.plt_trade_no,            -- 网店订单号
    t1.is_ex,                   -- 是否异常订单，1：是，0：否
    t1.shop_id,                 -- 销售渠道id
    t1.shop_name,               -- 销售渠道
    t1.shop_code,               -- 销售渠道Code(原始)
    t1.goods_no,                -- 货品编号
    t1.goods_name,              -- 货品名称
    t1.goods_tags,              -- 货品标签
    t1.sku_id,                  -- 规格ID
    t1.plat_sku_id,             -- 外部货品编码
    t1.is_fit,                  -- 组装标记
    t1.is_gift,                 -- 赠品标记
    t1.gift_flag,               -- 赠品标识:尝鲜装赠品，NS赠品，非食赠品，正装赠品
    t1.plat_author_id,          -- 平台主播id
    t1.plat_author_name,        -- 平台主播名称
    t1.product_price,           -- 商品单价
    case  when t2.sku_field5 like 'D%' and t1.pay_time >'2025-04-01' then 0 else t1.product_cost end,            -- 商品成本
    case  when t2.sku_field5 like 'D%' and t1.pay_time >'2025-04-01' then 0 else t2.price1 end ,					-- RSP价格 4.25馋哆啦剔除
    t1.sell_count,              -- 销售数量
    t1.tax_fee,                 -- 税额
    t1.customer_code,           -- 客户编号
    t1.customer_account,		-- 客户账号
  	t1.send_shop_scenario,		-- 寄样场景
    t1.seller_memo,             -- 客服备注
    t1.buyer_memo,              -- 买家备注
    t1.append_memo,             -- 追加备注
    t1.trade_type,              -- 订单类型(数值版)
    t1.trade_type_explain,      -- 订单类型(文本版本)
    t1.trade_status,            -- 销售单状态(数值版)
    t1.trade_status_explain,    -- 销售单状态(文本版)
    t1.order_time,              -- 下单时间
    t1.pay_time,                -- 支付时间
    t1.send_time,               -- 发货时间
    t1.delivery_time,           -- 收货时间
    t1.cancel_time,             -- 取消时间
    t1.rfd_time,                -- 退款时间
    t1.country,                 -- 国家
    t1.state,                   -- 省
    t1.city,                    -- 城市
    t1.district,                -- 区县
    t1.town,                    -- 街道
    t1.zip,                     -- 邮编
    t1.warehouse_code,          -- 发货仓库编码
    t1.warehouse_name,          -- 发货仓库名称
    t1.is_cod_warehouse,        -- 是否冷链仓
    t1.discount_fee,            -- 优惠金额
    t1.payment,                 -- 应收金额
    t1.coupon_fee,              -- 平台优惠
    t1.received_total,          -- 已收金额
    t1.discount_total,          -- 优惠总金额
    t1.goods_plat_discount_fee, -- 货品平台优惠
    t1.divide_sell_total,       -- 实付总金额
    t1.share_order_discount_fee,-- 订单商品优惠分摊
    t1.share_order_plat_discount_fee, -- 订单平台优惠分摊
    t1.share_favourable_fee,    -- 分摊金额
    case when t1.shop_code='11218477' and t1.business_cate='心选业务' then 0 else t1.share_favourable_after_fee end, -- 分摊后金额
    t1.order_cate,              -- 平台订单业务分类
    t1.product_cate,            -- 平台商品业务分类
    t1.account_cate,            -- 平台账户业务分类
    t1.business_cate,           -- 业务分类
    t2.sku_field5,           -- 规格编码
    t2.sku_name,             -- 规格名称
    t2.first_level,          -- 一级分类
    t2.second_level,          -- 二级分类
    t2.third_level,          -- 三级分类
    t2.fourth_level,          -- 四级分类
    t3.department_1,          -- 一级部门（组织架构）
    t3.department_2,          -- 二级渠道（组织架构）
    t3.department_3,          -- 三级渠道
    t3.department_4,          -- 四级渠道（店铺名称+业务分类）
    t3.expense_center,         -- 费用中心名称
    t3.expense_center_code,    -- 费用中心名称编号
    'gmv' as money_type,        -- 金额类型
    '非寄样' as send_shop_type,    -- 寄样类型
    null as phone,            -- 电话
    null as address,    -- 地址
    null as mobile,    -- 手机
    null as receiverName,  -- 收件人名称
    t1.flag_data -- 货品标记 常温冷链
from dwd.trd_erp_pay_order_sku t1 -- 交易域-吉客云&聚水潭订单支付表
left join (select distinct * from dim.jky_storage_goodsinfo where dt = '${yd}') t2 -- 分页查询货品信息维表
on t1.sku_id = t2.sku_id
left join (select distinct * from ods.fill_expense_center_mapping where dt = '${yd}' and expense_center not like '%中台%') t3
on UPPER(t1.shop_code) = UPPER(t3.shop_id) and ifnull(t1.business_cate,'') = ifnull(t3.business_cate,'') and LEFT(case when (t3.`department_1` = '线下营销中心' or (t3.department_3 like '%线上分销%' and t3.department_3 not in ('线上分销-代运营','线上分销-私域'))) then t1.send_time else t1.pay_time end,10) between date(t3.start_date) and date(t3.end_date)
  where (UPPER(t1.seller_memo) not LIKE '%SSD%' and UPPER(t1.buyer_memo) not LIKE '%SSD%')
and (shop_code not in ('14505590','11908207','YC19D','14028951','11908207')) -- 2025.7.21 剔除'11809520','JDZYSX','JD0237'
and t1.trade_type_explain not in ('售后退货','仅退款')
AND NOT (t1.shop_name LIKE '线上分销%' AND (t3.expense_center_code IS NULL OR t3.expense_center_code = ''))
and not (t1.shop_code= '13302195' and (t3.expense_center_code IS NULL OR t3.expense_center_code = '') ) -- 过滤发货时间统计下的取消单
and not (t1.trade_status_explain in ('已取消') and (t3.department_3 in ('线上分销-批采','线上分销-一件代发') OR t3.department_1 = '线下营销中心')) -- 过滤发货时间统计下的取消单
 AND not (UPPER(t1.shop_code)  ='11626221' AND t1.goods_no = 'QTYF0001')  -- 过滤补差链接店铺


union all


SELECT
    t1.erp,                     -- erp系统
    t1.trade_no,                -- 订单编号
    t1.trade_id,                -- 外部编码
    t1.plt_trade_no,            -- 网店订单号
    t1.is_ex,                   -- 是否异常订单，1：是，0：否
    t1.shop_id,                 -- 销售渠道id
    t1.shop_name,               -- 销售渠道
    t1.shop_code,               -- 销售渠道Code(原始)
    t1.goods_no,                -- 货品编号
    t1.goods_name,              -- 货品名称
    t1.goods_tags,              -- 货品标签
    t1.sku_id,                  -- 规格ID
    t1.plat_sku_id,             -- 外部货品编码
    t1.is_fit,                  -- 组装标记
    t1.is_gift,                 -- 赠品标记
    t1.gift_flag,               -- 赠品标识:尝鲜装赠品，NS赠品，非食赠品，正装赠品
    t1.plat_author_id,          -- 平台主播id
    t1.plat_author_name,        -- 平台主播名称
    t1.product_price,           -- 商品单价
    t1.product_cost,            -- 商品成本
     case  when t2.sku_field5 like 'D%' and t1.pay_time >'2025-04-01' then 0 else t2.price1 end ,					-- RSP价格
    t1.sell_count,              -- 销售数量
    t1.tax_fee,                 -- 税额
    t1.customer_code,           -- 客户编号
    t1.customer_account,		-- 客户账号
  	t1.send_shop_scenario,		-- 寄样场景
    t1.seller_memo,             -- 客服备注
    t1.buyer_memo,              -- 买家备注
    t1.append_memo,             -- 追加备注
    t1.trade_type,              -- 订单类型(数值版)
    t1.trade_type_explain,      -- 订单类型(文本版本)
    t1.trade_status,            -- 销售单状态(数值版)
    t1.trade_status_explain,    -- 销售单状态(文本版)
    t1.order_time,              -- 下单时间
    t1.pay_time,                -- 支付时间
    t1.send_time,               -- 发货时间
    t1.delivery_time,           -- 收货时间
    t1.cancel_time,             -- 取消时间
    t1.rfd_time,                -- 退款时间
    t1.country,                 -- 国家
    t1.state,                   -- 省
    t1.city,                    -- 城市
    t1.district,                -- 区县
    t1.town,                    -- 街道
    t1.zip,                     -- 邮编
    t1.warehouse_code,          -- 发货仓库编码
    t1.warehouse_name,          -- 发货仓库名称
    t1.is_cod_warehouse,        -- 是否冷链仓
    t1.discount_fee,            -- 优惠金额
    t1.payment,                 -- 应收金额
    t1.coupon_fee,              -- 平台优惠
    t1.received_total,          -- 已收金额
    t1.discount_total,          -- 优惠总金额
    t1.goods_plat_discount_fee, -- 货品平台优惠
    t1.divide_sell_total,       -- 实付总金额
    t1.share_order_discount_fee,-- 订单商品优惠分摊
    t1.share_order_plat_discount_fee, -- 订单平台优惠分摊
    t1.share_favourable_fee,    -- 分摊金额
    case when t1.shop_code='11218477' and t1.business_cate='心选业务' then 0 else t1.share_favourable_after_fee end, -- 分摊后金额
    t1.order_cate,              -- 平台订单业务分类
    t1.product_cate,            -- 平台商品业务分类
    t1.account_cate,            -- 平台账户业务分类
    t1.business_cate,           -- 业务分类
    t2.sku_field5,           -- 规格编码
    t2.sku_name,             -- 规格名称
    t2.first_level,          -- 一级分类
    t2.second_level,          -- 二级分类
    t2.third_level,          -- 三级分类
    t2.fourth_level,          -- 四级分类
    t3.department_1,          -- 一级部门（组织架构）
    t3.department_2,          -- 二级渠道（组织架构）
    t3.department_3,          -- 三级渠道
    t3.department_4,          -- 四级渠道（店铺名称+业务分类）
    t3.expense_center,         -- 费用中心名称
    t3.expense_center_code,    -- 费用中心名称编号
    'rfd' as money_type,        -- 金额类型
    '非寄样' as send_shop_type,    -- 寄样类型
    null as phone,            -- 电话
    null as address,    -- 地址
    null as mobile,    -- 手机
    null as receiverName,  -- 收件人名称
  t1.flag_data -- 货品标记 常温冷链
from dwd.trd_erp_pay_order_sku t1 -- 交易域-吉客云&聚水潭订单支付表
left join (select distinct * from dim.jky_storage_goodsinfo where dt = '${yd}') t2 -- 分页查询货品信息维表
on t1.sku_id = t2.sku_id
left join (select distinct * from ods.fill_expense_center_mapping where dt = '${yd}' and expense_center not like '%中台%') t3
on UPPER(t1.shop_code) = UPPER(t3.shop_id) and ifnull(t1.business_cate,'') = ifnull(t3.business_cate,'') and LEFT(ifnull(t1.cancel_time,t1.pay_time),10) between date(t3.start_date) and date(t3.end_date)
  where (UPPER(t1.seller_memo) not LIKE '%SSD%' and UPPER(t1.buyer_memo) not LIKE '%SSD%')
and (shop_code not in ('14505590','11908207','YC19D','14028951','11908207')) -- '11809520','JDZYSX','JD0237',
and (t1.trade_type_explain in ('售后退货', '仅退款') or t1.trade_status_explain in ('已取消'))
AND NOT (t1.shop_name LIKE '线上分销%' AND (t3.expense_center_code IS NULL OR t3.expense_center_code = ''))
and not (t1.shop_code= '13302195' and (t3.expense_center_code IS NULL OR t3.expense_center_code = '') ) -- 过滤发货时间统计下的取消单
and not (t1.trade_status_explain in ('已取消') and (t3.department_3 in ('线上分销-批采','线上分销-一件代发') OR t3.department_1 = '线下营销中心')) -- 过滤发货时间统计下的取消单
AND not (UPPER(t1.shop_code)  ='11626221' AND t1.goods_no = 'QTYF0001')   -- 过滤补差链接店铺


union all
-- 14028951全渠道寄样店铺
SELECT
    t1.erp,                     -- erp系统
    t1.trade_no,                -- 订单编号
    t1.trade_id,                -- 外部编码
    t1.plt_trade_no,            -- 网店订单号
    t1.is_ex,                   -- 是否异常订单，1：是，0：否
    t1.shop_id,                 -- 销售渠道id
    t1.new_shop_name,           -- 新销售渠道名称
    t1.new_shop_code,           -- 新销售渠道Code
    t1.goods_no,                -- 货品编号
    t1.goods_name,              -- 货品名称
    t1.goods_tags,              -- 货品标签
    t1.sku_id,                  -- 规格ID
    t1.plat_sku_id,             -- 外部货品编码
    t1.is_fit,                  -- 组装标记
    t1.is_gift,                 -- 赠品标记
    t1.gift_flag,               -- 赠品标识:尝鲜装赠品，NS赠品，非食赠品，正装赠品
    t1.plat_author_id,          -- 平台主播id
    t1.plat_author_name,        -- 平台主播名称
    t1.product_price,           -- 商品单价
    t1.product_cost,            -- 商品成本
    t2.price1,					-- RSP价格
    t1.sell_count,              -- 销售数量
    t1.tax_fee,                 -- 税额
    t1.customer_code,           -- 客户编号
    t1.customer_account,		-- 客户账号
  	t1.send_shop_scenario,		-- 寄样场景
    t1.seller_memo,             -- 客服备注
    t1.buyer_memo,              -- 买家备注
    t1.append_memo,             -- 追加备注
    t1.trade_type,              -- 订单类型(数值版)
    t1.trade_type_explain,      -- 订单类型(文本版本)
    t1.trade_status,            -- 销售单状态(数值版)
    t1.trade_status_explain,    -- 销售单状态(文本版)
    t1.order_time,              -- 下单时间
    t1.pay_time,                -- 支付时间
    t1.send_time,               -- 发货时间
    t1.delivery_time,           -- 收货时间
    t1.cancel_time,             -- 取消时间
    t1.rfd_time,                -- 退款时间
    t1.country,                 -- 国家
    t1.state,                   -- 省
    t1.city,                    -- 城市
    t1.district,                -- 区县
    t1.town,                    -- 街道
    t1.zip,                     -- 邮编
    t1.warehouse_code,          -- 发货仓库编码
    t1.warehouse_name,          -- 发货仓库名称
    t1.is_cod_warehouse,        -- 是否冷链仓
    t1.discount_fee,            -- 优惠金额
    t1.payment,                 -- 应收金额
    t1.coupon_fee,              -- 平台优惠
    t1.received_total,          -- 已收金额
    t1.discount_total,          -- 优惠总金额
    t1.goods_plat_discount_fee, -- 货品平台优惠
    t1.divide_sell_total,       -- 实付总金额
    t1.share_order_discount_fee,-- 订单商品优惠分摊
    t1.share_order_plat_discount_fee, -- 订单平台优惠分摊
    t1.share_favourable_fee,    -- 分摊金额
    t1.share_favourable_after_fee, -- 分摊后金额
    t1.order_cate,              -- 平台订单业务分类
    t1.product_cate,            -- 平台商品业务分类
    t1.account_cate,            -- 平台账户业务分类
    t1.business_cate,           -- 业务分类
    t2.sku_field5,           -- 规格编码
    t2.sku_name,             -- 规格名称
    t2.first_level,          -- 一级分类
    t2.second_level,          -- 二级分类
    t2.third_level,          -- 三级分类
    t2.fourth_level,          -- 四级分类
    t3.department_1,          -- 一级部门（组织架构）
    t3.department_2,          -- 二级渠道（组织架构）
    t3.department_3,          -- 三级渠道
    t3.department_4,          -- 四级渠道（店铺名称+业务分类）
    t3.expense_center,         -- 费用中心名称
    t3.expense_center_code,    -- 费用中心名称编号
    'gmv' as money_type,        -- 金额类型
    '寄样' as send_shop_type,    -- 寄样类型
    null as phone,            -- 电话
    null as address,    -- 地址
    null as mobile,    -- 手机
    null as receiverName,  -- 收件人名称
  t1.flag_data -- 货品标记 常温冷链
from dwd.trd_erp_pay_order_sku t1 -- 交易域-吉客云&聚水潭订单支付表
left join (select distinct * from dim.jky_storage_goodsinfo where dt = '${yd}') t2 -- 分页查询货品信息维表
on t1.sku_id = t2.sku_id
left join (select distinct * from ods.fill_expense_center_mapping where dt = '${yd}' and expense_center not like '%中台%') t3
on UPPER(t1.new_shop_code) = UPPER(t3.shop_id) and ifnull(t1.business_cate,'') = ifnull(t3.business_cate,'') and LEFT(case when (t3.`department_1` = '线下营销中心' or (t3.department_3 like '%线上分销%' and t3.department_3 not in ('线上分销-代运营','线上分销-私域'))) then t1.send_time else t1.pay_time end,10) between date(t3.start_date) and date(t3.end_date)
  where (UPPER(t1.seller_memo) not LIKE '%SSD%' and UPPER(t1.buyer_memo) not LIKE '%SSD%')
and (shop_code = '14028951')
and t1.trade_type_explain not in ('售后退货','仅退款')


union all
-- 14028951全渠道寄样店铺

SELECT
    t1.erp,                     -- erp系统
    t1.trade_no,                -- 订单编号
    t1.trade_id,                -- 外部编码
    t1.plt_trade_no,            -- 网店订单号
    t1.is_ex,                   -- 是否异常订单，1：是，0：否
    t1.shop_id,                 -- 销售渠道id
    t1.new_shop_name,           -- 新销售渠道名称
    t1.new_shop_code,           -- 新销售渠道Code
    t1.goods_no,                -- 货品编号
    t1.goods_name,              -- 货品名称
    t1.goods_tags,              -- 货品标签
    t1.sku_id,                  -- 规格ID
    t1.plat_sku_id,             -- 外部货品编码
    t1.is_fit,                  -- 组装标记
    t1.is_gift,                 -- 赠品标记
    t1.gift_flag,               -- 赠品标识:尝鲜装赠品，NS赠品，非食赠品，正装赠品
    t1.plat_author_id,          -- 平台主播id
    t1.plat_author_name,        -- 平台主播名称
    t1.product_price,           -- 商品单价
    t1.product_cost,            -- 商品成本
    t2.price1,					-- RSP价格
    t1.sell_count,              -- 销售数量
    t1.tax_fee,                 -- 税额
    t1.customer_code,           -- 客户编号
    t1.customer_account,		-- 客户账号
  	t1.send_shop_scenario,		-- 寄样场景
    t1.seller_memo,             -- 客服备注
    t1.buyer_memo,              -- 买家备注
    t1.append_memo,             -- 追加备注
    t1.trade_type,              -- 订单类型(数值版)
    t1.trade_type_explain,      -- 订单类型(文本版本)
    t1.trade_status,            -- 销售单状态(数值版)
    t1.trade_status_explain,    -- 销售单状态(文本版)
    t1.order_time,              -- 下单时间
    t1.pay_time,                -- 支付时间
    t1.send_time,               -- 发货时间
    t1.delivery_time,           -- 收货时间
    t1.cancel_time,             -- 取消时间
    t1.rfd_time,                -- 退款时间
    t1.country,                 -- 国家
    t1.state,                   -- 省
    t1.city,                    -- 城市
    t1.district,                -- 区县
    t1.town,                    -- 街道
    t1.zip,                     -- 邮编
    t1.warehouse_code,          -- 发货仓库编码
    t1.warehouse_name,          -- 发货仓库名称
    t1.is_cod_warehouse,        -- 是否冷链仓
    t1.discount_fee,            -- 优惠金额
    t1.payment,                 -- 应收金额
    t1.coupon_fee,              -- 平台优惠
    t1.received_total,          -- 已收金额
    t1.discount_total,          -- 优惠总金额
    t1.goods_plat_discount_fee, -- 货品平台优惠
    t1.divide_sell_total,       -- 实付总金额
    t1.share_order_discount_fee,-- 订单商品优惠分摊
    t1.share_order_plat_discount_fee, -- 订单平台优惠分摊
    t1.share_favourable_fee,    -- 分摊金额
    t1.share_favourable_after_fee, -- 分摊后金额
    t1.order_cate,              -- 平台订单业务分类
    t1.product_cate,            -- 平台商品业务分类
    t1.account_cate,            -- 平台账户业务分类
    t1.business_cate,           -- 业务分类
    t2.sku_field5,           -- 规格编码
    t2.sku_name,             -- 规格名称
    t2.first_level,          -- 一级分类
    t2.second_level,          -- 二级分类
    t2.third_level,          -- 三级分类
    t2.fourth_level,          -- 四级分类
    t3.department_1,          -- 一级部门（组织架构）
    t3.department_2,          -- 二级渠道（组织架构）
    t3.department_3,          -- 三级渠道
    t3.department_4,          -- 四级渠道（店铺名称+业务分类）
    t3.expense_center,         -- 费用中心名称
    t3.expense_center_code,    -- 费用中心名称编号
    'rfd' as money_type,        -- 金额类型
    '寄样' as send_shop_type,    -- 寄样类型
    null as phone,            -- 电话
    null as address,    -- 地址
    null as mobile,    -- 手机
    null as receiverName,  -- 收件人名称
  t1.flag_data -- 货品标记 常温冷链
from dwd.trd_erp_pay_order_sku t1 -- 交易域-吉客云&聚水潭订单支付表
left join (select distinct * from dim.jky_storage_goodsinfo where dt = '${yd}') t2 -- 分页查询货品信息维表
on t1.sku_id = t2.sku_id
left join (select distinct * from ods.fill_expense_center_mapping where dt = '${yd}' and expense_center not like '%中台%') t3
on UPPER(t1.new_shop_code) = UPPER(t3.shop_id) and ifnull(t1.business_cate,'') = ifnull(t3.business_cate,'') and LEFT(ifnull(t1.cancel_time,t1.pay_time),10) between date(t3.start_date) and date(t3.end_date)
  where (UPPER(t1.seller_memo) not LIKE '%SSD%' and UPPER(t1.buyer_memo) not LIKE '%SSD%')
and (shop_code = '14028951')
and (t1.trade_type_explain in ('售后退货', '仅退款') or t1.trade_status_explain in ('已取消'))
and not (t1.trade_status_explain in ('已取消') and (t3.department_3 in ('线上分销-批采','线上分销-一件代发') OR t3.department_1 = '线下营销中心'))
;
