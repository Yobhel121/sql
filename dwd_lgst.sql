create table dwd.lgst_outbound_order
(
    outbound_id          VARCHAR COMMENT '出库单号',
    outbound_datetime    DATETIME COMMENT '出库时间',
    order_number         VARCHAR COMMENT '订单号',
    company              VARCHAR COMMENT '公司',
    store_id             VARCHAR COMMENT '店铺id',
    store_name           VARCHAR COMMENT '店铺名称',
    warehouse_code       VARCHAR COMMENT '发货仓库编码',
    warehouse_name       VARCHAR COMMENT '发货仓库名称',
    warehouse_type       VARCHAR COMMENT '仓库类型:冷链,常温',
    express_company_code VARCHAR COMMENT '快递公司编码',
    express_company      VARCHAR COMMENT '快递公司',
    logistics_number     VARCHAR COMMENT '物流单号',
    customer_id          VARCHAR COMMENT '客户id',
    customer_name        VARCHAR COMMENT '客户账户',
    province             VARCHAR COMMENT '收货省',
    city                 VARCHAR COMMENT '收货市',
    district             VARCHAR COMMENT '收货区',
    box_code             VARCHAR COMMENT '纸箱编码',
    box_name             VARCHAR COMMENT '纸箱名称',
    outbound_weight      double COMMENT '出库重量（单位：千克）',
    dt                   date comment '分区日期'
)PARTITION BY VALUE(dt) HOT_PARTITION_COUNT=7 comment '物流域-销售出库订单事实表';
insert OVERWRITE dwd.lgst_outbound_order
select
    goods_doc_no outbound_id, -- 出库单号
    in_out_date outbound_datetime, -- 出库时间
    t1.bill_no order_number,  -- 订单号
    t1.company_name company, -- 公司
    channel_code shop_id,  -- 店铺id
    channel_name shop_name,  -- 店铺名称
    t1.warehouse_code, -- 发货仓库编码
    t1.warehouse_name, -- 发货仓库名称
    if(t1.warehouse_name like '%冷链%','冷链','常温'), -- 仓库类型
    t2.logistic_code express_company_code, -- 快递公司编码
    t1.logistic_name express_company, -- 快递公司
    logistic_no logistics_number, -- 物流单号
    customer_code customer_id,  -- 客户id
    customer_name,  -- 客户账户
    state province,  -- 收货省
    city, -- 收货市
    district, -- 收货区
    box_code,
    box_name,
    package_weight/1000 outbound_weight,
    date_format(in_out_date,'%Y-%m-%d')
from (select * from ods.jky_erp_storage_goodsdocout_v2 where dt = '2025-04-27' and date_format(in_out_date,'%Y-%m-%d') = '2025-04-27' and inout_type = 201) t1
left join(select * from ods.jky_qm_trades_fullinfo) t2 on t1.bill_no = t2.trade_no
left join(
   select
       *
   from(
        select
            bill_no,
            b.goods_no box_code,
            b.goods_name box_name,
            cast(sku_a as int) * cast(sku_b as int) * cast(sku_c as int),
            row_number() over (partition by bill_no order by cast(sku_a as int) * cast(sku_b as int) * cast(sku_c as int)) n
        from(select * from ods.jky_erp_storage_goodsdocout_v2 where dt = '2025-04-27' and inout_type = 212) a
        left join(select * from ods.jky_erp_storage_goodsdocout_v2_goodsdocdetail where dt = '2025-04-27') b on a.goods_doc_no = b.goods_doc_no
        left join(select goods_no,sku_field4,SUBSTRING_INDEX(sku_field4, '*', 1) AS sku_a,SUBSTRING_INDEX(SUBSTRING_INDEX(sku_field4, '*', 2), '*', -1) AS sku_b,SUBSTRING_INDEX(sku_field4, '*', -1) AS sku_c from ods.jky_storage_goodsinfo where dt = '2025-04-27') c on b.goods_no = c.goods_no
    )tmp where n =1
) t3 on t1.bill_no = t3.bill_no
;


drop table dwd.lgst_outbound_order_item;
create table dwd.lgst_outbound_order_item
(
    outbound_id         VARCHAR COMMENT '出库单号',
    outbound_datetime   DATETIME COMMENT '出库时间',
    order_id            VARCHAR COMMENT '订单号',
    plat_order_id       VARCHAR COMMENT '网店主订单号',
    plat_sub_order_id   VARCHAR COMMENT '网店子订单号',
    order_category      VARCHAR COMMENT '订单分类（如：正常/刷单/寄样/售后/微瑕品）',
    platform            VARCHAR COMMENT '网店平台（如：AlibabaC2M/TB/JD）',
    product_id          VARCHAR COMMENT '商品id',
    product_name        VARCHAR COMMENT '商品名称',
    item_cnt            INT COMMENT '商品数量',
    allocated_amt       DECIMAL(10, 2) COMMENT '分摊后金额',
    plat_author_id      VARCHAR COMMENT '达人id',
    plat_goods_id       VARCHAR COMMENT '外部商品编码',
    length              double COMMENT '长度（cm）',
    width               double COMMENT '宽度（cm）',
    height              double COMMENT '高度（cm）',
    volume              double COMMENT '体积（立方厘米）',
    weight              double COMMENT '重量（g）',
    is_gift             TINYINT COMMENT '是否赠品（0否 1是）',
    is_card             TINYINT COMMENT '是否卡片（0否 1是）',
    flag_names          varchar COMMENT '货品标签',
    dt                  date comment '分区日期'
)PARTITION BY VALUE(dt) HOT_PARTITION_COUNT=7 comment '物流域-销售出库订单商品详情事实表';

insert OVERWRITE dwd.lgst_outbound_order_item
select
    t1.goods_doc_no outbound_id, -- 出库单号
    t1.in_out_date outbound_datetime, -- 出库时间
    t1.bill_no order_number,  -- 订单号
    source_trade_no, -- 网店订单号
    source_subtrade_no, -- 网店订单号
    case when concat(t3.seller_memo,t3.append_memo,t3.buyer_memo) like 'SSD' then '刷单'
        when shop_name  = '全渠道寄样专用店铺' then '寄样'
        when trade_type = 7 then '售后'
        when t1.warehouse_name like '%微瑕%' then '微瑕品'
    else '正常' end order_category,
    plat_code platform,
    t2.goods_no as goods_no, -- 商品id
    t2.goods_name as goods_name,-- 商品名称
    cast(sku_cnt as int),
    cast(share_favourable_after_fee_js as decimal(10,2)) as allocated_amt,-- 分摊后金额
    t4.plat_author_id, -- 达人id
    plat_goods_id, -- 外部商品编码
    sku_length, -- 长
    sku_width, -- 宽
    sku_height, -- 高
    sku_length * sku_width * sku_height, -- 体积（立方厘米）
    t4.sku_weight, -- 重量(g)
    cast(is_gift as TINYINT),
    cast(is_card as TINYINT),
    flag_names,
    date_format(t1.in_out_date,'%Y-%m-%d')
from (select * from ods.jky_erp_storage_goodsdocout_v2 where dt = '2025-04-27' and date_format(in_out_date,'%Y-%m-%d') = '2025-04-27' and inout_type = 201) t1
left join(select * from ods.jky_erp_storage_goodsdocout_v2_goodsdocdetail where dt = '2025-04-27') t2 on t1.goods_doc_no = t2.goods_doc_no
left join(select * from ods.jky_qm_trades_fullinfo where is_delete = 0) t3 on t1.bill_no = t3.trade_no -- 销售单查询
left join(
    select
        a.trade_no, -- 订单编号
        a.plat_code,-- 平台代码
        case when a.plat_code in ('AlibabaC2M','TB','TMCS','TMALL') then nvl(a.source_subtrade_no,a.source_trade_no) else a.source_trade_no end plat_order_id, -- 网店订单号
        nvl(b.sub_trade_id,a.sub_trade_id) sub_trade_id,
        if(a.plat_goods_id != '' and a.plat_goods_id is not null, a.plat_goods_id,max(a.plat_goods_id) over (partition by a.source_trade_no)) plat_goods_id,-- 平台商品id
        coalesce(a.plat_author_id, max(a.plat_author_id) over (partition by a.source_trade_no )) as plat_author_id,-- 平台主播id
        c.goods_no as goods_no, -- 货品编号
        c.goods_name as goods_name,-- 货品名称
        c.sku_id as sku_id,-- 规格ID
        c.sku_name as sku_name,-- 规格名称
        c.sku_length, -- 长
        c.sku_height, -- 高
        c.sku_width, -- 宽
        c.sku_weight, -- 重量(g)
        nvl(b.sell_count,a.sell_count) as sku_cnt, -- 销售数量
        if(a.goods_name like '%卡片%',1,0) is_card, -- 是否卡片
        a.is_gift,-- 是否赠品
        a.source_trade_no, -- 网店主订单号
        a.source_subtrade_no, -- 网店子订单号
        -- 分摊后金额
        case when b.sell_total is not null then cast(b.sell_total as decimal(10,2)) - cast(b.share_favourable_fee as decimal(10,2))  else a.share_favourable_after_fee end share_favourable_after_fee_js
    from (select distinct bill_no from ods.jky_erp_storage_goodsdocout_v2 where dt = '2025-04-27' and date_format(in_out_date,'%Y-%m-%d') = '2025-04-27' and inout_type = 201) t
    left join(select * from ods.jky_qm_trades_fullinfo_goodsdetail where dt = '2025-04-27') a on t.bill_no = a.trade_no -- 销售单查询_货品详情
    left join(select * from ods.jky_qm_trades_fullinfo_assembly_goodsdto where dt = '2025-04-27') b on a.trade_no = b.trade_no and a.trade_id = b.trade_id and a.sub_trade_id = b.sub_trade_id -- 销售单查询_组合装子件列表
    left join(select * from ods.jky_storage_goodsinfo where dt = '2025-04-27' and is_delete = 0) c on nvl(b.goods_no,a.goods_no) = c.goods_no and nvl(b.barcode,a.barcode) = c.sku_barcode -- 分页查询货品信息
)t4 on t1.bill_no = t4.trade_no and t2.source_detail_id = t4.sub_trade_id and t2.goods_no = t4.goods_no
;

# *****************************************************************************************************************************************************************
insert OVERWRITE dwd.lgst_outbound_order
select
    goods_doc_no outbound_id, -- 出库单号
    in_out_date outbound_datetime, -- 出库时间
    t1.bill_no order_number,  -- 订单号
    t1.company_name company, -- 公司
    channel_code shop_id,  -- 店铺id
    channel_name shop_name,  -- 店铺名称
    t1.warehouse_code, -- 发货仓库编码
    t1.warehouse_name, -- 发货仓库名称
    if(t1.warehouse_name like '%冷链%','冷链','常温'), -- 仓库类型
    t2.logistic_code express_company_code, -- 快递公司编码
    t1.logistic_name express_company, -- 快递公司
    logistic_no logistics_number, -- 物流单号
    customer_code customer_id,  -- 客户id
    customer_name,  -- 客户账户
    state province,  -- 收货省
    city, -- 收货市
    district, -- 收货区
    box_code,
    box_name,
    package_weight/1000 outbound_weight,
    date_format(in_out_date,'%Y-%m-%d')
from (select * from ods.jky_erp_storage_goodsdocout_v2 where dt = '2025-04-27' and inout_type = 201) t1
left join(select * from ods.jky_qm_trades_fullinfo) t2 on t1.bill_no = t2.trade_no
left join(
   select
       *
   from(
        select
            bill_no,
            b.goods_no box_code,
            b.goods_name box_name,
            cast(sku_a as int) * cast(sku_b as int) * cast(sku_c as int),
            row_number() over (partition by bill_no order by cast(sku_a as int) * cast(sku_b as int) * cast(sku_c as int)) n
        from(select * from ods.jky_erp_storage_goodsdocout_v2 where dt = '2025-04-27' and inout_type = 212) a
        left join(select * from ods.jky_erp_storage_goodsdocout_v2_goodsdocdetail where dt = '2025-04-27') b on a.goods_doc_no = b.goods_doc_no
        left join(select goods_no,sku_field4,SUBSTRING_INDEX(sku_field4, '*', 1) AS sku_a,SUBSTRING_INDEX(SUBSTRING_INDEX(sku_field4, '*', 2), '*', -1) AS sku_b,SUBSTRING_INDEX(sku_field4, '*', -1) AS sku_c from ods.jky_storage_goodsinfo where dt = '2025-04-27') c on b.goods_no = c.goods_no
    )tmp where n =1
) t3 on t1.bill_no = t3.bill_no
;

insert OVERWRITE dwd.lgst_outbound_order_item
select
    t1.goods_doc_no outbound_id, -- 出库单号
    t1.in_out_date outbound_datetime, -- 出库时间
    t1.bill_no order_number,  -- 订单号
    source_trade_no, -- 网店订单号
    source_subtrade_no, -- 网店订单号
    case when concat(t3.seller_memo,t3.append_memo,t3.buyer_memo) like 'SSD' then '刷单'
        when shop_name  = '全渠道寄样专用店铺' then '寄样'
        when trade_type = 7 then '售后'
        when t1.warehouse_name like '%微瑕%' then '微瑕品'
    else '正常' end order_category,
    plat_code platform,
    t2.goods_no as goods_no, -- 商品id
    t2.goods_name as goods_name,-- 商品名称
    cast(sku_cnt as int),
    cast(share_favourable_after_fee_js as decimal(10,2)) as allocated_amt,-- 分摊后金额
    t4.plat_author_id, -- 达人id
    plat_goods_id, -- 外部商品编码
    sku_length, -- 长
    sku_width, -- 宽
    sku_height, -- 高
    sku_length * sku_width * sku_height, -- 体积（立方厘米）
    t4.sku_weight, -- 重量(g)
    cast(is_gift as TINYINT),
    cast(is_card as TINYINT),
    flag_names,
    date_format(t1.in_out_date,'%Y-%m-%d')
from (select * from ods.jky_erp_storage_goodsdocout_v2 where dt = '2025-04-27' and inout_type = 201) t1
left join(select * from ods.jky_erp_storage_goodsdocout_v2_goodsdocdetail where dt = '2025-04-27') t2 on t1.goods_doc_no = t2.goods_doc_no
left join(select * from ods.jky_qm_trades_fullinfo where is_delete = 0) t3 on t1.bill_no = t3.trade_no -- 销售单查询
left join(
    select
        a.trade_no, -- 订单编号
        a.plat_code,-- 平台代码
        case when a.plat_code in ('AlibabaC2M','TB','TMCS','TMALL') then nvl(a.source_subtrade_no,a.source_trade_no) else a.source_trade_no end plat_order_id, -- 网店订单号
        nvl(b.sub_trade_id,a.sub_trade_id) sub_trade_id,
        if(a.plat_goods_id != '' and a.plat_goods_id is not null, a.plat_goods_id,max(a.plat_goods_id) over (partition by a.source_trade_no)) plat_goods_id,-- 平台商品id
        coalesce(a.plat_author_id, max(a.plat_author_id) over (partition by a.source_trade_no )) as plat_author_id,-- 平台主播id
        c.goods_no as goods_no, -- 货品编号
        c.goods_name as goods_name,-- 货品名称
        c.sku_id as sku_id,-- 规格ID
        c.sku_name as sku_name,-- 规格名称
        c.sku_length, -- 长
        c.sku_height, -- 高
        c.sku_width, -- 宽
        c.sku_weight, -- 重量(g)
        nvl(b.sell_count,a.sell_count) as sku_cnt, -- 销售数量
        if(a.goods_name like '%卡片%',1,0) is_card, -- 是否卡片
        a.is_gift,-- 是否赠品
        a.source_trade_no, -- 网店主订单号
        a.source_subtrade_no, -- 网店子订单号
        -- 分摊后金额
        case when b.sell_total is not null then cast(b.sell_total as decimal(10,2)) - cast(b.share_favourable_fee as decimal(10,2))  else a.share_favourable_after_fee end share_favourable_after_fee_js
    from (select distinct bill_no from ods.jky_erp_storage_goodsdocout_v2 where dt = '2025-04-27' and inout_type = 201) t
    left join(select * from ods.jky_qm_trades_fullinfo_goodsdetail where dt = '2025-04-27') a on t.bill_no = a.trade_no -- 销售单查询_货品详情
    left join(select * from ods.jky_qm_trades_fullinfo_assembly_goodsdto where dt = '2025-04-27') b on a.trade_no = b.trade_no and a.trade_id = b.trade_id and a.sub_trade_id = b.sub_trade_id -- 销售单查询_组合装子件列表
    left join(select * from ods.jky_storage_goodsinfo where dt = '2025-04-27' and is_delete = 0) c on nvl(b.goods_no,a.goods_no) = c.goods_no and nvl(b.barcode,a.barcode) = c.sku_barcode -- 分页查询货品信息
)t4 on t1.bill_no = t4.trade_no and t2.source_detail_id = t4.sub_trade_id and t2.goods_no = t4.goods_no
;


select * from ods.jky_storage_goodsinfo where dt = '2025-04-27' and is_delete = 0 and goods_name like '%卡片%';

select * from dwd.lgst_outbound_order_item where dt ='2024-06-05';


select dt,count(1) from dwd.lgst_outbound_order_item group by dt;



select * from ods.jky_erp_storage_goodsdocout_v2_goodsdocdetail where dt = '2025-04-27' and goods_doc_no = 'CRK2025011051253';



show create table rpa_data.syyz_order_details;


select * from rpa_data.syyz_order_details;


select * from dwd.lgst_outbound_order_item where order_id = 'JY2025030465065';

select * from dwd.lgst_outbound_order_item where order_id = 'JY2025022849482';


select * from dwd.trd_erp_pay_order_sku where trade_no = 'JY2025022849482';

select platGoodsId,sourceTradeNo,* from jky.qm_trades_fullinfo_goodsdetail where sourceTradeNo = '6938460946097968622';






select
    t1.goods_doc_no outbound_id, -- 出库单号
    t1.in_out_date outbound_datetime, -- 出库时间
    t1.bill_no order_number,  -- 订单号
    source_trade_no, -- 网店订单号
    source_subtrade_no, -- 网店订单号
    case when concat(t3.seller_memo,t3.append_memo,t3.buyer_memo) like 'SSD' then '刷单'
        when shop_name  = '全渠道寄样专用店铺' then '寄样'
        when trade_type = 7 then '售后'
        when t1.warehouse_name like '%微瑕%' then '微瑕品'
    else '正常' end order_category,
    plat_code platform,
    t2.goods_no as goods_no, -- 商品id
    t2.goods_name as goods_name,-- 商品名称
    cast(quantity as int),
    cast(share_favourable_after_fee_js as decimal(10,2)) as allocated_amt,-- 分摊后金额
    t4.plat_author_id, -- 达人id
    plat_goods_id, -- 外部商品编码
    sku_length, -- 长
    sku_width, -- 宽
    sku_height, -- 高
    sku_length * sku_width * sku_height, -- 体积（立方厘米）
    t4.sku_weight, -- 重量(g)
    cast(is_gift as TINYINT),
    cast(is_card as TINYINT),
    flag_names,
    date_format(t1.in_out_date,'%Y-%m-%d')
from (select * from ods.jky_erp_storage_goodsdocout_v2 where dt = '2025-05-09'  and inout_type = 201) t1
left join(select * from ods.jky_erp_storage_goodsdocout_v2_goodsdocdetail where dt = '2025-05-09' and goods_doc_no = 'CRK202503016913') t2 on t1.goods_doc_no = t2.goods_doc_no
left join(select * from ods.jky_qm_trades_fullinfo where is_delete = 0) t3 on t1.bill_no = t3.trade_no -- 销售单查询
left join(
    select
        a.trade_no, -- 订单编号
        a.plat_code,-- 平台代码
        case when a.plat_code in ('AlibabaC2M','TB','TMCS','TMALL') then nvl(a.source_subtrade_no,a.source_trade_no) else a.source_trade_no end plat_order_id, -- 网店订单号
        nvl(b.sub_trade_id,a.sub_trade_id) sub_trade_id,
        if(a.plat_goods_id != '' and a.plat_goods_id is not null, a.plat_goods_id,max(a.plat_goods_id) over (partition by a.source_trade_no)) plat_goods_id,-- 平台商品id
        coalesce(a.plat_author_id, max(a.plat_author_id) over (partition by a.source_trade_no )) as plat_author_id,-- 平台主播id
        c.goods_no as goods_no, -- 货品编号
        c.goods_name as goods_name,-- 货品名称
        c.sku_id as sku_id,-- 规格ID
        c.sku_name as sku_name,-- 规格名称
        c.sku_length, -- 长
        c.sku_height, -- 高
        c.sku_width, -- 宽
        c.sku_weight, -- 重量(g)
        nvl(b.sell_count,a.sell_count) as sku_cnt, -- 销售数量
        if(a.goods_name like '%卡片%',1,0) is_card, -- 是否卡片
        a.is_gift,-- 是否赠品
        a.source_trade_no, -- 网店主订单号
        a.source_subtrade_no, -- 网店子订单号
        -- 分摊后金额
        case when b.sell_total is not null then cast(b.sell_total as decimal(10,2)) - cast(b.share_favourable_fee as decimal(10,2))  else a.share_favourable_after_fee end share_favourable_after_fee_js
    from (select distinct bill_no from ods.jky_erp_storage_goodsdocout_v2 where dt = '2025-05-09'  and inout_type = 201) t
    left join(select * from ods.jky_qm_trades_fullinfo_goodsdetail where dt = '2025-05-09') a on t.bill_no = a.trade_no -- 销售单查询_货品详情
    left join(select * from ods.jky_qm_trades_fullinfo_assembly_goodsdto where dt = '2025-05-09') b on a.trade_no = b.trade_no and a.trade_id = b.trade_id and a.sub_trade_id = b.sub_trade_id -- 销售单查询_组合装子件列表
    left join(select * from ods.jky_storage_goodsinfo where dt = '2025-05-09' and is_delete = 0) c on nvl(b.goods_no,a.goods_no) = c.goods_no and nvl(b.barcode,a.barcode) = c.sku_barcode -- 分页查询货品信息
    where a.trade_no = 'JY2025022849482'
)t4 on t1.bill_no = t4.trade_no and t2.source_detail_id = t4.sub_trade_id and t2.goods_no = t4.goods_no
where t1.bill_no = 'JY2025022849482';

select * from jky.erp_storage_goodsdocout_v2_goodsdocdetail where goods_doc_no = 'CRK202503016913'


show create table ods.fill_bud_fin_import_items_marketing;


select * from ods.fill_bud_fin_import_items_marketing;

