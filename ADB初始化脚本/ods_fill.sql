CREATE TABLE ods.fill_sku_cate
(
    plat     varchar COMMENT '平台',
    shop_id   varchar COMMENT '店铺id',
    shop_name varchar COMMENT '店铺名称',
    plat_sku_id   varchar COMMENT '链接商品id',
    plat_sku_name varchar COMMENT '链接商品名称',
    cate     varchar COMMENT '业务分类',
    dt       date comment '分区日期'
) COMMENT = '填报GMV-各平台店铺按规格业务分类';

CREATE TABLE ods.fill_product_cate
(
    plat     varchar COMMENT '平台',
    shop_id   varchar COMMENT '店铺id',
    shop_name varchar COMMENT '店铺名称',
    plat_sku_id   varchar COMMENT '链接商品id',
    plat_sku_name varchar COMMENT '链接商品名称',
    cate     varchar COMMENT '业务分类',
    dt       date comment '分区日期'
) COMMENT = '填报GMV-各平台店铺按商品业务分类';

drop table ods.fill_account_cate;
CREATE TABLE ods.fill_account_cate
(
    plat         varchar COMMENT '平台',
    shop_id      varchar COMMENT '店铺id',
    shop_name    varchar COMMENT '店铺名称',
    account_id   varchar COMMENT '账户id/主播id',
    account_name varchar COMMENT '账户名称',
    cate         varchar COMMENT '业务分类',
    dt           date comment '分区日期'
)COMMENT = '填报GMV-各平台店铺按账户业务分类';

CREATE TABLE ods.fill_dealer
(
    dealer_id         varchar COMMENT '分销商id',
    dealer_name       varchar COMMENT '分销商名称',
    dealer_short_name varchar COMMENT '分销商简称',
    region            varchar COMMENT '大区',
    p_region          varchar COMMENT '省区',
    province          varchar COMMENT '省',
    city              varchar COMMENT '市',
    director          varchar COMMENT '办事经理',
    drawer            varchar COMMENT '开单人',
    dt                date comment '分区日期'
) COMMENT = '填报-经销商对应办事处';

--
CREATE TABLE ods.fill_shop_cate
(
    jky_shop_id   varchar COMMENT '吉客云店铺id',
    rpa_shop_id   varchar COMMENT 'rpa取数店铺id',
    sta_date      date COMMENT '开始时间',
    end_date      date COMMENT '结束时间',
    channel       varchar COMMENT '渠道',
    business_cate varchar COMMENT '业务分类',
    dt            date comment '分区日期'
) COMMENT = '填报-店铺业务分类';

CREATE TABLE ods.fill_shop_channel_cate
(
    shop_id      VARCHAR COMMENT '店铺ID',
    shop_name    VARCHAR COMMENT '店铺名称',
    aff_channel  VARCHAR COMMENT '所属渠道',
    biz_line     VARCHAR COMMENT '业务线',
    corr_channel VARCHAR COMMENT '对应渠道',
    channel_type VARCHAR COMMENT '渠道区分',
    biz_category VARCHAR COMMENT '业务分类',
    brand        VARCHAR COMMENT '对应品牌',
    dt           date comment '分区日期'
) COMMENT ='填报-业务渠道分类';

CREATE TABLE ods.fill_cost_center_ref
(
    shop_id         VARCHAR COMMENT '店铺ID',
    shop_name       VARCHAR COMMENT '店铺名',
    channel         VARCHAR COMMENT '所属渠道',
    biz_category    VARCHAR COMMENT '业务分类',
    cost_center     VARCHAR COMMENT '费用中心',
    cost_center_id  VARCHAR COMMENT '费用中心编号',
    dept_lvl1       VARCHAR COMMENT '一级中心/部门',
    dept_lvl2       VARCHAR COMMENT '二级部门',
    cost_lead       VARCHAR COMMENT '费用中心直接负责人',
    cost_mgr        VARCHAR COMMENT '费用中心负责人',
    exec_mgr        VARCHAR COMMENT '公司管理层负责人',
    channel2        VARCHAR COMMENT '所属渠道2',
    version_date    DATE COMMENT '版本时间',
    remarks         VARCHAR COMMENT '备注',
    dept_lvl3       VARCHAR COMMENT '三级部门',
    ledger_dept1    VARCHAR COMMENT '台账-一级部门',
    ledger_channel2 VARCHAR COMMENT '台账-二级渠道',
    ledger_channel3 VARCHAR COMMENT '台账-三级渠道',
    extra_cost1     VARCHAR COMMENT '费用中心_1',
    extra_cost2     VARCHAR COMMENT '增加费用中心',
    extra_field1    VARCHAR COMMENT '11',
    extra_field2    VARCHAR COMMENT '11_1',
    updated_time    VARCHAR COMMENT '更新时间',
    status          VARCHAR COMMENT '状态',
    dt              date comment '分区日期'
) COMMENT ='填报-费用中心名称对应表';

CREATE TABLE ods.fill_send_shop_cost
(
    customer_id      VARCHAR COMMENT '客户编号，唯一标识客户',
    customer_name    VARCHAR COMMENT '客户名称',
    shop_code        VARCHAR COMMENT '对应店铺ID，唯一标识店铺',
    shop_name        VARCHAR COMMENT '店铺名称',
    channel          VARCHAR COMMENT '店铺所属渠道',
    business_cate    VARCHAR COMMENT '对应业务分类，唯一标识客户的业务分类',
    cost_center      VARCHAR COMMENT '费用中心',
    cost_center_code VARCHAR COMMENT '费用中心编码',
    dt               date comment '分区日期'
) COMMENT ='填报-寄样店铺费用归属';

CREATE TABLE ods.shop_share
(
    year          VARCHAR COMMENT '年',
    spu_id        VARCHAR COMMENT 'SPU编号',
    spu_name      VARCHAR COMMENT 'SPU名称',
    dsp_rate      DOUBLE COMMENT '短视频',
    mf_rate       DOUBLE COMMENT '米粉直播间',
    yh_rate       DOUBLE COMMENT '一号直播间',
    pym_rate      DOUBLE COMMENT '胚芽米直播间',
    hty_rate      DOUBLE COMMENT '核桃油直播间',
    business_cate VARCHAR COMMENT '业务分类',
    dt            date comment '分区日期'
) COMMENT '商城分摊';

CREATE TABLE ods.fill_ly_supply_price (
    erp_code           varchar(50) COMMENT '乐友ERP编码',
    product_barcode    varchar(50) COMMENT '商品条码',
    akita_product_code varchar(50) COMMENT '秋田满满商品编码',
    product_name       varchar(255) COMMENT '商品名称',
    supply_price       decimal(10, 2) COMMENT '供货价',
    start_time         datetime COMMENT '开始时间',
    end_time           datetime COMMENT '结束时间',
    case_specification varchar(50) COMMENT '箱规',
    dt                 date COMMENT '分区日期'
)COMMENT='乐友商品供货价明细';

CREATE TABLE ods.fill_bud_fin_import_items
(
    biz_day             date COMMENT '日期',
    shop_id             varchar(100) COMMENT '店铺ID',
    business_cate       varchar(100) COMMENT '业务分类',
    expense_center_code varchar(100) COMMENT '费用中心编码',
    expense_center      varchar(100) COMMENT '费用中心',
    budget_subject_code varchar(100) COMMENT '预算科目编码',
    budget_subject      varchar(100) COMMENT '预算科目',
    value               decimal(10, 2) COMMENT '数值',
    summary             varchar(100) COMMENT '摘要(报销单)',
    remarks             varchar(100) COMMENT '备注(来源)',
    category            varchar(100) COMMENT '分类',
    mk_order_num        varchar(100) COMMENT '每刻单号',
    applicant           varchar(100) COMMENT '报销人',
    allocation_logic    varchar(100) COMMENT '分摊逻辑',
    data_type           varchar(100) COMMENT '台账管报',
    dt                  date COMMENT '分区字段'
) COMMENT ='台账补录数据';