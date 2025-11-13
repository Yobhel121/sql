CREATE TABLE rpa_data.fs_ly_pos_data
(
    id                    bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    performance_shop_code bigint COMMENT '业绩考核门店编码',
    performance_shop_name varchar(100) COMMENT '业绩考核门店名称',
    city_name             varchar(50) COMMENT '城市名称',
    erp_product_code      bigint COMMENT 'ERP商品编码',
    product_name          varchar(100) COMMENT '商品名称',
    date                  date COMMENT '日',
    sell_out_achievement  varchar(50) COMMENT '销售sell out达成',
    sell_total            decimal(10, 2) COMMENT '交易额',
    purchase_quantity     bigint COMMENT '购买数量',
    series                varchar(50) COMMENT '系列',
    supply_price          decimal(10, 2) COMMENT '供货价',
    is_pc                 varchar(50) COMMENT '是否是PC',
    category              varchar(50) COMMENT '品类',
    rsp                   varchar(50) COMMENT 'RSP',
    box_specification     varchar(50) COMMENT '箱规',
    created_by            varchar(100) NOT NULL COMMENT '插入人',
    created_at            timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by            varchar(100) COMMENT '更新人',
    updated_at            timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (id)
) COMMENT='飞书_乐友POS数据';

CREATE TABLE feishu_haiziwang_pos_data
(
    id                    bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id               varchar(50) COMMENT '店铺ID',
    performance_shop_code bigint COMMENT '业绩考核门店编码',
    branch                varchar(50) COMMENT '分部',
    erp_product_code      bigint COMMENT 'ERP商品编码',
    product_name          varchar(100) COMMENT '商品名称',
    date                  timestamp COMMENT '日',
    purchase_quantity     bigint NOT NULL COMMENT '购买数量',
    series                varchar(50) COMMENT '系列',
    sell_out_achievement  varchar(50) COMMENT '销售sell out达成',
    pos_achievement       varchar(50) COMMENT '导购POS达成',
    supply_price          decimal(10, 2) COMMENT '供货价',
    is_pc                 varchar(50) COMMENT '是否是PC',
    performance_shop_name varchar(100) COMMENT '业绩考核门店名称',
    category              varchar(50) COMMENT '品类',
    rsp                   varchar(50) COMMENT 'RSP',
    box_specification     varchar(50) COMMENT '箱规',
    created_by            varchar(50) COMMENT '创建者',
    created_at            varchar(50),
    updated_by            varchar(50),
    updated_at            timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (id)
) COMMENT ='飞书_孩子王POS数据';

CREATE TABLE feishu_leyou_pos_data
(
    id                            bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id                       varchar(50) COMMENT '店铺ID',
    product_name                  varchar(100) COMMENT '商品名称',
    date                          date NOT NULL COMMENT '日期',
    rsp                           varchar(50) COMMENT 'RSP',
    box_specification             varchar(50) COMMENT '箱规',
    month                         varchar(10) COMMENT '月份',
    sku                           varchar(255) COMMENT 'SKU',
    net_sales                     decimal(10, 2) COMMENT '净销售额（元）',
    sales_quantity                bigint COMMENT '销售件数',
    number_of_consumers           bigint COMMENT '消费会员数',
    order_volume                  bigint COMMENT '订单量',
    shopping_frequency double COMMENT '购物频次',
    unit_price                    decimal(10, 2) COMMENT '品单价（元）',
    per_capita_sales_contribution decimal(10, 2) COMMENT '人均销售贡献（元）',
    per_capita_purchase_quantity  decimal(10, 2) COMMENT '人均购买件数',
    total                         varchar(255) COMMENT '合计',
    city_code                     varchar(50) COMMENT '城市代码',
    city_name                     varchar(100) COMMENT '城市名称',
    remark                        varchar(255) COMMENT '备注',
    created_by                    varchar(50) COMMENT '创建者',
    created_at                    varchar(50),
    updated_by                    varchar(50),
    updated_at                    timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (id)
) COMMENT ='飞书_乐友POS数据';


select '海豚智投-短视频-财务报表',
       'htzt_finance',
       COLUMN_NAME,
       DATA_TYPE,
       COLUMN_COMMENT,
       CHARACTER_MAXIMUM_LENGTH
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'htzt_finance';

