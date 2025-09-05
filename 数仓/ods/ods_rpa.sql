# *********************************** 抖音平台 ***********************************
CREATE TABLE ods.rpa_dy_product_constitute
(
    id                     bigint       NOT NULL AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id                varchar(100) NOT NULL COMMENT '店铺id',
    biz_day                date COMMENT '日期',
    product_code           varchar(50) COMMENT '商品编号',
    product_name           varchar(50) COMMENT '商品名称',
    carrier_type           varchar(100) COMMENT '载体类型',
    trans_amount           decimal(10, 2) COMMENT '成交金额(元)',
    unit_price             decimal(10, 2) COMMENT '成交笔单价(元)',
    product_click_pay_rate double COMMENT '商品点击-支付转化率(次数)',
    created_by             varchar(100) NOT NULL COMMENT '插入人',
    created_at             timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by             varchar(100) COMMENT '更新人',
    updated_at             timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                     date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='抖音-商品构成';

CREATE TABLE ods.rpa_dy_business_overview
(
    id                     bigint       NOT NULL AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id                varchar(100) NOT NULL COMMENT '平台id，及店铺id，推广id',
    biz_day                date COMMENT '日期',
    trans_amount           decimal(10, 2) COMMENT '成交金额(元)',
    refund_amount          decimal(10, 2) COMMENT '退款金额(元)',
    trans_order_cnt        int COMMENT '成交订单数',
    trans_user_cnt         int COMMENT '成交人数',
    product_visit_num      int COMMENT '商品访客数',
    product_click_num      int COMMENT '商品点击人数',
    refund_order_cnt       int COMMENT '退款订单量',
    product_exposure_cnt   int COMMENT '商品曝光次数',
    product_click_cnt      int COMMENT '商品点击次数',
    product_click_rate     double COMMENT '商品点击率(次数)',
    product_click_pay_rate double COMMENT '商品点击-支付转化率(次数)',
    trans_user_price       decimal(10, 2) COMMENT '成交客单价(元)',
    trans_exposure_price   decimal(10, 2) COMMENT '千次曝光成交金额(元)',
    created_by             varchar(100) NOT NULL COMMENT '插入人',
    created_at             timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by             varchar(100) COMMENT '更新人',
    updated_at             timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                     date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='抖音-经营概览';

CREATE TABLE ods.rpa_dy_expert_analysis
(
    id                                bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id                           varchar(100) NOT NULL COMMENT '店铺id',
    expert_avatar                     varchar(200) COMMENT '达人头像',
    expert_nickname                   varchar(100) COMMENT '达人昵称',
    tiktok                            varchar(50) COMMENT '抖音号',
    trans_product_cnt                 int COMMENT '成交商品数',
    ecommerce_level                   int COMMENT '电商等级',
    fans_cnt                          int COMMENT '粉丝数',
    play_30d_rate                     double COMMENT '近30天电商开播频次',
    contribute_30d_rate               double COMMENT '近30天电商投稿频次',
    trans_amount                      decimal(10, 2) COMMENT '成交金额(元)',
    trans_order_cnt                   int COMMENT '成交订单数',
    trans_deal_cnt                    int COMMENT '成交件数',
    trans_user_cnt                    int COMMENT '成交人数',
    predict_commission                decimal(10, 2) COMMENT '预估佣金支出',
    actual_commission_amount          decimal(10, 2) COMMENT '实际佣金支出',
    trans_new_user_cnt                int COMMENT '成交新用户数',
    trans_old_user_cnt                int COMMENT '成交老用户数',
    plant_grass_user_cnt              int COMMENT '种草人数',
    trans_new_user_amount             decimal(10, 2) COMMENT '新用户成交金额(元)',
    trans_old_user_amount             decimal(10, 2) COMMENT '老用户成交金额(元)',
    live_trans_amount                 decimal(10, 2) COMMENT '直播间成交金额(元)',
    live_trans_order_cnt              int COMMENT '直播间成交订单数',
    live_trans_user_cnt               int COMMENT '直播间成交人数',
    live_trans_grass_user_cnt         int COMMENT '直播间种草人数',
    short_video_trans_amount          decimal(10, 2) COMMENT '短视频成交金额(元)',
    short_video_trans_order_cnt       int COMMENT '短视频成交订单数',
    short_video__trans_user_cnt       int COMMENT '直播间成交人数',
    short_video__trans_grass_user_cnt int COMMENT '短视频种草人数',
    refund_amount                     decimal(10, 2) COMMENT '退款金额',
    refund_order_cnt                  int COMMENT '退款订单数',
    refund_user_cnt                   int COMMENT '退款人数',
    shipment_refund_amount            decimal(10, 2) COMMENT '发货前退款金额',
    shipment_refund_order_cnt         int COMMENT '发货前退款订单数',
    shipment_refund_user_cnt          int COMMENT '发货前退款人数',
    biz_day                           date COMMENT '日期',
    created_by                        varchar(100) NOT NULL COMMENT '插入人',
    created_at                        timestamp DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                        varchar(100) COMMENT '更新人',
    updated_at                        timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                                date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='抖音-达人分析';

CREATE TABLE ods.rpa_dy_merchant_experience_score
(
    id                           bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id                      varchar(100) NOT NULL COMMENT '店铺id',
    product_negative_review_rate varchar(100) COMMENT '商品差评率',
    product_quality_return_rate  varchar(100) COMMENT '商品品质退货率',
    order_delivery_duration      varchar(100) COMMENT '订单配送时长',
    payment_collect_24h_rate     varchar(100) COMMENT '24小时支付-揽收率',
    deliver_goods_feedback_rate  varchar(100) COMMENT '发货问题负向反馈率',
    after_sales_refusal_rate     varchar(100) COMMENT '售后拒绝率',
    platform_assistance_rate     varchar(100) COMMENT '平台求助率',
    im_dissatisfaction_rate      varchar(100) COMMENT 'IM不满意率',
    return_refund_duration       varchar(100) COMMENT '退货退款自主完结时长',
    refund_duration              varchar(100) COMMENT '仅退款自主完结时长',
    im_avg_respond_duration      varchar(100) COMMENT 'IM平均响应时长',
    shop_name                    varchar(100) COMMENT '店铺名称',
    biz_day                      date COMMENT '日期',
    created_by                   varchar(100) NOT NULL COMMENT '插入人',
    created_at                   timestamp DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                   varchar(100) COMMENT '更新人',
    updated_at                   timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                           date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='抖音-商家体验分';

CREATE TABLE ods.rpa_dy_product_overview
(
    id                                    bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id                               varchar(100) NOT NULL COMMENT '店铺id',
    biz_day                               date COMMENT '日期',
    product_image                         varchar(255) COMMENT '商品图片',
    product_title                         varchar(255) COMMENT '商品标题',
    product_code                          varchar(255) COMMENT '商品编号',
    trans_amount                          decimal(10, 2) COMMENT '成交金额',
    trans_order_cnt                       int COMMENT '成交订单数',
    trans_deal_cnt                        int COMMENT '成交件数',
    trans_user_cnt                        int COMMENT '成交人数',
    trans_customer_price                  int COMMENT '成交客单价',
    trans_exclude_refunds_amount          decimal(10, 2) COMMENT '成交金额（剔除退款）',
    trans_exclude_refunds_order_cnt       int COMMENT '成交订单数（剔除退款）',
    actual_settlement_amount              decimal(10, 2) COMMENT '实际结算金额',
    actual_commission_amount              decimal(10, 2) COMMENT '实际佣金支出',
    pre_sale_order_cnt                    int COMMENT '预售订单数',
    pre_sale_created_amount               decimal(10, 2) COMMENT '预售创建金额',
    refund_amount                         decimal(10, 2) COMMENT '退款金额',
    refund_order_cnt                      int COMMENT '退款订单数',
    refund_product_cnt                    int COMMENT '退款件数',
    refund_user_cnt                       int COMMENT '退款人数',
    trans_refund_amount                   decimal(10, 2) COMMENT '成交退款金额',
    trans_refund_order_cnt                int COMMENT '成交退款订单数',
    trans_refund_rate                     double COMMENT '成交退款率',
    before_shop_refund_rate               double COMMENT '发货前成交退款率',
    after_shop_refund_rate                double COMMENT '发货后成交退款率',
    quality_return_rate                   double COMMENT '品质退货率（滞后）',
    complaint_rate                        double COMMENT '投诉率（滞后）',
    negative_feedback_rate                double COMMENT '差评率',
    negative_feedback_cnt                 int COMMENT '差评数',
    positive_feedback_rate                double COMMENT '好评率',
    positive_feedback_cnt                 int COMMENT '好评数',
    feedback_cnt                          int COMMENT '评价数',
    order_negative_feedback_rate          double COMMENT '订单差评率',
    product_exposure_cnt                  int COMMENT '商品曝光次数',
    product_click_cnt                     int COMMENT '商品点击次数',
    product_exposure_user_count           int COMMENT '商品曝光人数',
    product_click_num                     int COMMENT '商品点击人数',
    live_room_product_exposure_user_count int COMMENT '直播间商品曝光人数',
    live_room_product_click_user_count    int COMMENT '直播间商品点击人数',
    live_trans_amount                     decimal(10, 2) COMMENT '直播间成交金额',
    live_trans_order_cnt                  int COMMENT '直播间成交订单数',
    live_room_trans_product_cnt           int COMMENT '直播间成交件数',
    live_trans_user_cnt                   int COMMENT '直播间成交人数',
    live_room_trans_conversion_rate       double COMMENT '直播间成交转化率',
    short_video_product_exposure_user_cnt int COMMENT '短视频商品曝光人数',
    short_video_product_click_user_cnt    int COMMENT '短视频商品点击人数',
    short_video_trans_amount              decimal(10, 2) COMMENT '短视频成交金额',
    short_video_trans_order_cnt           int COMMENT '短视频成交订单数',
    short_video_trans_cnt                 int COMMENT '短视频成交件数',
    short_video_trans_user_cnt            int COMMENT '短视频成交人数',
    short_video_pay_rate                  double COMMENT '短视频支付转化率',
    created_by                            varchar(100) NOT NULL COMMENT '插入人',
    created_at                            timestamp DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                            varchar(100) COMMENT '更新人',
    updated_at                            timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                                    date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='抖音-商品概览';

CREATE TABLE ods.rpa_dy_short_video_product
(
    id              bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id         varchar(100) NOT NULL COMMENT '店铺id',
    video_title     varchar(255) COMMENT '视频标题',
    video_id        varchar(100) COMMENT '视频ID',
    play_link       varchar(100) COMMENT '播放链接',
    release_time    varchar(100) COMMENT '发布时间',
    expert_nickname varchar(100) COMMENT '达人昵称',
    expert_tiktok   varchar(100) COMMENT '达人抖音号',
    video_duration  varchar(100) COMMENT '视频时长',
    video_view_cnt  double COMMENT '视频观看次数',
    trans_amount    double COMMENT '成交金额(元)',
    trans_order_cnt double COMMENT '成交订单数',
    complete_rate   varchar(100) COMMENT '完播率',
    biz_day         date COMMENT '日期',
    product_id      varchar(100) COMMENT '商品id',
    product_name    varchar(100) COMMENT '商品名称',
    created_by      varchar(100) NOT NULL COMMENT '插入人',
    created_at      timestamp DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by      varchar(100) COMMENT '更新人',
    updated_at      timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt              date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='抖音-短视频商品数据';

CREATE TABLE ods.rpa_dy_alliance_order
(
    id                                  bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id                             varchar(100) NOT NULL COMMENT '店铺id',
    order_id                            varchar(100) COMMENT '订单id',
    product_id                          varchar(100) COMMENT '商品id',
    product_name                        varchar(100) COMMENT '商品名称',
    author_account                      varchar(100) COMMENT '作者账号',
    tiktok                              varchar(100) COMMENT '抖音/火山号',
    pay_amount                          double COMMENT '支付金额',
    commission_rate                     varchar(100) COMMENT '佣金率',
    predict_commission                  decimal(10, 2) COMMENT '预估佣金支出',
    settlement_amount                   decimal(10, 2) COMMENT '结算金额',
    reality_commission                  decimal(10, 2) COMMENT '实际佣金支出',
    order_status                        varchar(100) COMMENT '订单状态',
    settlement_timeout_reason           varchar(100) COMMENT '超时未结算原因',
    payment_time                        timestamp COMMENT '付款时间',
    receipt_time                        varchar(100) COMMENT '收货时间',
    order_settlement_time               varchar(100) COMMENT '订单结算时间',
    product_source                      varchar(100) COMMENT '商品来源',
    final_pay_time                      varchar(100) COMMENT '尾款支付时间',
    deposit_amount                      varchar(100) COMMENT '定金金额',
    shop_name                           varchar(100) COMMENT '店铺名称',
    product_cnt                         int COMMENT '商品数量',
    commission_invoice                  varchar(100) COMMENT '佣金发票',
    frozen_rate                         varchar(100) COMMENT '冻结比例',
    is_tiered_commission                varchar(100) COMMENT '是否阶梯佣金',
    threshold_sale_cnt                  varchar(100) COMMENT '门槛销量',
    base_commission_rate                varchar(100) COMMENT '基础佣金率',
    increased_commission_rate           varchar(100) COMMENT '升佣佣金率',
    estimated_bonus_commission_amount   decimal(10, 2) COMMENT '预估奖励佣金支出',
    settled_bonus_commission_amount     decimal(10, 2) COMMENT '结算奖励佣金支出',
    tiered_plan_id                      varchar(100) COMMENT '阶梯计划ID',
    payment_subsidy                     decimal(10, 2) COMMENT '支付补贴',
    platform_subsidy                    decimal(10, 2) COMMENT '平台补贴',
    expert_subsidy                      decimal(10, 2) COMMENT '达人补贴',
    shipping_cost                       decimal(10, 2) COMMENT '运费',
    tax_fee                             decimal(10, 2) COMMENT '税费',
    shipping_subsidy                    decimal(10, 2) COMMENT '运费补贴',
    distribution_source                 varchar(100) COMMENT '分销来源',
    marketing_activity_id               varchar(100) COMMENT '营销活动id',
    promotion_rate                      varchar(100) COMMENT '推广费率',
    promotion_service_fee               double COMMENT '推广技术服务费',
    estimated_promotion_fee_expenditure double COMMENT '预估推广费支出',
    settled_promotion_fee_expenditure   double COMMENT '结算推广费支出',
    plan_type                           varchar(100) COMMENT '计划类型',
    order_source                        varchar(100) COMMENT '订单来源',
    traffic_sub_source                  varchar(100) COMMENT '流量细分来源',
    traffic_source                      varchar(100) COMMENT '流量来源',
    order_type                          varchar(100) COMMENT '订单类型',
    created_by                          varchar(100) NOT NULL COMMENT '插入人',
    created_at                          timestamp DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                          varchar(100) COMMENT '更新人',
    updated_at                          timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                                  date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='抖音-联盟订单明细';

CREATE TABLE ods.rpa_dy_finance_statement
(
    id                              bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    biz_day                         date COMMENT '日期',
    fund_pool_type                  varchar(100) COMMENT '资金池类型',
    total_balance_consumption       decimal(10, 2) COMMENT '余额总消耗(元)',
    non_grant_consumption           decimal(10, 2) COMMENT '非赠款消耗(元)',
    grant_consumption               decimal(10, 2) COMMENT '赠款消耗(元)',
    cashback_redemption_consumption decimal(10, 2) COMMENT '消返红包消耗(元)',
    shared_grant_consumption        decimal(10, 2) COMMENT '共享赠款消耗(元)',
    minus_redemption_consumption    decimal(10, 2) COMMENT '立减红包消耗(元)',
    total_deposit                   decimal(10, 2) COMMENT '总存入(元)',
    total_transfer_in               decimal(10, 2) COMMENT '总转入(元)',
    total_transfer_out              decimal(10, 2) COMMENT '总转出(元)',
    total_balance                   decimal(10, 2) COMMENT '总余额(元)',
    grant_balance                   decimal(10, 2) COMMENT '赠款余额(元)',
    non_grant_balance               decimal(10, 2) COMMENT '非赠款余额(元)',
    account                         varchar(100) COMMENT '账户',
    account_id                      varchar(100) COMMENT '账户ID',
    created_by                      varchar(100) NOT NULL COMMENT '插入人',
    created_at                      timestamp DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                      varchar(100) COMMENT '更新人',
    updated_at                      timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                              date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='抖音-财务流水';

CREATE TABLE ods.rpa_dy_promotion_global_tiktok
(
    id                        bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    tiktok                    varchar(100) COMMENT '抖音号',
    biz_day                   date COMMENT '日期',
    total_consumption         decimal(10, 2) COMMENT '整体消耗(元)',
    total_pay_roi             decimal(10, 2) COMMENT '整体支付ROI',
    total_trans_amount        decimal(10, 2) COMMENT '整体成交金额(元)',
    total_trans_order_cnt     int COMMENT '整体成交订单数',
    total_trans_order_cost    decimal(10, 2) COMMENT '整体成交订单成本(元)',
    total_smart_coupon_amount int COMMENT '整体成交智能优惠券金额(元)',
    account_id                varchar(100) COMMENT '账户ID',
    account_name              varchar(100) COMMENT '账户名称',
    created_by                varchar(100) NOT NULL COMMENT '插入人',
    created_at                timestamp DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                varchar(100) COMMENT '更新人',
    updated_at                timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                        date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='抖音-全域推广数据-抖音';

CREATE TABLE ods.rpa_dy_promotion_global_product
(
    id                              bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    product_id                      BIGINT COMMENT '商品ID',
    product_name                    VARCHAR(255) COMMENT '商品名称',
    biz_day                         DATE COMMENT '日期',
    total_display_cnt               DOUBLE COMMENT '整体展示次数',
    total_click_cnt                 DOUBLE COMMENT '整体点击次数',
    total_click_rate                VARCHAR(50) COMMENT '整体点击率',
    total_conversion_rate           VARCHAR(50) COMMENT '整体转化率',
    total_cost                      decimal(10, 2) COMMENT '整体消耗',
    total_order_cnt                 BIGINT COMMENT '整体成交订单数',
    total_sale_amount               decimal(10, 2) COMMENT '整体成交金额',
    total_pay_roi                   DOUBLE COMMENT '整体支付ROI',
    total_order_cost                decimal(10, 2) COMMENT '整体成交订单成本',
    total_smart_coupon_amount       decimal(10, 2) COMMENT '整体成交智能优惠券金额',
    total_unfinished_presale_amount decimal(10, 2) COMMENT '整体未完结预售订单预估金额',
    account_id                      BIGINT COMMENT '账号ID',
    account_name                    VARCHAR(255) COMMENT '账号名称',
    data_page_link                  VARCHAR(255) COMMENT '数据页面链接',
    update_time                     TIMESTAMP COMMENT '更新时间',
    created_by                      varchar(100) NOT NULL COMMENT '插入人',
    created_at                      timestamp DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                      varchar(100) COMMENT '更新人',
    updated_at                      timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                              date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='抖音-全域推广数据-商品';

CREATE TABLE ods.rpa_dy_promotion_product_tiktok
(
    id                           bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    tiktok                       varchar(100) COMMENT '抖音号',
    tiktok_name                  varchar(100) COMMENT '抖音号名称',
    biz_day                      date COMMENT '日期',
    cost                         decimal(10, 2) COMMENT '消耗(元)',
    display_cnt                  int COMMENT '展示次数',
    click_through_rate           double COMMENT '点击率(%)',
    click_cnt                    double COMMENT '点击次数',
    avg_cpm_amount               decimal(10, 2) COMMENT '平均千次展现费用(元)',
    direct_transaction_amount    decimal(10, 2) COMMENT '直接成交金额(元)',
    direct_payment_roi           decimal(10, 2) COMMENT '直接支付ROI',
    direct_transaction_order_cnt double COMMENT '直接成交订单数',
    new_customer_first_order_cnt double COMMENT '店铺首单新客人数',
    new_customer_first_order_roi double COMMENT '店铺首单新客直接支付ROI',
    new_customer_30_days_roi     double COMMENT '店铺首单新客30天累计支付ROI',
    account                      varchar(100) COMMENT '账户',
    account_id                   varchar(100) COMMENT '账户ID',
    order_platform               varchar(100) COMMENT '下单平台',
    created_by                   varchar(100) NOT NULL COMMENT '插入人',
    created_at                   timestamp DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                   varchar(100) COMMENT '更新人',
    updated_at                   timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                           date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='抖音-商品推广-抖音';

CREATE TABLE ods.rpa_dy_promotion_product_product
(
    id                           bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    product_id                   varchar(100) COMMENT '商品id',
    product_name                 varchar(100) COMMENT '商品名称',
    biz_day                      date COMMENT '日期',
    cost                         decimal(10, 2) COMMENT '消耗(元)',
    display_cnt                  int COMMENT '展示次数',
    click_through_rate           double COMMENT '点击率(%)',
    click_cnt                    double COMMENT '点击次数',
    avg_cpm_amount               decimal(10, 2) COMMENT '平均千次展现费用(元)',
    direct_transaction_amount    decimal(10, 2) COMMENT '直接成交金额(元)',
    direct_payment_roi           decimal(10, 2) COMMENT '直接支付ROI',
    direct_transaction_order_cnt double COMMENT '直接成交订单数',
    new_customer_first_order_cnt double COMMENT '店铺首单新客人数',
    new_customer_first_order_roi double COMMENT '店铺首单新客直接支付ROI',
    new_customer_30_days_roi     double COMMENT '店铺首单新客30天累计支付ROI',
    account                      varchar(100) COMMENT '账户',
    account_id                   varchar(100) COMMENT '账户ID',
    order_platform               varchar(100) COMMENT '下单平台',
    trans_smart_coupon_amount    varchar(100) COMMENT '成交智能优惠券金额',
    created_by                   varchar(100) NOT NULL COMMENT '插入人',
    created_at                   timestamp DEFAULT '2024-08-30 10:51:22.919' COMMENT '插入时间',
    updated_by                   varchar(100) COMMENT '更新人',
    updated_at                   timestamp DEFAULT '2024-08-30 10:51:22.919' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                           date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='抖音-商品推广-商品';

CREATE TABLE ods.rpa_dy_promotion_living_tiktok
(
    id                           bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    tiktok                       varchar(100) COMMENT '抖音号',
    tiktok_name                  varchar(100) COMMENT '抖音号名称',
    biz_day                      date COMMENT '日期',
    cost                         decimal(10, 2) COMMENT '消耗(元)',
    display_cnt                  decimal(10, 2) COMMENT '展示次数',
    click_through_rate           decimal(10, 2) COMMENT '点击率(%)',
    click_cnt                    decimal(10, 2) COMMENT '点击次数',
    avg_cpm_amount               decimal(10, 2) COMMENT '平均千次展现费用(元)',
    total_pay_7d_roi             decimal(10, 2) COMMENT '7日总支付ROI',
    total_trans_7d_order_cnt     decimal(10, 2) COMMENT '7日总成交订单数',
    total_trans_7d_amount        decimal(10, 2) COMMENT '7日总成交金额(元)',
    direct_transaction_order_cnt decimal(10, 2) COMMENT '直接成交订单数',
    direct_transaction_amount    decimal(10, 2) COMMENT '直接成交金额(元)',
    direct_payment_roi           decimal(10, 2) COMMENT '直接支付ROI',
    new_customer_first_order_cnt decimal(10, 2) COMMENT '店铺首单新客人数',
    new_customer_first_order_roi decimal(10, 2) COMMENT '店铺首单新客直接支付ROI',
    new_customer_30_days_roi     decimal(10, 2) COMMENT '店铺首单新客30天累计支付ROI',
    account                      varchar(100) COMMENT '账户',
    account_id                   varchar(100) COMMENT '账户ID',
    order_platform               varchar(100) COMMENT '下单平台',
    created_by                   varchar(100) NOT NULL COMMENT '插入人',
    created_at                   timestamp DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                   varchar(100) COMMENT '更新人',
    updated_at                   timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                           date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='抖音-直播推广-抖音';

CREATE TABLE ods.rpa_dy_promotion_fee_consumption
(
    id               bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    account          varchar(100) COMMENT '账户',
    consumption      decimal(10, 2) COMMENT '消耗',
    account_id       varchar(100) COMMENT '账户ID',
    biz_day          varchar(100) COMMENT '消耗日期',
    down_day         varchar(100) COMMENT '下载日期',
    created_by       varchar(100) NOT NULL COMMENT '插入人',
    created_at       timestamp DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by       varchar(100) COMMENT '更新人',
    updated_at       timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    consumption_type int COMMENT '消耗类型：1-标准推广,2-全域推广',
    dt               date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='抖音-推广费消耗明细';

CREATE TABLE ods.rpa_dy_reception_volume
(
    id                                bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    biz_day                           date COMMENT '日期',
    shop_id                           varchar(100) COMMENT '店铺id',
    shop_name                         varchar(100) COMMENT '店铺名称',
    customer_service_nickname         varchar(100) COMMENT '客服昵称',
    account_name                      varchar(100) COMMENT '账号名称',
    receive_manually_user_cnt         double COMMENT '人工已接待人数',
    receive_manually_session_cnt      double COMMENT '人工已接待会话量',
    cpd                               decimal(10, 2) COMMENT 'CPD',
    dissatisfaction_rate              varchar(100) COMMENT '不满意率',
    manual_response_3min_session_rate varchar(100) COMMENT '3分钟人工回复率 (会话)',
    manual_response_3min_rate         varchar(100) COMMENT '3分钟人工回复率',
    first_response_duration           double COMMENT '首次响应时长（秒）',
    avg_response_duration             double COMMENT '平均响应时长（秒）',
    new_avg_response_duration         double COMMENT '新平均响应时长（秒）',
    satisfaction_rate                 varchar(100) COMMENT '满意率',
    customer_service_sales_amount     decimal(10, 2) COMMENT '客服销售额（元）',
    inquiry_user_cnt                  double COMMENT '询单人数',
    order_user_cnt                    double COMMENT '下单人数',
    pay_user_cnt                      double COMMENT '支付人数',
    inquiry_conversion_rate           varchar(100) COMMENT '询单转化率',
    warning_session_cnt               double COMMENT '预警会话量',
    pc_online_duration                double COMMENT 'PC在线时长（时）',
    pc_rest_duration                  double COMMENT 'PC小休时长（时）',
    pc_offline_duration               double COMMENT 'PC离线时长（时）',
    created_by                        varchar(100) NOT NULL COMMENT '插入人',
    created_at                        timestamp DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                        varchar(100) COMMENT '更新人',
    updated_at                        timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                                date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='抖音-接待量';

CREATE TABLE ods.rpa_dy_cid
(
    id                        bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    login_user_id             varchar(100) COMMENT '登录用户id',
    biz_day                   date COMMENT '日期',
    account_name              varchar(100) NOT NULL COMMENT '账号名称',
    account_id                varchar(100) NOT NULL COMMENT '账号id',
    business_platform         varchar(100) COMMENT '业务平台',
    agent_name                varchar(100) COMMENT '所属代理商名称',
    agent_id                  varchar(100) COMMENT '所属代理商ID',
    shared_grant_expenditure  decimal(10, 2) COMMENT '共享赠款支出',
    total_account_expenditure decimal(10, 2) COMMENT '账户总支出(¥)',
    cash_account_expenditure  decimal(10, 2) COMMENT '账户现金支出(¥)',
    grant_account_expenditure decimal(10, 2) COMMENT '账户赠款支出(¥)',
    total_account_deposit     decimal(10, 2) COMMENT '账户总存入(¥)',
    total_account_inflow      decimal(10, 2) COMMENT '账户总转入(¥)',
    total_account_outflow     decimal(10, 2) COMMENT '账户总转出(¥)',
    non_grant_balance         decimal(10, 2) COMMENT '非赠款余额(¥)',
    grant_balance             decimal(10, 2) COMMENT '赠款余额(¥)',
    total_balance             decimal(10, 2) COMMENT '总余额(¥)',
    frozen_amount             decimal(10, 2) COMMENT '冻结(¥)',
    created_by                varchar(100) NOT NULL COMMENT '插入人',
    created_at                timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                varchar(100) COMMENT '更新人',
    updated_at                timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                        date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='抖音-CID';


# *********************************** 京东平台 ***********************************

CREATE TABLE ods.rpa_jd_jtk_bill
(
    id                bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    platform_type     int COMMENT '1.京东自营 2：京东pop',
    shop_id           varchar(100) COMMENT '店铺id',
    shop_name         varchar(100) COMMENT '店铺名称',
    trans_id          varchar(255) COMMENT '流水单号',
    settlement_amount decimal(10, 2) COMMENT '结算金额',
    expense_date      date COMMENT '费用时间',
    status            varchar(255) COMMENT '状态',
    settlement_date   date COMMENT '结算时间',
    created_by        varchar(100) NOT NULL COMMENT '插入人',
    created_at        timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by        varchar(100) COMMENT '更新人',
    updated_at        timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='京东-京挑客-结算账单';

CREATE TABLE ods.rpa_jd_jzt_bill
(
    id               bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    platform_type    int COMMENT '1.京东自营 2：京东pop',
    shop_id          varchar(100) COMMENT '店铺id',
    shop_name        varchar(100) COMMENT '店铺名称',
    trans_id         varchar(100) COMMENT '流水单号',
    account          varchar(100) COMMENT '账号',
    placement_date   date COMMENT '投放日期',
    trans_type       varchar(100) COMMENT '交易类型',
    expend_amount    decimal(10, 2) COMMENT '支出',
    settlement_date  date COMMENT '结算时间',
    remain_amount    decimal(10, 2) COMMENT '结余',
    invoicing_method varchar(255) COMMENT '开票方式',
    created_by       varchar(100) NOT NULL COMMENT '插入人',
    created_at       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by       varchar(100) COMMENT '更新人',
    updated_at       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt               date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='京东-京准通-结算账单';

CREATE TABLE ods.rpa_jd_autarky_product_list
(
    id                    bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    day_type              int COMMENT '统计范围：1：:1天，15：15天',
    day_range             varchar(100) COMMENT '日期范围',
    price_range           varchar(100) COMMENT '价格区间',
    rank_num              bigint COMMENT '排名',
    product_id            varchar(100) COMMENT '商品编号',
    product_name          varchar(100) COMMENT '商品名称',
    brand                 varchar(100) COMMENT '所属品牌',
    trans_amount_idx      double COMMENT '成交金额指数',
    trans_volume_idx      double COMMENT '成交件数指数',
    traffic_idx           double COMMENT '流量指数',
    visit_idx             double COMMENT '访客指数',
    trans_unit_price      decimal(10, 2) COMMENT '成交客单价',
    trans_conversion_rate double COMMENT '成交转化率',
    add_cart_user_num     double COMMENT '加购人数',
    follow_user_num       double COMMENT '关注人数',
    search_click_idx      double COMMENT '搜索点击指数',
    created_by            varchar(100) NOT NULL COMMENT '插入人',
    created_at            timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by            varchar(100) COMMENT '更新人',
    updated_at            timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                    date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='京东-自营-商品榜单';

CREATE TABLE ods.rpa_jd_autarky_product_performance
(
    id                      bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id                 varchar(100) COMMENT '店铺id',
    biz_day                 date COMMENT '日期',
    product_id              varchar(100) COMMENT '商品编号',
    product_name            varchar(100) COMMENT '商品名称',
    financial_sales_volume  bigint COMMENT '财务销量',
    revenue                 decimal(12, 4) COMMENT '收入',
    cost                    decimal(12, 4) COMMENT '成本',
    gross_profit            decimal(12, 4) COMMENT '毛利',
    coupon_deductions       double COMMENT '优惠券抵减数',
    points_deductions       double COMMENT '积分抵减数',
    promotion_deductions    double COMMENT '满返满减额',
    inventory_turnover_days double COMMENT '库存周转天数',
    created_by              varchar(100) NOT NULL COMMENT '插入人',
    created_at              timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by              varchar(100) COMMENT '更新人',
    updated_at              timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                      date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='京东-自营-商品业绩';

CREATE TABLE ods.rpa_jd_autarky_recharge
(
    id          bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id     varchar(100) COMMENT '店铺id',
    biz_day     date COMMENT '日期',
    shop_name   varchar(200) COMMENT '店铺',
    gift_amount decimal(12, 2) COMMENT '赠送金额',
    created_by  varchar(100) NOT NULL COMMENT '插入人',
    created_at  timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by  varchar(100) COMMENT '更新人',
    updated_at  timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt          date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='京东-自营-充值数据';

CREATE TABLE ods.rpa_jd_autarky_trade
(
    id                    bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id               varchar(100) COMMENT '店铺id',
    biz_day               date COMMENT '日期',
    page_views            bigint COMMENT '浏览量',
    visit_cnt             bigint COMMENT '访客数',
    trans_user_num        bigint COMMENT '成交人数',
    trans_conversion_rate varchar(100) COMMENT '成交转化率',
    trans_order_cnt       bigint COMMENT '成交单量',
    trans_product_cnt     bigint COMMENT '成交商品件数',
    trans_amount          decimal(10, 2) COMMENT '成交金额',
    trans_unit_price      decimal(10, 2) COMMENT '成交客单价',
    created_by            varchar(100) NOT NULL COMMENT '插入人',
    created_at            timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by            varchar(100) COMMENT '更新人',
    updated_at            timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                    date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='京东-自营-交易概况';

CREATE TABLE ods.rpa_jd_autarky_product
(
    id                    bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id               varchar(100) COMMENT '店铺id',
    shop_name             varchar(100) COMMENT '店铺名称',
    biz_day               date COMMENT '日期',
    product_name          varchar(100) COMMENT '商品名称',
    sku                   bigint COMMENT 'SKU',
    brand                 varchar(100) COMMENT '品牌',
    first_cate            varchar(100) COMMENT '一级类目',
    secondary_cate        varchar(100) COMMENT '二级类目',
    third_cate            varchar(100) COMMENT '三级类目',
    business_model        varchar(100) COMMENT '经营模式',
    page_view             bigint COMMENT '浏览量',
    visit_num             bigint COMMENT '访客数',
    avg_page_view         bigint COMMENT '人均浏览量',
    avg_stay_duration     bigint COMMENT '平均停留时长',
    trans_user_num        bigint COMMENT '成交人数',
    trans_conversion_rate double COMMENT '成交转化率',
    trans_order_cnt       bigint COMMENT '成交单量',
    trans_product_cnt     bigint COMMENT '成交商品件数',
    trans_amount          decimal(10, 0) COMMENT '成交金额',
    trans_unit_price      decimal(10, 2) COMMENT '成交客单价',
    cart_add_num          bigint COMMENT '加购人数',
    cart_conversion_rate  double COMMENT '加购转化率',
    cart_product_cnt      bigint COMMENT '加购商品件数',
    created_by            varchar(100) NOT NULL COMMENT '插入人',
    created_at            timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by            varchar(100) COMMENT '更新人',
    updated_at            timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                    date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='京东-自营-商品明细';

CREATE TABLE ods.rpa_jd_autarky_product_stock
(
    id                            bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id                       varchar(100) COMMENT '店铺id',
    biz_day                       date COMMENT '日期',
    product_name                  varchar(100) COMMENT '商品名称',
    sku                           varchar(100) COMMENT 'SKU',
    brand                         varchar(100) COMMENT '品牌',
    first_cate                    varchar(100) COMMENT '一级类目',
    secondary_cate                varchar(100) COMMENT '二级类目',
    third_cate                    varchar(100) COMMENT '三级类目',
    shop_name                     varchar(100) COMMENT '店铺名称',
    supplier_code                 varchar(100) COMMENT '供应商简码',
    supplier_name                 varchar(100) COMMENT '供应商名称',
    is_limited_sale               varchar(100) COMMENT '是否售完即止',
    is_factory_direct             varchar(100) COMMENT '是否厂直',
    nationwide_factory_stock      bigint COMMENT '全国厂直可用库存',
    is_shadow_stock               varchar(20) COMMENT '是否影分身',
    is_virtual_combo              varchar(20) COMMENT '是否虚拟组套',
    is_virtual_category           varchar(20) COMMENT '是否虚拟品类',
    listing_status                varchar(20) COMMENT '上下柜状态',
    listing_date                  date COMMENT '上柜时间',
    is_parallel_stock             varchar(20) COMMENT '是否平行库存',
    is_gift                       varchar(20) COMMENT '是否赠品',
    spu_code                      varchar(100) COMMENT 'SPU编码',
    barcode                       varchar(100) COMMENT '条形码',
    jd_price                      decimal(10, 2) COMMENT '京东价',
    nationwide_purchase_price     decimal(10, 2) COMMENT '全国采购价',
    warehouse_network_type        varchar(50) COMMENT '仓网类型',
    shelf_life                    bigint COMMENT '保质期',
    length                        varchar(50) COMMENT '长度',
    width                         bigint COMMENT '宽度',
    height                        bigint COMMENT '高度',
    weight                        bigint COMMENT '重量',
    nationwide_7day_sale_cnt      varchar(100) COMMENT '全国7日三级销量band',
    nationwide_28day_sale_cnt     varchar(100) COMMENT '全国28日三级销量band',
    rdc                           varchar(100) COMMENT 'RDC',
    distribution_center           varchar(100) COMMENT '配送中心',
    stock                         bigint COMMENT '库存件数',
    in_stock                      bigint COMMENT '现货库存',
    internal_in_transit_stock     bigint COMMENT '内配在途库存',
    internal_in                   bigint COMMENT '内配入',
    internal_out                  bigint COMMENT '内配出',
    locked_stock                  bigint COMMENT '已锁定',
    available_stock               bigint COMMENT '可用库存',
    pending_purchase_stock        bigint COMMENT '采购未到货',
    be_order_stock                bigint COMMENT '可订购库存',
    reserved_stock                bigint COMMENT '订单预定',
    vmi_stock                     bigint COMMENT 'VMI库存',
    unsellable_stock              bigint COMMENT '不可售',
    large_item_7d_cnt             bigint COMMENT '大件7天内待预占数量',
    large_item_8_14d_cnt          bigint COMMENT '大件8-14天待预占数量',
    large_item_15_21d_cnt         bigint COMMENT '大件15-21天待预占数量',
    large_item_22_28d_cnt         bigint COMMENT '大件22-28天待预占数量',
    large_item_28d_cnt            bigint COMMENT '大件28天以上待预占数量',
    last_1d_dispatch_cnt          bigint COMMENT '昨日出库商品件数',
    last_7d_dispatch_cnt          bigint COMMENT '近7日出库商品件数',
    last_14d_dispatch_cnt         bigint COMMENT '近14日出库商品件数',
    last_28d_dispatch_cnt         bigint COMMENT '近28日出库商品件数',
    last_30d_dispatch_cnt         bigint COMMENT '近30日出库商品件数',
    last_60d_dispatch_cnt         bigint COMMENT '近60日出库商品件数',
    last_90d_dispatch_cnt         bigint COMMENT '近90日出库商品件数',
    mtd_dispatch_cnt              bigint COMMENT '月至今出库商品件数',
    last_1d_receipt_cnt           bigint COMMENT '昨日收货地商品件数',
    last_7d_receipt_cnt           bigint COMMENT '近7日收货地商品件数',
    last_14d_receipt_cnt          bigint COMMENT '近14日收货地商品件数',
    last_28d_receipt_cnt          bigint COMMENT '近28日收货地商品件数',
    last_30d_receipt_cnt          bigint COMMENT '近30日收货地商品件数',
    last_60d_receipt_cnt          bigint COMMENT '近60日收货地商品件数',
    last_90d_receipt_cnt          bigint COMMENT '近90日收货地商品件数',
    mtd_receipt_cnt               bigint COMMENT '月至今收货地商品件数',
    last_1d_factory_dispatch_cnt  bigint COMMENT '昨日厂直出库商品件数',
    last_7d_factory_dispatch_cnt  bigint COMMENT '近7日厂直出库商品件数',
    last_14d_factory_dispatch_cnt bigint COMMENT '近14日厂直出库商品件数',
    last_28d_factory_dispatch_cnt bigint COMMENT '近28日厂直出库商品件数',
    last_30d_factory_dispatch_cnt bigint COMMENT '近30日厂直出库商品件数',
    last_60d_factory_dispatch_cnt bigint COMMENT '近60日厂直出库商品件数',
    last_90d_factory_dispatch_cnt bigint COMMENT '近90日厂直出库商品件数',
    mtd_factory_dispatch_cnt      bigint COMMENT '月至今厂直出库商品件数',
    last_1d_vmi_dispatch_cnt      bigint COMMENT '昨日VMI出库商品件数',
    last_7d_vmi_dispatch_cnt      bigint COMMENT '近7日VMI出库商品件数',
    last_14d_vmi_dispatch_cnt     bigint COMMENT '近14日VMI出库商品件数',
    last_28d_vmi_dispatch_cnt     bigint COMMENT '近28日VMI出库商品件数',
    last_30d_vmi_dispatch_cnt     bigint COMMENT '近30日VMI出库商品件数',
    last_60d_vmi_dispatch_cnt     bigint COMMENT '近60日VMI出库商品件数',
    last_90d_vmi_dispatch_cnt     bigint COMMENT '近90日VMI出库商品件数',
    mtd_vmi_dispatch_cnt          bigint COMMENT '月至今VMI出库商品件数',
    available_days_7d             bigint COMMENT '7日有货天数',
    available_days_14d            bigint COMMENT '14日有货天数',
    available_days_28d            bigint COMMENT '28日有货天数',
    available_days_30d            bigint COMMENT '30日有货天数',
    expected_sellable_days        double COMMENT '预计可售天数',
    out_of_stock_pv               bigint COMMENT '无货pv',
    mtd_out_of_stock_pv           bigint COMMENT '月至今无货pv',
    in_stock_pv_rate              double COMMENT 'PV现货率',
    mtd_in_stock_pv_rate          double COMMENT '月至今pv现货率',
    pending_purchase_arrived      bigint COMMENT '采购未到货-已回告',
    pending_purchase_scheduled    bigint COMMENT '采购未到货-已预约',
    last_1d_purchase_in_cnt       bigint COMMENT '昨日采购入库件数',
    last_7d_purchase_in_cnt       bigint COMMENT '近7日采购入库件数',
    last_14d_purchase_in_cnt      bigint COMMENT '近14日采购入库件数',
    last_28d_purchase_in_cnt      bigint COMMENT '近28日采购入库件数',
    last_30d_purchase_in_cnt      bigint COMMENT '近30日采购入库件数',
    mtd_purchase_in_cnt           bigint COMMENT '月至今采购入库件数',
    last_1d_purchase_order_cnt    bigint COMMENT '昨日采购下单件数',
    last_7d_purchase_order_cnt    bigint COMMENT '近7日采购下单件数',
    last_14d_purchase_order_cnt   bigint COMMENT '近14日采购下单件数',
    last_28d_purchase_order_cnt   bigint COMMENT '近28日采购下单件数',
    last_30d_purchase_order_cnt   bigint COMMENT '近30日采购下单件数',
    mtd_purchase_order_cnt        bigint COMMENT '月至今采购下单件数',
    last_1d_return_supplier_cnt   bigint COMMENT '昨日退供应商件数',
    last_7d_return_supplier_cnt   bigint COMMENT '近7日退供应商件数',
    last_14d_return_supplier_cnt  bigint COMMENT '近14日退供应商件数',
    last_28d_return_supplier_cnt  bigint COMMENT '近28日退供应商件数',
    last_30d_return_supplier_cnt  bigint COMMENT '近30日退供应商件数',
    mtd_return_to_supplier_cnt    bigint COMMENT '月至今退供应商件数',
    created_by                    varchar(100) NOT NULL COMMENT '插入人',
    created_at                    timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                    varchar(100) COMMENT '更新人',
    updated_at                    timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                            date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='京东-自营-商品库存表';

CREATE TABLE ods.rpa_jd_autarky_consumer_overview
(
    id                             bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id                        varchar(100) COMMENT '店铺id',
    biz_day                        date COMMENT '日期',
    category                       varchar(100) COMMENT '类目',
    trans_new_customer_num         bigint COMMENT '新客成交人数',
    trans_old_customer_num         bigint COMMENT '老客成交人数',
    trans_new_customer_amount      decimal(10, 2) COMMENT '新客成交金额',
    trans_old_customer_amount      decimal(10, 2) COMMENT '老客成交金额',
    trans_new_customer_product_cnt bigint COMMENT '新客成交商品件数',
    trans_old_customer_product_cnt bigint COMMENT '老客成交商品件数',
    created_by                     varchar(100) NOT NULL COMMENT '插入人',
    created_at                     timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                     varchar(100) COMMENT '更新人',
    updated_at                     timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                             date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='京东-自营-消费者总览';

CREATE TABLE ods.rpa_jd_autarky_return_order
(
    id                      bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id                 varchar(100) COMMENT '店铺id',
    shop_name               varchar(100) COMMENT '店铺',
    product_code            varchar(100) COMMENT '商品编号',
    order_code              varchar(100) COMMENT '订单编号',
    order_date              date COMMENT '下单日期',
    completion_date         date COMMENT '完成日期',
    product_cnt             bigint COMMENT '商品数量',
    product_amount          decimal(10, 2) COMMENT '商品金额',
    commission_amount       decimal(10, 2) COMMENT '计佣金额',
    commission              decimal(10, 2) COMMENT '佣金',
    leader_service_fee      decimal(10, 2) COMMENT '团长服务费',
    jd_platform_service_fee decimal(10, 2) COMMENT '京东平台技术服务费',
    total_commission_amount decimal(10, 2) COMMENT '总佣金',
    return_cnt              bigint COMMENT '退货数量',
    refund_amount           decimal(10, 2) COMMENT '返款金额',
    refund_date             date COMMENT '返款日期',
    refund_reason           varchar(100) COMMENT '返款原因',
    plan_or_event           varchar(100) COMMENT '所属计划/活动',
    created_by              varchar(100) NOT NULL COMMENT '插入人',
    created_at              timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by              varchar(100) COMMENT '更新人',
    updated_at              timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                      date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='京东-自营-返款订单明细';

CREATE TABLE ods.rpa_jd_jtk_product_order
(
    id                      bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id                 varchar(100) COMMENT '店铺id',
    shop_name               varchar(100) COMMENT '店铺',
    product_code            varchar(100) COMMENT '商品编号',
    order_code              varchar(100) COMMENT '订单编号',
    order_date              date COMMENT '下单日期',
    order_status            varchar(100) COMMENT '订单状态',
    promoter_pin            varchar(100) COMMENT '推客PIN',
    commission_amount       decimal(10, 2) COMMENT '计佣金额',
    commission              decimal(10, 2) COMMENT '佣金',
    total_commission        decimal(10, 2) COMMENT '总佣金',
    completion_date         varchar(100) COMMENT '完成日期',
    is_valid                varchar(100) COMMENT '是否有效',
    product_quantity        bigint COMMENT '商品数量',
    roi                     decimal(10, 2) COMMENT 'ROI',
    plan_or_event           varchar(100) COMMENT '所属计划/活动',
    jd_platform_service_fee decimal(10, 2) COMMENT '京东平台技术服务费',
    created_by              varchar(100) NOT NULL COMMENT '插入人',
    created_at              timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by              varchar(100) COMMENT '更新人',
    updated_at              timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                      date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='京东-京挑客-下单订单明细';

CREATE TABLE ods.rpa_jd_autarky_jzt_promotion
(
    id                 bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id            varchar(100) COMMENT '店铺id',
    shop_name          varchar(100) COMMENT '店铺',
    biz_day            date COMMENT '日期',
    product_line       varchar(100) COMMENT '产品线',
    tracking_sku_id    varchar(100) COMMENT '跟单SKU ID',
    total_amount       decimal(10, 2) COMMENT '总费用',
    total_order_amount decimal(10, 2) COMMENT '总订单金额',
    created_by         varchar(100) NOT NULL COMMENT '插入人',
    created_at         timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by         varchar(100) COMMENT '更新人',
    updated_at         timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                 date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='京东-自营-京准通-推广费';

CREATE TABLE ods.rpa_jd_autarky_product_key_idx
(
    id                 bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    biz_day            date COMMENT '日期',
    sku_id             varchar(255) COMMENT 'SKU ID',
    product_name       varchar(255) COMMENT '商品名称',
    visit_idx          double COMMENT '访客指数',
    trans_quantity_idx double COMMENT '成交件数指数',
    trans_amount_idx   double COMMENT '成交金额指数',
    add_cart_num       bigint COMMENT '加购人数',
    follow_num         bigint COMMENT '关注人数',
    trans_avg_price    decimal(10, 2) COMMENT '成交客单价',
    created_by         varchar(100) NOT NULL COMMENT '插入人',
    created_at         timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by         varchar(100) COMMENT '更新人',
    updated_at         timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                 date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='京东-自营-商品对比-关键指标';

CREATE TABLE ods.rpa_jd_autarky_flow
(
    id                            bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    biz_day                       date COMMENT '日期',
    secondary_source              varchar(100) COMMENT '二级来源',
    third_source                  varchar(100) COMMENT '三级来源',
    product_visit_idx             varchar(100) COMMENT '本品访客指数',
    product_visit_rate            varchar(100) COMMENT '本品访客数占比',
    product_customer_idx          varchar(100) COMMENT '本品成交客户指数',
    product_trans_amount_idx      varchar(100) COMMENT '本品成交金额指数',
    product_trans_amount_rate     varchar(100) COMMENT '本品成交金额占比',
    competitor1_visit_idx         varchar(100) COMMENT '竞品1访客指数',
    competitor1_visit_rate        varchar(100) COMMENT '竞品1访客数占比',
    competitor1_customer_idx      varchar(100) COMMENT '竞品1成交客户指数',
    competitor1_trans_amount_idx  varchar(100) COMMENT '竞品1成交金额指数',
    competitor1_trans_amount_rate varchar(100) COMMENT '竞品1成交金额占比',
    competitor2_visit_idx         varchar(100) COMMENT '竞品2访客指数',
    competitor2_visit_rate        varchar(100) COMMENT '竞品2访客数占比',
    competitor2_customer_idx      varchar(100) COMMENT '竞品2成交客户指数',
    competitor2_trans_amount_idx  varchar(100) COMMENT '竞品2成交金额指数',
    competitor2_trans_amount_rate varchar(100) COMMENT '竞品2成交金额占比',
    own_sku                       varchar(100) COMMENT '本店 SKU',
    competitor_sku                varchar(100) COMMENT '竞品 SKU',
    created_by                    varchar(100) NOT NULL COMMENT '插入人',
    created_at                    timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                    varchar(100) COMMENT '更新人',
    updated_at                    timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                            date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='京东-自营-商品对比-流量来源';

CREATE TABLE ods.rpa_jd_pop_core_idx
(
    id               bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    biz_day          date COMMENT '日期',
    shop_id          varchar(100) COMMENT '店铺id',
    shop_name        varchar(100) COMMENT '店铺名称',
    product_name     varchar(100) COMMENT '商品名称',
    trans_cnt        bigint COMMENT '成交单量',
    visit_idx        bigint COMMENT '访客指数',
    trans_amount_idx bigint COMMENT '成交金额指数',
    search_visit_idx bigint COMMENT '搜索访客指数',
    follow_cnt       bigint COMMENT '关注人数',
    add_cart_idx     bigint COMMENT '加购指数',
    own_sku          bigint COMMENT '本店 SKU',
    competitor_sku   bigint COMMENT '竞品 SKU',
    created_by       varchar(100) NOT NULL COMMENT '插入人',
    created_at       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by       varchar(100) COMMENT '更新人',
    updated_at       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt               date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='京东-POP-竞品对比-核心指标';

CREATE TABLE ods.rpa_jd_pop_entry_source
(
    id                           bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    biz_day                      date COMMENT '日期',
    first_source                 varchar(100) COMMENT '一级来源',
    secondary_source             varchar(100) COMMENT '二级来源',
    tertiary_source              varchar(100) COMMENT '三级来源',
    product_visit_cnt            double COMMENT '本店商品访客数',
    product_visit_rate           varchar(100) COMMENT '本店商品访客数占比',
    product_trans_amount_idx     varchar(100) COMMENT '本店商品成交金额指数',
    competitor1_visit_cnt        varchar(100) COMMENT '竞品1访客数',
    competitor1_visit_rate       varchar(100) COMMENT '竞品1访客数占比',
    competitor1_trans_amount_idx varchar(100) COMMENT '竞品1成交金额指数',
    competitor2_visit_cnt        varchar(100) COMMENT '竞品2访客数',
    competitor2_visit_rate       varchar(100) COMMENT '竞品2访客数占比',
    competitor2_trans_amount_idx varchar(100) COMMENT '竞品2成交金额指数',
    own_sku                      bigint COMMENT '本店 SKU',
    competitor_sku               bigint COMMENT '竞品 SKU',
    created_by                   varchar(100) NOT NULL COMMENT '插入人',
    created_at                   timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                   varchar(100) COMMENT '更新人',
    updated_at                   timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                           date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='京东-POP-竞品对比-入店来源';

CREATE TABLE ods.rpa_jd_pop_outbound
(
    id                                    bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    biz_day                               date COMMENT '日期',
    warehouse_name                        varchar(100) COMMENT '仓库',
    sku                                   varchar(100) COMMENT 'SKU',
    merchant_item_id                      varchar(100) COMMENT '商家商品标识',
    product_name                          varchar(100) COMMENT '商品名称',
    initial_inventory                     bigint COMMENT '期初库存',
    final_inventory                       bigint COMMENT '期末库存',
    initial_transfer_in_transit_inventory bigint COMMENT '期初调拨在途库存',
    final_transfer_in_transit_inventory   bigint COMMENT '期末调拨在途库存',
    total_inbound                         bigint COMMENT '总入库',
    total_outbound                        bigint COMMENT '总出库',
    vmi_adjustment                        bigint COMMENT 'VMI调整',
    other_adjustment                      bigint COMMENT '其他调整',
    purchase_inbound                      bigint COMMENT '采购入库',
    return_inbound                        bigint COMMENT '退货入库',
    transfer_inbound                      bigint COMMENT '调拨入库',
    inventory_gain                        bigint COMMENT '盘盈',
    warehouse_move_in                     bigint COMMENT '搬仓入库',
    spare_parts_to_main_inventory         bigint COMMENT '备件库入大库',
    finished_goods_inbound                bigint COMMENT '加工单成品入库',
    raw_material_rollback_inbound         bigint COMMENT '加工单原料回滚入库',
    owner_adjustment_inbound              bigint COMMENT '货主调整单入库',
    unboxing_inbound                      bigint COMMENT '拆箱单入库',
    sales_outbound                        bigint COMMENT '销售出库',
    return_supplier_outbound              bigint COMMENT '退供出库',
    transfer_outbound                     bigint COMMENT '调拨出库',
    inventory_loss                        bigint COMMENT '盘亏',
    warehouse_move_out                    bigint COMMENT '搬仓出库',
    spare_parts_from_main_inventory       bigint COMMENT '大库出备件库',
    raw_material_deduction_outbound       bigint COMMENT '加工单原料扣减出库',
    consumables_outbound                  bigint COMMENT '耗材出库',
    owner_adjustment_outbound             bigint COMMENT '货主调整单出库',
    unboxing_outbound                     bigint COMMENT '拆箱单出库',
    created_by                            varchar(100) NOT NULL COMMENT '插入人',
    created_at                            timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                            varchar(100) COMMENT '更新人',
    updated_at                            timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                                    date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='京东-POP-出库明细表';

CREATE TABLE ods.rpa_jd_pop_stock
(
    id                    bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    biz_day               date COMMENT '日期',
    sequence_number       bigint COMMENT '序号',
    warehouse_name        varchar(100) COMMENT '仓库名称',
    warehouse_code        bigint COMMENT '仓库编码',
    division_product_code varchar(100) COMMENT '事业部商品编码',
    division_product_name varchar(100) COMMENT '事业部商品名称',
    merchant_product_code varchar(100) COMMENT '商家商品编码',
    merchant_product_id   varchar(255) COMMENT '商家商品标识',
    stock_status          varchar(100) COMMENT '库存状态',
    product_grade_code    bigint COMMENT '商品等级编码',
    stock_type            varchar(100) COMMENT '库存类型',
    total_stock           bigint COMMENT '总库存',
    available_stock       bigint COMMENT '可用库存',
    division_code         varchar(100) COMMENT '事业部编码',
    division_name         varchar(100) COMMENT '事业部名称',
    unit_of_measurement   varchar(50) COMMENT '计量单位',
    style_number          varchar(50) COMMENT '款号',
    color                 varchar(50) COMMENT '颜色',
    size                  varchar(50) COMMENT '尺寸',
    season                varchar(50) COMMENT '季节',
    year                  varchar(50) COMMENT '年份',
    created_by            varchar(100) NOT NULL COMMENT '插入人',
    created_at            timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by            varchar(100) COMMENT '更新人',
    updated_at            timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                    date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='京东-POP-库存表';

# *********************************** 天猫平台 ***********************************

CREATE TABLE ods.rpa_tm_inventory_performance
(
    id                                     bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    biz_day                                date COMMENT '日期',
    shop_id                                varchar(100) COMMENT '店铺id',
    product                                varchar(100) COMMENT '商品',
    product_name                           varchar(100) COMMENT '商品名称',
    product_id                             bigint COMMENT '商品 ID',
    sku_id                                 bigint COMMENT 'SKU ID',
    goods_name                             varchar(100) COMMENT '货品名称',
    goods_id                               bigint COMMENT '货品 ID',
    barcode                                varchar(100) COMMENT '条形码',
    logical_warehouse_code                 varchar(100) COMMENT '逻辑仓编码',
    warehouse_role_name                    varchar(100) COMMENT '仓角色名称',
    physical_warehouse_name                varchar(100) COMMENT '物理仓名称',
    physical_warehouse_code                varchar(100) COMMENT '物理仓编码',
    brand_name                             varchar(100) COMMENT '品牌名称',
    cate_name                              varchar(100) COMMENT '类目名称',
    goods_status                           varchar(100) COMMENT '货品状态',
    unsold_28d_cnt                         bigint COMMENT '28天不动销件数',
    purchase_in_transit_cnt                bigint COMMENT '采购在途库存件数',
    transfer_in_transit_cnt                bigint COMMENT '调拨在途库存件数',
    high_age_inventory_cnt                 bigint COMMENT '高库龄件数',
    high_age_high_turnover_inventory_cnt   double COMMENT '高库龄且高周转库存件数',
    high_age_high_turnover_inventory_ratio double COMMENT '高库龄且高周转库存件数占比',
    high_turnover_cnt                      double COMMENT '高周转件数',
    supplier_defective_due_to_delivery     bigint COMMENT '供应商到货原因导致残次',
    saleable_inventory_days                double COMMENT '库存可售天数',
    inventory_turnover_days                double COMMENT '库存周转天数',
    future_28d_sales_plan_inventory        double COMMENT '未来28天销量计划库存件数',
    expiry_warning_cnt                     bigint COMMENT '效期预警件数',
    defective_inventory_cnt                bigint COMMENT '在库残品库存件数',
    defective_inventory_ratio              double COMMENT '在库残品库存件数占比',
    non_locked_good_inventory_cnt          bigint COMMENT '在库良品非锁定库存件数',
    non_sales_locked_good_inventory_cnt    bigint COMMENT '在库良品非销售锁定库存件数',
    good_inventory_cnt                     bigint COMMENT '在库良品库存件数',
    total_inventory_cnt                    bigint COMMENT '在库总库存件数',
    turnover_impact_value                  double COMMENT '周转影响值',
    avg_28d_daily_sales_out_inventory      double COMMENT '最近28天日均销售出库库存件数',
    last_1d_sales_out_cnt                  bigint COMMENT '最近1天出库件数',
    last_7d_sales_out_cnt                  bigint COMMENT '最近7天出库件数',
    last_14d_sales_out_cnt                 bigint COMMENT '最近14天出库件数',
    last_30d_sales_out_cnt                 bigint COMMENT '最近30天出库件数',
    high_age_warning_cnt                   bigint COMMENT '高库龄预警件数',
    created_by                             varchar(100) NOT NULL COMMENT '插入人',
    created_at                             timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                             varchar(100) COMMENT '更新人',
    updated_at                             timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                                     date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='天猫-供应链-库存分析';

CREATE TABLE ods.rpa_tm_core_idx
(
    id                 bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    biz_day            date COMMENT '日期',
    shop_id            varchar(100) COMMENT '店铺id',
    analysis_dimension varchar(100) COMMENT '分析维度',
    empty_value        varchar(100) COMMENT '空值',
    own_product        varchar(100) COMMENT '本店商品',
    own_value          double COMMENT '本店数值',
    competitor_product varchar(100) COMMENT '竞品',
    competitor_value   double COMMENT '竞品数值',
    own_sku            bigint COMMENT '本店SKU',
    competitor_sku     bigint COMMENT '竞品SKU',
    created_by         varchar(100) NOT NULL COMMENT '插入人',
    created_at         timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by         varchar(100) COMMENT '更新人',
    updated_at         timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                 date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='天猫-竞品-核心指标';

CREATE TABLE ods.rpa_tm_flow
(
    id                            bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    biz_day                       date COMMENT '日期',
    shop_id                       varchar(100) COMMENT '店铺id',
    channel                       varchar(100) COMMENT '通道',
    shop_traffic_heat             double COMMENT '本店访问热度',
    shop_traffic_popularity       double COMMENT '本店访问人气',
    competitor_traffic_heat       double COMMENT '竞品访问热度',
    competitor_traffic_popularity double COMMENT '竞品访问人气',
    own_sku                       double COMMENT '本店SKU',
    competitor_sku                double COMMENT '竞品SKU',
    created_by                    varchar(100) NOT NULL COMMENT '插入人',
    created_at                    timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                    varchar(100) COMMENT '更新人',
    updated_at                    timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                            date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='天猫-竞品-流量分析';

CREATE TABLE ods.rpa_tm_actual_inventory
(
    id                               bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id                          varchar(100) COMMENT '店铺id',
    shop_name                        varchar(100) COMMENT '店铺名称',
    biz_day                          date COMMENT '日期',
    product_name                     varchar(100) COMMENT '货品名称',
    product_id                       bigint COMMENT '货品ID',
    product_code                     varchar COMMENT '货品编码',
    barcode                          varchar(100) COMMENT '条形码',
    supply_chain_owner_name          varchar(100) COMMENT '供应链货主名称',
    supply_chain_owner_id            bigint COMMENT '供应链货主ID',
    brand_name                       varchar(100) COMMENT '商品品牌名称',
    warehouse_name                   varchar(100) COMMENT '仓库名称',
    warehouse_code                   varchar(100) COMMENT '仓库CODE',
    warehouse_type                   varchar(100) COMMENT '仓类型',
    warehouse_role                   varchar(100) COMMENT '仓角色',
    supplier_name                    varchar(100) COMMENT '供应商名称',
    supplier_id                      bigint COMMENT '供应商ID',
    supplier_code                    bigint COMMENT '供应商编码',
    actual_inventory                 bigint COMMENT '实仓库存',
    available_good_stock             bigint COMMENT '良品可用',
    occupied_good_stock              bigint COMMENT '良品占用',
    available_defective_stock        bigint COMMENT '残品可用',
    occupied_defective_stock         bigint COMMENT '残品占用',
    pending_good_stock               bigint COMMENT '收货待上架良品',
    pending_defective_stock          bigint COMMENT '收货待上架残品',
    pending_transfer_good_stock      bigint COMMENT '收货待调拨良品',
    pending_transfer_defective_stock bigint COMMENT '收货待调拨残品',
    purchase_in_transit              bigint COMMENT '采购在途',
    transfer_in_transit              bigint COMMENT '调拨在途',
    sales_in_transit                 bigint COMMENT '销售在途',
    sales_return_in_transit          bigint COMMENT '销退在途',
    transfer_difference              bigint COMMENT '调拨差异',
    sales_return_difference          bigint COMMENT '销退差异',
    item_name                        varchar(100) COMMENT '商品名称',
    associated_item_id_sku           varchar(100) COMMENT '关联商品ID-SKUID',
    industry                         varchar(100) COMMENT '行业',
    first_cate                       varchar(100) COMMENT '一级类目',
    first_cate_id                    bigint COMMENT '一级类目ID',
    secondary_cate                   varchar(100) COMMENT '二级类目',
    secondary_cate_id                bigint COMMENT '二级类目ID',
    third_cate                       varchar(100) COMMENT '三级类目',
    third_cate_id                    bigint COMMENT '三级类目ID',
    four_cate                        varchar(100) COMMENT '四级类目',
    four_cate_id                     bigint COMMENT '四级类目ID',
    created_by                       varchar(100) NOT NULL COMMENT '插入人',
    created_at                       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                       varchar(100) COMMENT '更新人',
    updated_at                       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                               date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='天猫-库存-实时库存';

CREATE TABLE ods.rpa_tm_inventory_trans
(
    id                                bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id                           varchar(100) COMMENT '店铺id',
    shop_name                         varchar(100) COMMENT '店铺名称',
    biz_day                           date COMMENT '日期',
    product_id                        bigint COMMENT '商品id',
    product_name                      varchar(100) COMMENT '商品名称',
    item_id                           bigint COMMENT '货品id',
    warehouse_name                    varchar(100) COMMENT '仓库名称',
    item_code                         varchar(100) COMMENT '货品编码',
    sku_id                            bigint COMMENT 'skuId',
    warehouse_code                    varchar(100) COMMENT '仓库编码',
    brand_name                        varchar(100) COMMENT '品牌名称',
    initial_stock                     double COMMENT '当日(在架+收货暂存)期初库存',
    initial_good_stock                double COMMENT '当日期初在架良品库存',
    initial_defective_stock           double COMMENT '当日期初在架残次库存',
    initial_receiving_good_stock      double COMMENT '当日期初收货暂存良品库存',
    initial_receiving_defective_stock bigint COMMENT '当日期初收货暂存残次库存',
    final_stock                       double COMMENT '当日(在架+收货暂存)期末库存',
    final_good_stock                  double COMMENT '当日期末在架良品库存',
    final_defective_stock             double COMMENT '当日期末架残次库存',
    final_receiving_good_stock        double COMMENT '当日期末收货暂存良品库存',
    final_receiving_defective_stock   bigint COMMENT '当日期末收货暂存残次库存',
    purchase_inbound_total            bigint COMMENT '采购入库总数',
    trans_outbound_total              double COMMENT '交易出库总数',
    b2b_trans_outbound_total          bigint COMMENT 'b2b交易出库总数',
    return_inbound_good_total         double COMMENT '退货入库良品总数',
    return_inbound_defective_total    double COMMENT '退货入库残次总数',
    transfer_outbound_total           double COMMENT '调拨出库总数',
    final_transfer_in_transit_stock   double COMMENT '期末调拨在途库存',
    transfer_inbound_total            double COMMENT '调拨入库总数',
    inventory_check_outbound_total    double COMMENT '盘点出库总数',
    inventory_check_inbound_total     double COMMENT '盘点入库总数',
    warehouse_return_outbound_total   double COMMENT '退仓出库总数',
    adjustment_inbound_total          double COMMENT '调整入库总数',
    adjustment_outbound_total         double COMMENT '调整出库总数',
    replacement_inbound_total         bigint COMMENT '汰换/代转经入库总数',
    replacement_outbound_total        bigint COMMENT '汰换/代转经出库总数',
    scrapped_outbound_total           bigint COMMENT '报废出库总数',
    created_by                        varchar(100) NOT NULL COMMENT '插入人',
    created_at                        timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                        varchar(100) COMMENT '更新人',
    updated_at                        timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                                date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='天猫-库存进销存台账';

CREATE TABLE ods.rpa_tm_promotion_fee
(
    id                   bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id              varchar(100) COMMENT '店铺id',
    shop_name            varchar(100) COMMENT '店铺名称',
    accounting_time      timestamp COMMENT '记账时间',
    trans_date           date COMMENT '交易日期',
    income_expense_type  varchar(100) COMMENT '收支类型',
    trans_type           varchar(100) COMMENT '交易类型',
    operate_amount       decimal(10, 2) COMMENT '操作金额(元)',
    after_operate_amount decimal(10, 2) COMMENT '操作后余额(元)',
    platform             varchar(100) COMMENT '平台',
    update_time          timestamp COMMENT '更新日期',
    created_by           varchar(100) NOT NULL COMMENT '插入人',
    created_at           timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by           varchar(100) COMMENT '更新人',
    updated_at           timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                   date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='天猫-猫超推广费';

CREATE TABLE ods.rpa_tm_account_fee
(
    id                   bigint AUTO_INCREMENT COMMENT '编号',
    record_id            bigint COMMENT '记录编号',
    shop_id              varchar(100) COMMENT '店铺id',
    shop_name            varchar(100) COMMENT '店铺名称',
    external_business_id varchar(100) COMMENT '外部业务ID',
    fund_details         decimal(10, 2) COMMENT '资金明细',
    type                 varchar(100) COMMENT '类型',
    source               varchar(100) COMMENT '明细来源',
    trans_time           timestamp COMMENT '时间',
    created_by           varchar(100) NOT NULL COMMENT '插入人',
    created_at           timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by           varchar(100) COMMENT '更新人',
    updated_at           timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                   date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='天猫-账户明细';

CREATE TABLE ods.rpa_tm_promotion_report
(
    id                               bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id                          varchar(100) COMMENT '店铺id',
    shop_name                        varchar(100) COMMENT '店铺名称',
    biz_day                          date COMMENT '日期',
    plan_id                          bigint COMMENT '计划ID',
    plan_name                        varchar(100) COMMENT '计划名称',
    promotion_type                   varchar(100) COMMENT '推广类型',
    unit_id                          bigint COMMENT '单元ID',
    unit_name                        varchar(100) COMMENT '单元名称',
    product_id                       bigint COMMENT '商品ID',
    show_cnt                         bigint COMMENT '展现量',
    click_cnt                        bigint COMMENT '点击量',
    cost                             decimal(10, 2) COMMENT '花费',
    click_rate                       double COMMENT '点击率',
    avg_click_cost                   decimal(10, 2) COMMENT '平均点击花费',
    per_mille_cost                   decimal(10, 2) COMMENT '千次展现花费',
    total_favorite_cnt               double COMMENT '总收藏数',
    product_favorite_cnt             double COMMENT '宝贝收藏数',
    shop_favorite_cnt                double COMMENT '店铺收藏数',
    total_cart_cnt                   double COMMENT '总购物车数',
    direct_cart_cnt                  double COMMENT '直接购物车数',
    indirect_cart_cnt                double COMMENT '间接购物车数',
    cart_cost                        decimal(10, 2) COMMENT '加购成本',
    product_favorite_cost            decimal(10, 2) COMMENT '宝贝收藏成本',
    product_favorite_conversion_rate double COMMENT '宝贝收藏转化率',
    cart_rate                        double COMMENT '加购率',
    total_presale_amount             decimal(10, 2) COMMENT '总预售成交金额',
    total_presale_order_cnt          double COMMENT '总预售成交笔数',
    direct_presale_amount            decimal(10, 2) COMMENT '直接预售成交金额',
    direct_presale_order_cnt         double COMMENT '直接预售成交笔数',
    indirect_presale_amount          decimal(10, 2) COMMENT '间接预售成交金额',
    indirect_presale_order_cnt       double COMMENT '间接预售成交笔数',
    total_sales_amount               decimal(10, 2) COMMENT '总成交金额',
    direct_sales_amount              decimal(10, 2) COMMENT '直接成交金额',
    indirect_sales_amount            decimal(10, 2) COMMENT '间接成交金额',
    total_sales_order_cnt            double COMMENT '总成交笔数',
    direct_sales_order_cnt           double COMMENT '直接成交笔数',
    indirect_sales_order_cnt         double COMMENT '间接成交笔数',
    return_on_investment             double COMMENT '投入产出比',
    conversion_rate                  double COMMENT '点击转化率',
    direct_conversion_rate           double COMMENT '直接点击转化率',
    recharge_order_cnt               double COMMENT '购物金充值笔数',
    recharge_amount                  decimal(10, 2) COMMENT '购物金充值金额',
    organic_exposure                 double COMMENT '自然流量曝光',
    organic_conversion_amount        decimal(10, 2) COMMENT '自然流量转化金额',
    total_favorite_cart_cnt          double COMMENT '总收藏加购数',
    total_favorite_cart_cost         decimal(10, 2) COMMENT '总收藏加购成本',
    product_favorite_cart_cnt        double COMMENT '宝贝收藏加购数',
    product_favorite_cart_cost       decimal(10, 2) COMMENT '宝贝收藏加购成本',
    created_by                       varchar(100) NOT NULL COMMENT '插入人',
    created_at                       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                       varchar(100) COMMENT '更新人',
    updated_at                       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                               date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='天猫-直通车-单元报表-单元列表';

CREATE TABLE ods.rpa_tm_promotion_performance
(
    id                         bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id                    varchar(100) COMMENT '店铺id',
    shop_name                  varchar(100) COMMENT '店铺名称',
    product_id                 varchar(100) COMMENT '商品ID',
    supplier_code              varchar(100) COMMENT '供应商code',
    brand_name                 varchar(100) COMMENT '品牌名称',
    promotion_date             date COMMENT '推广时间',
    campaign_id                varchar(100) COMMENT '活动ID',
    leader_name                varchar(100) COMMENT '团长名称',
    click_cnt                  bigint COMMENT '点击数',
    trans_cnt                  bigint COMMENT '成交笔数',
    trans_amount               decimal(10, 2) COMMENT '成交金额',
    click_conversion_rate      double COMMENT '点击转化率',
    estimated_commission       decimal(10, 2) COMMENT '预估佣金支出',
    estimated_service_fee      decimal(10, 2) COMMENT '预估服务费支出',
    estimated_commission_rate  double COMMENT '预估佣金率',
    estimated_service_fee_rate double COMMENT '预估服务费率',
    created_by                 varchar(100) NOT NULL COMMENT '插入人',
    created_at                 timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                 varchar(100) COMMENT '更新人',
    updated_at                 timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                         date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='天猫-推广数据';

CREATE TABLE ods.rpa_tm_business_overview
(
    id                  bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id             varchar(100) COMMENT '店铺id',
    shop_name           varchar(100) COMMENT '店铺名称',
    biz_day             date COMMENT '日期',
    pay_amount          decimal(10, 2) COMMENT '支付金额',
    avg_suborder_price  decimal(10, 2) COMMENT '子订单均价',
    avg_customer_price  decimal(10, 2) COMMENT '客单价',
    ipv_uv              bigint COMMENT 'IPVUV',
    pay_suborder_cnt    bigint COMMENT '支付子订单数',
    pay_product_cnt     bigint COMMENT '支付商品件数',
    pay_conversion_rate double COMMENT '支付转化率',
    trans_user_num      bigint COMMENT '成交用户数',
    created_by          varchar(100) NOT NULL COMMENT '插入人',
    created_at          timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by          varchar(100) COMMENT '更新人',
    updated_at          timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                  date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='天猫-经营概览';

CREATE TABLE ods.rpa_tm_product
(
    id                                  bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id                             varchar(100) COMMENT '店铺id',
    shop_name                           varchar(100) COMMENT '店铺名称',
    biz_day                             date COMMENT '统计日期',
    product_image                       varchar(100) COMMENT '商品图片',
    product_name                        varchar(100) COMMENT '商品名称',
    product_id                          varchar(100) COMMENT '商品ID',
    sku_id                              bigint COMMENT 'SKUID',
    barcode                             varchar(100) COMMENT '条形码',
    goods_id                            varchar(100) COMMENT '货品ID',
    region                              varchar(100) COMMENT '区域',
    warehouse                           varchar(100) COMMENT '仓库',
    four_cate                           varchar(100) COMMENT '四级类目',
    brand                               varchar(100) COMMENT '品牌',
    product_status                      varchar(100) COMMENT '商品状态',
    stock_cnt                           bigint COMMENT '库存件数',
    stock_cnt_mom                       double COMMENT '库存件数环比',
    good_stock_cnt                      bigint COMMENT '良品库存件数',
    good_stock_cnt_mom                  double COMMENT '良品库存件数环比',
    good_saleable_stock_cnt             bigint COMMENT '良品可售库存件数',
    good_saleable_stock_cnt_mom         double COMMENT '良品可售库存件数环比',
    defective_locked_stock_cnt          bigint COMMENT '残品锁定库存件数',
    defective_locked_stock_cnt_mom      double COMMENT '残品锁定库存件数环比',
    exp_warn_good_stock_cnt             bigint COMMENT '效期预警良品库存件数',
    exp_warn_good_stock_cnt_mom         double COMMENT '效期预警良品库存件数环比',
    exp_warn_good_stock_ratio           double COMMENT '效期预警良品库存件数占比',
    exp_warn_good_stock_ratio_mom       double COMMENT '效期预警良品库存件数占比环比',
    exp_defective_stock_ratio           double COMMENT '效期残品库存件数占比',
    exp_defective_stock_ratio_mom       double COMMENT '效期残品库存件数占比环比',
    defective_stock_cnt                 bigint COMMENT '残品库存件数',
    defective_stock_cnt_mom             double COMMENT '残品库存件数环比',
    exp_defective_stock_cnt             bigint COMMENT '效期残品库存件数',
    exp_defective_stock_cnt_mom         double COMMENT '效期残品库存件数环比',
    exp_managed_stock_cnt               bigint COMMENT '效期管理库存件数',
    exp_managed_stock_cnt_mom           double COMMENT '效期管理库存件数环比',
    avg_daily_sales_28d                 bigint COMMENT '28天日均销售件数',
    avg_daily_sales_28d_mom             double COMMENT '28天日均销售件数环比',
    turnover_days                       double COMMENT '周转天数',
    turnover_days_mom                   double COMMENT '周转天数环比',
    pay_amount                          decimal(10, 2) COMMENT '支付金额',
    pay_amount_mom                      double COMMENT '支付金额环比',
    pay_product_cnt                     bigint COMMENT '支付商品件数',
    pay_product_cnt_mom                 double COMMENT '支付商品件数环比',
    pay_suborder_cnt                    bigint COMMENT '支付子订单数',
    pay_suborder_cnt_mom                double COMMENT '支付子订单数环比',
    pay_user_num                        bigint COMMENT '支付用户数',
    pay_user_num_mom                    double COMMENT '支付用户数环比',
    pay_amount_exclude_refund_cnt       decimal(10, 2) COMMENT '支付金额(剔退款)',
    pay_amount_exclude_refund_cnt_mom   double COMMENT '支付金额(剔退款)环比',
    pay_suborder_exclude_refund_cnt     bigint COMMENT '支付子订单数(剔退款)',
    pay_suborder_exclude_refund_cnt_mom double COMMENT '支付子订单数(剔退款)环比',
    refund_amount                       decimal(10, 2) COMMENT '发起退款金额',
    refund_amount_mom                   double COMMENT '发起退款金额环比',
    refund_suborder_cnt                 bigint COMMENT '发起退款子订单数',
    refund_suborder_cnt_mom             double COMMENT '发起退款子订单数环比',
    refund_product_cnt                  bigint COMMENT '发起退款商品件数',
    refund_product_cnt_mom              double COMMENT '发起退款商品件数环比',
    refund_success_amount               decimal(10, 2) COMMENT '退款成功金额',
    refund_success_amount_mom           double COMMENT '退款成功金额环比',
    refund_success_product_cnt          bigint COMMENT '退款成功商品件数',
    refund_success_product_cnt_mom      double COMMENT '退款成功商品件数环比',
    refund_success_suborder_cnt         bigint COMMENT '退款成功子订单数',
    refund_success_suborder_cnt_mom     double COMMENT '退款成功子订单数环比',
    created_by                          varchar(100) NOT NULL COMMENT '插入人',
    created_at                          timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                          varchar(100) COMMENT '更新人',
    updated_at                          timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                                  date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='天猫-商品信息';

CREATE TABLE ods.rpa_tm_living_sale
(
    id                         bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id                    varchar(100) COMMENT '店铺id',
    shop_name                  varchar(100) COMMENT '店铺名称',
    biz_day                    date COMMENT '统计日期',
    product_id                 varchar(100) COMMENT '商品ID',
    product_name               varchar(100) COMMENT '商品名称',
    expert_id                  varchar(100) COMMENT '达人ID',
    expert_name                varchar(100) COMMENT '达人名称',
    broadcast_date             date COMMENT '开播日期',
    guided_pay_suborder_cnt    bigint COMMENT '引导支付子订单数',
    guided_pay_product_cnt     bigint COMMENT '引导支付商品件数',
    guided_pay_amount          decimal(10, 2) COMMENT '引导支付金额',
    pay_user_cnt               bigint COMMENT '支付用户数',
    guided_ipv_uv              bigint COMMENT '引导IPVUV',
    refund_suborder_cnt        bigint COMMENT '退款子订单数',
    guided_pay_conversion_rate double COMMENT '引导支付转化率',
    avg_order_price            decimal(10, 2) COMMENT '笔单价',
    avg_customer_price         decimal(10, 2) COMMENT '客单价',
    refund_rate                double COMMENT '退款率',
    created_by                 varchar(100) NOT NULL COMMENT '插入人',
    created_at                 timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                 varchar(100) COMMENT '更新人',
    updated_at                 timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                         date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='天猫-销售直播';

# *********************************** 淘宝平台 ***********************************

CREATE TABLE ods.rpa_tb_trans_log
(
    id              bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id         varchar(100) COMMENT '店铺id',
    operate_time    TIMESTAMP COMMENT '操作时间',
    trans_amount    decimal(10, 2) COMMENT '交易金额(元)',
    account_type    VARCHAR(100) COMMENT '账户类型',
    fund_type       VARCHAR(100) COMMENT '资金类型',
    trans_type      VARCHAR(100) COMMENT '流水类型',
    account_balance decimal(10, 2) COMMENT '帐户余额(元)',
    operate_remark  VARCHAR(100) COMMENT '操作备注',
    contract_name   VARCHAR(100) COMMENT '合同名称',
    created_by      varchar(100) NOT NULL COMMENT '插入人',
    created_at      timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by      varchar(100) COMMENT '更新人',
    updated_at      timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt              date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='淘宝-交易流水表';

CREATE TABLE ods.rpa_tb_cold_product
(
    id                     bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    biz_day                date COMMENT '日期',
    shop_id                varchar(100) COMMENT '店铺id',
    product_name           VARCHAR(100) COMMENT '商品名称',
    product_id             VARCHAR(100) COMMENT '商品ID',
    status                 VARCHAR(100) COMMENT '状态',
    temperature_chain_flag VARCHAR(50) COMMENT '常温冷链标识',
    created_by             varchar(100) NOT NULL COMMENT '插入人',
    created_at             timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by             varchar(100) COMMENT '更新人',
    updated_at             timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                     date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='淘宝-冷链产品';

CREATE TABLE ods.rpa_tb_unpaid_order
(
    id                    bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id               varchar(100) COMMENT '店铺id',
    main_order_id         VARCHAR(100) COMMENT '淘宝主订单号',
    sub_order_id          VARCHAR(100) COMMENT '淘宝子订单号',
    product_name          VARCHAR(100) COMMENT '商品名称',
    product_id            VARCHAR(100) COMMENT '商品ID',
    expert_nickname       VARCHAR(100) COMMENT '达人昵称',
    service_provider_name VARCHAR(100) COMMENT '服务商名称',
    create_time           TIMESTAMP COMMENT '订单创建时间',
    pay_time              TIMESTAMP COMMENT '订单支付时间',
    complete_time         VARCHAR(100) COMMENT '订单完结时间',
    status                VARCHAR(100) COMMENT '订单状态',
    actual_pay_amount     decimal(10, 2) COMMENT '订单实付金额',
    refund_amount         decimal(10, 2) COMMENT '订单退款金额',
    commission_amount     decimal(10, 2) COMMENT '订单计佣金额',
    estimated_commission  decimal(10, 2) COMMENT '预估佣金',
    remark                VARCHAR(100) COMMENT '备注',
    record_time           TIMESTAMP COMMENT '时间',
    created_by            varchar(100) NOT NULL COMMENT '插入人',
    created_at            timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by            varchar(100) COMMENT '更新人',
    updated_at            timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                    date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='淘宝-未出账订单';

CREATE TABLE ods.rpa_tb_core_idx
(
    id                  bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    biz_day             date COMMENT '日期',
    shop_id             varchar(100) COMMENT '店铺id',
    product_name        VARCHAR(100) COMMENT '商品名称',
    product_id          VARCHAR(100) COMMENT '商品ID',
    cate                VARCHAR(100) COMMENT '类别',
    trans_amount        decimal(10, 2) COMMENT '交易金额',
    visit_num           BIGINT COMMENT '访客数',
    search_num          BIGINT COMMENT '搜索人数',
    collect_num         BIGINT COMMENT '收藏人数',
    cart_num            BIGINT COMMENT '加购人数',
    pay_conversion_rate VARCHAR(100) COMMENT '支付转化率',
    pay_user_num        BIGINT COMMENT '支付买家数',
    pay_item_cnt        BIGINT COMMENT '支付件数',
    search_ratio        VARCHAR(100) COMMENT '搜索占比',
    collect_rate        VARCHAR(100) COMMENT '收藏率',
    cart_rate           VARCHAR(100) COMMENT '加购率',
    avg_customer_price  decimal(10, 2) COMMENT '客单价',
    uv_value            DOUBLE COMMENT 'UV价值',
    created_by          varchar(100) NOT NULL COMMENT '插入人',
    created_at          timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by          varchar(100) COMMENT '更新人',
    updated_at          timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                  date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='淘宝-生意参谋-关键指标';

CREATE TABLE ods.rpa_tb_entry_source
(
    id                    bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    biz_day               date COMMENT '日期',
    shop_id               varchar(100) COMMENT '店铺id',
    product_name          VARCHAR(100) COMMENT '商品名称',
    product_id            VARCHAR(100) COMMENT '商品ID',
    cate                  VARCHAR(100) COMMENT '类别',
    traffic_source        VARCHAR(100) COMMENT '流量来源',
    first_source          VARCHAR(100) COMMENT '一级来源',
    secondary_source      VARCHAR(100) COMMENT '二级来源',
    visit_num             BIGINT COMMENT '访客数',
    order_user_num        BIGINT COMMENT '下单买家数',
    order_conversion_rate VARCHAR(100) COMMENT '下单转化率',
    pay_user_num          BIGINT COMMENT '支付买家数',
    pay_conversion_rate   VARCHAR(100) COMMENT '支付转化率',
    trans_amount          decimal(10, 2) COMMENT '交易金额',
    uv_value              DOUBLE COMMENT 'UV价值',
    avg_customer_price    decimal(10, 2) COMMENT '客单价',
    created_by            varchar(100) NOT NULL COMMENT '插入人',
    created_at            timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by            varchar(100) COMMENT '更新人',
    updated_at            timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                    date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='淘宝-入店来源';

CREATE TABLE ods.rpa_tb_cate_shop_gold
(
    id                    bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    biz_day               date COMMENT '日期',
    shop_id               varchar(100) COMMENT '店铺id',
    cate_name             VARCHAR(100) COMMENT '类目',
    pay_amount            decimal(10, 2) COMMENT '支付金额',
    pay_amount_percentage VARCHAR(100) COMMENT '支付金额占比',
    success_refund_amount decimal(10, 2) COMMENT '成功退款金额',
    pay_conversion_rate   VARCHAR(100) COMMENT '支付转化率',
    product_visit_num     BIGINT COMMENT '商品访客数',
    action                VARCHAR(100) COMMENT '操作',
    created_by            varchar(100) NOT NULL COMMENT '插入人',
    created_at            timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by            varchar(100) COMMENT '更新人',
    updated_at            timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                    date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='淘宝-品类购物金';

CREATE TABLE ods.rpa_tb_tm_operate_window
(
    id                                     bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    biz_day                                date COMMENT '日期',
    shop_id                                varchar(100) COMMENT '店铺id',
    sale_amount                            decimal(10, 2) COMMENT '销售金额',
    avg_customer_price                     decimal(10, 2) COMMENT '客单价',
    uv                                     BIGINT COMMENT 'UV',
    pay_conversion_rate                    VARCHAR(100) COMMENT '支付转化率',
    promotion_cost                         decimal(10, 2) COMMENT '推广费用',
    sale_cnt                               BIGINT COMMENT '销售件数',
    order_cnt                              BIGINT COMMENT '订单数',
    pending_order_cnt                      BIGINT COMMENT '待发货订单数',
    active_product_cnt                     BIGINT COMMENT '出售中的宝贝数',
    refund_rate                            VARCHAR(100) COMMENT '退款率',
    customer_inquiry_cnt                   BIGINT COMMENT '客服询单数',
    customer_service_amount                decimal(10, 2) COMMENT '客服销售额',
    ai_customer_service_conversion_rate    VARCHAR(100) COMMENT 'AI客服支付转化率',
    human_customer_service_conversion_rate VARCHAR(100) COMMENT '人工客服支付转化率',
    refund_amount                          decimal(10, 2) COMMENT '退款金额',
    affiliate_commission                   VARCHAR(100) COMMENT '淘宝客佣金',
    keyword_promotion_cost                 VARCHAR(100) COMMENT '关键词推广花费',
    precise_audience_promotion_cost        VARCHAR(100) COMMENT '精准人群推广花费',
    smart_scenario_promotion_cost          VARCHAR(100) COMMENT '智能场景花费',
    created_by                             varchar(100) NOT NULL COMMENT '插入人',
    created_at                             timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                             varchar(100) COMMENT '更新人',
    updated_at                             timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                                     date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='淘宝-天猫运营视窗(废弃)';

CREATE TABLE ods.rpa_tb_operate_window
(
    id                              bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    biz_day                         date COMMENT '日期',
    shop_id                         varchar(100) COMMENT '店铺id',
    pay_amount                      DOUBLE COMMENT '支付金额',
    visit_cnt                       BIGINT COMMENT '访客数',
    pay_conversion_rate             VARCHAR(100) COMMENT '支付转化率',
    avg_customer_price              decimal(10, 2) COMMENT '客单价',
    suc_refund_amount               decimal(10, 2) COMMENT '成功退款金额',
    direct_traffic_cost             decimal(10, 2) COMMENT '直通车花费',
    gravity_cube_cost               decimal(10, 2) COMMENT '引力魔方花费',
    wxt_cost                        decimal(10, 2) COMMENT '万相台花费',
    affiliate_commission            decimal(10, 2) COMMENT '淘宝客佣金',
    pay_customer_num                BIGINT COMMENT '支付买家数',
    old_customer_repurchase_rate    VARCHAR(100) COMMENT '老客复购率',
    pay_old_customer_num            BIGINT COMMENT '支付老买家数',
    old_customer_pay_amount         decimal(10, 2) COMMENT '老买家支付金额',
    pay_suborder_cnt                BIGINT COMMENT '支付子订单数',
    pay_item_cnt                    BIGINT COMMENT '支付件数',
    cart_user_num                   BIGINT COMMENT '加购人数',
    cart_item_cnt                   BIGINT COMMENT '加购件数',
    product_collect_num             BIGINT COMMENT '商品收藏人数',
    page_view                       BIGINT COMMENT '浏览量',
    keyword_promotion_cost          VARCHAR(100) COMMENT '关键词推广花费',
    precise_audience_promotion_cost VARCHAR(100) COMMENT '精准人群推广花费',
    smart_scenario_promotion_cost   VARCHAR(100) COMMENT '智能场景花费',
    created_by                      varchar(100) NOT NULL COMMENT '插入人',
    created_at                      timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                      varchar(100) COMMENT '更新人',
    updated_at                      timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                              date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='淘宝-运营视窗表';

CREATE TABLE ods.rpa_tb_account_fee
(
    id                  bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id             varchar(100) COMMENT '店铺id',
    record_time         TIMESTAMP COMMENT '记账时间',
    trans_date          DATE COMMENT '交易日期',
    income_expense_type VARCHAR(100) COMMENT '收支类型',
    trans_type          VARCHAR(100) COMMENT '交易类型',
    trans_amount        decimal(10, 2) COMMENT '操作金额(元)',
    after_amount        decimal(10, 2) COMMENT '操作后余额(元)',
    remark              VARCHAR(100) COMMENT '备注',
    created_by          varchar(100) NOT NULL COMMENT '插入人',
    created_at          timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by          varchar(100) COMMENT '更新人',
    updated_at          timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                  date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='淘宝-账户明细';

CREATE TABLE ods.rpa_tb_cps_order
(
    id                          bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id                     varchar(100) COMMENT '店铺id',
    confirmation_time           TIMESTAMP COMMENT '确认收货时间',
    account_expense_time        TIMESTAMP COMMENT '账户支出时间',
    affiliate_settlement_time   TIMESTAMP COMMENT '淘客结算时间',
    create_time                 TIMESTAMP COMMENT '创建时间',
    plan_name                   VARCHAR(100) COMMENT '计划名称',
    product_id                  BIGINT COMMENT '商品ID',
    product_name                VARCHAR(100) COMMENT '商品名称',
    actual_trans_price          decimal(10, 2) COMMENT '实际成交价格',
    trans_product_quantity      BIGINT COMMENT '成交商品数',
    commission_rate             VARCHAR(100) COMMENT '佣金比例',
    commission                  decimal(10, 2) COMMENT '佣金',
    service_fee_rate            VARCHAR(100) COMMENT '服务费率',
    service_fee_amount          decimal(10, 2) COMMENT '服务费金额',
    parent_order_id             BIGINT COMMENT '淘宝父订单编号',
    sub_order_id                BIGINT COMMENT '淘宝子订单编号',
    source_or_nickname          VARCHAR(100) COMMENT '来源或淘客昵称',
    leader_name                 VARCHAR(100) COMMENT '团长名称',
    is_presale_unpaid_pay_order VARCHAR(50) COMMENT '是否预售未付尾款订单',
    remark                      VARCHAR(100) COMMENT '备注',
    created_by                  varchar(100) NOT NULL COMMENT '插入人',
    created_at                  timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                  varchar(100) COMMENT '更新人',
    updated_at                  timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                          date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='淘宝-cps订单明细';

CREATE TABLE ods.rpa_tb_cps_account_fee
(
    id             bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    biz_day        date COMMENT '日期',
    shop_id        varchar(100) COMMENT '店铺id',
    expense_type   VARCHAR(100)   NOT NULL COMMENT '类型',
    expense_amount decimal(10, 2) NOT NULL COMMENT '支出金额',
    created_by     varchar(100)   NOT NULL COMMENT '插入人',
    created_at     timestamp      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by     varchar(100) COMMENT '更新人',
    updated_at     timestamp      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt             date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='淘宝-cps账户明细';

CREATE TABLE ods.rpa_tb_living_sale
(
    id                     bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    biz_day                date COMMENT '日期',
    shop_id                varchar(100) COMMENT '店铺id',
    product_id             VARCHAR(100) COMMENT '商品ID',
    product_name           VARCHAR(100) COMMENT '商品名称',
    clicks                 INT COMMENT '点击数',
    click_conversion_rate  VARCHAR(100) COMMENT '点击转化率',
    pay_order_cnt          BIGINT COMMENT '付款笔数',
    pay_amount             decimal(10, 2) COMMENT '付款金额',
    pay_commission         decimal(10, 2) COMMENT '付款佣金支出',
    pay_commission_rate    VARCHAR(100) COMMENT '付款佣金率',
    confirmed_order_cnt    BIGINT COMMENT '确认收货笔数',
    confirmed_amount       decimal(10, 2) COMMENT '确认收货金额',
    settle_order_cnt       BIGINT COMMENT '结算笔数',
    settle_amount          decimal(10, 2) COMMENT '结算金额',
    settle_commission      decimal(10, 2) COMMENT '结算佣金支出',
    settle_commission_rate VARCHAR(100) COMMENT '结算佣金率',
    created_by             varchar(100) NOT NULL COMMENT '插入人',
    created_at             timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by             varchar(100) COMMENT '更新人',
    updated_at             timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                     date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='淘宝-客达播';

CREATE TABLE ods.rpa_tb_tm_living_sale
(
    id                     bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id                varchar(100) COMMENT '店铺id',
    living_title           VARCHAR(100) COMMENT '直播标题',
    living_start_time      TIMESTAMP COMMENT '开播时间',
    session_id             BIGINT COMMENT '场次ID',
    substitute_anchor_name VARCHAR(100) COMMENT '代播主播名称',
    product_id             BIGINT COMMENT '商品ID',
    product_title          VARCHAR(100) COMMENT '商品标题',
    product_first_cate     VARCHAR(100) COMMENT '商品一级类目',
    parent_order_id        VARCHAR(100) COMMENT '父订单',
    sub_order_id           VARCHAR(100) COMMENT '子订单',
    order_time             TIMESTAMP COMMENT '下单时间',
    pay_time               TIMESTAMP COMMENT '支付时间',
    pay_amount             decimal(10, 2) COMMENT '支付金额',
    confirm_time           VARCHAR(100) COMMENT '确认收货时间',
    confirm_amount         VARCHAR(100) COMMENT '确认收货金额',
    refund_amount          VARCHAR(100) COMMENT '退款金额',
    refund_success_time    VARCHAR(100) COMMENT '退款成功时间',
    substitute_id          VARCHAR(100) COMMENT '代播ID',
    created_by             varchar(100) NOT NULL COMMENT '插入人',
    created_at             timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by             varchar(100) COMMENT '更新人',
    updated_at             timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                     date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='淘宝-直播订单表现表';

CREATE TABLE ods.rpa_tb_promotion_report
(
    id                            bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    biz_day                       date COMMENT '日期',
    shop_id                       varchar(100) COMMENT '店铺id',
    scene_id                      BIGINT COMMENT '场景ID',
    scene_name                    VARCHAR(100) COMMENT '场景名字',
    campaign_id                   BIGINT COMMENT '计划ID',
    campaign_name                 VARCHAR(100) COMMENT '计划名字',
    unit_id                       BIGINT COMMENT '单元ID',
    unit_name                     VARCHAR(100) COMMENT '单元名字',
    subject_id                    BIGINT COMMENT '主体ID',
    subject_type                  VARCHAR(100) COMMENT '主体类型',
    subject_name                  VARCHAR(100) COMMENT '主体名称',
    impressions                   BIGINT COMMENT '展现量',
    clicks                        BIGINT COMMENT '点击量',
    cost                          decimal(10, 2) COMMENT '花费',
    click_rate                    DOUBLE COMMENT '点击率',
    avg_click_cost                VARCHAR(100) COMMENT '平均点击花费',
    thousand_impression_cost      decimal(10, 2) COMMENT '千次展现花费',
    total_presale_amount          decimal(10, 2) COMMENT '总预售成交金额',
    total_presale_order_cnt       BIGINT COMMENT '总预售成交笔数',
    direct_presale_amount         decimal(10, 2) COMMENT '直接预售成交金额',
    direct_presale_order_cnt      BIGINT COMMENT '直接预售成交笔数',
    indirect_presale_amount       decimal(10, 2) COMMENT '间接预售成交金额',
    indirect_presale_order_cnt    BIGINT COMMENT '间接预售成交笔数',
    direct_sale_amount            decimal(10, 2) COMMENT '直接成交金额',
    indirect_sale_amount          decimal(10, 2) COMMENT '间接成交金额',
    total_sale_amount             decimal(10, 2) COMMENT '总成交金额',
    total_sale_order_cnt          BIGINT COMMENT '总成交笔数',
    direct_sale_order_cnt         BIGINT COMMENT '直接成交笔数',
    indirect_sale_order_cnt       BIGINT COMMENT '间接成交笔数',
    click_conversion_rate         VARCHAR(100) COMMENT '点击转化率',
    return_on_investment          VARCHAR(100) COMMENT '投入产出比',
    total_sale_cost               VARCHAR(100) COMMENT '总成交成本',
    total_cart_item_cnt           BIGINT COMMENT '总购物车数',
    direct_cart_item_cnt          BIGINT COMMENT '直接购物车数',
    indirect_cart_item_cnt        BIGINT COMMENT '间接购物车数',
    cart_rate                     VARCHAR(100) COMMENT '加购率',
    favorite_product_cnt          BIGINT COMMENT '收藏宝贝数',
    favorite_store_cnt            BIGINT COMMENT '收藏店铺数',
    store_favorite_cost           VARCHAR(100) COMMENT '店铺收藏成本',
    total_favorite_cart_cnt       BIGINT COMMENT '总收藏加购数',
    total_favorite_cart_cost      VARCHAR(100) COMMENT '总收藏加购成本',
    product_favorite_cart_cnt     BIGINT COMMENT '宝贝收藏加购数',
    product_favorite_cart_cost    VARCHAR(100) COMMENT '宝贝收藏加购成本',
    total_favorite_cnt            BIGINT COMMENT '总收藏数',
    product_favorite_cost         VARCHAR(100) COMMENT '宝贝收藏成本',
    product_favorite_rate         VARCHAR(100) COMMENT '宝贝收藏率',
    cart_cost                     VARCHAR(100) COMMENT '加购成本',
    placed_order_cnt              BIGINT COMMENT '拍下订单笔数',
    placed_order_amount           decimal(10, 2) COMMENT '拍下订单金额',
    direct_product_favorite_cnt   BIGINT COMMENT '直接收藏宝贝数',
    indirect_product_favorite_cnt BIGINT COMMENT '间接收藏宝贝数',
    coupon_redemption_cnt         BIGINT COMMENT '优惠券领取量',
    deposit_trans_cnt             BIGINT COMMENT '购物金充值笔数',
    deposit_amount                decimal(10, 2) COMMENT '购物金充值金额',
    ww_inquiried_cnt              BIGINT COMMENT '旺旺咨询量',
    guided_visit_cnt              BIGINT COMMENT '引导访问量',
    guided_visitor_num            BIGINT COMMENT '引导访问人数',
    guided_lead_num               BIGINT COMMENT '引导访问潜客数',
    guided_leads_ratio            VARCHAR(100) COMMENT '引导访问潜客占比',
    membership_rate               VARCHAR(100) COMMENT '入会率',
    membership_cnt                BIGINT COMMENT '入会量',
    guided_visit_rate             DOUBLE COMMENT '引导访问率',
    deep_visit_cnt                BIGINT COMMENT '深度访问量',
    avg_pages_per_visit           VARCHAR(100) COMMENT '平均访问页面数',
    new_customer_num              BIGINT COMMENT '成交新客数',
    new_customer_ratio            VARCHAR(100) COMMENT '成交新客占比',
    first_time_member_num         BIGINT COMMENT '会员首购人数',
    member_sale_amount            decimal(10, 2) COMMENT '会员成交金额',
    member_sale_order_cnt         BIGINT COMMENT '会员成交笔数',
    total_customer_num            BIGINT COMMENT '成交人数',
    avg_customer_sale_cnt         VARCHAR(100) COMMENT '人均成交笔数',
    avg_customer_sale_amount      VARCHAR(100) COMMENT '人均成交金额',
    new_exposure_customer_num     BIGINT COMMENT '曝光新客数',
    new_visit_num                 BIGINT COMMENT '进店新客数',
    new_cart_customer_num         BIGINT COMMENT '加购新客数',
    new_favorite_customer_num     BIGINT COMMENT '收藏新客数',
    new_customer_sale_amount      decimal(10, 2) COMMENT '新客支付金额',
    new_customer_click_rate       DOUBLE COMMENT '新客点击率',
    new_customer_conversion_rate  VARCHAR(100) COMMENT '新客成交转化率',
    organic_sale_amount           decimal(10, 2) COMMENT '自然流量转化金额',
    organic_exposure_cnt          BIGINT COMMENT '自然流量曝光量',
    created_by                    varchar(100) NOT NULL COMMENT '插入人',
    created_at                    timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                    varchar(100) COMMENT '更新人',
    updated_at                    timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                            date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='淘宝-单元报表';

CREATE TABLE ods.rpa_tb_account_report
(
    id                             bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    biz_day                        date COMMENT '日期',
    shop_id                        varchar(100) COMMENT '店铺id',
    scene_id                       BIGINT COMMENT '场景ID',
    scene_name                     VARCHAR(100) COMMENT '场景名字',
    impression_cnt                 BIGINT COMMENT '展现量',
    click_cnt                      BIGINT COMMENT '点击量',
    cost                           decimal(10, 2) COMMENT '花费',
    click_rate                     DOUBLE COMMENT '点击率',
    avg_click_cost                 decimal(10, 2) COMMENT '平均点击花费',
    thousand_impression_cost       decimal(10, 2) COMMENT '千次展现花费',
    total_presale_amount           decimal(10, 2) COMMENT '总预售成交金额',
    total_presale_order_cnt        BIGINT COMMENT '总预售成交笔数',
    direct_presale_amount          decimal(10, 2) COMMENT '直接预售成交金额',
    direct_presale_order_cnt       BIGINT COMMENT '直接预售成交笔数',
    indirect_presale_amount        decimal(10, 2) COMMENT '间接预售成交金额',
    indirect_presale_order_cnt     BIGINT COMMENT '间接预售成交笔数',
    direct_sale_amount             decimal(10, 2) COMMENT '直接成交金额',
    indirect_sale_amount           decimal(10, 2) COMMENT '间接成交金额',
    total_sale_amount              decimal(10, 2) COMMENT '总成交金额',
    total_sale_order_cnt           BIGINT COMMENT '总成交笔数',
    direct_sale_order_cnt          BIGINT COMMENT '直接成交笔数',
    indirect_sale_order_cnt        BIGINT COMMENT '间接成交笔数',
    click_conversion_rate          DOUBLE COMMENT '点击转化率',
    return_on_investment           DOUBLE COMMENT '投入产出比',
    total_sales_cost               decimal(10, 2) COMMENT '总成交成本',
    total_cart_item_cnt            BIGINT COMMENT '总购物车数',
    direct_cart_item_cnt           BIGINT COMMENT '直接购物车数',
    indirect_cart_item_cnt         BIGINT COMMENT '间接购物车数',
    cart_rate                      DOUBLE COMMENT '加购率',
    favorite_product_cnt           BIGINT COMMENT '收藏宝贝数',
    favorite_store_cnt             BIGINT COMMENT '收藏店铺数',
    store_favorite_cost            VARCHAR(100) COMMENT '店铺收藏成本',
    total_favorite_cart_item_cnt   BIGINT COMMENT '总收藏加购数',
    total_favorite_cart_cost       decimal(10, 2) COMMENT '总收藏加购成本',
    product_favorite_cart_item_cnt BIGINT COMMENT '宝贝收藏加购数',
    product_favorite_cart_cost     decimal(10, 2) COMMENT '宝贝收藏加购成本',
    total_favorite_cnt             BIGINT COMMENT '总收藏数',
    product_favorite_cost          VARCHAR(100) COMMENT '宝贝收藏成本',
    product_favorite_rate          DOUBLE COMMENT '宝贝收藏率',
    cart_cost                      decimal(10, 2) COMMENT '加购成本',
    placed_order_cnt               BIGINT COMMENT '拍下订单笔数',
    placed_order_amount            decimal(10, 2) COMMENT '拍下订单金额',
    direct_product_favorite_cnt    BIGINT COMMENT '直接收藏宝贝数',
    indirect_product_favorite_cnt  BIGINT COMMENT '间接收藏宝贝数',
    coupon_redemption_cnt          BIGINT COMMENT '优惠券领取量',
    deposit_trans_cnt              BIGINT COMMENT '购物金充值笔数',
    deposit_amount                 decimal(10, 2) COMMENT '购物金充值金额',
    ww_inquiried_cnt               BIGINT COMMENT '旺旺咨询量',
    guided_visit_cnt               BIGINT COMMENT '引导访问量',
    guided_visit_num               BIGINT COMMENT '引导访问人数',
    guided_lead_num                BIGINT COMMENT '引导访问潜客数',
    guided_lead_ratio              DOUBLE COMMENT '引导访问潜客占比',
    membership_rate                DOUBLE COMMENT '入会率',
    membership_cnt                 BIGINT COMMENT '入会量',
    guided_visit_rate              DOUBLE COMMENT '引导访问率',
    deep_visit_cnt                 BIGINT COMMENT '深度访问量',
    avg_page_visit_cnt             BIGINT COMMENT '平均访问页面数',
    new_customer_num               BIGINT COMMENT '成交新客数',
    new_customer_ratio             DOUBLE COMMENT '成交新客占比',
    first_time_member_num          BIGINT COMMENT '会员首购人数',
    member_sale_amount             decimal(10, 2) COMMENT '会员成交金额',
    member_sale_order_cnt          BIGINT COMMENT '会员成交笔数',
    total_customer_num             BIGINT COMMENT '成交人数',
    avg_customer_sale_cnt          BIGINT COMMENT '人均成交笔数',
    avg_customer_sale_amount       decimal(10, 2) COMMENT '人均成交金额',
    organic_sale_amount            decimal(10, 2) COMMENT '自然流量转化金额',
    organic_exposure_cnt           BIGINT COMMENT '自然流量曝光量',
    created_by                     varchar(100) NOT NULL COMMENT '插入人',
    created_at                     timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                     varchar(100) COMMENT '更新人',
    updated_at                     timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                             date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='淘宝-账户报表';

CREATE TABLE ods.rpa_tb_coupon_usage
(
    id             bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    biz_day        date COMMENT '记账日期',
    shop_id        varchar(100) COMMENT '店铺id',
    shop_name      VARCHAR(100) COMMENT '店铺',
    coupon_name    VARCHAR(100) COMMENT '优惠券名称',
    coupon_type    VARCHAR(100) COMMENT '券类型',
    usage_method   VARCHAR(100) COMMENT '使用方式',
    operate_amount decimal(10, 2) COMMENT '操作金额(元)',
    remark         VARCHAR(500) COMMENT '备注',
    created_by     varchar(100) NOT NULL COMMENT '插入人',
    created_at     timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by     varchar(100) COMMENT '更新人',
    updated_at     timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt             date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='淘宝-账户明细-优惠券花费明细';

CREATE TABLE ods.rpa_tb_special_trans
(
    id                   bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id              varchar(100) COMMENT '店铺id',
    shop_name            VARCHAR(100) COMMENT '店铺',
    account_time         TIMESTAMP COMMENT '记账时间',
    special_fund_id      BIGINT COMMENT '专款ID',
    income_expense_type  VARCHAR(100) COMMENT '收支类型',
    trans_type           VARCHAR(100) COMMENT '交易类型',
    special_fund_type    VARCHAR(100) COMMENT '专款类型',
    operate_amount       decimal(10, 2) COMMENT '操作金额(元)',
    market_fund_amount   decimal(10, 2) COMMENT '营销专款（元）',
    cash_fund_amount     decimal(10, 2) COMMENT '现金专款（元）',
    after_operate_amount decimal(10, 2) COMMENT '操作后余额(元)',
    remark               VARCHAR(500) COMMENT '备注',
    created_by           varchar(100) NOT NULL COMMENT '插入人',
    created_at           timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by           varchar(100) COMMENT '更新人',
    updated_at           timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                   date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='淘宝-账户明细-专款现金交易明细';

CREATE TABLE ods.rpa_tb_service_metrics
(
    id                              bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id                         varchar(100) COMMENT '店铺id',
    biz_day                         date COMMENT '日期',
    service_metric                  VARCHAR(255) COMMENT '服务指标',
    metric_performance              VARCHAR(255) COMMENT '指标表现',
    comparison_with_previous_period VARCHAR(100) COMMENT '环比',
    industry_average                VARCHAR(100) COMMENT '同行同层均值',
    industry_excellent              VARCHAR(100) COMMENT '同行同层优秀',
    created_by                      varchar(100) NOT NULL COMMENT '插入人',
    created_at                      timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                      varchar(100) COMMENT '更新人',
    updated_at                      timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                              date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='淘宝-售后服务指标体系';

CREATE TABLE ods.rpa_tb_assessment
(
    id                   bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id              varchar(100) COMMENT '店铺id',
    biz_day              date COMMENT '日期',
    assessment_dimension VARCHAR(255) COMMENT '考核维度',
    assessment_score     DOUBLE COMMENT '考核得分',
    experience_metric    VARCHAR(255) COMMENT '体验指标',
    metric_score         VARCHAR(100) COMMENT '指标得分',
    metric_value         VARCHAR(100) COMMENT '指标值',
    standard             VARCHAR(255) COMMENT '2分/3分/4分/5分标准',
    created_by           varchar(100) NOT NULL COMMENT '插入人',
    created_at           timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by           varchar(100) COMMENT '更新人',
    updated_at           timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                   date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='淘宝-考核详情';

CREATE TABLE ods.rpa_tb_experience_score
(
    id               bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id          varchar(100) COMMENT '店铺id',
    biz_day          date COMMENT '日期',
    experience_score DOUBLE COMMENT '店铺综合体验分',
    created_by       varchar(100) NOT NULL COMMENT '插入人',
    created_at       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by       varchar(100) COMMENT '更新人',
    updated_at       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt               date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='淘宝-店铺综合体验分';

CREATE TABLE ods.rpa_tb_ww_satisfaction
(
    id                   bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id              varchar(100) COMMENT '店铺id',
    biz_day              date COMMENT '日期',
    service_satisfaction VARCHAR(255) COMMENT '服务满意度',
    industry_excellent   VARCHAR(255) COMMENT '同行同层优秀',
    team_standard        VARCHAR(255) COMMENT '团队标准',
    created_by           varchar(100) NOT NULL COMMENT '插入人',
    created_at           timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by           varchar(100) COMMENT '更新人',
    updated_at           timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                   date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='淘宝-旺旺满意度';

CREATE TABLE ods.rpa_tb_cdl_product_statistics
(
    id                           bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id                      varchar(100) COMMENT '店铺id',
    shop_name                    varchar(100) COMMENT '店铺名称',
    biz_day                      date COMMENT '日期',
    product_id                   BIGINT COMMENT '商品ID',
    product_name                 VARCHAR(255) COMMENT '商品名称',
    main_product_id              BIGINT COMMENT '主商品ID',
    product_type                 VARCHAR(100) COMMENT '商品类型',
    product_code                 VARCHAR(100) COMMENT '货号',
    product_status               VARCHAR(100) COMMENT '商品状态',
    product_tag                  VARCHAR(255) COMMENT '商品标签',
    product_visit_num            BIGINT COMMENT '商品访客数',
    product_view_cnt             BIGINT COMMENT '商品浏览量',
    avg_stay_time                DOUBLE COMMENT '平均停留时长',
    bounce_rate                  VARCHAR(50) COMMENT '商品详情页跳出率',
    product_favorite_num         BIGINT COMMENT '商品收藏人数',
    product_cart_cnt             BIGINT COMMENT '商品加购件数',
    product_cart_num             BIGINT COMMENT '商品加购人数',
    order_buy_num                BIGINT COMMENT '下单买家数',
    order_buy_cnt                BIGINT COMMENT '下单件数',
    order_amount                 decimal(10, 2) COMMENT '下单金额',
    order_conversion_rate        VARCHAR(50) COMMENT '下单转化率',
    pay_num                      BIGINT COMMENT '支付买家数',
    pay_cnt                      BIGINT COMMENT '支付件数',
    pay_amount                   decimal(10, 2) COMMENT '支付金额',
    product_pay_conversion_rate  VARCHAR(50) COMMENT '商品支付转化率',
    new_user_pay_num             BIGINT COMMENT '支付新买家数',
    old_user_pay_num             BIGINT COMMENT '支付老买家数',
    old_user_pay_amount          decimal(10, 2) COMMENT '老买家支付金额',
    jhs_pay_amount               decimal(10, 2) COMMENT '聚划算支付金额',
    visit_avg_value              DOUBLE COMMENT '访客平均价值',
    refund_amount                DOUBLE COMMENT '成功退款金额',
    competitiveness_score        VARCHAR(50) COMMENT '竞争力评分',
    annual_pay_amount            decimal(10, 2) COMMENT '年累计支付金额',
    monthly_pay_amount           decimal(10, 2) COMMENT '月累计支付金额',
    monthly_pay_quantity         BIGINT COMMENT '月累计支付件数',
    search_guide_conversion_rate VARCHAR(50) COMMENT '搜索引导支付转化率',
    search_guide_visit_num       BIGINT COMMENT '搜索引导访客数',
    search_guide_pay_num         BIGINT COMMENT '搜索引导支付买家数',
    structured_conversion_rate   VARCHAR(50) COMMENT '结构化详情引导转化率',
    structured_trans_ratio       VARCHAR(50) COMMENT '结构化详情引导成交占比',
    data_page_link               VARCHAR(255) COMMENT '数据页面链接',
    update_time                  TIMESTAMP COMMENT '更新时间',
    created_by                   varchar(100) NOT NULL COMMENT '插入人',
    created_at                   timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                   varchar(100) COMMENT '更新人',
    updated_at                   timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                           date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='淘宝-馋哆啦商品排行';

CREATE TABLE ods.rpa_tb_settle_overview
(
    id                 bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id            varchar(100) COMMENT '店铺id',
    biz_day            date COMMENT '日期',
    settle_amount      DOUBLE COMMENT '结算金额',
    commission_expense DOUBLE COMMENT '结算佣金支出',
    directed_plan_name VARCHAR(255) COMMENT '定向计划名称',
    created_by         varchar(100) NOT NULL COMMENT '插入人',
    created_at         timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by         varchar(100) COMMENT '更新人',
    updated_at         timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                 date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='淘宝-定向计划报表-概览数据';

# *********************************** 其它平台 ***********************************
CREATE TABLE ods.rpa_feishu_haiziwang_pos_data
(
    month_index           varchar(10) NOT NULL COMMENT '唯一键',
    performance_shop_code bigint COMMENT '业绩考核门店编码',
    performance_shop_name varchar(100) COMMENT '业绩考核门店名称',
    branch                varchar(50) COMMENT '分部',
    erp_product_code      bigint COMMENT 'ERP商品编码',
    product_name          varchar(100) COMMENT '商品名称',
    date                  timestamp COMMENT '日',
    sell_out_achievement  varchar(50) COMMENT '销售sell out达成',
    pos_achievement       varchar(50) COMMENT '导购POS达成',
    purchase_quantity     bigint COMMENT '购买数量',
    series                varchar(50) COMMENT '系列',
    supply_price          decimal(10, 2) COMMENT '供货价',
    is_pc                 varchar(50) COMMENT '是否是PC',
    category              varchar(50) COMMENT '品类',
    rsp                   varchar(50) COMMENT 'RSP',
    box_specification     varchar(50) COMMENT '箱规',
    created_by            varchar(50) COMMENT '创建者',
    created_at            varchar(50),
    updated_by            varchar(50),
    updated_at            timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                    date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='飞书_孩子王POS数据';

CREATE TABLE ods.rpa_feishu_leyou_pos_data
(
    month_index                   varchar(10) NOT NULL COMMENT '唯一键',
    month_string                  varchar(50) COMMENT '月',
    date_string                   varchar(50) COMMENT '日',
    city_code                     varchar(50) COMMENT '城市代码',
    city_name                     varchar(100) COMMENT '城市名称',
    sku                           varchar(255) COMMENT 'SKU',
    product_name                  varchar(100) COMMENT '商品名称',
    net_sales                     decimal(10, 2) COMMENT '净销售额',
    sales_quantity                bigint COMMENT '销售件数',
    number_of_consumers           bigint COMMENT '消费会员数',
    order_volume                  bigint COMMENT '订单量',
    shopping_frequency            double COMMENT '购物频次',
    unit_price                    decimal(10, 2) COMMENT '品单价',
    per_capita_sales_contribution decimal(10, 2) COMMENT '人均销售贡献',
    per_capita_purchase_quantity  decimal(10, 2) COMMENT '人均购买件数',
    rsp                           varchar(50) COMMENT 'RSP',
    box_specification             varchar(50) COMMENT '箱规',
    total                         varchar(255) COMMENT '合计',
    remark                        varchar(255) COMMENT '备注',
    created_by                    varchar(50) COMMENT '创建者',
    created_at                    varchar(50),
    updated_by                    varchar(50),
    updated_at                    timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                            date comment '分区日期'
) PARTITION BY
VALUE
(dt) COMMENT ='飞书_乐友POS数据';

CREATE TABLE ods.rpa_ks_aftersales_bulk_export
(
    id                         bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id                    varchar(100) COMMENT '店铺id',
    order_no                   bigint       NOT NULL COMMENT '订单编号',
    order_status               varchar(50) COMMENT '订单状态',
    order_create_time          datetime COMMENT '订单创建时间',
    actual_payment             varchar(50) COMMENT '实付款',
    shipping_fee               varchar(50) COMMENT '快递费',
    merchant_receipt           varchar(50) COMMENT '商家实收金额',
    product_id                 bigint COMMENT '商品ID',
    product_name               varchar(255) COMMENT '商品名称',
    buyer_id                   bigint COMMENT '买家ID',
    buyer_nick                 varchar(255) COMMENT '买家昵称',
    aftersales_no              bigint COMMENT '售后单号',
    aftersales_status          varchar(50) COMMENT '售后状态',
    aftersales_request_time    datetime COMMENT '售后申请时间',
    aftersales_type            varchar(50) COMMENT '售后类型',
    aftersales_reason          varchar(255) COMMENT '售后原因',
    request_description        varchar(500) COMMENT '申请描述',
    refund_amount              varchar(50) COMMENT '退款金额',
    return_shipping_no         varchar(50) COMMENT '退货物流单号',
    aftersales_completion_time datetime COMMENT '售后完结时间',
    is_atom_processed          varchar(50) COMMENT '是否ATOM处理',
    created_by                 varchar(100) NOT NULL COMMENT '插入人',
    created_at                 timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                 varchar(100) COMMENT '更新人',
    updated_at                 timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                         date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='快手售后单批量导出';

CREATE TABLE ods.rpa_ks_est_commission
(
    id                    bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id               varchar(100) COMMENT '店铺id',
    biz_day               date COMMENT '日期',
    page_views            int COMMENT 'PV (页面浏览量)',
    unique_visitors       int COMMENT 'UV (独立访客数)',
    payment_count         int COMMENT '支付笔数',
    payment_gmv           decimal(15, 2) COMMENT '支付GMV',
    commission_rate       decimal(5, 2) COMMENT '佣金比例',
    estimated_commission  decimal(10, 2) COMMENT '预估佣金',
    technical_service_fee decimal(10, 2) COMMENT '技术服务费',
    product_id            bigint COMMENT '商品ID',
    product_name          varchar(255) COMMENT '商品名称',
    influencer_id         bigint COMMENT '达人ID',
    influencer_nickname   varchar(100) COMMENT '达人昵称',
    plan_type             varchar(50) COMMENT '计划类型',
    created_by            varchar(100) NOT NULL COMMENT '插入人',
    created_at            timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by            varchar(100) COMMENT '更新人',
    updated_at            timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                    date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='快手预估佣金';

CREATE TABLE ods.rpa_ks_e_niu_agent_summary_total_cost
(
    id         bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    biz_day    date COMMENT '日期',
    shop_id    bigint COMMENT '磁力金牛服务商唯一ID',
    total_cost decimal(10, 3) COMMENT '总花费',
    created_by varchar(100) NOT NULL COMMENT '插入人',
    created_at timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by varchar(100) COMMENT '更新人',
    updated_at timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt         date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT='磁力金牛服务商-数据概览-总花费';

CREATE TABLE ods.rpa_ks_e_niu_financial_transactions
(
    id                        bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    biz_day                   date COMMENT '日期',
    account_ks_id             bigint COMMENT '账户快手ID',
    ad_account_id             bigint COMMENT '广告主账户ID(店铺ID)',
    campaign_cost             decimal(10, 3) COMMENT '计划花费',
    recharge_cost             decimal(10, 3) COMMENT '充值花费',
    frame_return_cost         decimal(10, 3) COMMENT '框返花费',
    incentive_cost            decimal(10, 3) COMMENT '激励花费',
    ecomm_cost                decimal(10, 3) COMMENT '电商花费',
    recharge_transfer_in      decimal(10, 3) COMMENT '充值转入',
    frame_return_transfer_in  decimal(10, 3) COMMENT '框返转入',
    incentive_transfer_in     decimal(10, 3) COMMENT '激励转入',
    ecomm_transfer_in         decimal(10, 3) COMMENT '电商转入',
    total_transfer_in         decimal(10, 3) COMMENT '总转入',
    recharge_transfer_out     decimal(10, 3) COMMENT '充值转出',
    frame_return_transfer_out decimal(10, 3) COMMENT '框返转出',
    incentive_transfer_out    decimal(10, 3) COMMENT '激励转出',
    ecomm_transfer_out        decimal(10, 3) COMMENT '电商转出',
    total_transfer_out        decimal(10, 3) COMMENT '总转出',
    order_payment             decimal(10, 3) COMMENT '订单支付',
    order_refund              decimal(10, 3) COMMENT '订单退款',
    brand_payment             decimal(10, 3) COMMENT '品牌支付',
    brand_refund              decimal(10, 3) COMMENT '品牌退款',
    end_of_day_balance        decimal(10, 3) COMMENT '日终结余',
    created_by                varchar(100) NOT NULL COMMENT '插入人',
    created_at                timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                varchar(100) COMMENT '更新人',
    updated_at                timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                        date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='磁力金牛-财务流水';

CREATE TABLE ods.rpa_ks_mkt_ovw_e_niu_acc_details
(
    id                   bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id              varchar(100) COMMENT '店铺id',
    ad_account           int COMMENT '广告账号',
    promotion_type       varchar(50) COMMENT '推广类型',
    cost                 decimal(10, 2) COMMENT '花费',
    direct_gmv           decimal(15, 2) COMMENT '直接GMV',
    daily_gmv            decimal(15, 2) COMMENT '当日累计GMV',
    post_1_day_gmv       decimal(15, 2) COMMENT '投后1日累计GMV',
    post_3_days_gmv      decimal(15, 2) COMMENT '投后3日累计GMV',
    post_7_days_gmv      decimal(15, 2) COMMENT '投后7日累计GMV',
    post_15_days_gmv     decimal(15, 2) COMMENT '投后15日累计GMV',
    post_30_days_gmv     decimal(15, 2) COMMENT '投后30日累计GMV',
    direct_roi           decimal(5, 2) COMMENT '直接ROI',
    daily_roi            decimal(5, 2) COMMENT '当日累计ROI',
    post_1_day_roi       decimal(5, 2) COMMENT '投后1日累计ROI',
    post_3_days_roi      decimal(5, 2) COMMENT '投后3日累计ROI',
    post_7_days_roi      decimal(5, 2) COMMENT '投后7日累计ROI',
    post_15_days_roi     decimal(5, 2) COMMENT '投后15日累计ROI',
    post_30_days_roi     decimal(5, 2) COMMENT '投后30日累计ROI',
    direct_orders        int COMMENT '直接成交订单量',
    daily_orders         int COMMENT '当日累计成交订单量',
    post_1_day_orders    int COMMENT '投后1日累计成交订单量',
    post_3_days_orders   int COMMENT '投后3日累计成交订单量',
    post_7_days_orders   int COMMENT '投后7日累计成交订单量',
    post_15_days_orders  int COMMENT '投后15日累计成交订单量',
    post_30_days_orders  int COMMENT '投后30日累计成交订单量',
    cover_impressions    int COMMENT '封面曝光数',
    cover_clicks         int COMMENT '封面点击数',
    impressions          int COMMENT '曝光数',
    plays                int COMMENT '播放数',
    new_followers        int COMMENT '涨粉数',
    live_room_entries    int COMMENT '直播间进人',
    creative_impressions int COMMENT '素材曝光数',
    biz_day              date         NOT NULL COMMENT '日期',
    shop_name            varchar(255) COMMENT '店铺',
    created_by           varchar(100) NOT NULL COMMENT '插入人',
    created_at           timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by           varchar(100) COMMENT '更新人',
    updated_at           timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                   date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='营销总览-磁力金牛-账户明细';

CREATE TABLE ods.rpa_ks_operating_data
(
    id                       bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id                  varchar(100) COMMENT '店铺id',
    shop_name                varchar(255) COMMENT '店铺',
    biz_day                  date COMMENT '日期',
    product_views            int COMMENT '商品浏览量',
    product_visitors         int COMMENT '商品访客数',
    total_orderers           int COMMENT '累计下单人数',
    total_orders             int COMMENT '累计下单订单数',
    total_order_amount       decimal(10, 2) COMMENT '累计下单金额',
    total_buyers             int COMMENT '累计成交人数',
    total_sales_orders       int COMMENT '累计成交订单数',
    total_sales_amount       decimal(10, 2) COMMENT '累计成交金额',
    paid_items               int COMMENT '支付件数',
    self_build_self_sell     decimal(10, 2) COMMENT '自建商品自卖',
    self_build_distributed   decimal(10, 2) COMMENT '自建商品被分销',
    fast_distribution        int COMMENT '快分销（原好物联盟）商品',
    third_party_products     int COMMENT '第三方商品',
    refund_amount            decimal(10, 2) COMMENT '退款金额（元）',
    refund_order_count       bigint COMMENT '退款订单数',
    refund_goods_amount      decimal(10, 2) COMMENT '退货退款金额',
    refund_goods_order_count bigint COMMENT '退货退款订单数',
    real_cost                decimal(10, 2) COMMENT '花费(非全站推广)',
    real_cost_full           varchar(20) COMMENT '花费(全站推广)',
    created_by               varchar(100) NOT NULL COMMENT '插入人',
    created_at               timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by               varchar(100) COMMENT '更新人',
    updated_at               timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    pay_order_amount_all     decimal(10, 2) COMMENT '全店累计成交金额',
    dt                       date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='快手-经营数据';

CREATE TABLE ods.rpa_ks_order_bulk_export
(
    id                    bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id               varchar(100) COMMENT '店铺id',
    order_no              bigint COMMENT '订单号',
    order_create_time     datetime COMMENT '订单创建时间',
    order_pay_time        datetime COMMENT '订单支付时间',
    presale_deposit_time  varchar(50) COMMENT '预售定金支付时间',
    order_status          varchar(50) COMMENT '订单状态',
    actual_payment        varchar(50) COMMENT '实付款',
    shipping_fee          varchar(50) COMMENT '快递费',
    channel               varchar(50) COMMENT '渠道',
    pay_method            varchar(50) COMMENT '支付方式',
    quantity              int COMMENT '成交数量',
    buyer_message         varchar(500) COMMENT '买家留言',
    account_type          varchar(50) COMMENT '账号类型',
    account_details       varchar(500) COMMENT '账号明细',
    order_notes           varchar(500) COMMENT '订单备注',
    refund                varchar(50) COMMENT '退货退款',
    activity_order        varchar(50) COMMENT '活动订单',
    presale_delivery_time datetime COMMENT '预售/承诺发货时间',
    product_name          varchar(255) COMMENT '商品名称',
    product_id            bigint COMMENT '商品ID',
    product_spec          varchar(255) COMMENT '商品规格',
    sku_code              varchar(255) COMMENT 'SKU编码',
    unit_price            varchar(50) COMMENT '商品单价',
    cps_influencer_id     bigint COMMENT 'CPS达人ID',
    cps_influencer_nick   varchar(255) COMMENT 'CPS达人昵称',
    est_promotion_comm    decimal(10, 2) COMMENT '预估推广佣金',
    est_promoter_rate     varchar(50) COMMENT '预估推广者分佣比例',
    recipient_name        varchar(255) COMMENT '收货人姓名',
    recipient_phone       varchar(20) COMMENT '收货人电话',
    recipient_province    varchar(100) COMMENT '收货地址-省',
    recipient_city        varchar(100) COMMENT '收货地址-市',
    recipient_district    varchar(100) COMMENT '收货地址-区',
    recipient_street      varchar(255) COMMENT '收货地址-街道',
    recipient_address     varchar(100) COMMENT '收货地址',
    shipping_company      varchar(100) COMMENT '快递公司',
    tracking_no           varchar(255) COMMENT '快递单号',
    logistics_info        varchar(50) COMMENT '物流信息',
    real_name             varchar(255) COMMENT '实名姓名',
    id_number             varchar(20) COMMENT '身份证号',
    store_id              varchar(20) COMMENT '门店ID',
    store_name            varchar(255) COMMENT '门店名称',
    store_address         varchar(255) COMMENT '门店地址',
    created_by            varchar(100) NOT NULL COMMENT '插入人',
    created_at            timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by            varchar(100) COMMENT '更新人',
    updated_at            timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                    date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='快手订单批量导出';

CREATE TABLE ods.rpa_ks_short_video_prod_report
(
    id                      bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id                 varchar(100) COMMENT '店铺id',
    product_id              bigint COMMENT '商品ID',
    product_name            varchar(255) COMMENT '商品名称',
    product_image_url       varchar(512) COMMENT '商品主图',
    spend                   decimal(10, 2) COMMENT '花费(元)',
    impressions             double COMMENT '曝光数',
    cpm                     decimal(10, 2) COMMENT '平均千次广告曝光花费',
    product_visits          double COMMENT '商品访问数',
    gmv                     decimal(15, 2) COMMENT 'GMV（总交易额）',
    roi                     decimal(5, 2) COMMENT 'ROI（投资回报率）',
    orders_paid             double COMMENT '订单支付数',
    order_cost              decimal(10, 2) COMMENT '商品订单成本',
    aov                     decimal(10, 2) COMMENT '单均价',
    daily_cumulative_gmv    decimal(15, 2) COMMENT '当日累计GMV',
    t0_roi                  decimal(10, 6) COMMENT 't0Roi',
    daily_cumulative_orders double       NOT NULL COMMENT '当日累计订单数',
    biz_day                 date COMMENT '日期',
    account_id              bigint       NOT NULL COMMENT '账户ID',
    created_by              varchar(100) NOT NULL COMMENT '插入人',
    created_at              timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by              varchar(100) COMMENT '更新人',
    updated_at              timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                      date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='短视频推广-商品报表';

CREATE TABLE ods.rpa_mx_ai_inventory_marketing_order
(
    id                        bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id                   varchar(100) COMMENT '店铺id',
    settlement_subject        varchar(50) COMMENT '结算科目',
    payment_type              varchar(50) COMMENT '收付类型',
    activity_number           bigint COMMENT '活动编号',
    activity_name             varchar(255) COMMENT '活动名称',
    ad_order_number           varchar(50) COMMENT 'AD单号',
    secondary_order_number    varchar(50) COMMENT '二级订单号',
    tertiary_order_number     varchar(50) COMMENT '三级订单号',
    product_name              varchar(100) COMMENT '商品名称',
    product_quantity          int COMMENT '商品件数',
    product_number            bigint COMMENT '商品编号',
    barcode                   varchar(50) COMMENT '条码',
    item_number               varchar(50) COMMENT '款号',
    settlement_amount         decimal(10, 2) COMMENT '结算金额',
    sales_price               decimal(10, 2) COMMENT '销售价格',
    marketing_promotition_fee decimal(10, 2) COMMENT '市场推广费',
    actual_payment            decimal(10, 2) COMMENT '实付金额',
    operating_sale_fee        decimal(10, 2) COMMENT '营销费用',
    high_commission_fee       decimal(10, 2) COMMENT '高佣费用',
    low_price_fee             decimal(10, 2) COMMENT '低价费用',
    coupon_fee                decimal(10, 2) COMMENT '优惠券费用',
    transaction_time          datetime COMMENT '业务发生时间',
    is_settled                varchar(50) COMMENT '是否出账',
    expected_settle_time      datetime COMMENT '预计出账时间',
    recon_no                  varchar(255) COMMENT '对账单号',
    billing_date              date COMMENT '账单日',
    created_by                varchar(100) NOT NULL COMMENT '插入人',
    created_at                timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                varchar(100) COMMENT '更新人',
    updated_at                timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                        date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='爱库存营销费用&订单货款';

CREATE TABLE ods.rpa_mx_funds_account_transactions
(
    id                bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id           varchar(100) COMMENT '店铺id',
    source_order_no   varchar(50) COMMENT '来源单号',
    transaction_type  varchar(50) COMMENT '交易类型',
    settlement_amount decimal(10, 2) COMMENT '结算金额(元)',
    settlement_date   datetime COMMENT '结算日期',
    created_by        varchar(100) NOT NULL COMMENT '插入人',
    created_at        timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by        varchar(100) COMMENT '更新人',
    updated_at        timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='梦饷家-资金-账户收支';

CREATE TABLE ods.rpa_pdd_after_sales_data
(
    id         bigint AUTO_INCREMENT COMMENT '主键id',
    biz_day    date         NOT NULL COMMENT '日期',
    dimension  varchar(255) COMMENT '维度',
    value      varchar(255) NOT NULL COMMENT '数值',
    remarks    varchar,
    shop_id    varchar(255) COMMENT '店铺id',
    created_by varchar(100) NOT NULL COMMENT '插入人',
    created_at timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by varchar(100) COMMENT '更新人',
    updated_at timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt         date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='拼多多售后数据';

CREATE TABLE ods.rpa_pdd_after_sales_shop_star_rating
(
    id                   bigint AUTO_INCREMENT COMMENT '主键id',
    biz_day              date         NOT NULL COMMENT '日期',
    experience_dimension varchar(255) COMMENT '体验维度',
    assessment_indicator varchar(255) NOT NULL COMMENT '考核指标',
    current_performance  varchar(255) NOT NULL COMMENT '店铺表现（如评分）',
    shop_id              varchar(255) COMMENT '店铺id',
    created_by           varchar(100) NOT NULL COMMENT '插入人',
    created_at           timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by           varchar(100) COMMENT '更新人',
    updated_at           timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                   date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='拼多多售后店铺星级';

CREATE TABLE ods.rpa_pdd_ddjb_promotion_expenses
(
    id                     bigint AUTO_INCREMENT COMMENT '主键id',
    biz_day                date           NOT NULL COMMENT '日期',
    deal_count             bigint COMMENT '成交笔数',
    transaction_amount     decimal(10, 2) NOT NULL COMMENT '成交金额',
    estimated_commission   decimal(10, 2) NOT NULL COMMENT '预估支付佣金',
    estimated_software_fee decimal(10, 2) NOT NULL COMMENT '预估软件服务费',
    shop_id                varchar(255) COMMENT '店铺id',
    created_by             varchar(100)   NOT NULL COMMENT '插入人',
    created_at             timestamp      NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by             varchar(100) COMMENT '更新人',
    updated_at             timestamp      NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                     date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='多多进宝推广费';

CREATE TABLE ods.rpa_pdd_operate_overview
(
    id                                 bigint AUTO_INCREMENT COMMENT '主键id',
    biz_day                            date           NOT NULL COMMENT '日期',
    payment_amount                     decimal(10, 2) NOT NULL COMMENT '支付金额',
    buyer_count                        bigint COMMENT '支付买家数',
    customer_avg_price                 decimal(10, 2) COMMENT '支付客单价',
    conversion_rate                    varchar(255) COMMENT '支付转化率',
    store_followers                    bigint COMMENT '店铺关注用户数',
    order_count                        bigint COMMENT '支付订单数',
    old_buyer_ratio                    varchar(255) COMMENT '老买家占比',
    dispute_refund_count               bigint COMMENT '纠纷退款数',
    dispute_refund_rate                varchar(255) COMMENT '纠纷退款率',
    intervention_order_count           int COMMENT '介入订单数',
    platform_intervention_rate         varchar(255) COMMENT '平台介入率',
    quality_refund_rate                varchar(255) COMMENT '品质退款率',
    avg_refund_duration                varchar(255) COMMENT '平均退款时长（单位：天/小时，根据业务需要定义）',
    successful_refund_orders           bigint COMMENT '成功退款订单数',
    successful_refund_amount           decimal(10, 2) COMMENT '成功退款金额',
    successful_refund_rate             varchar(255) COMMENT '成功退款率',
    return_refund_self_finish_duration varchar(255) COMMENT '退货退款自主完结时长（单位：天/小时）',
    only_refund_self_finish_duration   varchar(255) COMMENT '仅退款自主完结时长（单位：天/小时）',
    shop_id                            varchar(255) COMMENT '店铺id',
    created_by                         varchar(100)   NOT NULL COMMENT '插入人',
    created_at                         timestamp      NOT NULL DEFAULT '2024-09-04 16:00:24.267' COMMENT '插入时间',
    updated_by                         varchar(100) COMMENT '更新人',
    updated_at                         timestamp      NOT NULL DEFAULT '2024-09-04 16:00:24.267' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                                 date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='拼多多经营总览';

CREATE TABLE ods.rpa_pdd_pre_sales_sales_data
(
    id                        bigint AUTO_INCREMENT COMMENT '主键id',
    biz_day                   date         NOT NULL COMMENT '日期',
    consultation_count        bigint COMMENT '咨询人数',
    inquiry_count             bigint COMMENT '询单人数',
    final_group_members_count bigint COMMENT '最终成团人数',
    inquiry_conversion_rate   varchar(100) NOT NULL COMMENT '询单转化率',
    sales_amount              decimal(15, 2) COMMENT '客服销售额（元）',
    potential_sales_increase  decimal(15, 2) COMMENT '客服可提升销售额（元）',
    shop_id                   varchar(255) COMMENT '店铺id',
    created_by                varchar(100) NOT NULL COMMENT '插入人',
    created_at                timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                varchar(100) COMMENT '更新人',
    updated_at                timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                        date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='拼多多售前销售数据';

CREATE TABLE ods.rpa_pdd_pre_sales_service_data
(
    id                               bigint AUTO_INCREMENT COMMENT '主键id',
    biz_day                          date         NOT NULL COMMENT '日期',
    consultation_count               bigint COMMENT '咨询人数',
    manual_consultation_count        bigint COMMENT '需要人工回复的咨询人数',
    attended_by_human_count          bigint COMMENT '人工接待人数',
    three_min_response_rate_8_23     varchar(255) COMMENT '3分钟人工回复率(8-23点)',
    thirty_sec_response_rate_8_23    varchar(255) COMMENT '30秒应答率(8-23点)',
    average_response_time_minutes    decimal(5, 2) COMMENT '平均响应时长(分)',
    score_leq_3_orders_count         varchar(255) COMMENT '评分≤3订单数',
    dispute_refund_count             varchar(255) COMMENT '纠纷退款数',
    three_min_response_rate_all_day  varchar(255) COMMENT '3分钟人工回复率(全天)',
    thirty_sec_response_rate_all_day varchar(255) COMMENT '30秒应答率(全天)',
    shop_id                          varchar(255) COMMENT '店铺id',
    created_by                       varchar(100) NOT NULL COMMENT '插入人',
    created_at                       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                       varchar(100) COMMENT '更新人',
    updated_at                       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                               date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='拼多多售前服务数据';

CREATE TABLE ods.rpa_pdd_pre_sales_team_conversion_rate
(
    id                           bigint AUTO_INCREMENT COMMENT '主键id',
    biz_day                      date         NOT NULL COMMENT '日期',
    customer_service_account     varchar(100) NOT NULL COMMENT '客服账号',
    consultation_count           bigint COMMENT '咨询人数',
    inquiry_count                bigint COMMENT '询单人数',
    final_group_count            bigint COMMENT '最终成团人数',
    inquiry_loss_count           bigint COMMENT '询单流失人数',
    inquiry_conversion_rate      varchar(100) NOT NULL COMMENT '询单转化率',
    sales_amount                 decimal(15, 2) COMMENT '客服销售额（元）',
    attended_by_human_count      bigint COMMENT '人工接待人数',
    manual_consultation_count    bigint COMMENT '需要人工回复的咨询人数',
    three_min_unreplied_count    bigint COMMENT '3分钟未回复人数',
    three_min_response_rate      varchar(100) COMMENT '3分钟人工回复率(8-23点)',
    average_response_time        varchar(100) COMMENT '平均人工响应时长（分钟）',
    thirty_sec_response_rate     varchar(100) COMMENT '30秒应答率(8-23点)',
    score_leq_3_orders_count     bigint COMMENT '评分≤3订单数',
    total_reviews                bigint COMMENT '评分数',
    score_leq_3_rate             varchar(100) COMMENT '评分≤3率',
    dispute_refund_count         bigint COMMENT '纠纷退款数',
    complaints_count             bigint COMMENT '投诉数',
    three_min_response_rate_day  varchar(100) COMMENT '3分钟人工回复率(全天)',
    thirty_sec_response_rate_day varchar(100) COMMENT '30秒应答率(全天)',
    shop_id                      varchar(255) COMMENT '店铺id',
    created_by                   varchar(100) NOT NULL COMMENT '插入人',
    created_at                   timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                   varchar(100) COMMENT '更新人',
    updated_at                   timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                           date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='拼多多售前团队数据(转化率)';

CREATE TABLE ods.rpa_pdd_pre_sales_team_data
(
    id                           bigint AUTO_INCREMENT COMMENT '主键id',
    biz_day                      date         NOT NULL COMMENT '日期',
    customer_service_account     varchar(100) NOT NULL COMMENT '客服账号',
    consultation_count           bigint COMMENT '咨询人数',
    inquiry_count                bigint COMMENT '询单人数',
    final_group_count            bigint COMMENT '最终成团人数',
    inquiry_loss_count           bigint COMMENT '询单流失人数',
    inquiry_conversion_rate      varchar(100) NOT NULL COMMENT '询单转化率',
    sales_amount                 decimal(15, 2) COMMENT '客服销售额（元）',
    attended_by_human_count      bigint COMMENT '人工接待人数',
    manual_consultation_count    bigint COMMENT '需要人工回复的咨询人数',
    three_min_unreplied_count    bigint COMMENT '3分钟未回复人数',
    three_min_response_rate      varchar(100) COMMENT '3分钟人工回复率(8-23点)',
    average_response_time        varchar(100) COMMENT '平均人工响应时长（分钟）',
    thirty_sec_response_rate     varchar(100) COMMENT '30秒应答率(8-23点)',
    score_leq_3_orders_count     bigint COMMENT '评分≤3订单数',
    total_reviews                bigint COMMENT '评分数',
    score_leq_3_rate             varchar(100) COMMENT '评分≤3率',
    dispute_refund_count         bigint COMMENT '纠纷退款数',
    complaints_count             bigint COMMENT '投诉数',
    three_min_response_rate_day  varchar(100) COMMENT '3分钟人工回复率(全天)',
    thirty_sec_response_rate_day varchar(100) COMMENT '30秒应答率(全天)',
    shop_id                      varchar(255) COMMENT '店铺id',
    created_by                   varchar(100) NOT NULL COMMENT '插入人',
    created_at                   timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                   varchar(100) COMMENT '更新人',
    updated_at                   timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                           date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='拼多多售前团队数据';

CREATE TABLE ods.rpa_pdd_promotion_expenses
(
    id                  bigint AUTO_INCREMENT COMMENT '主键id',
    biz_day             date           NOT NULL COMMENT '时间',
    fund_type           varchar(255)   NOT NULL COMMENT '资金类型',
    transaction_type    varchar(255)   NOT NULL COMMENT '流水类型',
    is_included         varchar(255) COMMENT '是否计入',
    store_name          varchar(255)   NOT NULL COMMENT '店铺名称',
    transaction_amount  decimal(10, 2) NOT NULL COMMENT '交易金额',
    balance             decimal(10, 2) COMMENT '余额',
    transaction_summary varchar COMMENT '交易摘要',
    shop_id             varchar(255) COMMENT '店铺id',
    created_by          varchar(100)   NOT NULL COMMENT '插入人',
    created_at          timestamp      NOT NULL DEFAULT '2024-09-05 14:32:03.289' COMMENT '插入时间',
    updated_by          varchar(100) COMMENT '更新人',
    updated_at          timestamp      NOT NULL DEFAULT '2024-09-05 14:32:03.289' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                  date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='拼多多推广费用';

CREATE TABLE ods.rpa_syyz_after_sales_data
(
    id                        bigint AUTO_INCREMENT COMMENT '主键id',
    after_sale_id             varchar(50)  NOT NULL COMMENT '售后编号',
    store_id                  varchar(50) COMMENT '归属店铺',
    order_id                  varchar(50)  NOT NULL COMMENT '订单编号',
    product_sku_code          varchar(100) COMMENT '商品SKU编码',
    refund_complete_time      timestamp COMMENT '退款完成时间',
    after_sale_type           varchar(50) COMMENT '售后方式',
    product_name              varchar(255) COMMENT '商品名称',
    product_code              varchar(100) COMMENT '商品编码',
    delivery_company          varchar(100) COMMENT '发货物流公司',
    delivery_number           varchar(100) COMMENT '发货物流单号',
    payment_time              timestamp COMMENT '付款时间',
    transaction_complete_time timestamp COMMENT '交易完成时间',
    order_amount              decimal(10, 2) COMMENT '订单金额',
    refund_amount             decimal(10, 2) COMMENT '退款金额',
    application_time          timestamp COMMENT '申请时间',
    refund_status             varchar(50) COMMENT '退款资金状态',
    after_sale_status         varchar(50) COMMENT '售后状态',
    after_sale_reason         varchar(255) COMMENT '售后原因',
    delivery_status           varchar(50) COMMENT '发货状态',
    return_logistics_number   varchar(100) COMMENT '退货物流单号',
    application_quantity      bigint COMMENT '申请数量',
    refund_note               varchar COMMENT '退款说明',
    buyer_phone               varchar(20) COMMENT '买家手机号',
    operator                  varchar(100) COMMENT '操作人',
    store_name                varchar(255) COMMENT '店铺名',
    shop_id                   varchar(255) NOT NULL COMMENT '店铺id',
    created_by                varchar(100) NOT NULL COMMENT '插入人',
    created_at                timestamp    NOT NULL DEFAULT '2024-09-18 13:49:02.514' COMMENT '插入时间',
    updated_by                varchar(100) COMMENT '更新人',
    updated_at                timestamp    NOT NULL DEFAULT '2024-09-18 13:49:02.514' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                        date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='私域有赞售后单';

CREATE TABLE ods.rpa_syyz_business_data_overview
(
    id                                bigint AUTO_INCREMENT COMMENT '主键id',
    biz_day                           timestamp    NOT NULL COMMENT '日期',
    visit_to_payment_conversion_rate  varchar(50) COMMENT '访问-支付转化率',
    customer_average_order_value      decimal(10, 2) COMMENT '客单价',
    page_views                        bigint COMMENT '浏览量',
    old_customers_transactions        bigint COMMENT '老成交客户数',
    successful_refund_amount          decimal(10, 2) COMMENT '成功退款金额',
    refund_rate                       varchar(50) COMMENT '退款率',
    total_transaction_amount          decimal(20, 2) COMMENT '总成交金额',
    self_operated_amount              decimal(20, 2) COMMENT '自营金额',
    distribution_market_supply_amount decimal(20, 2) COMMENT '分销市场供货金额',
    visitors                          bigint COMMENT '访客数',
    order_placers                     bigint COMMENT '下单人数',
    order_count                       bigint COMMENT '下单笔数',
    order_amount                      decimal(20, 2) COMMENT '下单金额',
    payment_users                     bigint COMMENT '支付人数',
    payment_order_count               bigint COMMENT '支付订单数',
    payment_amount                    decimal(20, 2) COMMENT '支付金额',
    payment_items                     bigint COMMENT '支付件数',
    order_to_payment_conversion_rate  varchar(50) COMMENT '下单-支付转化率',
    new_customers_payment_amount      decimal(20, 2) COMMENT '新成交客户-支付金额',
    old_customers_payment_amount      decimal(20, 2) COMMENT '老成交客户-支付金额',
    store_name                        varchar(255) COMMENT '店铺名称',
    shop_id                           varchar(255) NOT NULL COMMENT '店铺id',
    created_by                        varchar(100) NOT NULL COMMENT '插入人',
    created_at                        timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                        varchar(100) COMMENT '更新人',
    updated_at                        timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                                date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='私域有赞&线下商城经营数据概况';

CREATE TABLE ods.rpa_syyz_distribution_analysis
(
    id                     bigint AUTO_INCREMENT COMMENT '主键id',
    biz_day                timestamp    NOT NULL COMMENT '日期',
    payment_amount         decimal(10, 2) COMMENT '支付金额',
    payment_items          bigint COMMENT '支付件数',
    gross_profit           decimal(10, 2) COMMENT '毛利额',
    gross_profit_rate      varchar(50) COMMENT '毛利率',
    promotion_commission   decimal(10, 2) COMMENT '推广佣金',
    promotion_compensation decimal(10, 2) COMMENT '推广补差金额',
    store_name             varchar(255) COMMENT '店铺名称',
    shop_id                varchar(255) NOT NULL COMMENT '店铺id',
    created_by             varchar(100) NOT NULL COMMENT '插入人',
    created_at             timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by             varchar(100) COMMENT '更新人',
    updated_at             timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                     date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='私域有赞分销分析';

CREATE TABLE ods.rpa_syyz_procure_order
(
    id                             bigint AUTO_INCREMENT COMMENT '主键id',
    purchase_order_id              varchar(255) COMMENT '采购单ID',
    status                         varchar(255) NOT NULL COMMENT '采购单状态',
    Purchase_Order_created_at      timestamp    NOT NULL COMMENT '采购单创建时间',
    transaction_success_time       timestamp COMMENT '交易成功时间',
    funds_settlement_status        varchar(255) COMMENT '采购单资金结算状态',
    supplier_name                  varchar(255) COMMENT '供货商名称',
    actual_payment_amount          decimal(10, 2) COMMENT '采购单实付金额',
    shipping_fee                   decimal(10, 2) COMMENT '采购单运费',
    distribution_promotion_subsidy decimal(10, 2) COMMENT '采购单分销推广补差',
    distribution_commission        decimal(10, 2) COMMENT '采购单分销推广佣金',
    distribution_order_id          varchar(255) COMMENT '分销买家单ID',
    distribution_status            varchar(255) COMMENT '分销买家单状态',
    distribution_created_at        timestamp COMMENT '分销买家单创建时间',
    buyer_payment_time             timestamp COMMENT '买家付款时间',
    total_product_amount           decimal(10, 2) COMMENT '分销买家单商品金额合计',
    distribution_shipping_fee      decimal(10, 2) COMMENT '分销买家单运费',
    distribution_payment_amount    decimal(10, 2) COMMENT '分销买家单实付金额',
    merge_order_id                 varchar(255) COMMENT '合并单号',
    shop_id                        varchar(255) COMMENT '店铺id',
    created_by                     varchar(100) NOT NULL COMMENT '插入人',
    created_at                     timestamp    NOT NULL DEFAULT '2024-09-11 10:46:59.105' COMMENT '插入时间',
    updated_by                     varchar(100) COMMENT '更新人',
    updated_at                     timestamp    NOT NULL DEFAULT '2024-09-11 10:46:59.105' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                             date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='私域有赞采购单';

CREATE TABLE ods.rpa_syyz_sales_slip
(
    id                              bigint AUTO_INCREMENT COMMENT '主键id',
    order_id                        varchar(50)  NOT NULL COMMENT '订单号',
    order_type                      varchar(20)  NOT NULL COMMENT '订单类型',
    order_status                    varchar(20)  NOT NULL COMMENT '订单状态',
    buyer_payment_time              timestamp COMMENT '买家付款时间',
    transaction_success_time        timestamp COMMENT '交易成功时间',
    actual_payment_amount           decimal(10, 2) COMMENT '订单实付金额',
    all_product_names               varchar COMMENT '全部商品名称',
    recipient_name                  varchar(100) COMMENT '收货人/提货人',
    recipient_phone                 varchar(20) COMMENT '收货人手机号/提货人手机号',
    recipient_province              varchar(50) COMMENT '收货人省份',
    recipient_city                  varchar(50) COMMENT '收货人城市',
    recipient_district              varchar(50) COMMENT '收货人地区',
    buyer_name                      varchar(100) COMMENT '买家姓名',
    buyer_phone                     varchar(20) COMMENT '买家手机号',
    refund_status                   varchar(20) COMMENT '订单退款状态',
    refunded_amount                 decimal(10, 2) COMMENT '订单已退款金额',
    distribution_promotion_subsidy  decimal(10, 2) COMMENT '分销推广补差',
    distribution_commission         decimal(10, 2) COMMENT '分销推广佣金',
    group_sell_commission           varchar(20) COMMENT '群团团帮卖佣金',
    group_sell_commission_status    varchar(20) COMMENT '群团团佣金结算状态',
    group_sell_invite_commission    varchar(20) COMMENT '群团团邀请佣金',
    group_sell_exclusive_commission varchar(20) COMMENT '群团团专属佣金',
    watercourse                     varchar(20) COMMENT '销售渠道',
    shop_id                         varchar(255) COMMENT '店铺id',
    created_by                      varchar(100) NOT NULL COMMENT '插入人',
    created_at                      timestamp    NOT NULL DEFAULT '2024-09-12 15:54:39.593' COMMENT '插入时间',
    updated_by                      varchar(100) COMMENT '更新人',
    updated_at                      timestamp    NOT NULL DEFAULT '2024-09-12 15:54:39.593' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                              date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='私域有赞销售单';

CREATE TABLE ods.rpa_wph_data_overview
(
    id                                          bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    biz_day                                     date COMMENT '日期',
    sales_amount                                double COMMENT '销售额（元）',
    sales_volume                                bigint COMMENT '销售量',
    return_items                                bigint COMMENT '退货件数',
    return_amount                               double COMMENT '退货金额',
    return_rate                                 varchar(100) COMMENT '退货率',
    reject_items                                bigint COMMENT '拒收件数',
    reject_amount                               decimal(10, 2) COMMENT '拒收金额',
    reject_rate                                 varchar(100) COMMENT '拒收率',
    reject_return_items                         bigint COMMENT '拒退件数',
    reject_return_amount                        double COMMENT '拒退金额',
    reject_return_rate                          varchar(100) COMMENT '拒退率',
    exchange_items                              bigint COMMENT '换货件数',
    exchange_amount                             double COMMENT '换货金额',
    exchange_rate                               varchar(100) COMMENT '换货率',
    exposure_traffic                            bigint COMMENT '曝光流量',
    page_views                                  bigint COMMENT '浏览流量',
    product_detail_uv                           bigint COMMENT '商详UV',
    product_detail_value                        double COMMENT '商详UV价值',
    add_to_cart_users                           bigint COMMENT '加购人数',
    favorites_users                             bigint COMMENT '收藏人数',
    conversion_rate_from_view_to_add_to_cart    varchar(100) COMMENT '访问-加购转化率',
    sales_amount_1                              decimal(10, 2) COMMENT '销售额（备用）',
    sales_volume_1                              bigint COMMENT '销售量（备用）',
    customer_count                              bigint COMMENT '客户数',
    suborders                                   bigint COMMENT '子订单数',
    arpu_value                                  double COMMENT 'ARPU值（平均每用户收入）',
    conversion_rate_from_add_to_cart_to_payment varchar(100) COMMENT '加购-支付转化率',
    purchase_conversion_rate                    varchar(100) COMMENT '购买转化率',
    brand_name                                  varchar(255) COMMENT '品牌名称',
    created_by                                  varchar(100) NOT NULL COMMENT '插入人',
    shop_id                                     varchar(255) COMMENT '店铺ID',
    platform_name                               varchar(255) COMMENT '平台名称',
    created_at                                  timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                                  varchar(100) COMMENT '更新人',
    updated_at                                  timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                                          date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='唯品会-数据概览2.0';

CREATE TABLE ods.rpa_wph_product_details
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
    dt              date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='唯品会_商品明细';

CREATE TABLE ods.rpa_wph_promotion_fee
(
    id             bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    shop_id        varchar(255) COMMENT '店铺ID',
    account        varchar(255) COMMENT '账户',
    date           date COMMENT '日期',
    cash_income    double COMMENT '现金收入(元)',
    cash_expense   double COMMENT '现金支出(元)',
    reward_income  double COMMENT '奖励收入(元)',
    reward_expense double COMMENT '奖励支出(元)',
    remark         varchar(255) COMMENT '备注',
    shop_name      varchar(255) COMMENT '店铺',
    updated_at     timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    created_at     timestamp,
    created_by     varchar(10),
    updated_by     timestamp,
    dt             date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='唯品会-推广费';

CREATE TABLE ods.rpa_wph_supplier_inventory_report
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
    dt                        date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='唯品会_供应商平台_进销存报表';

CREATE TABLE ods.rpa_xhs_dandelion_consumer_discipline
(
    id                           bigint AUTO_INCREMENT COMMENT '主键id',
    biz_day                      timestamp    NOT NULL COMMENT '投放时间',
    partner_id                   varchar(255) COMMENT '合作id',
    transaction_amount           decimal(10, 2) COMMENT '交易金额',
    transaction_type             varchar(255) COMMENT '交易类型',
    transaction_type_description varchar(255) COMMENT '交易类型描述',
    partner_name                 varchar(255) COMMENT '合作方的名称',
    shop_id                      varchar(255) NOT NULL COMMENT '店铺id',
    created_by                   varchar(100) NOT NULL COMMENT '插入人',
    created_at                   timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                   varchar(100) COMMENT '更新人',
    updated_at                   timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                           date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='小红书_蒲公英_消费记录';

CREATE TABLE ods.rpa_xhs_estimated_commission_order
(
    id                           bigint AUTO_INCREMENT COMMENT '主键id',
    biz_day                      timestamp    NOT NULL COMMENT '支付时间',
    order_id                     varchar(50) COMMENT '订单ID',
    order_status                 varchar(50) COMMENT '订单状态',
    specification_name           varchar(255) COMMENT '规格名称',
    specification_id             varchar(50) COMMENT '规格ID',
    price                        decimal(10, 2) COMMENT '价格',
    influencer_name              varchar(100) COMMENT '达人名称',
    influencer_id                varchar(50) COMMENT '达人ID',
    merchant_received_amount     decimal(10, 2) COMMENT '商家实收金额',
    user_paid_amount             decimal(10, 2) COMMENT '用户实付金额',
    refund_amount                decimal(10, 2) COMMENT '退款金额',
    effective_sales_amount       decimal(10, 2) COMMENT '有效销售金额（计佣金额）',
    commission_rate              decimal(5, 2) COMMENT '佣金率',
    estimated_commission_expense decimal(10, 2) COMMENT '预估支出佣金',
    plan_type                    varchar(50) COMMENT '计划类型',
    promotion_channel            varchar(100) COMMENT '推广渠道',
    shop_id                      varchar(255) NOT NULL COMMENT '店铺id',
    created_by                   varchar(100) NOT NULL COMMENT '插入人',
    created_at                   timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                   varchar(100) COMMENT '更新人',
    updated_at                   timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                           date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='小红书预估佣金订单';

CREATE TABLE ods.rpa_xhs_order_inquiry
(
    id                       bigint AUTO_INCREMENT COMMENT '主键id',
    biz_day                  timestamp COMMENT '支付时间',
    order_id                 varchar(50)  NOT NULL COMMENT '订单号',
    order_status             varchar(50)  NOT NULL COMMENT '订单状态',
    after_sale_status        varchar(50) COMMENT '售后状态',
    order_type               varchar(50) COMMENT '订单类型',
    order_flag               varchar(50) COMMENT '订单标记',
    recipient_name           varchar(100) COMMENT '收件人姓名',
    recipient_phone          varchar(20) COMMENT '收件人电话',
    recipient_address        varchar(255) COMMENT '收件人地址',
    province                 varchar(50) COMMENT '省',
    city                     varchar(50) COMMENT '市',
    district                 varchar(50) COMMENT '区',
    area_code                varchar(50) COMMENT '区域编码',
    xiaohongshu_code         varchar(50) COMMENT '小红书编码',
    barcode                  varchar(50) COMMENT '条形码',
    specification_id         varchar(255) COMMENT '规格ID',
    sku_name                 varchar(255) COMMENT 'SKU名称',
    sku_specification        varchar(255) COMMENT 'SKU规格',
    sku_quantity             bigint COMMENT 'SKU件数',
    is_gift                  varchar(15) COMMENT '是否为赠品',
    invoice                  varchar(20) COMMENT '发票/Invoice',
    total_price              decimal(10, 2) COMMENT '商品总价(元)',
    user_paid_amount         decimal(10, 2) COMMENT '用户实付金额(元)',
    platform_discount        decimal(10, 2)        DEFAULT '0.00' COMMENT '平台优惠(元)',
    store_discount           decimal(10, 2)        DEFAULT '0.00' COMMENT '店铺优惠(元)',
    sku_price_change         decimal(10, 2)        DEFAULT '0.00' COMMENT 'SKU商家改价(元)',
    merchant_received_amount decimal(10, 2) COMMENT '商家实收金额(元)（支付金额）',
    payment_method           varchar(50) COMMENT '支付方式',
    payment_terms            varchar(50) COMMENT '支付期数',
    interest_fee             decimal(10, 2)        DEFAULT '0.00' COMMENT '利息费用',
    fee_bearer               varchar(50) COMMENT '手续费承担方',
    sku_net_weight           varchar(20) COMMENT 'sku净重(kg)',
    package_total_net_weight decimal(10, 2) COMMENT '包裹总净重(kg)',
    package_total_freight    decimal(10, 2) COMMENT '包裹总运费(元)',
    express_company          varchar(100) COMMENT '快递公司',
    express_number           varchar(50) COMMENT '快递单号',
    paint_marker             varchar(100) COMMENT '大头笔/Paint Marker',
    express_extend_1         varchar(100) COMMENT '集包地/Express Extend 1',
    express_extend_2         varchar(100) COMMENT '三段码/Express Extend 2',
    orderer_id_name          varchar(100) COMMENT '订购人身份证姓名/ID Name',
    orderer_id_number        varchar(20) COMMENT '订购人身份证号/ID Number',
    recipient_id_name        varchar(100) COMMENT '收件人身份证姓名',
    recipient_id_number      varchar(20) COMMENT '收件人身份证号',
    order_created_at         timestamp COMMENT '订单创建时间',
    pre_sale_start_time      varchar(255) COMMENT '预售订单开始发货时间',
    pre_sale_end_time        varchar(255) COMMENT '预售订单截止发货时间',
    promised_ship_time       timestamp COMMENT '承诺发货时间',
    shipped_at               timestamp COMMENT '订单发货时间',
    completed_at             timestamp COMMENT '订单完成时间',
    shipment_warehouse       varchar(100) NOT NULL COMMENT '发货仓库',
    confirm_receipt_type     varchar(50) COMMENT '确认收货类型',
    is_delayed_receipt       varchar(50) COMMENT '是否延迟收货',
    user_note                varchar(255) COMMENT '用户备注',
    package_note_flag        varchar(50) COMMENT '包裹备注标记',
    package_note_info        varchar(255) COMMENT '包裹备注信息',
    abnormal_reason          varchar(255) COMMENT '异常原因',
    store_name               varchar(255) NOT NULL COMMENT '店铺名称',
    user_id                  varchar(50) COMMENT '用户编号',
    freight_template_name    varchar(255) COMMENT '运费模版名称',
    logistics_plan_name      varchar(255) COMMENT '物流方案名称',
    third_party_order_id     varchar(50) COMMENT '第三方机构订单号',
    shop_id                  varchar(255) NOT NULL COMMENT '店铺id',
    created_by               varchar(100) NOT NULL COMMENT '插入人',
    created_at               timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by               varchar(100) COMMENT '更新人',
    updated_at               timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                       date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='小红书订单查询';

CREATE TABLE ods.rpa_xhs_spotlight_account_flow
(
    id              bigint AUTO_INCREMENT COMMENT '主键id',
    biz_day         timestamp    NOT NULL COMMENT '投放日期',
    operation_type  varchar(50) COMMENT '操作类型',
    business_type   varchar(50) COMMENT '业务类型',
    fund_type       varchar(50) COMMENT '资金类型',
    amount_occurred decimal(10, 2) COMMENT '发生金额',
    balance_after   decimal(10, 2) COMMENT '操作后的账户余额',
    operation_time  datetime COMMENT '操作发生的具体时间',
    remark          varchar(255) COMMENT '备注信息',
    account_name    varchar(255) NOT NULL COMMENT '账号名称',
    shop_id         varchar(255) NOT NULL COMMENT '店铺id',
    created_by      varchar(100) NOT NULL COMMENT '插入人',
    created_at      timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by      varchar(100) COMMENT '更新人',
    updated_at      timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    account_id      varchar(50) COMMENT '账号ID',
    dt              date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY
VALUE
(dt) COMMENT ='小红书_聚光_账户流水';

CREATE TABLE ods.rpa_hzw_transaction_info
(
    id                         bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    date                       date NOT NULL COMMENT '日期',
    visitor_count              bigint COMMENT '访客数',
    page_views                 bigint COMMENT '浏览量',
    order_customer_count       bigint COMMENT '下单客户数',
    order_count                bigint COMMENT '下单订单数',
    order_amount               decimal(10, 2) COMMENT '下单金额',
    order_product_count        bigint COMMENT '下单商品数',
    transaction_customer_count bigint COMMENT '成交客户数',
    transaction_order_count    bigint COMMENT '成交订单数',
    transaction_amount         double COMMENT '成交金额',
    transaction_product_count  bigint COMMENT '成交商品数',
    avg_transaction_amount     decimal(10, 4) COMMENT '客单价',
    shop_id                    varchar(50) COMMENT '店铺ID',
    platform_name              varchar(50) COMMENT '平台名称',
    created_by                 varchar(100) COMMENT '插入人',
    created_at                 timestamp DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                 varchar(100) COMMENT '更新人',
    updated_at                 timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                         date comment '分区日期',
    PRIMARY KEY (id, dt)
) COMMENT ='孩子王-交易信息';

CREATE TABLE ods.rpa_hzw_king_promotion
(
    id               bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    date             timestamp    NOT NULL COMMENT '日期',
    shop_id          varchar(50) COMMENT '店铺ID',
    platform_name    varchar(50) COMMENT '平台名称',
    project_name     varchar(50) COMMENT '项目名称',
    transaction_type varchar(50) COMMENT '交易类型',
    business_type    varchar(50) COMMENT '业务类型',
    account_type     varchar(50) COMMENT '账户类型',
    amount_kcoin     decimal(10, 2) COMMENT '金额（K币）',
    balance_kcoin    decimal(10, 2) COMMENT '余额（K币）',
    remark           varchar(255) COMMENT '备注',
    created_by       varchar(100) NOT NULL COMMENT '插入人',
    created_at       timestamp             DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by       varchar(100) COMMENT '更新人',
    updated_at       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt               date comment '分区日期',
    PRIMARY KEY (id, dt)
) COMMENT ='孩子王-推广';

CREATE TABLE ods.rpa_hzw_king_return_order
(
    id                          bigint AUTO_INCREMENT COMMENT '主键ID，自增',
    return_order_number         varchar(50)  NOT NULL COMMENT '退单号',
    order_number                bigint       NOT NULL COMMENT '订单号',
    application_time            timestamp    NOT NULL COMMENT '申请时间',
    after_sales_requirements    varchar(255) COMMENT '售后要求',
    SKUID                       varchar(255) COMMENT 'SKUID',
    product_name                varchar(100) NOT NULL COMMENT '商品名称',
    order_quantity              bigint COMMENT '订单数量',
    requested_return_quantity   bigint COMMENT '申请退货数量',
    actual_return_quantity      bigint COMMENT '实际退货数量',
    requested_exchange_quantity bigint COMMENT '申请换货数量',
    payment_amount              decimal(10, 2) COMMENT '支付金额（元）',
    refund_amount               decimal(10, 2) COMMENT '退款金额（元）',
    shipping_fee                bigint COMMENT '运费',
    return_order_status         varchar(50)  NOT NULL COMMENT '退单状态',
    return_reason               varchar(255) COMMENT '退货原因',
    tracking_number             varchar(50) COMMENT '运单号',
    courier_company             varchar(50) COMMENT '快递公司',
    shop_id                     varchar(50) COMMENT '店铺ID',
    platform_name               varchar(50) COMMENT '平台名称',
    created_by                  varchar(100) NOT NULL COMMENT '插入人',
    created_at                  timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by                  varchar(100) COMMENT '更新人',
    updated_at                  timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    dt                          date comment '分区日期',
    PRIMARY KEY (id, dt)
) COMMENT ='孩子王-退单';

CREATE TABLE ods.rpa_jky_shop_ref
(
    shop_id              varchar comment '店铺账户id',
    shop_name            varchar comment '店铺名称',
    promotion_account_id varchar comment '推广账户id，没有怎么为空',
    jky_shop_id          varchar comment '吉客云店铺id',
    jky_shop_name        varchar comment '吉客云店铺名称',
    jky_cate             int comment '业务分类',
    jdy_channel          varchar comment '所属渠道',
    jky_promotion_id     int comment '推广账户id',
    created_by           varchar comment '插入人',
    created_at           timestamp comment '插入时间',
    updated_by           varchar comment '更新人',
    updated_at           timestamp comment '更新时间',
    dt                   date comment '分区日期',
    primary key (shop_id, shop_name, dt)
) PARTITION BY
VALUE
(dt) comment '吉客云店铺关联关系表';

CREATE TABLE ods.tmp_ks_order
(
    order_id      varchar comment '订单号',
    business_cate varchar comment '业务分类',
    pay_time      date comment '订单支付时间',
    order_status  varchar comment '订单状态',
    payment       decimal(10, 2) comment '实付款'
) comment '临时取数表_单号快手米粉直播间区分业务分类7.6';

CREATE TABLE ods.ods.rpa_fs_ly_pos_data (
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
    dt                    date comment '分区日期',
    PRIMARY KEY (id, dt)
) PARTITION BY VALUE(dt) COMMENT='飞书_乐友POS数据';

CREATE TABLE ods.rpa_syyz_order_details (
    shop_id                             varchar(20) NOT NULL COMMENT '店铺id',
    order_id                            varchar(50) COMMENT '订单号',
    product_name                        varchar(255) COMMENT '商品名称',
    buyer_payment_time                  datetime COMMENT '买家付款时间',
    transaction_success_time            datetime COMMENT '交易成功时间',
    recipient_or_picker                 varchar(100) COMMENT '收货人/提货人',
    recipient_or_picker_phone           varchar(20) COMMENT '收货人手机号/提货人手机号',
    recipient_province                  varchar(100) COMMENT '收货人省份',
    recipient_city                      varchar(100) COMMENT '收货人城市',
    recipient_district                  varchar(100) COMMENT '收货人地区',
    detailed_delivery_or_pickup_address varchar(200) COMMENT '详细收货地址/提货地址',
    order_product_status                varchar(50) COMMENT '订单商品状态',
    product_specification               varchar(50) COMMENT '商品规格',
    product_specification_id            varchar(50) COMMENT '商品规格ID',
    specification_code                  varchar(50) COMMENT '规格编码',
    product_code                        varchar(50) COMMENT '商品编码',
    product_barcode                     varchar(50) COMMENT '商品条码',
    product_quantity                    int COMMENT '商品数量',
    product_actual_transaction_amount   decimal(10, 2) COMMENT '商品实际成交金额',
    product_refund_status               varchar(50) COMMENT '商品退款状态',
    product_refunded_amount             decimal(10, 2) COMMENT '商品已退款金额',
    product_cost_price                  decimal(10, 2) COMMENT '商品成本价',
    product_id                          varchar(50) COMMENT '商品ID',
    created_by                          varchar(50),
    updated_by                          varchar(50),
    created_at                          timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    updated_at                          timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    dt                                    date comment '分区日期'
) PARTITION BY VALUE(dt) COMMENT='有赞-微商城-订单-订单查询-订单管理-分销买家订单';



