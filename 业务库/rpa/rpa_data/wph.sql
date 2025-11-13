
CREATE TABLE wph_data_overview
(
    id                                          bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    biz_day                                     date COMMENT '日期',
    sales_amount double COMMENT '销售额（元）',
    sales_volume                                bigint COMMENT '销售量',
    return_items                                bigint COMMENT '退货件数',
    return_amount double COMMENT '退货金额',
    return_rate                                 varchar(100) COMMENT '退货率',
    reject_items                                bigint COMMENT '拒收件数',
    reject_amount                               decimal(10, 2) COMMENT '拒收金额',
    reject_rate                                 varchar(100) COMMENT '拒收率',
    reject_return_items                         bigint COMMENT '拒退件数',
    reject_return_amount double COMMENT '拒退金额',
    reject_return_rate                          varchar(100) COMMENT '拒退率',
    exchange_items                              bigint COMMENT '换货件数',
    exchange_amount double COMMENT '换货金额',
    exchange_rate                               varchar(100) COMMENT '换货率',
    exposure_traffic                            bigint COMMENT '曝光流量',
    page_views                                  bigint COMMENT '浏览流量',
    product_detail_uv                           bigint COMMENT '商详UV',
    product_detail_value double COMMENT '商详UV价值',
    add_to_cart_users                           bigint COMMENT '加购人数',
    favorites_users                             bigint COMMENT '收藏人数',
    conversion_rate_from_view_to_add_to_cart    varchar(100) COMMENT '访问-加购转化率',
    sales_amount_1                              decimal(10, 2) COMMENT '销售额（备用）',
    sales_volume_1                              bigint COMMENT '销售量（备用）',
    customer_count                              bigint COMMENT '客户数',
    suborders                                   bigint COMMENT '子订单数',
    arpu_value double COMMENT 'ARPU值（平均每用户收入）',
    conversion_rate_from_add_to_cart_to_payment varchar(100) COMMENT '加购-支付转化率',
    purchase_conversion_rate                    varchar(100) COMMENT '购买转化率',
    brand_name                                  varchar(255) COMMENT '品牌名称',
    created_by                                  varchar(100) NOT NULL COMMENT '插入人',
    shop_id                                     varchar(255) COMMENT '店铺ID',
    platform_name                               varchar(255) COMMENT '平台名称',
    created_at                                  timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                                  varchar(100) COMMENT '更新人',
    updated_at                                  timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (id)
) COMMENT ='唯品会-数据概览2.0';

CREATE TABLE wph_product_details
(
    id              bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    platform_name   varchar(50) COMMENT '平台名称',
    product_name    varchar(100) COMMENT '商品名称',
    created_by      varchar(100) COMMENT '创建者',
    shop_id         varchar(100) COMMENT '店铺ID',
    product_id      varchar(100) COMMENT '商品ID',
    date            date COMMENT '日期',
    sku_code        varchar(100) COMMENT '货号',
    style_number    varchar(100) COMMENT '款号',
    p_spu_id        varchar(100) COMMENT 'P_SPU_ID',
    product_image   varchar(255) COMMENT '商品图片',
    brand_sn        varchar(100) COMMENT '品牌SN',
    brand_name      varchar(100) COMMENT '品牌名称',
    address_name    varchar(100) COMMENT '地址名称',
    sales_amount    decimal(10, 2) COMMENT '销售额',
    sales_volume    bigint COMMENT '销售量',
    customer_count  bigint COMMENT '客户数',
    available_stock bigint COMMENT '在售库存',
    product_link    varchar(255) COMMENT '商品链接',
    updated_at      timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    updated_by      varchar(10),
    created_at      timestamp          DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) COMMENT ='唯品会_商品明细';

CREATE TABLE wph_promotion_fee
(
    id         bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id    varchar(255) COMMENT '店铺ID',
    account    varchar(255) COMMENT '账户',
    date       date COMMENT '日期',
    cash_income double COMMENT '现金收入(元)',
    cash_expense double COMMENT '现金支出(元)',
    reward_income double COMMENT '奖励收入(元)',
    reward_expense double COMMENT '奖励支出(元)',
    remark     varchar(255) COMMENT '备注',
    shop_name  varchar(255) COMMENT '店铺',
    updated_at timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    created_at timestamp,
    created_by varchar(10),
    updated_by timestamp,
    PRIMARY KEY (id)
) COMMENT ='唯品会-推广费';

CREATE TABLE wph_supplier_inventory_report
(
    id                        bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    create_by                 varchar(100) COMMENT '插入人',
    shop_id                   varchar(255) COMMENT '店铺ID',
    platform_name             varchar(255) COMMENT '平台名称',
    region                    varchar(255) COMMENT '区域',
    stock_in_voucher          varchar(255) COMMENT '入库凭证',
    product_code              varchar(255) COMMENT '商品编码',
    product_name              varchar(255) COMMENT '商品名称',
    product_brand             varchar(255) COMMENT '商品品牌',
    charge_category           varchar(255) COMMENT '收费品类',
    stock_date                date COMMENT '库存日期',
    initial_stock_quantity    bigint COMMENT '期初库存数量',
    stock_in_quantity         bigint COMMENT '入库数量',
    stock_out_quantity        bigint COMMENT '出库数量',
    return_supply_quantity    bigint COMMENT '退供数量',
    transfer_in_quantity      bigint COMMENT '调拨入库数量',
    transfer_out_quantity     bigint COMMENT '调拨出库数量',
    inventory_profit_quantity bigint COMMENT '盘点盘盈数量',
    inventory_loss_quantity   bigint COMMENT '盘点盘亏数量',
    customer_return_quantity  bigint COMMENT '客退收货数量',
    subscription_quantity     bigint COMMENT '认购数量',
    genuine_stock_quantity    bigint COMMENT '正品库存数量',
    defective_stock_quantity  bigint COMMENT '残次品库存数量',
    final_stock_quantity      bigint COMMENT '期末库存数量',
    updated_at                timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (id)
) COMMENT ='唯品会_供应商平台_进销存报表';


select '海豚智投-短视频-财务报表',
       'htzt_finance',
       COLUMN_NAME,
       DATA_TYPE,
       COLUMN_COMMENT,
       CHARACTER_MAXIMUM_LENGTH
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'htzt_finance';

