CREATE TABLE IF NOT EXISTS dim.jky_shop_ref
(
    shop_id              varchar comment '店铺账户id',
    shop_name            varchar comment '店铺名称',
    promotion_account_id varchar comment '推广账户id，没有怎么为空',
    jky_shop_id          varchar comment '吉客云店铺id',
    jky_shop_name        varchar comment '吉客云店铺名称',
    jky_cate             int comment '业务分类',
    jdy_channel          varchar comment '所属渠道',
    jky_promotion_id     int comment '推广账户id',
    dt                   date comment '分区日期',
    primary key (shop_id, shop_name, dt)
)PARTITION BY VALUE(dt) COMMENT ='维度表-吉客云店铺关联关系表';
insert OVERWRITE dim.jky_shop_ref
select
    shop_id,
    shop_name,
    promotion_account_id,
    jky_shop_id,
    jky_shop_name,
    jky_cate,
    jdy_channel,
    jky_promotion_id,
    '2024-11-20'
from ods.rpa_jky_shop_ref
;

CREATE TABLE dim.send_shop_cost
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
)PARTITION BY VALUE(dt) COMMENT ='填报-寄样店铺费用归属';
insert OVERWRITE dim.send_shop_cost
select
    customer_id,
    customer_name,
    shop_code,
    shop_name,
    channel,
    business_cate,
    cost_center,
    cost_center_code,
    '2024-11-20'
from ods.fill_send_shop_cost where dt = '2024-11-20'
;


CREATE TABLE dim.cost_center
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
    dt            date comment '分区日期'
)PARTITION BY VALUE(dt) COMMENT ='填报-费用中心名称对应表';
insert OVERWRITE dim.cost_center
select
    shop_id,
    shop_name,
    channel,
    biz_category,
    cost_center,
    cost_center_id,
    dept_lvl1,
    dept_lvl2,
    cost_lead,
    cost_mgr,
    exec_mgr,
    channel2,
    version_date,
    remarks,
    dept_lvl3,
    ledger_dept1,
    ledger_channel2,
    ledger_channel3,
    extra_cost1,
    extra_cost2,
    '2024-12-05'
from(select *,row_number() over (partition by shop_id,cost_center_id order by version_date) n from ods.fill_cost_center_ref where dt = '2024-12-05')tmp
where n =1;

CREATE TABLE dim.warehouse_info
(
    warehouse_id   varchar COMMENT '仓库id',
    warehouse_code varchar COMMENT '仓库编号',
    warehouse_name varchar COMMENT '仓库名称',
    province_name  varchar COMMENT '省',
    city_name      varchar COMMENT '市',
    town_name      varchar COMMENT '乡镇',
    street_name    varchar COMMENT '街道',
    address        varchar COMMENT '地址',
    vend_id        varchar COMMENT '供应商id',
    vend_name      varchar COMMENT '供应商名称',
    gmt_create     datetime COMMENT '创建时间',
    dt             date COMMENT '分区日期'
) PARTITION BY VALUE(dt) COMMENT='仓库信息维表';
insert OVERWRITE dim.warehouse_info
select
    warehouse_id,
    warehouse_code,
    warehouse_name,
    province_name,
    city_name,
    town_name,
    street_name,
    address,
    vend_id,
    vend_name,
    gmt_create,
    '2024-11-20'
from ods.jky_warehouse_info
;



CREATE TABLE dim.date_info
(
    date_id    date COMMENT '日期id',
    week_id    int COMMENT '周id,一年中的第几周',
    week_day   int COMMENT '周几',
    day        int COMMENT '每月的第几天',
    month      int COMMENT '一年中的第几月',
    quarter    int COMMENT '一年中的第几季度',
    year       int COMMENT '年份',
    is_workday boolean COMMENT '是否是工作日'
) COMMENT '时间维度表';

CREATE TABLE dim.shop_channel_cate_zip
(
    shop_id        varchar COMMENT '店铺id',
    plat_shop_id   varchar COMMENT '平台店铺id',
    shop_name      varchar comment '店铺名称',
    channel_level1 varchar COMMENT '一级渠道',
    channel_level2 varchar COMMENT '二级渠道',
    channel_level3 varchar COMMENT '三级渠道',
    business_cate  varchar COMMENT '业务分类',
    sta_date       date COMMENT '开始时间',
    end_date       date COMMENT '结束时间',
    dt             date comment '分区日期'
)PARTITION BY VALUE(dt) COMMENT = '店铺渠道业务分类拉链表';
insert OVERWRITE dim.shop_channel_cate_zip
select
    t1.shop_id,
    plt_shop_id,
    t1.shop_name,
    channel_1,
    channel_2,
    channel_3,
    b_cate,
    version_date,
    end_date,
    end_date
from(select
        *,nvl(date_sub(nvl(lead(version_date) over (partition by shop_id order by version_date),'9999-12-31'),1),'9999-12-31') as end_date
    from(select *,row_number() over (partition by shop_id order by version_date desc) n from tmp.shop_free where shop_id is not null)tmp where n = 1
)t1
left join(select channel_4 as shop_name,channel_1,channel_2,channel_3 from tmp.channel_all)t2 on t1.shop_name = t2.shop_name
left join(
    select plt_shop_id,shop_id from tmp.shop_ref where plt_shop_id is not null and shop_id is not null and plt_shop_id not like '%,%'
) t3 on t1.shop_id = t3.shop_id
;

CREATE TABLE dim.account_cate_zip
(
    plat         varchar COMMENT '平台',
    shop_id      varchar COMMENT '店铺id',
    shop_name    varchar COMMENT '店铺名称',
    account_id   varchar COMMENT '账户id/主播id',
    account_name varchar COMMENT '账户名称',
    cate         varchar COMMENT '业务分类',
    start_date   date comment '开始日期',
    end_date     date comment '结束日期',
    dt           date comment '分区日期'
)PARTITION BY VALUE(dt) COMMENT = '账户业务分类';
-- init
insert overwrite dim.account_cate_zip
select
    plat,
    shop_id,
    shop_name,
    account_id,
    account_name,
    cate,
    dt,
    nvl(date_sub(lead(dt) over (partition by plat,shop_id,account_id order by dt),1) ,'9999-12-31') end_date,
    nvl(date_sub(lead(dt) over (partition by plat,shop_id,account_id order by dt),1) ,'9999-12-31')  dt
from ods.fill_account_cate;
-- cron
insert overwrite dim.account_cate_zip
select
    plat,
    shop_id,
    shop_name,
    account_id,
    account_name,
    cate,
    start_date,
    if(rn=1,'9999-12-31',date_sub('2024-11-01',1)) end_date,
    if(rn=1,'9999-12-31',date_sub('2024-11-01',1)) dt
from(
    select
        plat,
        shop_id,
        shop_name,
        account_id,
        account_name,
        cate,
        start_date,
        end_date,
        row_number() over (partition by plat,shop_id,account_id order by start_date desc) rn
    from(
        select
            plat,
            shop_id,
            shop_name,
            account_id,
            account_name,
            cate,
            start_date,
            end_date
        from dim.account_cate_zip
        where dt='9999-12-31'
        union
        select
            plat,
            shop_id,
            shop_name,
            account_id,
            account_name,
            cate,
            '2024-11-01' start_date,
            '9999-12-31' end_date
        from(
            select *,row_number() over (partition by plat,shop_id,account_id order by dt desc) rn
            from ods.fill_account_cate
            where dt='2024-11-01'
        )t1 where rn=1
    )t2
)t3;


CREATE TABLE dim.sku_cate_zip
(
    plat          varchar COMMENT '平台',
    shop_id       varchar COMMENT '店铺id',
    shop_name     varchar COMMENT '店铺名称',
    plat_sku_id   varchar COMMENT '链接商品id',
    plat_sku_name varchar COMMENT '链接商品名称',
    cate          varchar COMMENT '业务分类',
    start_date    date comment '开始日期',
    end_date      date comment '结束日期',
    dt            date comment '分区日期'
)PARTITION BY VALUE(dt) COMMENT = '填报GMV-各平台店铺按规格业务分类';
-- init
insert overwrite dim.sku_cate_zip
select
    plat,
    shop_id,
    shop_name,
    plat_sku_id,
    plat_sku_name,
    cate,
    '2024-10-31' start_date,
    '9999-12-31' end_date,
    '9999-12-31' dt
from ods.fill_sku_cate where dt = '2024-10-31'
union all
select
    plat,
    shop_id,
    shop_name,
    plat_sku_id,
    plat_sku_name,
    cate,
    '2024-10-31' start_date,
    '9999-12-31' end_date,
    '9999-12-31' dt
from ods.fill_shop_cate where dt = '2024-10-31';
insert overwrite dim.sku_cate_zip
select
    plat,
    shop_id,
    shop_name,
    plat_sku_id,
    plat_sku_name,
    cate,
    dt,
    nvl(date_sub(lead(dt) over (partition by plat,shop_id,plat_sku_id order by dt),1) ,'9999-12-31') end_date,
    nvl(date_sub(lead(dt) over (partition by plat,shop_id,plat_sku_id order by dt),1) ,'9999-12-31')  dt
from (
    select * from ods.fill_sku_cate
    union all
    select * from ods.fill_product_cate
)tmp;
-- cron
insert overwrite dim.sku_cate_zip
select
    plat,
    shop_id,
    shop_name,
    plat_sku_id,
    plat_sku_name,
    cate,
    start_date,
    if(rn=1,'9999-12-31',date_sub('2024-10-31',1)) end_date,
    if(rn=1,'9999-12-31',date_sub('2024-10-31',1)) dt
from(
    select
        plat,
        shop_id,
        shop_name,
        plat_sku_id,
        plat_sku_name,
        cate,
        start_date,
        end_date,
        row_number() over (partition by plat,shop_id,plat_sku_id order by start_date desc) rn
    from
    (
        select
            plat,
            shop_id,
            shop_name,
            plat_sku_id,
            plat_sku_name,
            cate,
            start_date,
            end_date
        from dim.sku_cate_zip
        where dt='9999-12-31'
        union
        select
            plat,
            shop_id,
            shop_name,
            plat_sku_id,
            plat_sku_name,
            cate,
            '2024-10-31' start_date,
            '9999-12-31' end_date
        from(
            select *,row_number() over (partition by plat,shop_id,plat_sku_id order by dt desc) rn
            from (
                select * from ods.fill_sku_cate where dt = '2024-10-31'
                union all
                select * from ods.fill_product_cate where dt = '2024-10-31'
            )tmp
        )t1
        where rn=1
    )t2
)t3;

CREATE TABLE dim.dealer_zip
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
    start_date    date comment '开始日期',
    end_date      date comment '结束日期',
    dt           date comment '分区日期'
) COMMENT ='填报-分销商信息';
-- init
insert overwrite dim.dealer_zip
select
    dealer_id,
    dealer_name,
    dealer_short_name,
    region,
    p_region,
    province,
    city,
    director,
    drawer,
    '2024-10-31' start_date,
    '9999-12-31' end_date,
    '9999-12-31' dt
from ods.fill_dealer where dt = '2024-10-31'
;
-- cron
insert overwrite dim.dealer_zip
select
    dealer_id,
    dealer_name,
    dealer_short_name,
    region,
    p_region,
    province,
    city,
    director,
    drawer,
    start_date,
    if(rn=1,'9999-12-31',date_sub('2024-10-31',1)) end_date,
    if(rn=1,'9999-12-31',date_sub('2024-10-31',1)) dt
from(
    select
        dealer_id,
        dealer_name,
        dealer_short_name,
        region,
        p_region,
        province,
        city,
        director,
        drawer,
        start_date,
        end_date,
        row_number() over (partition by dealer_id order by start_date desc) rn
    from
    (
        select
            dealer_id,
            dealer_name,
            dealer_short_name,
            region,
            p_region,
            province,
            city,
            director,
            drawer,
            start_date,
            end_date
        from dim.dealer_zip
        where dt='9999-12-31'
        union
        select
            dealer_id,
            dealer_name,
            dealer_short_name,
            region,
            p_region,
            province,
            city,
            director,
            drawer,
            '2024-10-31' start_date,
            '9999-12-31' end_date
        from(
            select *,row_number() over (partition by dealer_id order by dt desc) rn
            from ods.fill_dealer
            where dt='2024-10-31'
        )t1
        where rn=1
    )t2
)t3;



CREATE TABLE dim.fill_shop_channel_cate
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

CREATE TABLE dim.product_item_zip
(
    goods_id                             varchar COMMENT '货品ID',
    goods_no                             varchar COMMENT '货品编号',
    goods_name                           varchar COMMENT '货品名称',
    sku_id                               varchar COMMENT '规格ID',
    sku_name                             varchar COMMENT '规格名称',
    sku_barcode                          varchar COMMENT '条码',
    unit_name                            varchar COMMENT '单位',
    cate_id                              varchar COMMENT '分类ID',
    cate_name                            varchar COMMENT '分类',
    brand_id                             varchar COMMENT '品牌ID',
    brand_name                           varchar COMMENT '品牌',
    sku_code                             varchar COMMENT '外部货品编码',
    warehouse_id                         varchar comment '默认存放仓库ID',
    warehouse_name                       varchar comment '默认存放仓库名称',
    default_vend_id                      varchar comment '默认供应商ID',
    default_vend_name                    varchar comment '默认供应商',
    is_package                           varchar COMMENT '是否组合装，1：是，0：否',
    sub_sku_id                           varchar COMMENT '组合装子规格ID',
    sub_sku_name                         varchar COMMENT '组合装子规格名称',
    sku_cnt                              varchar COMMENT '数量',
    sku_price                            double comment '价格',
    cost                                 double comment '成本',
    start_date                           date comment '开始日期',
    end_date                             date comment '结束日期',
    dt                                   date comment '分区日期'
) PARTITION BY VALUE (dt) COMMENT = '商品单品拉链表';
-- cron
insert overwrite dim.product_item_zip
-- 组合装商品价格成本
select
    package_good.goods_id,
    package_good.goods_no,
    package_good.goods_name,
    package_good.sku_id,
    package_good.sku_name,
    package_good.sku_barcode,
    package_good.unit_name,
    package_good.cate_id,
    package_good.cate_name,
    package_good.brand_id,
    package_good.brand_name,
    package_good.sku_code,
    package_good.warehouse_id,
    package_good.warehouse_name,
    package_good.default_vend_id,
    package_good.default_vend_name,
    package_good.is_package,
    package_detail.sku_id as sub_sku_id,
    package_detail.sku_name as sub_sku_name,
    package_detail.goods_amount as sku_cnt,
    sku_price.price1,
    good_cost.adjustment_cost,
    good_cost.start_date,
    good_cost.end_date,
    good_cost.end_date
from (
    select
        t1.goods_id,
        t1.goods_no,
        t1.goods_name,
        t1.sku_id,
        t1.sku_name,
        t1.sku_barcode,
        t1.unit_name,
        t1.cate_id,
        t1.cate_name,
        t1.brand_id,
        t1.brand_name,
        t1.sku_code,
        t1.warehouse_id,
        t1.warehouse_name,
        t1.default_vend_id,
        t1.default_vend_name,
        if(t2.sku_id is not null, 1, 0) as is_package,
        t2.sku_id as package_sku_id,
        t1.retail_price
    from (select * from ods.jky_storage_goodsinfo where dt = '2024-12-23') t1
    left join (select * from ods.jky_goods_package where dt = '2024-12-23') t2 on t1.goods_no = t2.goods_no
    where t2.sku_id is not null
 ) package_good
left join(select * from ods.jky_goods_package_detail where dt = '2024-12-23') package_detail on package_good.package_sku_id = package_detail.package_sku_id
left join(select distinct sku_id,price1 from ods.jky_pricelist where dt = '2024-12-23') sku_price on package_detail.sku_id = sku_price.sku_id
left join(
    select
        *,nvl(date_sub(lead(start_date) over (partition by sku_id order by start_date),1),'9999-12-31') as end_date,sku_id as goods_no
    from(select distinct sku_id,start_date,adjustment_cost from ods.fill_cost_adjustment_template where dt = '2024-10-12')tmp
) good_cost on package_detail.goods_no = good_cost.goods_no
union all
-- 非组合装商品价格成本
select
    package_good.goods_id,
    package_good.goods_no,
    package_good.goods_name,
    package_good.sku_id,
    package_good.sku_name,
    package_good.sku_barcode,
    package_good.unit_name,
    package_good.cate_id,
    package_good.cate_name,
    package_good.brand_id,
    package_good.brand_name,
    package_good.sku_code,
    package_good.warehouse_id,
    package_good.warehouse_name,
    package_good.default_vend_id,
    package_good.default_vend_name,
    package_good.is_package,
    null,
    null,
    1,
    sku_price.price1,
    good_cost.adjustment_cost,
    good_cost.start_date,
    good_cost.end_date,
    good_cost.end_date
from (
    select
        t1.goods_id,
        t1.goods_no,
        t1.goods_name,
        t1.sku_id,
        t1.sku_name,
        t1.sku_barcode,
        t1.unit_name,
        t1.cate_id,
        t1.cate_name,
        t1.brand_id,
        t1.brand_name,
        t1.sku_code,
        t1.warehouse_id,
        t1.warehouse_name,
        t1.default_vend_id,
        t1.default_vend_name,
        if(t2.sku_id is not null, 1, 0) as is_package,
        t2.sku_id as package_sku_id,
        t1.retail_price
    from (select * from ods.jky_storage_goodsinfo where dt = '2024-12-23') t1
    left join (select * from ods.jky_goods_package where dt = '2024-12-23') t2 on t1.goods_no = t2.goods_no
    where t2.sku_id is null
) package_good
left join(select distinct sku_id,price1 from  ods.jky_pricelist where dt = '2024-12-23') sku_price on package_good.sku_id = sku_price.sku_id
left join(select
        *,nvl(date_sub(lead(start_date) over (partition by sku_id order by start_date),1),'9999-12-31') as end_date,sku_id as goods_no
    from(select distinct sku_id,start_date,adjustment_cost from ods.fill_cost_adjustment_template where dt = '2024-10-12')tmp
) good_cost on package_good.goods_no = good_cost.goods_no
;

-- 逻辑
with all_goods as(
    select
        t1.goods_id,
        t1.goods_no,
        t1.goods_name,
        t1.sku_id,
        t1.sku_name,
        t1.sku_barcode,
        t1.unit_name,
        t1.cate_id,
        t1.cate_name,
        t1.brand_id,
        t1.brand_name,
        t1.sku_code,
        t1.warehouse_id,
        t1.warehouse_name,
        t1.default_vend_id,
        t1.default_vend_name,
        if(t2.sku_id is not null, 1, 0) as is_package,
        t2.sku_id as package_sku_id,
        t1.retail_price
    from (select * from ods.jky_storage_goodsinfo where dt = '2024-12-23') t1
    left join (select * from ods.jky_goods_package where dt = '2024-12-23') t2 on t1.goods_no = t2.goods_no
),package_detail as (select * from ods.jky_goods_package_detail where dt = '2024-12-23')
,sku_price as(select distinct sku_id,price1 from ods.jky_pricelist where dt = '2024-12-23')
,good_cost as (
    select
        *,nvl(date_sub(lead(start_date) over (partition by sku_id order by start_date),1),'9999-12-31') as end_date,sku_id as goods_no
    from(select distinct sku_id,start_date,adjustment_cost from ods.fill_cost_adjustment_template where dt = '2024-10-12')tmp
)
-- 组合装商品价格成本
select
    package_good.goods_id,
    package_good.goods_no,
    package_good.goods_name,
    package_good.sku_id,
    package_good.sku_name,
    package_good.sku_barcode,
    package_good.unit_name,
    package_good.cate_id,
    package_good.cate_name,
    package_good.brand_id,
    package_good.brand_name,
    package_good.sku_code,
    package_good.warehouse_id,
    package_good.warehouse_name,
    package_good.default_vend_id,
    package_good.default_vend_name,
    package_good.is_package,
    package_detail.sku_id as sub_sku_id,
    package_detail.sku_name as sub_sku_name,
    package_detail.goods_amount as sku_cnt,
    sku_price.price1,
    good_cost.adjustment_cost,
    good_cost.start_date,
    good_cost.end_date
from (select * from all_goods where is_package = 1) package_good
left join package_detail on package_good.package_sku_id = package_detail.package_sku_id
left join sku_price on package_detail.sku_id = sku_price.sku_id
left join good_cost on package_detail.goods_no = good_cost.goods_no
union all
-- 非组合装商品价格成本
select
    package_good.goods_id,
    package_good.goods_no,
    package_good.goods_name,
    package_good.sku_id,
    package_good.sku_name,
    package_good.sku_barcode,
    package_good.unit_name,
    package_good.cate_id,
    package_good.cate_name,
    package_good.brand_id,
    package_good.brand_name,
    package_good.sku_code,
    package_good.warehouse_id,
    package_good.warehouse_name,
    package_good.default_vend_id,
    package_good.default_vend_name,
    package_good.is_package,
    null,
    null,
    1,
    sku_price.price1,
    good_cost.adjustment_cost,
    good_cost.start_date,
    good_cost.end_date
from (select * from all_goods where is_package = 0) package_good
left join sku_price on package_good.sku_id = sku_price.sku_id
left join good_cost on package_good.goods_no = good_cost.goods_no
;

CREATE TABLE dim.shop_share
(
    year               VARCHAR COMMENT '年',
    spu_id             VARCHAR COMMENT 'SPU编号',
    spu_name           VARCHAR COMMENT 'SPU名称',
    business_cate      VARCHAR COMMENT '业务分类',
    business_cate_rate DOUBLE COMMENT '业务分类_占比',
    dt                 date comment '分区日期'
) COMMENT '商城分摊';

insert overwrite dim.shop_share

SELECT year,spu_id,spu_name,split(col,'|')[1],split(col,'|')[2]
FROM (select year,spu_id,spu_name, split(concat('短视频|',dsp_rate, ',米粉直播间|',mf_rate, ',一号直播间|',yh_rate, ',胚芽米直播间|',pym_rate, ',核桃油直播间|',hty_rate),',') as str_array from ods.shop_share)
CROSS JOIN UNNEST(str_array) as temp_table(col);




DELETE from jky.qm_trades_fullinfo_goodsdetail  where tradeNo in (selct * from ) >=1731998883792;



select
    nvl(max(b.__dm_emitted_at),0)
from jky.qm_trades_fullinfo a
left join jky.qm_trades_fullinfo_goodsdetail b on a.tradeNo = b.tradeNo
where a.gmtCreate like '2024-11-01%' AND a.goodsDetail != '' and a.goodsDetail !='[]'
;

select
    sum(1),
    sum(json_length(cast(goodsDetail as json)))
from jky.qm_trades_fullinfo a
where a.gmtCreate like '2024-11%';


select
    count(1)
from jky.qm_trades_fullinfo a
join jky.qm_trades_fullinfo_goodsdetail b on a.tradeNo = b.tradeNo
where a.gmtCreate like '2024-11%';


with tmp as (
    select
        a.tradeNo,
        json_length(cast(goodsDetail as json)) a_goods_cnt,
        count(1) b_goods_cnt
    from jky.qm_trades_fullinfo a
    join jky.qm_trades_fullinfo_goodsdetail b on a.tradeNo = b.tradeNo
    where a.gmtCreate like '2024-11%'
    group by a.tradeNo
)
select * from tmp where a_goods_cnt-b_goods_cnt != 0
;


select json_length(cast(goodsDetail as json)),goodsDetail from jky.qm_trades_fullinfo where qm_trades_fullinfo.tradeNo = 'JY2024110159322'



SELECT
*
FROM jky.qm_trades_fullinfo where gmtModified is  null;



SELECT
*
FROM jky.qm_trades_fullinfo_assembly_goodsdto where gmtModified is  null;


show create table jky.qm_trades_fullinfo_goodsdetail;
show create table jky.qm_trades_fullinfo_assembly_goodsdto;

select count(1) from jky.qm_trades_fullinfo_assembly_goodsdto;