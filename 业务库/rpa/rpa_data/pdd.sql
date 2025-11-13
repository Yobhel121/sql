#*********************************** 拼多多 ***********************************

CREATE TABLE pdd_after_sales_data
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
    PRIMARY KEY (id)
) COMMENT ='拼多多售后数据';

CREATE TABLE pdd_after_sales_shop_star_rating
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
    PRIMARY KEY (id)
) COMMENT ='拼多多售后店铺星级';

CREATE TABLE pdd_ddjb_promotion_expenses
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
    PRIMARY KEY (id)
) COMMENT ='多多进宝推广费';

CREATE TABLE pdd_operate_overview
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
    PRIMARY KEY (id)
) COMMENT ='拼多多经营总览';

CREATE TABLE pdd_pre_sales_sales_data
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
    PRIMARY KEY (id)
) COMMENT ='拼多多售前销售数据';

CREATE TABLE pdd_pre_sales_service_data
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
    PRIMARY KEY (id)
) COMMENT ='拼多多售前服务数据';

CREATE TABLE pdd_pre_sales_team_conversion_rate
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
    PRIMARY KEY (id)
) COMMENT ='拼多多售前团队数据(转化率)';

CREATE TABLE pdd_pre_sales_team_data
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
    PRIMARY KEY (id)
) COMMENT ='拼多多售前团队数据';

CREATE TABLE pdd_promotion_expenses
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
    PRIMARY KEY (id)
) COMMENT ='拼多多推广费用';



select '海豚智投-短视频-财务报表',
       'htzt_finance',
       COLUMN_NAME,
       DATA_TYPE,
       COLUMN_COMMENT,
       CHARACTER_MAXIMUM_LENGTH
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME = 'htzt_finance';

