
SELECT
    t1.erp,                     -- erp系统
    t1.trade_no,                -- 订单编号
    t1.trade_id,                -- 外部编码
    t1.plt_trade_no,            -- 网店订单号
    t1.is_ex,                   -- 是否异常订单，1：是，0：否
    t1.shop_id,                 -- 销售渠道id
    t1.shop_name,               -- 销售渠道
    t1.shop_code,               -- 销售渠道Code(原始)
    t1.new_shop_code,           -- 销售渠道Code
    t1.goods_no,                -- 货品编号
    t1.goods_name,              -- 货品名称
    t1.goods_tags,              -- 货品标签
    t1.sku_id,                  -- 规格ID
    t1.sku_name,                -- 规格名称
    t1.plat_sku_id,             -- 外部货品编码
    t1.is_fit,                  -- 组装标记
    t1.is_gift,                 -- 赠品标记
    t1.gift_flag,               -- 赠品标识:尝鲜装赠品，NS赠品，非食赠品，正装赠品
    t1.plat_author_id,          -- 平台主播id
    t1.plat_author_name,        -- 平台主播名称
    t1.product_price,           -- 商品单价
    t1.product_cost,            -- 商品成本
    t1.sell_count,              -- 销售数量
    t1.tax_fee,                 -- 税额
    t1.customer_code,           -- 客户编号
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
    t2.sku_field5,				-- 规格编码
    t2.sku_name,				-- 规格名称
    t2.first_level,				-- 一级分类
    t2.second_level,			-- 二级分类
    t2.third_level,				-- 三级分类
    t2.fourth_level,			-- 四级分类
    t3.department_1,			-- 一级部门（组织架构）
    t3.department_2,			-- 二级渠道（组织架构）
    t3.department_3,			-- 三级渠道
    t3.department_4,			-- 四级渠道（店铺名称+业务分类）
    t3.expense_center			-- 费用中心名称
FROM(select * from dwd.trd_erp_pay_order_sku where business_cate != '小店及其它') t1 -- 交易域-吉客云&聚水潭订单支付表
left join dim.jky_storage_goodsinfo t2 -- 分页查询货品信息维表
on t1.sku_id = t2.sku_id
left join ods.fill_expense_center_mapping t3
on t1.shop_id = t3.shop_id and t1.business_cate = t3.business_cate
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
    t1.new_shop_code,           -- 销售渠道Code
    t1.goods_no,                -- 货品编号
    t1.goods_name,              -- 货品名称
    t1.goods_tags,              -- 货品标签
    t1.sku_id,                  -- 规格ID
    t1.sku_name,                -- 规格名称
    t1.plat_sku_id,             -- 外部货品编码
    t1.is_fit,                  -- 组装标记
    t1.is_gift,                 -- 赠品标记
    t1.gift_flag,               -- 赠品标识:尝鲜装赠品，NS赠品，非食赠品，正装赠品
    t1.plat_author_id,          -- 平台主播id
    t1.plat_author_name,        -- 平台主播名称
    t1.product_price,           -- 商品单价
    t1.product_cost,            -- 商品成本
    t4.business_cate_rate * t1.sell_count,              -- 销售数量
    t1.tax_fee,                 -- 税额
    t1.customer_code,           -- 客户编号
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
    t4.business_cate_rate * t1.share_favourable_after_fee, -- 分摊后金额
    t1.order_cate,              -- 平台订单业务分类
    t1.product_cate,            -- 平台商品业务分类
    t1.account_cate,            -- 平台账户业务分类
    nvl(t4.business_cate,t1.business_cate),           -- 业务分类
    t2.sku_field5,				-- 规格编码
    t2.sku_name,				-- 规格名称
    t2.first_level,				-- 一级分类
    t2.second_level,			-- 二级分类
    t2.third_level,				-- 三级分类
    t2.fourth_level,			-- 四级分类
    t3.department_1,			-- 一级部门（组织架构）
    t3.department_2,			-- 二级渠道（组织架构）
    t3.department_3,			-- 三级渠道
    t3.department_4,			-- 四级渠道（店铺名称+业务分类）
    t3.expense_center			-- 费用中心名称
FROM(select * from dwd.trd_erp_pay_order_sku where business_cate = '小店及其它') t1 -- 交易域-吉客云&聚水潭订单支付表
left join dim.jky_storage_goodsinfo t2 -- 分页查询货品信息维表
on t1.sku_id = t2.sku_id
left join ods.fill_expense_center_mapping t3
on t1.shop_id = t3.shop_id and t1.business_cate = t3.business_cate
left join(
    select
        join_key,
        business_cate,
       gmv/sum(gmv) over() as business_cate_rate
    from(
        select
            '小店及其它' as join_key,
            business_cate,
            sum(share_favourable_after_fee) gmv
        from dwd.trd_erp_pay_order_sku
        where shop_code = '11207381' and business_cate in ('短视频','米粉直播间','一号直播间','胚芽米直播间','核桃油直播间') and date_format(add_months(pay_time,-1),'yyyy-MM') = '2024-10'
        group by business_cate
    )tmp
) t4 on t1.business_cate = t4.join_key
;
