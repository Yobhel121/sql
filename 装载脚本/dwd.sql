CREATE TABLE dwd.fin_tb_trans_log
(
    shop_id         varchar COMMENT '店铺id',
    operate_time    TIMESTAMP COMMENT '操作时间',
    trans_amount    decimal(10, 2) COMMENT '交易金额(元)',
    account_type    VARCHAR COMMENT '账户类型',
    fund_type       VARCHAR COMMENT '资金类型',
    trans_type      VARCHAR COMMENT '流水类型',
    account_balance decimal(10, 2) COMMENT '帐户余额(元)',
    operate_remark  VARCHAR COMMENT '操作备注',
    dt            date COMMENT '分区字段'
)PARTITION BY VALUE(dt) comment '财务域-品牌营销流水明细';
insert OVERWRITE dwd.fin_tb_trans_log
    select
    shop_id
    ,operate_time
    ,trans_amount
    ,account_type
    ,fund_type
    ,trans_type
    ,account_balance
    ,operate_remark
    ,'2024-10-13'
from(select *,row_number() over (partition by operate_time order by dt desc) n from ods.rpa_tb_trans_log)t1
where n = 1;

CREATE TABLE dim.tb_cold_product
(
    shop_id                varchar COMMENT '店铺id',
    product_id             VARCHAR COMMENT '商品ID',
    product_name           VARCHAR COMMENT '商品名称',
    status                 VARCHAR COMMENT '状态',
    temperature_chain_flag VARCHAR COMMENT '常温冷链标识',
    dt            date COMMENT '分区字段'
)PARTITION BY VALUE(dt) comment '商品域-淘宝冷链商品表';
insert OVERWRITE dim.tb_cold_product
    select
    shop_id
    ,product_id
    ,product_name
    ,status
    ,temperature_chain_flag
    ,'2024-11-19'
from(select *,row_number() over (partition by product_id order by dt desc) n from ods.rpa_tb_cold_product)t1
where n = 1;


CREATE TABLE dwd.trd_tb_unpaid_order
(
    shop_id               varchar COMMENT '店铺id',
    main_order_id         VARCHAR COMMENT '淘宝主订单号',
    sub_order_id          VARCHAR COMMENT '淘宝子订单号',
    product_id            VARCHAR COMMENT '商品ID',
    product_name          VARCHAR COMMENT '商品名称',
    temperature_chain_flag VARCHAR COMMENT '常温冷链标识',
    create_time           TIMESTAMP COMMENT '订单创建时间',
    pay_time              TIMESTAMP COMMENT '订单支付时间',
    complete_time         VARCHAR COMMENT '订单完结时间',
    status                VARCHAR COMMENT '订单状态',
    actual_pay_amount     decimal(10, 2) COMMENT '订单实付金额',
    refund_amount         decimal(10, 2) COMMENT '订单退款金额',
    order_cate            VARCHAR COMMENT '订单业务分类',
    dt            date COMMENT '分区字段'
)PARTITION BY VALUE(dt) comment '交易域-淘宝未结算订单数据';
insert OVERWRITE dwd.trd_tb_unpaid_order
select
        t1.shop_id
        ,main_order_id
        ,sub_order_id
        ,t1.product_id
        ,t1.product_name
        ,case when temperature_chain_flag is not null then '冷链' else'常温' end
        ,create_time
        ,pay_time
        ,case when length(complete_time) = 1 then null when length(complete_time) <= 15 then DATE_FORMAT(complete_time, '%Y-%m-%d %H:%i:%s') else complete_time end
        ,t1.status
        ,actual_pay_amount
        ,refund_amount
        ,case when t1.shop_id = '186243644' then '馋哆啦天猫-达人直播'
            when t1.shop_id != '186243644' and expert_nickname like '%李佳琦%' then '天猫-李佳琦达播'
            when t1.shop_id != '186243644' and pay_time <= '2024-03-01' then '天猫-达人直播'
            else '天猫-KOC达播' end
        ,'2024-10-13'
from (
    select
        *
    from (
        select *, row_number() over (partition by main_order_id,sub_order_id,product_id order by created_at desc) n from ods.rpa_tb_unpaid_order
    ) tmp
    where n = 1
)t1
left join(select * from dim.tb_cold_product where dt = '2024-10-13') t2 on t1.product_id = t2.product_id;

CREATE TABLE dwd.fin_tb_unpaid_order_commission
(
    shop_id                varchar COMMENT '店铺id',
    main_order_id          VARCHAR COMMENT '淘宝主订单号',
    sub_order_id           VARCHAR COMMENT '淘宝子订单号',
    product_id             VARCHAR COMMENT '商品ID',
    product_name           VARCHAR COMMENT '商品名称',
    temperature_chain_flag VARCHAR COMMENT '常温冷链标识',
    status                 VARCHAR COMMENT '订单状态',
    commission_amount      decimal(10, 2) COMMENT '订单计佣金额',
    estimated_commission   decimal(10, 2) COMMENT '预估佣金',
    create_time            timestamp comment '订单创建时间',
    pay_time               timestamp comment '订单支付时间',
    complete_time          varchar comment '订单完结时间',
    order_cate             VARCHAR COMMENT '订单业务分类',
    dt                     date COMMENT '分区字段'
)PARTITION BY VALUE(dt) comment '财务域-淘宝未结算订单佣金数据';
insert OVERWRITE dwd.fin_tb_unpaid_order_commission
select
    t1.shop_id
    ,main_order_id
    ,sub_order_id
    ,t1.product_id
    ,t1.product_name
    ,nvl(temperature_chain_flag,'常温')
    ,t1.status
    ,commission_amount
    ,estimated_commission
    ,create_time
    ,pay_time
    ,complete_time
    ,case when t1.shop_id = '186243644' then '馋哆啦天猫-达人直播'
    when t1.shop_id != '186243644' and expert_nickname like '%李佳琦%' then '天猫-李佳琦达播'
    when t1.shop_id != '186243644' and pay_time <= '2024-03-01' then '天猫-达人直播'
    else '天猫-KOC达播' end
    ,'2024-10-13'
from(
    select
        *
    from(select *,row_number() over (partition by main_order_id,sub_order_id,product_id order by dt desc) n from ods.rpa_tb_unpaid_order)tmp
    where n = 1
) t1 left join(select * from dim.tb_cold_product where dt = '2024-10-13') t2 on t1.product_id = t2.product_id;

CREATE TABLE dwd.fin_tb_promotion
(
    shop_id                         varchar COMMENT '店铺id',
    biz_day                         date COMMENT '日期',
    ztc_cost                        decimal(10, 2) COMMENT '直通车花费',
    ylmf_cost                       decimal(10, 2) COMMENT '引力魔方花费',
    wxt_cost                        decimal(10, 2) COMMENT '万相台花费',
    affiliate_commission            decimal(10, 2) COMMENT '淘宝客佣金',
    cps_cost                        decimal(10, 2) COMMENT 'cps支出金额',
    tbk_settle_amount               decimal(10, 2) COMMENT '淘宝客-结算金额',
    tbk_cost                        decimal(10, 2) COMMENT '淘宝客-结算佣金支出',
    dt                              date comment '分区日期'
) PARTITION BY VALUE(dt) COMMENT ='财务域-淘宝店铺推广';
insert OVERWRITE dwd.fin_tb_promotion
    select
    t1.shop_id
    ,t1.biz_day
    ,direct_traffic_cost
    ,gravity_cube_cost
    ,wxt_cost
    ,affiliate_commission
    ,expense_amount
    ,cast(settle_amount as decimal(10, 2))
    ,cast(commission_expense as decimal(10, 2))
    ,'2024-10-13'
from(
    select
        *
    from(
        select
            *,row_number() over (partition by shop_id,biz_day order by dt desc) n
        from ods.rpa_tb_operate_window
    )tmp where n = 1
) t1 left join(
    select
        *
    from(
        select
            *,row_number() over (partition by shop_id,biz_day order by dt desc) n
        from ods.rpa_tb_cps_account_fee
    )tmp where n = 1
) t2 on t1.shop_id = t2.shop_id and t1.biz_day = t2.biz_day
left join(
    select
        *
    from(
        select
            *,row_number() over (partition by shop_id,biz_day order by dt desc) n
        from ods.rpa_tb_settle_overview
    )tmp where n = 1
) t3 on t1.shop_id = t3.shop_id and t1.biz_day = t3.biz_day;

CREATE TABLE dwd.fin_tb_account_fee
(
    shop_id             varchar COMMENT '店铺id',
    record_time         TIMESTAMP COMMENT '记账时间',
    trans_date          DATE COMMENT '交易日期',
    income_expense_type VARCHAR COMMENT '收支类型',
    trans_type          VARCHAR COMMENT '交易类型',
    trans_amount        decimal(10, 2) COMMENT '操作金额(元)',
    after_amount        decimal(10, 2) COMMENT '操作后余额(元)',
    remark              VARCHAR COMMENT '备注',
    dt                              date comment '分区日期'
) PARTITION BY VALUE(dt) COMMENT ='财务域-淘宝账户明细';
insert OVERWRITE dwd.fin_tb_account_fee
    select
    shop_id
    ,record_time
    ,trans_date
    ,income_expense_type
    ,trans_type
    ,trans_amount
    ,after_amount
    ,remark
    ,'2024-10-13'
from(select *,row_number() over (partition by shop_id,record_time order by dt desc) n from ods.rpa_tb_account_fee)t1
where n = 1;

CREATE TABLE dwd.fin_tb_paid_order_commission
(
    shop_id                   varchar COMMENT '店铺id',
    confirmation_time         timestamp comment '确认收货时间',
    account_expense_time      timestamp comment '账户支出时间',
    affiliate_settlement_time timestamp comment '淘客结算时间',
    create_time               timestamp comment '创建时间',
    main_order_id             VARCHAR COMMENT '淘宝主订单号',
    sub_order_id              VARCHAR COMMENT '淘宝子订单号',
    product_id                VARCHAR COMMENT '商品ID',
    product_name              VARCHAR COMMENT '商品名称',
    temperature_chain_flag    VARCHAR COMMENT '常温冷链标识',
    commission_rate           VARCHAR COMMENT '佣金比例',
    commission                decimal(10, 2) COMMENT '佣金',
    service_fee_rate          VARCHAR COMMENT '服务费率',
    service_fee_amount        decimal(10, 2) COMMENT '服务费金额',
    dt                        date COMMENT '分区字段'
)PARTITION BY VALUE(dt) comment '财务域-淘宝已结算订单佣金数据';
insert OVERWRITE dwd.fin_tb_paid_order_commission
select
    t1.shop_id
    ,confirmation_time
    ,account_expense_time
    ,affiliate_settlement_time
    ,create_time
    ,parent_order_id
    ,sub_order_id
    ,t1.product_id
    ,t1.product_name
    ,nvl(temperature_chain_flag,'常温')
    ,commission_rate
    ,commission
    ,service_fee_rate
    ,service_fee_amount
    ,'2024-10-13'
from(
    select
        *
    from(select *,row_number() over (partition by parent_order_id,sub_order_id,product_id order by dt desc) n from ods.rpa_tb_cps_order)tmp
    where n = 1
) t1 left join(
    select * from dim.tb_cold_product where dt = '2024-10-13'
) t2 on t1.product_id = t2.product_id;

CREATE TABLE dwd.fin_tb_living_sale_commission
(
    biz_day                date COMMENT '日期',
    shop_id                varchar COMMENT '店铺id',
    product_id             VARCHAR COMMENT '商品ID',
    product_name           VARCHAR COMMENT '商品名称',
    pay_commission         decimal(10, 2) COMMENT '付款佣金支出',
    pay_commission_rate    VARCHAR COMMENT '付款佣金率',
    settle_order_cnt       BIGINT COMMENT '结算笔数',
    settle_amount          decimal(10, 2) COMMENT '结算金额',
    settle_commission      decimal(10, 2) COMMENT '结算佣金支出',
    settle_commission_rate VARCHAR COMMENT '结算佣金率',
    dt                     date comment '分区日期'
) PARTITION BY VALUE(dt) COMMENT ='财务域-淘宝客达播佣金';
insert OVERWRITE dwd.fin_tb_living_sale_commission
select
    biz_day
    ,shop_id
    ,product_id
    ,product_name
    ,pay_commission
    ,pay_commission_rate
    ,settle_order_cnt
    ,settle_amount
    ,settle_commission
    ,settle_commission_rate
    ,'2024-10-13'
from
    (select *,row_number() over (partition by biz_day,product_id order by dt desc) n from ods.rpa_tb_living_sale)tmp
where n = 1;

CREATE TABLE dwd.trd_tb_living
(
    shop_id                varchar COMMENT '店铺id',
    living_title           varchar COMMENT '直播标题',
    living_start_time      timestamp COMMENT '开播时间',
    session_id             bigint COMMENT '场次ID',
    substitute_anchor_name varchar COMMENT '代播主播名称',
    product_id             bigint COMMENT '商品ID',
    product_title          varchar COMMENT '商品标题',
    product_first_cate     varchar COMMENT '商品一级类目',
    parent_order_id        varchar COMMENT '父订单',
    sub_order_id           varchar COMMENT '子订单',
    order_time             timestamp COMMENT '下单时间',
    pay_time               timestamp COMMENT '支付时间',
    pay_amount             decimal(10, 2) COMMENT '支付金额',
    confirm_time           varchar COMMENT '确认收货时间',
    confirm_amount         varchar COMMENT '确认收货金额',
    refund_amount          varchar COMMENT '退款金额',
    refund_success_time    varchar COMMENT '退款成功时间',
    substitute_id          varchar COMMENT '代播ID',
    order_cate             VARCHAR COMMENT '订单业务分类',
    dt                     date comment '分区日期'
) PARTITION BY VALUE(dt) COMMENT ='订单域-淘宝直播订单';
insert OVERWRITE dwd.trd_tb_living
select
    t1.shop_id
    ,living_title
    ,living_start_time
    ,session_id
    ,substitute_anchor_name
    ,t1.product_id
    ,product_title
    ,product_first_cate
    ,case when temperature_chain_flag is not null then '冷链' else'常温' end
    ,parent_order_id
    ,sub_order_id
    ,order_time
    ,pay_time
    ,pay_amount
    ,if(confirm_time in('-',''),null,confirm_time)
    ,if(confirm_amount in('-',''),null,cast(confirm_amount as DECIMAL(10,2)))
    ,if(refund_amount in('-',''),null,cast(refund_amount as DECIMAL(10,2)))
    ,if(refund_success_time in('-',''),null,refund_success_time)
    ,if(substitute_id in('-',''),null,substitute_id)
    , '天猫-自播'
    ,'2024-10-13'
from (
    select
        *
    from (
        select
            *,row_number() over (partition by sub_order_id,product_id order by dt desc) n
        from ods.rpa_tb_tm_living_sale
    ) tmp
    where n = 1
)t1
left join(select * from dim.tb_cold_product where dt = '2024-10-13') t2 on t1.product_id = t2.product_id;

CREATE TABLE dwd.fin_tb_promotion_report
(
    biz_day                       date COMMENT '日期',
    shop_id                       varchar COMMENT '店铺id',
    scene_id                      BIGINT COMMENT '场景ID',
    scene_name                    VARCHAR COMMENT '场景名字',
    campaign_id                   BIGINT COMMENT '计划ID',
    campaign_name                 VARCHAR COMMENT '计划名字',
    unit_id                       BIGINT COMMENT '单元ID',
    unit_name                     VARCHAR COMMENT '单元名字',
    subject_id                    BIGINT COMMENT '主体ID',
    subject_type                  VARCHAR COMMENT '主体类型',
    subject_name                  VARCHAR COMMENT '主体名称',
    cost                          decimal(10, 2) COMMENT '花费',
    avg_click_cost                VARCHAR COMMENT '平均点击花费',
    thousand_impression_cost      decimal(10, 2) COMMENT '千次展现花费',
    dt                     date comment '分区日期'
) PARTITION BY VALUE(dt) COMMENT ='财务域-淘宝单元报表花费情况';
insert OVERWRITE dwd.fin_tb_promotion_report
select
    biz_day
    ,shop_id
    ,scene_id
    ,scene_name
    ,campaign_id
    ,campaign_name
    ,unit_id
    ,unit_name
    ,subject_id
    ,subject_type
    ,subject_name
    ,cost
    ,avg_click_cost
    ,thousand_impression_cost
    ,'2024-10-13'
from
    (select *,row_number() over (partition by biz_day,shop_id,scene_id,campaign_id,unit_id order by dt desc) n from ods.rpa_tb_promotion_report)tmp
where n = 1;

CREATE TABLE fin_tb_account_report
(
    biz_day                        date COMMENT '日期',
    shop_id                        varchar COMMENT '店铺id',
    scene_id                       BIGINT COMMENT '场景ID',
    scene_name                     VARCHAR COMMENT '场景名字',
    cost                           decimal(10, 2) COMMENT '花费',
    dt                     date comment '分区日期'
) PARTITION BY VALUE(dt) COMMENT ='财务域-淘宝场景花费情况';
insert OVERWRITE dwd.fin_tb_account_report
select
    biz_day
    ,shop_id
    ,scene_id
    ,scene_name
    ,cost
    ,'2024-10-13'
from
    (select *,row_number() over (partition by biz_day,shop_id,scene_id order by dt desc) n from ods.rpa_tb_account_report)tmp
where n = 1;

CREATE TABLE fin_tb_coupon_usage
(
    biz_day        date COMMENT '记账日期',
    shop_id        varchar COMMENT '店铺id',
    shop_name      VARCHAR COMMENT '店铺',
    coupon_name    VARCHAR COMMENT '优惠券名称',
    coupon_type    VARCHAR COMMENT '券类型',
    usage_method   VARCHAR COMMENT '使用方式',
    operate_amount decimal(10, 2) COMMENT '操作金额(元)',
    remark         VARCHAR(500) COMMENT '备注',
    dt                     date comment '分区日期'
) PARTITION BY VALUE(dt) COMMENT ='财务域-淘宝优惠券花费明细';
insert OVERWRITE dwd.fin_tb_coupon_usage
select
    biz_day
    ,shop_id
    ,shop_name
    ,coupon_name
    ,coupon_type
    ,usage_method
    ,operate_amount
    ,remark
    ,'2024-10-13'
from
    (select *,row_number() over (partition by biz_day,shop_id,coupon_name order by dt desc) n from ods.rpa_tb_coupon_usage)tmp
where n = 1;

CREATE TABLE dwd.fin_tb_special_trans
(
    shop_id              varchar COMMENT '店铺id',
    shop_name            VARCHAR COMMENT '店铺',
    account_time         TIMESTAMP COMMENT '记账时间',
    special_fund_id      BIGINT COMMENT '专款ID',
    income_expense_type  VARCHAR COMMENT '收支类型',
    trans_type           VARCHAR COMMENT '交易类型',
    special_fund_type    VARCHAR COMMENT '专款类型',
    operate_amount       decimal(10, 2) COMMENT '操作金额(元)',
    market_fund_amount   decimal(10, 2) COMMENT '营销专款（元）',
    cash_fund_amount     decimal(10, 2) COMMENT '现金专款（元）',
    after_operate_amount decimal(10, 2) COMMENT '操作后余额(元)',
    remark               VARCHAR(500) COMMENT '备注',
    dt                   date comment '分区日期'
) PARTITION BY VALUE(dt) COMMENT ='财务域-淘宝账户专款现金交易';
insert OVERWRITE dwd.fin_tb_special_trans
select
    shop_id
    ,shop_name
    ,account_time
    ,special_fund_id
    ,income_expense_type
    ,trans_type
    ,special_fund_type
    ,operate_amount
    ,market_fund_amount
    ,cash_fund_amount
    ,after_operate_amount
    ,remark
    ,'2024-10-13'
from
    (select *,row_number() over (partition by shop_id,account_time order by dt desc) n from ods.rpa_tb_special_trans)tmp
where n = 1;

CREATE TABLE dwd.trd_tb_operate_window
(
    biz_day                         date                                        null comment '日期',
    shop_id                         varchar charset utf8                   null comment '店铺id',
    pay_amount                      double                                      null comment '支付金额',
    visit_cnt                       bigint                                      null comment '访客数',
    pay_conversion_rate             varchar charset utf8                   null comment '支付转化率',
    avg_customer_price              decimal(10, 2)                              null comment '客单价',
    suc_refund_amount               decimal(10, 2)                              null comment '成功退款金额',
    pay_customer_num                bigint                                      null comment '支付买家数',
    old_customer_repurchase_rate    varchar charset utf8                   null comment '老客复购率',
    pay_old_customer_num            bigint                                      null comment '支付老买家数',
    old_customer_pay_amount         decimal(10, 2)                              null comment '老买家支付金额',
    pay_suborder_cnt                bigint                                      null comment '支付子订单数',
    pay_item_cnt                    bigint                                      null comment '支付件数',
    cart_user_num                   bigint                                      null comment '加购人数',
    cart_item_cnt                   bigint                                      null comment '加购件数',
    product_collect_num             bigint                                      null comment '商品收藏人数',
    page_view                       bigint                                      null comment '浏览量',
    dt                              date                                        null comment '分区日期'
) PARTITION BY VALUE(dt) COMMENT ='订单域-店铺运营视窗表';
insert OVERWRITE dwd.trd_tb_operate_window
select
    biz_day
    ,shop_id
    ,pay_amount
    ,visit_cnt
    ,pay_conversion_rate
    ,avg_customer_price
    ,suc_refund_amount
    ,pay_customer_num
    ,old_customer_repurchase_rate
    ,pay_old_customer_num
    ,old_customer_pay_amount
    ,pay_suborder_cnt
    ,pay_item_cnt
    ,cart_user_num
    ,cart_item_cnt
    ,product_collect_num
    ,page_view
    ,'2024-10-13'
from(
    select
        *,row_number() over (partition by shop_id,biz_day order by dt desc) n
    from ods.rpa_tb_operate_window
)tmp where n = 1;

CREATE TABLE dwd.cs_tb_service_metrics
(
    shop_id                         varchar COMMENT '店铺id',
    biz_day                         date COMMENT '日期',
    service_metric                  VARCHAR COMMENT '服务指标',
    metric_performance              VARCHAR COMMENT '指标表现',
    comparison_with_previous_period VARCHAR COMMENT '环比',
    industry_average                VARCHAR COMMENT '同行同层均值',
    industry_excellent              VARCHAR COMMENT '同行同层优秀',
    dt                              date comment '分区日期'
) PARTITION BY VALUE(dt) COMMENT ='客服域-淘宝售后服务';
insert OVERWRITE dwd.cs_tb_service_metrics
select
    shop_id
    ,biz_day
    ,service_metric
    ,metric_performance
    ,comparison_with_previous_period
    ,industry_average
    ,industry_excellent
    ,'2024-10-13'
from
    (select *,row_number() over (partition by shop_id,biz_day order by dt desc) n from ods.rpa_tb_service_metrics)tmp
where n = 1;

CREATE TABLE dwd.cs_tb_assessment
(
    shop_id              varchar COMMENT '店铺id',
    biz_day              date COMMENT '日期',
    assessment_dimension VARCHAR COMMENT '考核维度',
    assessment_score     DOUBLE COMMENT '考核得分',
    experience_metric    VARCHAR COMMENT '体验指标',
    metric_score         VARCHAR COMMENT '指标得分',
    metric_value         VARCHAR COMMENT '指标值',
    standard             VARCHAR COMMENT '2分/3分/4分/5分标准',
    dt                   date comment '分区日期'
) PARTITION BY VALUE(dt) COMMENT ='客服域-淘宝考核';
insert OVERWRITE dwd.cs_tb_assessment
select
    shop_id
    ,biz_day
    ,assessment_dimension
    ,assessment_score
    ,experience_metric
    ,metric_score
    ,metric_value
    ,standard
    ,'2024-10-13'
from
    (select *,row_number() over (partition by shop_id,biz_day order by dt desc) n from ods.rpa_tb_assessment)tmp
where n = 1;

CREATE TABLE dwd.cs_tb_experience_score
(
    shop_id          varchar COMMENT '店铺id',
    biz_day          date COMMENT '日期',
    experience_score DOUBLE COMMENT '店铺综合体验分',
    dt                   date comment '分区日期'
) PARTITION BY VALUE(dt) COMMENT ='客服域-淘宝店铺综合体验分';
insert OVERWRITE dwd.cs_tb_experience_score
select
    shop_id
    ,biz_day
    ,experience_score
    ,'2024-10-13'
from
    (select *,row_number() over (partition by shop_id,biz_day order by dt desc) n from ods.rpa_tb_experience_score)tmp
where n = 1;

CREATE TABLE dwd.cs_tb_ww_satisfaction
(
    shop_id              varchar COMMENT '店铺id',
    biz_day              date COMMENT '日期',
    service_satisfaction VARCHAR COMMENT '服务满意度',
    industry_excellent   VARCHAR COMMENT '同行同层优秀',
    team_standard        VARCHAR COMMENT '团队标准',
    dt                   date comment '分区日期'
) PARTITION BY VALUE(dt) COMMENT ='客服域-淘宝旺旺满意度';
insert OVERWRITE dwd.cs_tb_ww_satisfaction
select
    shop_id
    ,biz_day
    ,service_satisfaction
    ,industry_excellent
    ,team_standard
    ,'2024-10-13'
from
    (select *,row_number() over (partition by shop_id,biz_day order by dt desc) n from ods.rpa_tb_ww_satisfaction)tmp
where n = 1;


create table dwd.trd_erp_pay_order_sku
(
    erp                           varchar COMMENT 'erp系统',
    trade_no                      varchar COMMENT '订单编号',
    trade_id                      varchar COMMENT '外部编码',
    plt_trade_no                  varchar COMMENT '网店订单号',
    is_ex                         int COMMENT '是否异常订单，1：是，0：否',
    shop_id                       varchar COMMENT '销售渠道id',
    shop_name                     varchar COMMENT '销售渠道',
    shop_code                     varchar COMMENT '销售渠道Code(原始)',
    new_shop_code                 varchar COMMENT '新销售渠道Code',
    new_shop_name                 varchar COMMENT '新销售渠道名称',
    goods_no                      varchar COMMENT '货品编号',
    goods_name                    varchar COMMENT '货品名称',
    goods_tags                    varchar COMMENT '货品标签',
    sku_id                        varchar COMMENT '规格ID',
    sku_name                      varchar COMMENT 'sku名称',
    plat_sku_id                   varchar COMMENT '外部货品编码',
    is_fit                        int COMMENT '组合装标记',
    is_gift                       int COMMENT '赠品标记',
    gift_flag                     varchar COMMENT '赠品标识:尝鲜装赠品，NS赠品，非食赠品，正装赠品',
    plat_author_id                varchar COMMENT '平台主播id',
    plat_author_name              varchar COMMENT '平台主播名称',
    product_price                 double COMMENT '商品单价',
    product_cost                  double COMMENT '商品成本',
    sell_count                    double COMMENT '销售数量',
    tax_fee                       double COMMENT '税额',
    customer_code                 varchar COMMENT '客户编号',
    customer_account              varchar COMMENT '客户账号',
    send_shop_scenario            varchar COMMENT '寄样场景',
    seller_memo                   varchar COMMENT '客服备注',
    buyer_memo                    varchar COMMENT '买家备注',
    append_memo                   varchar COMMENT '追加备注',
    trade_type                    varchar COMMENT '订单类型(数值版)',
    trade_type_explain            varchar COMMENT '订单类型(文本版本)',
    trade_status                  varchar COMMENT '销售单状态(数值版)',
    trade_status_explain          varchar COMMENT '销售单状态(文本版)',
    order_time                    datetime COMMENT '下单时间',
    pay_time                      datetime COMMENT '支付时间',
    send_time                     datetime COMMENT '发货时间',
    delivery_time                 datetime COMMENT '收货时间',
    cancel_time                   datetime COMMENT '取消时间',
    rfd_time                      datetime COMMENT '退款时间',
    country                       varchar COMMENT '国家',
    state                         varchar COMMENT '省',
    city                          varchar COMMENT '城市',
    district                      varchar COMMENT '区县',
    town                          varchar COMMENT '街道',
    zip                           varchar COMMENT '邮编',
    warehouse_code                varchar COMMENT '发货仓库编码',
    warehouse_name                varchar COMMENT '发货仓库名称',
    is_cod_warehouse              varchar COMMENT '是否冷链仓',
    discount_fee                  double COMMENT '优惠金额',
    payment                       double COMMENT '应收金额',
    coupon_fee                    double COMMENT '平台优惠',
    received_total                double COMMENT '已收金额',
    discount_total                double COMMENT '优惠总金额',
    goods_plat_discount_fee       double COMMENT '货品平台优惠',
    divide_sell_total             double COMMENT '实付总金额',
    share_order_discount_fee      double COMMENT '订单商品优惠分摊',
    share_order_plat_discount_fee double COMMENT '订单平台优惠分摊',
    share_favourable_fee          double COMMENT '分摊金额',
    share_favourable_after_fee    double COMMENT '分摊后金额',
    order_cate                    varchar COMMENT '平台订单业务分类',
    product_cate                  varchar COMMENT '平台商品业务分类',
    account_cate                  varchar COMMENT '平台账户业务分类',
    business_cate                 varchar COMMENT '业务分类',
    dt                            date COMMENT '分区日期'
)PARTITION BY VALUE(dt) comment '交易域-吉客云&聚水潭订单支付表';


insert OVERWRITE dwd.trd_erp_pay_order_sku
select
     'jky' as erp
     , j_order.trade_no
     , j_order.trade_id
     , order_sku.plat_order_id
     , if(internal_order_number is not null, 1, 0)
     , j_order.shop_id
     , j_order.shop_name
     , channel_code
     , case when channel_code = '14312172' and plat_author_id is not null then '11207381' else channel_code end new_channel_code
     , order_sku.goods_no
     , order_sku.goods_name
     , flag_names
     , order_sku.sku_id
     , order_sku.sku_name
     , order_sku.plat_sku_id
     , cast(is_fit as int)
     , cast(is_gift as int)
     , gift_flag
     , plat_author_id
     , plat_author_name
     , price1
     , adjustment_cost
     , order_sku.sku_name
     , j_order.tax_fee
     , customer_code
     , seller_memo
     , buyer_memo
     , append_memo
     , cast(trade_type as int)
     , case when trade_type = 1 then '零售业务'
         when trade_type = 2 then '代发货(来自分销商)'
         when trade_type = 3 then '预售订单'
         when trade_type = 4 then '周期性订购'
         when trade_type = 5 then '代销售(供货商发货)'
         when trade_type = 6 then '现款现货'
         when trade_type = 7 then '售后发货'
         when trade_type = 8 then '售后退货'
         when trade_type = 9 then '批发业务(B2B)'
         when trade_type = 10 then '试销业务'
         when trade_type = 11 then '错漏调整'
         when trade_type = 12 then '仅退款'
         when trade_type = 13 then '销售返利'
        else trade_type end as trade_type_explain
     , cast(trade_status as int)
     , trade_status_explain
     , j_order.trade_time as order_time
     , pay_time
     , consign_time as send_time
     , signing_time as delivery_time
     , nvl(jky_log.gmt_create,pay_time) as cancel_time
     , if(trade_type in(8,12),jky_log.gmt_create,pay_time) as rfd_time
     , country
     , state
     , j_order.city
     , district
     , town
     , zip
     , j_order.warehouse_code
     , j_order.warehouse_name
     , if(j_order.warehouse_name like '%生鲜%' or j_order.warehouse_name like '%冷链%',1,0) as is_cod_warehouse
     , j_order.discount_fee
     , payment
     , coupon_fee
     , received_total
     , discount_total
     , goods_plat_discount_fee
     , divide_sell_total
     , share_order_discount_fee
     , share_order_plat_discount_fee
     , share_favourable_fee
     , share_favourable_after_fee
     , case
        when channel_code = '14312172' then '视频号'
        when channel_code = '11207381' then(
            case
                when sku_cate.cate is not null then sku_cate.cate
                when account_cate.cate is not null then account_cate.cate
                when order_cate.cate is not null then order_cate.cate
            else '小店及其它' end
        )
        when channel_code = '12533898' then(
            case
                when sku_cate.cate is not null then sku_cate.cate
                when order_cate.cate is not null then order_cate.cate
            else '达人直播' end
        )
        when channel_code = '14637952' then(
            case
                when order_cate.cate is not null then order_cate.cate
            else '达人直播' end
        )
        when channel_code = 'CDL004' then '达人直播'
        when channel_code = 'CDL005' then(
            case
                when order_cate.cate is not null then order_cate.cate
            else '达人直播' end
        )
        when channel_code = '11888795' then (
            case
                when sku_cate.cate is not null then sku_cate.cate
                when order_cate.cate is not null then order_cate.cate
            else '快手达人' end
        )
        when channel_code = '13038301' then '代播'
        when channel_code = '13757144' then (
            case
                when order_cate.cate is not null then order_cate.cate
            else '快手达人' end
        )
        when channel_code = '14422985' then '代播'
        when channel_code = '14597829' then '代播'
        when channel_code = '4363590166' then '快手大童零食直播间'
        when channel_code = '14637952' then '达人直播'
      else order_cate.cate end as order_cate
     , case
         when channel_code = '11218477' then (
            case
                when goods_tags like '%分销订单%' or goods_tags like '%有赞采购%' then '分销'
                when goods_tags like '%需供应商发货订单%' and order_sku.plat_sku_id not like 'Q%' and order_sku.plat_sku_id not like 'D%' then '心选业务'
                when goods_name like '%礼包%' then '礼包客户'
                when order_sku.plat_sku_id = '2802316021' then '米卡'
            else '非礼包客户' end
        )
        when channel_code = '11207381' then(
            case
                when sku_cate.cate is not null then sku_cate.cate
                when account_cate.cate is not null then account_cate.cate
                when order_cate.cate is not null then order_cate.cate
            else '小店及其它' end
        )
        when channel_code = '12533898' then(
            case
                when sku_cate.cate is not null then sku_cate.cate
                when order_cate.cate is not null then order_cate.cate
            else '达人直播' end
        )
        when channel_code = '14028951' then(
            case
                when sku_cate.cate is not null then sku_cate.cate
            else '' end
        )
        when channel_code = '14532478' then(
            case
                when goods_name like 'DB%' then '达播-视频号'
            else '视频号' end
        )
        when channel_code = '11331057' then (
            case
                when sku_cate.cate is not null then sku_cate.cate
            else '快手零食直播间' end
        )
        when channel_code = '11888795' then (
            case
                when sku_cate.cate is not null then sku_cate.cate
                when order_cate.cate is not null then order_cate.cate
            else '快手达人' end
        )
        when channel_code = '13757144' then (
            case
                when order_cate.cate is not null then order_cate.cate
            else '快手达人' end
        )
        when plat_code in ('AlibabaC2M','TB','TMCS','TMALL') then(
            case
                when sku_cate.cate is not null then sku_cate.cate
            else order_cate.cate end
        )
    else sku_cate.cate end  as product_cate
    , case
        when channel_code in ('12533898','14637952','CDL005','CDL004') and account_cate.cate is null then '达人直播'
        when channel_code in ('13038301','14422985','14597829') and account_cate.cate is null then '达人直播'
        when channel_code = '14312172' then(
            case
                when account_cate.cate is not null then account_cate.cate
            else '' end
        )
        when channel_code = '13757144' then (
            case
                when order_cate.cate is not null then order_cate.cate
            else '快手达人' end
        )
    else account_cate.cate end account_cate
    , case
        when channel_code = '14312172' then '视频号'
        when channel_code = '11218477' then (
            case
                when goods_tags like '%分销订单%' or goods_tags like '%有赞采购%' then '分销'
                when goods_tags like '%需供应商发货订单%' and order_sku.plat_sku_id not like 'Q%' and order_sku.plat_sku_id not like 'D%' then '心选业务'
                when goods_name like '%礼包%' then '礼包客户'
                when order_sku.plat_sku_id = '2802316021' then '米卡'
            else '非礼包客户' end
        )
        when channel_code = '11207381' then(
            case
                when sku_cate.cate is not null then sku_cate.cate
                when account_cate.cate is not null then account_cate.cate
                when order_cate.cate is not null then order_cate.cate
            else '小店及其它' end
        )
        when channel_code = '12533898' then(
            case
                when sku_cate.cate is not null then sku_cate.cate
                when order_cate.cate is not null then order_cate.cate
            else '达人直播' end
        )
        when channel_code = '14028951' then(
            case
                when sku_cate.cate is not null then sku_cate.cate
            else '' end
        )
        when channel_code = '14312172' then(
            case
                when account_cate.cate is not null then account_cate.cate
            else '' end
        )
        when channel_code = '14532478' then(
            case
                when goods_name like 'DB%' then '达播-视频号'
            else '视频号' end
        )
        when channel_code = '14637952' then(
            case
                when order_cate.cate is not null then order_cate.cate
            else '达人直播' end
        )
        when channel_code = 'CDL004' then '达人直播'
        when channel_code = 'CDL005' then(
            case
                when order_cate.cate is not null then order_cate.cate
            else '达人直播' end
        )
        when channel_code = '11331057' then (
            case
                when sku_cate.cate is not null then sku_cate.cate
            else '快手零食直播间' end
        )
        when channel_code = '11888795' then (
            case
                when sku_cate.cate is not null then sku_cate.cate
                when order_cate.cate is not null then order_cate.cate
            else '快手达人' end
        )
        when channel_code = '13038301' then '代播'
        when channel_code = '13757144' then (
            case
                when order_cate.cate is not null then order_cate.cate
            else '快手达人' end
        )
        when channel_code = '14422985' then '代播'
        when channel_code = '14597829' then '代播'
        when channel_code = '4363590166' then '快手大童零食直播间'
        when channel_code = '14637952' then '达人直播'
        when plat_code in ('AlibabaC2M','TB','TMCS','TMALL') then(
            case
                when sku_cate.cate is not null then sku_cate.cate
            else order_cate.cate end
        )
        when sku_cate.cate is not null then sku_cate.cate
        when account_cate.cate is not null then account_cate.cate
        when order_cate.cate is not null then order_cate.cate
    else null end as business_cate
    , date_format(j_order.gmt_create,'%Y-%m-%d')
from (
    select * from(
        select
            *,row_number() over (partition by trade_id order by gmt_modified desc) n from ods.jky_qm_trades_fullinfo
        where is_delete = 0 and seller_memo not like '%测试单%'
    )tmp where n =1 and trade_status not in ('5020','5030')
) j_order
left join(
    select
        a.trade_id,
        nvl(b.goods_no,a.goods_no) as goods_no,
        nvl(b.goods_name,a.goods_name) as goods_name,
        c.sku_id as sku_id,
        c.sku_name as sku_name,
        nvl(b.sell_count,a.sell_count) as sku_cnt,
        plat_code,
        case when plat_code in ('AlibabaC2M','TB','TMCS','TMALL') then source_subtrade_no else source_trade_no end plat_order_id,
        coalesce(plat_author_name, last_value(plat_author_name) over (partition by a.trade_id order by plat_author_name)) plat_author_name,
        discount_total,
        goods_plat_discount_fee,
        divide_sell_total,
        share_order_discount_fee,
        share_order_plat_discount_fee,
        share_favourable_fee,
        plat_goods_id,
        is_fit,
        is_gift,
        case
            when (c.flag_data like '%便携装%' and share_favourable_after_fee != 0) or c.cate_name like '%市场部%' then '拉新'
            when is_gift = 1 and is_giveaway = 1 and c.flag_data like '%便携装%' then '尝鲜装赠品'
            when is_gift = 1 and is_giveaway = 1 and c.sku_field5 like '%ms%' then 'NS赠品'
            when is_gift = 1 and is_giveaway = 1 and c.cate_full_name like '%06周边赠品礼盒%' then '非食赠品'
            when is_gift = 1 and is_giveaway = 1 then '正装赠品'
        else null end gift_flag,
        coalesce(plat_author_id, last_value(plat_author_id) over (partition by a.trade_id order by plat_author_id)) as plat_author_id,
        plat_sku_id,
        goods_tags,
        price1,
        if(b.goods_no is null,share_favourable_after_fee,
            if(is_giveaway = 1 or sum(e.price1*b.sell_count) over(partition by a.goods_no) = 0,0,e.price1*b.sell_count/sum(e.price1*b.sell_count) over(partition by a.goods_no) * share_favourable_after_fee)
        ) share_favourable_after_fee
     from(select * from ods.jky_qm_trades_fullinfo_goodsdetail where dt = '2024-12-16') a
     left join(select * from ods.jky_qm_trades_fullinfo_assembly_goodsdto where dt = '2024-12-16') b on a.trade_id = b.trade_id and a.sub_trade_id = b.sub_trade_id
     left join(select * from ods.jky_storage_goodsinfo where dt = '2024-12-16') c on nvl(b.goods_no,a.goods_no) = c.goods_no and nvl(b.spec_name,a.spec_name) = c.sku_name
     left join(select distinct sku_id,is_giveaway from ods.jky_goods_package_detail where dt = '2024-12-16' and is_giveaway = 1) d on c.sku_id = d.sku_id
     left join(select sku_id,price1,unit_name from ods.jky_pricelist where dt = '2024-12-16' and is_current_active = 1) e on c.sku_id = e.sku_id and c.unit_name = e.unit_name
)order_sku on j_order.trade_id = order_sku.trade_id
left join(
    select
        *
    from(select sku_id as goods_no,adjustment_cost,row_number() over (partition by sku_id order by start_date desc ) n from ods.fill_cost_adjustment_template where dt = '2024-10-12')tmp
    where n = 1
)good_cost on order_sku.goods_no = good_cost.goods_no
left join(select * from ods.fill_abnormal_order_numbers where dt = '2024-10-12') ex_order on j_order.trade_no = ex_order.internal_order_number
left join(select * from ods.jky_sales_channel where dt = '2024-12-16') channel on j_order.shop_id = channel.channel_id
left join(select * from(select *,row_number() over (partition by trade_id) n from ods.jky_business_log where log_detail like '%取消订单%')tmp where n = 1)jky_log on j_order.trade_id = jky_log.trade_id
left join(select * from dim.sku_cate_zip where dt = '9999-12-31')sku_cate on order_sku.plat_goods_id = sku_cate.plat_sku_id
left join(select * from dim.dealer_zip where dt = '9999-12-31')dealer on j_order.customer_code = dealer.dealer_id
left join(select * from dim.account_cate_zip where dt = '9999-12-31')account_cate on order_sku.plat_author_id = account_cate.account_id
left join(
    select sub_order_id as order_id,order_cate cate from dwd.trd_tb_unpaid_order where dt = '2024-12-16'
    union
    select sub_order_id,order_cate from dwd.trd_tb_living where dt = '2024-12-16'
    union
    select order_id,business_cate from dwd.trd_dy_alliance_order where dt = '2024-12-16'
    union
    SELECT order_id,business_cate FROM ods.tmp_ks_order
)order_cate on order_sku.plat_order_id = order_cate.order_id;

-- json数据有两个货品
select *  from jky.qm_trades_fullinfo where gmtCreate is null;
-- 子表只有一个货品信息
select * from jky.qm_trades_fullinfo_goodsdetail where tradeNo = 'JY2024061494920';

select plat_sku_id,* from ods.jky_qm_trades_fullinfo_goodsdetail where dt = '2024-12-16' and trade_no = 'JY2024101136685';

select * from dim.sku_cate_zip where plat_sku_id like 'Q%';

select * from dwd.trd_erp_pay_order_sku where trade_no = 'JY2024101136685';




--   ------------------------------------------------------------------------------------------------------------------------
CREATE TABLE dwd.lgst_order (
    internal_order_id           varchar COMMENT '内部订单号',
    trade_type                  double COMMENT '订单类型 1：零售业务 2：待发货（来自分销商） 3：预售订单 4：待销售（供货商发货） 6：现款现货 7：售后发货 8：售后退款 9：批发业务（B2B) 10：试销业务 11：错漏调整 12：仅退款 13：销售返利',
    order_status                varchar COMMENT '订单状态',
    logistics_status            varchar COMMENT '物流状态',
    brand                       varchar COMMENT '品牌',
    platform                    varchar COMMENT '平台',
    channel_code                varchar COMMENT '渠道编码',
    shop_name                   varchar COMMENT '店铺名称',
    order_payment_date          datetime COMMENT '订单支付日期',
    order_audit_date            datetime COMMENT '订单审核日期',
    order_delivery_date         datetime COMMENT '订单发货日期',
    order_pickup_date           datetime COMMENT '订单揽收日期',
    order_sign_date             datetime COMMENT '订单签收日期',
    audit_method                varchar COMMENT '审单方式',
    auditor                     varchar COMMENT '审单人',
    outbound_order_id           varchar COMMENT '出库单号',
    express_order_id            varchar COMMENT '快递单号',
    shipping_warehouse_id       varchar COMMENT '发货仓编号',
    shipping_warehouse          varchar COMMENT '发货仓',
    default_warehouse_id        varchar COMMENT '默认仓编号',
    default_warehouse           varchar COMMENT '默认仓',
    express_company_code        varchar COMMENT '快递公司代码',
    express_company_name        varchar COMMENT '快递公司名称',
    shipping_warehouse_province varchar COMMENT '发货仓所在省份',
    shipping_warehouse_city     varchar COMMENT '发货仓所在市',
    shipping_warehouse_district varchar COMMENT '发货仓所在区',
    recipient_province          varchar COMMENT '收货地所在省份',
    recipient_city              varchar COMMENT '收货地所在市',
    recipient_district          varchar COMMENT '收货地所在区',
    logistic_code	            varchar COMMENT '物流公司编码',
    logistic_name	            varchar COMMENT '物流名称',
    dt                          date COMMENT '分区日期'
)PARTITION BY VALUE(dt) LIFECYCLE 30 STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7  COMMENT='仓储分析表';

insert overwrite dwd.lgst_order
select
    j_order.trade_no,
    trade_type,
    trade_status_explain,
    wuliuzhuangtai,
    brand,
    corr_channel,
    channel.channel_code,
    channel_name,
    pay_time,
    audit_time,
    consign_time,
    if(fachushijian= '',null,STR_TO_DATE(fachushijian, '%Y-%m-%d %H:%i:%s')),
    if(wuliuzhuangtai in ('已签收','代收'),STR_TO_DATE(zuixinshijian, '%Y-%m-%d %H:%i:%s'),null),
    if(j_order.register='系统自动' or auditor = 'auditor','非人工','人工'),
    auditor,
    stockout_no,
    wuliu_order,
    j_order.warehouse_code,
    j_order.warehouse_name,
    channel.warehouse_code,
    channel.warehouse_name,
    kdgs_code,
    kdgs,
    warehouse.province_name,
    warehouse.city_name,
    warehouse.city_name,
    j_order.state,
    j_order.city,
    j_order.district,
    logistic_code,
    logistic_name,
    '2025-03-19'
from(select * from ods.jky_qm_trades_fullinfo where pay_time is not null and trade_status_explain not like '%已取消-%') j_order
left join(select * from ods.jky_sales_channel where dt = '2025-03-19')channel on j_order.shop_id = channel.channel_id
left join(select * from ods.fill_shop_channel_cate where dt = '2025-03-19')brand on channel.channel_code = brand.shop_id
left join(select * from ods.jky_warehouse_info where dt = '2025-03-19')warehouse on j_order.warehouse_code = warehouse.warehouse_code
left join(select * from ods.zzy_etl_task  where dt = '2025-03-19')lgst on j_order.trade_no = lgst.chuku_order
;