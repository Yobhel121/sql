CREATE TABLE dws.xxxx_1d
(
    user_id       varchar COMMENT '新客人数',
    payment_count varchar COMMENT '新客成交金额',
    dt            date comment '分区日期'
) partition by (dt) comment '交易域-支付成功事实表';


CREATE TABLE dws.xxxx_1d
(
    user_id       varchar COMMENT '近30天新客成交人数',
    payment_count varchar COMMENT '近30天新客成交金额',
    payment_count varchar COMMENT '近60天新客成交人数',
    payment_count varchar COMMENT '近90天新客成交金额',
    dt            date comment '分区日期'
) partition by (dt) comment '交易域-支付成功事实表';


CREATE TABLE ads_trade_stats
(
    biz_day STRING COMMENT '统计日期',
    recent_days        BIGINT COMMENT '最近天数,1:最近1日,7:最近7天,30:最近30天',
    order_total_amount DECIMAL(16, 2) COMMENT '下单总额,GMV',
    order_count        BIGINT COMMENT '下单数',
    order_user_count   BIGINT COMMENT '下单人数'
) COMMENT '交易综合指标';

CREATE TABLE ads_trade_stats_day
(
    uv                 DECIMAL(16, 2) COMMENT '活跃人数',
    new_user_order_cnt BIGINT COMMENT '新客下单人数',
    new_user_order_amt BIGINT COMMENT '新客下单金额',
    new_user_avg_price BIGINT COMMENT '新客客单价',
    old_user_order_cnt BIGINT COMMENT '老客下单人数',
    old_user_order_amt BIGINT COMMENT '老客下单金额',
    old_user_avg_price BIGINT COMMENT '老客客单价',
    dt                 date comment '分区日期'
) COMMENT '交易综合指标';


CREATE TABLE ads_trade_stats_week
(
    uv                 DECIMAL(16, 2) COMMENT '活跃人数',
    new_user_order_cnt BIGINT COMMENT '新客下单人数',
    new_user_order_amt BIGINT COMMENT '新客下单金额',
    new_user_avg_price BIGINT COMMENT '新客客单价',
    old_user_order_cnt BIGINT COMMENT '老客下单人数',
    old_user_order_amt BIGINT COMMENT '老客下单金额',
    old_user_avg_price BIGINT COMMENT '老客客单价',
    wt                 date comment '分区周日期'
) COMMENT '交易综合指标';

CREATE TABLE ads_trade_stats_week
(
    uv                 DECIMAL(16, 2) COMMENT '活跃人数',
    new_user_order_cnt BIGINT COMMENT '新客下单人数',
    new_user_order_amt BIGINT COMMENT '新客下单金额',
    new_user_avg_price BIGINT COMMENT '新客客单价',
    old_user_order_cnt BIGINT COMMENT '老客下单人数',
    old_user_order_amt BIGINT COMMENT '老客下单金额',
    old_user_avg_price BIGINT COMMENT '老客客单价',
    mt                 date comment '分区月日期'
) COMMENT '交易综合指标';

CREATE TABLE ads.trd_user_metrics_d
(
    dt                 date comment '分区日期',
    day_type           varchar comment '日期类型：d:天，w:周，m:月',
    uv                 DECIMAL(16, 2) COMMENT '活跃人数',
    new_user_order_cnt BIGINT COMMENT '新客下单人数',
    new_user_order_amt BIGINT COMMENT '新客下单金额',
    new_user_avg_price BIGINT COMMENT '新客客单价',
    old_user_order_cnt BIGINT COMMENT '老客下单人数',
    old_user_order_amt BIGINT COMMENT '老客下单金额',
    old_user_avg_price BIGINT COMMENT '老客客单价'
) PARTITION BY
VALUE
(dt, day_type) comment '交易域-用户核心指标汇总表';

select tradeNo
from jky.qm_trades_fullinfo_paylist
group by tradeNo
having count(1) >= 2;

select *
from jky.qm_trades_fullinfo_paylist
where tradeNo = 'JY202410262472';

select *
from ods.rpa_tm_product
where biz_day = '2025-06-25'
order by created_at desc;


select created_at, *
from rpa_data.tm_product
where biz_day = '2025-06-25'
order by created_at desc;

select *
from dwd.lgst_outbound_order_item;
CREATE TABLE lgst_outbound_order
(
    __adb_auto_id__      bigint AUTO_INCREMENT,
    outbound_id          varchar COMMENT '出库单号',
    outbound_datetime    datetime COMMENT '出库时间',
    order_number         varchar COMMENT '订单号',
    company              varchar COMMENT '公司',
    shop_id              varchar COMMENT '店铺id',
    shop_name            varchar COMMENT '店铺名称',
    warehouse_code       varchar COMMENT '发货仓库编码',
    warehouse_name       varchar COMMENT '发货仓库名称',
    warehouse_type       varchar COMMENT '仓库类型:冷链,常温',
    express_company_code varchar COMMENT '快递公司编码',
    express_company      varchar COMMENT '快递公司',
    logistics_number     varchar COMMENT '物流单号',
    customer_id          varchar COMMENT '客户id',
    customer_name        varchar COMMENT '客户账户',
    province             varchar COMMENT '收货省',
    city                 varchar COMMENT '收货市',
    district             varchar COMMENT '收货区',
    box_code             varchar COMMENT '纸箱编码',
    box_name             varchar COMMENT '纸箱名称',
    outbound_weight      double COMMENT '出库重量（单位：千克）',
    dt                   date COMMENT '分区日期',
    PRIMARY KEY (__adb_auto_id__, dt)
) DISTRIBUTE BY HASH(__adb_auto_id__) PARTITION BY VALUE(dt) INDEX_ALL='Y' STORAGE_POLICY='HOT' ENGINE='XUANWU' TABLE_PROPERTIES='{"format":"columnstore"}' COMMENT='物流域-销售出库订单事实表'

select customerCode, *
from jky.qm_trades_fullinfo;

select *
from jky.storage_goodsinfo;


select *
from dim.jky_storage_goodsinfo;

create table dwd.trd_rfd_item
(
    order_id          varchar COMMENT '订单ID(吉客云)',
    platform          varchar comment '网店平台',
    plat_order_id     varchar COMMENT '平台网店主订单id',
    plat_sub_order_id varchar COMMENT '平台网店主子订单id',
    user_id           varchar COMMENT '用户ID',
    order_time        TIMESTAMP COMMENT '退款金额',
    shop_id           varchar COMMENT '店铺id',
    shop_name         varchar COMMENT '店铺名称',
    product_id        varchar COMMENT '商品id',
    product_name      varchar comment '商品名称',
    product_flag      varchar comment '商品标记',
    sku_id            varchar COMMENT '规格id',
    sku_barcode       varchar COMMENT '条码',
    item_count        INT COMMENT '商品数量',
    rfd_amt           decimal(10, 2) comment '退款总金额',
    dt                date comment '分区日期'
) comment '交易域-退款商品事务事实表';



create table dwd.trd_place_order_item
(
    order_id          varchar COMMENT '订单ID(吉客云)',
    platform          varchar comment '网店平台',
    plat_order_id     varchar COMMENT '平台网店主订单id',
    plat_sub_order_id varchar COMMENT '平台网店主子订单id',
    user_id           varchar COMMENT '用户ID',
    country           varchar comment '国家',
    state             varchar comment '省',
    city              varchar comment '城市',
    district          varchar comment '区县',
    town              varchar comment '街道',
    zip               varchar comment '邮编',
    order_time        TIMESTAMP COMMENT '下单时间',
    shop_id           varchar COMMENT '店铺id',
    shop_name         varchar COMMENT '店铺名称',
    product_id        varchar COMMENT '商品id',
    product_name      varchar comment '商品名称',
    product_flag      varchar comment '商品标记',
    sku_id            varchar COMMENT '规格id',
    sku_barcode       varchar COMMENT '条码',
    item_price        decimal(10, 2) COMMENT '商品单价',
    item_count        INT COMMENT '商品数量',
    total_amt         decimal(10, 2) comment '下单金额',
    dt                date comment '分区日期'
) comment '交易域-下单到品事务事实表';


show create table ods.jky_storage_goodsinfo;

select * from jky.storage_goodsinfo;

CREATE TABLE dim.simple_item
(
    goods_no             varchar COMMENT '货品编号',
    goods_name           varchar COMMENT '货品名称',
    sku_name             varchar COMMENT '规格名称',
    sku_id               varchar COMMENT '规格ID',
    sku_barcode          varchar COMMENT '条码',
    unit_name            varchar COMMENT '单位',
    cate_id              varchar COMMENT '分类ID',
    cate_name            varchar COMMENT '分类',
    brand_id             varchar COMMENT '品牌ID',
    brand_name           varchar COMMENT '品牌',
    sku_code             varchar COMMENT '外部货品编码',
    goods_desc           varchar COMMENT '货品说明',
    goods_alias          varchar COMMENT '货品别名',
    sku_img_url          varchar COMMENT '规格图片',
    sku_is_blockup       double COMMENT '规格是否停用',
    abc_cate             varchar COMMENT 'ABC分类',
    sku_length           double COMMENT '长',
    sku_width            double COMMENT '宽',
    sku_height           double COMMENT '高',
    color_code           varchar COMMENT '颜色编码',
    color_name           varchar COMMENT '颜色名称',
    size_code            varchar COMMENT '尺码编号',
    size_name            varchar COMMENT '尺寸名称',
    sku_weight           double COMMENT '重量(g)',
    volume               double COMMENT '体积（cm³）',
    retail_price         varchar COMMENT '固定成本价',
    goods_name_en        varchar COMMENT '货品英文名',
    goods_attr           double COMMENT '货品属性',
    is_serial_management double COMMENT '是否唯一码管理',
    cate_full_name       varchar COMMENT '分类全称',
    sku_no               varchar COMMENT '规格编号',
    sku_flag              varchar COMMENT '货品标记:便携装/便携装非MS/MS/正装赠品/非食赠品-入库',
    dt                     date comment '分区日期'
) COMMENT ='单品信息维度表';