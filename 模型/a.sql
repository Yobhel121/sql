with tmp as (
select
    share_favourable_after_fee_js,
    sum(share_favourable_after_fee_js) over(partition by channel_code,date_format(pay_time, '%Y-%m-%d')),
    sum(if(trade_type not in(8,12) and payment = 0 ,gift_cost * sku_cnt,0)) over(partition by channel_code,date_format(pay_time, '%Y-%m-%d')),
    share_favourable_after_fee_js/ sum(share_favourable_after_fee_js) over(partition by channel_code,date_format(pay_time, '%Y-%m-%d')) * sum(if(trade_type not in(8,12) and payment = 0 ,gift_cost * sku_cnt,0)) over(partition by channel_code,date_format(pay_time, '%Y-%m-%d')),
    if(trade_type in(8,12),0,share_favourable_after_fee_js/ sum(share_favourable_after_fee_js) over(partition by channel_code,date_format(pay_time, '%Y-%m-%d')) * if(j_order.payment = 0, sum(if(trade_type in(8,12),0,gift_cost * sku_cnt)) over(partition by channel_code,date_format(pay_time, '%Y-%m-%d')),0)),
    payment,
    trade_type,
    flag_names  订单标记
     , channel.company_name 店铺公司名称
     , if(trade_type in(8,12),'售后','网店下载')  订单来源
     , j_order.trade_no  订单编号
     , order_sku.source_trade_no   网店主订单号
     , order_sku.goods_no    货品编号
     , order_sku.goods_name  货品名称
     ,goods_field3  SPU
     ,goods_field17  战略分级
     ,case when channel.channel_code = '11207381' then(
            case
                when order_sku.plat_author_id in ('2638461630161949','3549857064065100530')  then '悠悠妈'
                when sku_cate.cate = '悠悠妈' and order_cate.cate is null then '悠悠妈'
                when sku_cate.cate is not null  and order_cate.cate is null and  j_order.pay_time >='2025-01-01' then sku_cate.cate
                when order_sku.plat_author_id = '3477091109831427' and order_cate.cate is not null and  j_order.pay_time >='2025-01-01' then '图图炫饭'
                when order_sku.plat_author_id = '175575026636192' and order_cate.cate is not null then '一棵杭白菜'
                when order_cate.cate in('短视频','米粉直播间') and   j_order.pay_time < '2025-01-01' then order_cate.cate
                when order_cate.cate in('短视频','米粉直播间') and  j_order.pay_time >='2025-01-01' then order_cate.cate -- 2025.3统一调整为短视频 4月统一刷新
                when sku_cate.cate = '鳕鱼直播间'  and order_cate.cate is not null and  j_order.pay_time >='2025-01-01' then '鳕鱼直播间'
                when order_sku.plat_author_id = '726093023675278' and order_cate.cate is not null  and  j_order.pay_time >='2025-01-01' then '鳕鱼直播间' -- 2025.4.2增加
                when j_order.pay_time > '2024-09-03' and sku_cate.cate = '辅食油直播间' and order_cate.cate is not null  then '辅食油直播间'
                when order_sku.plat_author_id = '3496897589032280' and order_cate.cate is not null and left(j_order.pay_time,10) >= '2025-04-24'  then '零食直播间' -- 4.25增加
                when order_sku.plat_author_id = '3496897589032280' and order_cate.cate is not null and  left(j_order.pay_time,10) <= '2025-04-23' then '胚芽米自播'
                when order_sku.plat_author_id = '3380370881384764' and  order_cate.cate is not null and left(j_order.pay_time,10) >= '2024-04-24'   then '胚芽米自播' -- 4.25调整
                when order_sku.plat_author_id = '3380370881384764' and order_cate.cate is not null and  left(j_order.pay_time,10) >= '2025-04-02'  and  left( j_order.pay_time,10) <= '2025-04-23' then '零食直播间'
                when order_sku.plat_author_id = '3380370881384764' and  order_cate.cate is not null and j_order.pay_time > '2024-01-01'  and left(j_order.pay_time,10) <= '2025-04-01' then '米粉直播间'
                when order_sku.plat_author_id = '1072728766956750' and order_cate.cate is not null and j_order.pay_time > '2025-04-02' then '米粉直播间' -- 2025.4.2 调整米粉零食
                when order_sku.plat_author_id = '1072728766956750' and order_cate.cate is not null and j_order.pay_time > '2024-03-01'  and left(j_order.pay_time,10) <= '2025-04-01' then '零食直播间'
                when account_cate.cate = '自营短视频-官旗鲁班' and   j_order.pay_time <'2025-01-01' then '短视频'
                when account_cate.cate = '鳕鱼直播间' and   j_order.pay_time <'2025-01-01' then '短视频'
                when account_cate.cate = '图图炫饭' and   j_order.pay_time <'2025-01-01' then '短视频' -- 6.20增加
                when account_cate.cate is not null then account_cate.cate
                when order_cate.cate is not null and   j_order.pay_time >='2025-04-01' then '短视频'
                when sku_cate.cate = '自营短视频-官旗鲁班' and   j_order.pay_time <'2025-01-01' then '短视频'
                when sku_cate.cate = '鳕鱼直播间' and   j_order.pay_time <'2025-01-01' then '短视频'
                when sku_cate.cate = '图图炫饭' and   j_order.pay_time <'2025-01-01' then '短视频' -- 6.20增加
                when sku_cate.cate is not null then sku_cate.cate
            else '橱窗' end
        ) else '' end 短视频识别业务分类
     , if(trade_type in(8,12),0,product_cost * sku_cnt)  货品成本
     , if(trade_type in(8,12),0,item_cost * sku_cnt)  商品成本
     , if(trade_type in(8,12),0,gift_cost * sku_cnt)  赠品费用
     , j_order.warehouse_name  发货仓库
     ,j_order.shop_name  销售渠道
     ,j_order.shop_name  店铺
     ,pay_time  付款时间
     , if(trade_type in(8,12),0,order_sku.sku_cnt)  数量
     , order_sku.share_favourable_after_fee_js  分摊后金额
     -- 1. 组合装赠品费用，分摊到组合装其它正装上
     ,if(trade_type in(8,12),0,if(order_sku.is_fit = 1, share_favourable_after_fee_js/sum(share_favourable_after_fee_js) over(partition by order_sku.trade_no,order_sku.a_goods_no) * sum(gift_cost*sku_cnt) over(partition by order_sku.trade_no,order_sku.a_goods_no),0)) 组合装赠品费用
     -- 2. 非组合装赠品分摊到其它 单品上 包括组合装单品上
     ,if(trade_type in(8,12),0,share_favourable_after_fee_js/sum(share_favourable_after_fee_js) over(partition by order_sku.trade_no)) * sum(if(order_sku.is_fit = 1 and p_share_favourable_fee_js != 0,0,gift_cost*sku_cnt)) over(partition by order_sku.trade_no) 非组合装赠品分摊
     -- 3. 0元订单赠品  分摊到各个正品上
     -- 各个单品 分摊后金额  / 店铺每日分摊后金额(去除售后）* 每日0元赠品费用总和
     ,if(trade_type in(8,12),0,share_favourable_after_fee_js/ sum(share_favourable_after_fee_js) over(partition by channel_code,date_format(pay_time, '%Y-%m-%d')) * sum(if(trade_type not in(8,12) and payment = 0 ,gift_cost * sku_cnt,0)) over(partition by channel_code,date_format(pay_time, '%Y-%m-%d'))) 其他赠品分摊金额
     -- a + b + c
     ,if(trade_type in(8,12),0,if(order_sku.is_fit = 1, share_favourable_after_fee_js/sum(share_favourable_after_fee_js) over(partition by order_sku.trade_no,order_sku.a_goods_no) * sum(gift_cost*sku_cnt) over(partition by order_sku.trade_no,order_sku.a_goods_no),0))+
     if(trade_type in(8,12),0,share_favourable_after_fee_js/sum(share_favourable_after_fee_js) over(partition by order_sku.trade_no)) * sum(if(order_sku.is_fit = 1 and p_share_favourable_fee_js != 0,0,gift_cost*sku_cnt)) over(partition by order_sku.trade_no)+
     if(trade_type in(8,12),0,share_favourable_after_fee_js/ sum(share_favourable_after_fee_js) over(partition by channel_code,date_format(pay_time, '%Y-%m-%d')) * sum(if(trade_type not in(8,12) and payment = 0 ,gift_cost * sku_cnt,0)) over(partition by channel_code,date_format(pay_time, '%Y-%m-%d')))   总赠品费用
     ,'' JY订单履约总费用
     ,if(trade_type in(8,12),0,sku_cnt * order_sku.sku_weight)  货品重量
     -- JY订单总重量  （剔除赠品，卡片，赠品的便携装，组合装赠品，  ps:即分摊后金额为0）
     ,if(trade_type in(8,12),0,sum(if(share_favourable_after_fee_js = 0,0,sku_cnt * order_sku.sku_weight)) over(partition by j_order.trade_no))  JY订单总重量
     ,if(trade_type in(8,12),0,if(share_favourable_after_fee_js=0,0,sku_cnt * order_sku.sku_weight/sum(if(share_favourable_after_fee_js = 0,0,sku_cnt * order_sku.sku_weight)) over(partition by j_order.trade_no)))  货品重量占比
     ,if(trade_type in(8,12),0,directional_material_cost * sku_cnt + if(share_favourable_after_fee_js=0,0,sku_cnt * order_sku.sku_weight/sum(if(share_favourable_after_fee_js = 0,0,sku_cnt * order_sku.sku_weight)) over(partition by j_order.trade_no)) * weight_fulfillment)  重量履约分摊
from (
    select * from(
        select
            *,row_number() over (partition by trade_id order by gmt_modified desc) n from ods.jky_qm_trades_fullinfo
        where is_delete = 0 and seller_memo not like '%测试单%' and gmt_create > date_format(date_sub('2025-08-06', 90), '%Y-%m-%d')
    )tmp where n =1
           and trade_status not in ('5010','5020','5030')
           and shop_id  not in('1723838592174621184','1726051235912319488','1695714490516406912','1739161925332304256','1799908914256478592','2240803665545987200','2083305436995192192','2069054003205801856','2164494330354370304')
           and warehouse_name not in('华中微瑕仓2仓','微瑕品仓')
           and pay_time like '2025-07-23%'
) j_order
left join(
    select
        a.trade_no, -- 订单编号
        a.source_trade_no, -- 网店主订单号
        a.source_subtrade_no, -- 网店子订单号
        a.goods_no as a_goods_no, -- 货品表货品编号 单品/组合装
        a.is_fit,-- 组合装标记 1 是
        c.goods_no as goods_no, -- 货品编号
        c.goods_name as goods_name,-- 货品名称
        c.sku_id as sku_id,-- 规格ID
        c.sku_field5, -- 货品-规格编码(规)
        c.sku_weight, -- 重量(g)
        case when a.plat_code in ('AlibabaC2M','TB','TMCS','TMALL') then nvl(a.source_subtrade_no,a.source_trade_no) else a.source_trade_no end plat_order_id, -- 网店订单号
        coalesce(a.plat_author_id, max(a.plat_author_id) over (partition by a.source_trade_no )) as plat_author_id,-- 平台主播id
        if(a.plat_goods_id != '' and a.plat_goods_id is not null, a.plat_goods_id,max(a.plat_goods_id) over (partition by a.source_trade_no)) plat_goods_id,-- 平台商品id
        nvl(b.sell_count,a.sell_count) as sku_cnt, -- 销售数量
        nvl(b.sell_price,a.sell_price) product_price, -- 售价
        d.adjustment_cost as product_cost, -- 货品成本
        if(case when b.sell_total is not null then cast(b.sell_total as decimal(10,2)) - cast(b.share_favourable_fee as decimal(10,2))  else a.share_favourable_after_fee end = 0,0,d.adjustment_cost) as item_cost, -- 商品成本
        if(case when b.sell_total is not null then cast(b.sell_total as decimal(10,2)) - cast(b.share_favourable_fee as decimal(10,2))  else a.share_favourable_after_fee end = 0,d.adjustment_cost,0) as gift_cost, -- 赠品费用
        -- 分摊后金额
        case when b.sell_total is not null then cast(b.sell_total as decimal(10,2)) - cast(b.share_favourable_fee as decimal(10,2))  else a.share_favourable_after_fee end share_favourable_after_fee_js,
        -- 组合装分摊后金额
        cast(a.share_favourable_after_fee as decimal(10,2)) p_share_favourable_fee_js
    from(select trade_no,gmt_create,pay_time from ods.jky_qm_trades_fullinfo where is_delete = 0 and seller_memo not like '%测试单%' and gmt_create > date_format(date_sub('2025-08-06', 90), '%Y-%m-%d') and pay_time like '2025-07-23%') t -- 销售单查询
    left join(select * from ods.jky_qm_trades_fullinfo_goodsdetail where dt = '2025-08-06') a on t.trade_no = a.trade_no -- 销售单查询_货品详情
    left join(select * from ods.jky_qm_trades_fullinfo_assembly_goodsdto where dt = '2025-08-06') b on a.trade_no = b.trade_no and a.trade_id = b.trade_id and a.sub_trade_id = b.sub_trade_id -- 销售单查询_组合装子件列表
    left join(select * from ods.jky_storage_goodsinfo where dt = '2025-08-06' and is_delete = 0) c on nvl(b.goods_no,a.goods_no) = c.goods_no and nvl(b.barcode,a.barcode) = c.sku_barcode -- 分页查询货品信息
    left join(
        select
            *
        from(select sku_id as goods_no,adjustment_cost,row_number() over (partition by sku_id order by start_date desc ) n from ods.fill_cost_adjustment where dt = '2025-08-06')tmp -- 成本调整_template
        where n = 1
    )d on c.sku_field5 = d.goods_no
)order_sku on j_order.trade_no = order_sku.trade_no
left join(select * from ods.jky_sales_channel where dt = '2025-08-06') channel on j_order.shop_id = channel.channel_id -- 销售渠道查询
left join(select * from dim.jky_storage_goodsinfo where dt = '2025-08-06' ) tmcate on order_sku.sku_id = tmcate.sku_id
left join(
    select order_id,storage_fee + handling_fee as num_fulfillment, operation_fee_total + material_fee_total + express_fee_total as weight_fulfillment  from ods.gyl_order_fulfillment
)fulfillment on j_order.trade_no = fulfillment.order_id
left join(select * from dim.sku_cate_zip where dt = '9999-12-31')sku_cate on order_sku.plat_goods_id = sku_cate.plat_sku_id and channel.channel_code = sku_cate.shop_id  -- 填报GMV-各平台店铺按规格业务分类
left join(
    select order_id,cate from(
        select *,row_number() over (partition by order_id order by type desc) n from (
            select distinct sub_order_id as order_id,order_cate cate,1 as type from dwd.trd_tb_unpaid_order where dt = '2025-08-06' -- 交易域-淘宝未结算订单数据
            union
            select distinct sub_order_id,order_cate,2 as type from dwd.trd_tb_living where dt = '2025-08-06'    -- 订单域-淘宝直播订单
        )tmp
    )t where n =1
    union
    select distinct order_id,business_cate from dwd.trd_dy_alliance_order where dt = '2025-08-06'  -- 抖音-联盟订单明细
    union
    SELECT distinct order_id,business_cate FROM ods.tmp_ks_order    -- 临时取数表_单号快手米粉直播间区分业务分类7.6
)order_cate on order_sku.plat_order_id = order_cate.order_id
left join(select * from dim.account_cate_zip where dt = '9999-12-31')account_cate on order_sku.plat_author_id = account_cate.account_id -- 账户业务分类
left join(select * from ods.gyl_product_material_cost where dt = '2025-08-06') product_material on order_sku.goods_no = product_material.product_code
)
,tmp2 as(
    select
        订单编号 id,
        sum(nvl(赠品费用,0)) aa,
        sum(nvl(组合装赠品费用,0)) bb,
        sum(nvl(非组合装赠品分摊,0)) cc,
        sum(nvl(其他赠品分摊金额,0)) dd
    from tmp
    group by 订单编号
)
# select * from tmp2 where abs(aa - bb-cc) >=0.1
# select * from tmp where 订单编号 = 'JY2025072311451'
select * from tmp where 店铺 = '秋田满满京东自营旗舰店'
;

select distinct mt from dwd.trd_pay_item;

show create table dwd.trd_pay_item;

drop table dwd.trd_pay_item;
CREATE TABLE dwd.trd_pay_item (
  `__adb_auto_id__` bigint AUTO_INCREMENT,
  `order_id` varchar COMMENT '订单ID(吉客云)',
  `order_type` varchar COMMENT '订单类型',
  `order_status` varchar COMMENT '订单状态',
  `company_name` varchar COMMENT '公司',
  `plat_code` varchar COMMENT '网店平台编码',
  `plat_name` varchar COMMENT '网店平台名称',
  `plat_order_id` varchar COMMENT '平台网店主订单id',
  `plat_sub_order_id` varchar COMMENT '平台网店主子订单id',
  `user_id` varchar COMMENT '用户ID',
  `seller_memo` varchar COMMENT '客服备注',
  `buyer_memo` varchar COMMENT '买家备注',
  `country` varchar COMMENT '国家',
  `state` varchar COMMENT '省',
  `city` varchar COMMENT '城市',
  `district` varchar COMMENT '区县',
  `town` varchar COMMENT '街道',
  `zip` varchar COMMENT '邮编',
  `pay_time` datetime COMMENT '支付时间',
  `shop_id` varchar COMMENT '店铺id',
  `shop_name` varchar COMMENT '店铺名称',
  `package_item_id` varchar COMMENT '组合装id',
  `package_item_name` varchar COMMENT '组合装名称',
  `is_package` varchar COMMENT '是否组合装',
  `item_id` varchar COMMENT '商品id',
  `item_name` varchar COMMENT '商品名称',
  `item_cate` varchar COMMENT '商品分类',
  `gift_flag` varchar COMMENT '赠品标识（赠品标识:尝鲜装赠品，NS赠品，非食赠品，正装赠品)',
  `is_samp` varchar COMMENT '是否派样',
  `sku_id` varchar COMMENT '规格id',
  `sku_code` varchar COMMENT '规格编号',
  `first_level` varchar COMMENT '一级分类',
  `second_level` varchar COMMENT '二级分类',
  `first_cate` varchar COMMENT '一级品类',
  `second_cate` varchar COMMENT '二级分类',
  `strategic_level` varchar COMMENT '战略分级(货)',
  `channel_strategic_level` varchar COMMENT '渠道战略分级(货)',
  `spu_id` varchar COMMENT 'SPU ID',
  `spu_name` varchar COMMENT 'SPU名称',
  `sku_barcode` varchar COMMENT '条码',
  `item_price` decimal(10, 2) COMMENT '商品单价',
  `item_cost` decimal(10, 2) COMMENT '商品成本',
  `item_count` int COMMENT '商品数量',
  `total_amt` decimal(10, 2) COMMENT '下单金额',
  `mt` varchar COMMENT '分区月份',
  PRIMARY KEY (`__adb_auto_id__`,`mt`)
) partition by value(mt) COMMENT='交易域-支付成功商品事实表';

select payment,* from ods.jky_qm_trades_fullinfo where trade_no = 'JY2025072355463';

-- 剔除店铺
select * from ods.jky_sales_channel where dt = '2025-08-06' and channel_code in('14480538','DP0010','XSFXYJDFRDY','NBMC-JYZY','CDL-JYZY','14028951','13302195','SHSGD');
select * from ods.jky_sales_channel where dt = '2025-08-06' and channel_code in('JD0237','JDZYSX','11809520');

select distinct business_cate from dwd.trd_erp_pay_order_sku where shop_code = '11207381';

select distinct * from ods.fill_expense_center_mapping where dt = '2025-08-06' and shop_id = '11207381' and department_3 in ('自营短视频','达人短视频') and expense_center not like '%中台%';

-- 自营短视频
图图炫饭
自营短视频-官旗鲁班
一棵杭白菜
兜兜成长记
悠悠妈

-- 达人短视频
短视频

-- 其它
橱窗
米粉直播间
辅食油直播间
零食直播间
鳕鱼直播间
胚芽米自播







-- 单号   重量履约费用  数量履约费用

-- 冷链
-- 店铺名称	内部订单号	商品数量	仓租	装卸费	操作费汇总	耗材费汇总	快递费汇总	履约费汇总
    -- by 数量    仓租	装卸费

    -- by 重量    操作费汇总	耗材费汇总	快递费汇总

-- 常温
-- 仓库名称	订单号	店铺	仓租件单价	装卸费件单价	仓租	 装卸费	应结算数量	操作费汇总	快递费合计	葫芦膜+气柱	耗材费汇总	履约汇总
    -- by 数量    仓租	装卸费

    -- by 重量    操作费汇总	快递费合计	耗材费汇总

CREATE TABLE ods.gyl_order_fulfillment
(
    id                    varchar(50) COMMENT '自增主键ID',
    create_by             varchar(50) COMMENT '创建人',
    create_time           datetime COMMENT '创建日期',
    update_by             varchar(50) COMMENT '更新人',
    update_time           datetime COMMENT '更新日期',
    sys_org_code          varchar(64) COMMENT '所属部门',
    warehouse_name        VARCHAR(100) COMMENT '仓库名称',
    biz_day               date      COMMENT '日期',
    order_id              VARCHAR(50) COMMENT '订单号',
    shop_name             VARCHAR(100) COMMENT '店铺',
    storage_unit_price    DECIMAL(10, 2) COMMENT '仓租件单价',
    handling_unit_price   DECIMAL(10, 2) COMMENT '装卸费件单价',
    storage_fee           DECIMAL(10, 2) COMMENT '仓租',
    handling_fee          DECIMAL(10, 2) COMMENT '装卸费',
    settlement_quantity   INT COMMENT '应结算数量',
    operation_fee_total   DECIMAL(10, 2) COMMENT '操作费汇总',
    express_fee_total     DECIMAL(10, 2) COMMENT '快递费合计',
    material_fee_total    DECIMAL(10, 2) COMMENT '耗材费(不含定向耗材)',
   dt date comment '分区字段'
) COMMENT ='供应链对账-常温冷链履约费用表';


drop table ods.gyl_product;
CREATE TABLE ods.gyl_product
(
    id             BIGINT COMMENT '自增主键ID',
    create_by      varchar(50) COMMENT '创建人',
    create_time    datetime COMMENT '创建日期',
    update_by      varchar(50) COMMENT '更新人',
    update_time    datetime COMMENT '更新日期',
    sys_org_code   varchar(64) COMMENT '所属部门',
    product_code   VARCHAR(50) COMMENT '货品编号',
    product_name   VARCHAR(100) COMMENT '货品名称',
    standard_cost  DECIMAL(10, 2) COMMENT '标准成本',
    spu            VARCHAR(50) COMMENT 'SPU(Standard Product Unit)',
    rsp            DECIMAL(10, 2) COMMENT 'RSP(Recommended Selling Price)',
    product_weight DECIMAL(10, 3) COMMENT '货品重量(单位:g)',
   dt date comment '分区字段'
) COMMENT ='供应链对账-货品成本表';

drop table ods.gyl_product_material_cost;
CREATE TABLE ods.gyl_product_material_cost
(
    id                        BIGINT  COMMENT '自增主键ID',
    create_by                 varchar(50) COMMENT '创建人',
    create_time               datetime COMMENT '创建日期',
    update_by                 varchar(50) COMMENT '更新人',
    update_time               datetime COMMENT '更新日期',
    sys_org_code              varchar(64) COMMENT '所属部门',
    product_code              VARCHAR(50) COMMENT '货品编号',
    product_name              VARCHAR(100) COMMENT '货品名称',
    directional_material_cost DECIMAL(10, 2) COMMENT '定向耗材成本',
   dt date comment '分区字段'
) COMMENT ='供应链对账-货品定向耗材成本表';

select
    tradeId, tradeNo, tradeTime, goodsNo, goodsName, specName, barcode, sellCount, unit, sellPrice, cast(sellTotal as decimal(10,2)), cost, discountTotal, discountPonumber, taxFee, shareFavourableFee, estimateWeight, goodsMemo, cateName, brandName, goodsTags, isFit, isGift, discountFee, taxRate, estimateGoodsVolume, isPresell, customerPrice, customerTotal, tradeGoodsNo, tradeGoodsName, tradeGoodsSpec, tradeGoodsUnit, sourceSubtradeNo, platCode, platGoodsId, subTradeId, platAuthorId, platAuthorName, isPlatGift, goodsPlatDiscountFee, cast(shareFavourableAfterFee as decimal(10,2)), divideSellTotal, shareOrderDiscountFee, shareOrderPlatDiscountFee, sourceTradeNo, actualSendCount, platSkuId, customerTradeNo, customerSubtradeNo, PlatCustomdate, assessmentCostLocal, assessmentGrossProfitLocal, assessmentGrossProfitPercent, goodsCompassSourceContentType, goodsSeller, goodsDelivery, __dm_id, __dm_connect_id, __dm_task_id, __dm_emitted_at, __dm_key, goodsFlagIds, specId, skuImgUrl
from jky.qm_trades_fullinfo_goodsdetail;

# insert OVERWRITE ods.jky_qm_trades_fullinfo_goodsdetail
# select tradeId, tradeNo, tradeTime, goodsNo, goodsName, specName, barcode, sellCount, unit, cast(sellPrice as decimal(10,2)) , cast(sellTotal as decimal(10,2)), cast(cost as decimal(10,2)), cast(discountTotal as decimal(10,2)), discountPonumber,
#        cast(taxFee as decimal(10,2)), cast(shareFavourableFee as decimal(10,2)), estimateWeight, goodsMemo, cateName, brandName, goodsTags, isFit, isGift, discountFee, taxRate, estimateGoodsVolume, isPresell, cast(customerPrice as decimal(10,2)), cast(customerTotal as decimal(10,2)),
#        tradeGoodsNo, tradeGoodsName, tradeGoodsSpec, tradeGoodsUnit, sourceSubtradeNo, platCode, platGoodsId, subTradeId, platAuthorId, platAuthorName, isPlatGift, cast(goodsPlatDiscountFee as decimal(10,2)), cast(shareFavourableAfterFee as decimal(10,2)), cast(divideSellTotal as decimal(10,2)), cast(shareOrderDiscountFee as decimal(10,2)),
#        cast(shareOrderPlatDiscountFee as decimal(10,2)), sourceTradeNo, actualSendCount, platSkuId, customerTradeNo, customerSubtradeNo, PlatCustomdate, assessmentCostLocal, assessmentGrossProfitLocal, assessmentGrossProfitPercent, goodsCompassSourceContentType, goodsSeller, goodsDelivery,
#        __dm_id, __dm_connect_id, __dm_task_id, __dm_emitted_at, __dm_key, goodsFlagIds, specId, skuImgUrl,'2025-08-06'
# from jky.qm_trades_fullinfo_goodsdetail;

drop table ods.`jky_qm_trades_fullinfo_goodsdetail`;
CREATE TABLE ods.`jky_qm_trades_fullinfo_goodsdetail` (
  `__adb_auto_id__` bigint AUTO_INCREMENT,
  `trade_id` varchar COMMENT '系统编码',
  `trade_no` varchar COMMENT '订单编号',
  `trade_time` datetime COMMENT '下单时间',
  `goods_no` varchar COMMENT '货品编号',
  `goods_name` varchar COMMENT '货品名称',
  `spec_name` varchar COMMENT '规格名称',
  `barcode` varchar COMMENT '条码',
  `sell_count` double COMMENT '销售哦数量',
  `unit` varchar COMMENT '单位',
  `sell_price` double COMMENT '单价',
  `sell_total` DECIMAL(10, 2) COMMENT '总金额',
  `cost` double COMMENT '货品成本',
  `discount_total` double COMMENT '优惠总金额',
  `discount_ponumber` double COMMENT '抵扣积分',
  `tax_fee` double COMMENT '税额',
  `share_favourable_fee` double COMMENT '分摊金额',
  `estimate_weight` double COMMENT '预估重量',
  `goods_memo` varchar COMMENT '货品备注',
  `cate_name` varchar COMMENT '货品类别',
  `brand_name` varchar COMMENT '品牌',
  `goods_tags` varchar COMMENT '货品标签',
  `is_fit` double COMMENT '组合装标记',
  `is_gift` double COMMENT '赠品标记',
  `discount_fee` double COMMENT '优惠',
  `tax_rate` double COMMENT '税率',
  `estimate_goods_volume` double COMMENT '预估体积',
  `is_presell` double COMMENT '是否预售货品标记',
  `customer_price` double COMMENT '终端销售单价',
  `customer_total` double COMMENT '终端销售金额',
  `trade_goods_no` varchar COMMENT '交易编号',
  `trade_goods_name` varchar COMMENT '交易名称',
  `trade_goods_spec` varchar COMMENT '交易规格',
  `trade_goods_unit` varchar COMMENT '交易单位',
  `source_subtrade_no` varchar COMMENT '网店子订单号',
  `plat_code` varchar COMMENT '平台代码',
  `plat_goods_id` varchar COMMENT '平台商品id',
  `sub_trade_id` varchar COMMENT '商品明细id（唯一）',
  `plat_author_id` varchar COMMENT '平台主播id',
  `plat_author_name` varchar COMMENT '平台主播名称',
  `is_plat_gift` varchar COMMENT '平台赠品标记',
  `goods_plat_discount_fee` double COMMENT '货品平台优惠',
  `share_favourable_after_fee` decimal(10,2) COMMENT '分摊后金额',
  `divide_sell_total` double COMMENT '实付总金额',
  `share_order_discount_fee` double COMMENT '订单商品优惠分摊',
  `share_order_plat_discount_fee` double COMMENT '订单平台优惠分摊',
  `source_trade_no` varchar COMMENT '网店主订单号',
  `actual_send_count` double COMMENT '实发数',
  `plat_sku_id` varchar COMMENT '平台商品链接skuId',
  `customer_trade_no` varchar COMMENT '终端网店订单号',
  `customer_subtrade_no` varchar COMMENT '终端网店子订单号',
  `plat_customdate` varchar COMMENT '平台定制信息',
  `assessment_cost_local` double COMMENT '考核成本',
  `assessment_gross_profit_local` double COMMENT '考核毛利',
  `assessment_gross_profit_percent` varchar COMMENT '考核毛利率',
  `goods_compass_source_content_type` varchar COMMENT '货品级流量题材',
  `goods_seller` varchar COMMENT '货品业务员',
  `goods_delivery` varchar COMMENT '货品发货批次明细',
  `__dm_id` varchar(128) COMMENT 'dm_id',
  `__dm_connect_id` varchar(128) COMMENT 'dm_connect_id',
  `__dm_task_id` varchar(128) COMMENT 'dm_task_id',
  `__dm_emitted_at` bigint COMMENT 'dm_emitted_at',
  `__dm_key` varchar(32) COMMENT '最终表唯一键',
  `goods_flag_ids` varchar COMMENT '',
  `spec_id` varchar COMMENT '',
  `sku_img_url` varchar COMMENT '',
  `dt` date COMMENT '分区日期',
  KEY `assessment_cost_local_52_idx` (`assessment_cost_local`),
  KEY `assessment_gross_profit_local_53_idx` (`assessment_gross_profit_local`),
  KEY `assessment_gross_profit_percent_54_idx` (`assessment_gross_profit_percent`),
  KEY `barcode_7_idx` (`barcode`),
  KEY `brand_name_20_idx` (`brand_name`),
  KEY `discount_total_13_idx` (`discount_total`),
  KEY `dt_66_idx` (`dt`),
  KEY `goods_compass_source_content_type_55_idx` (`goods_compass_source_content_type`),
  KEY `goods_no_4_idx` (`goods_no`),
  KEY `is_presell_27_idx` (`is_presell`),
  KEY `plat_author_id_38_idx` (`plat_author_id`),
  KEY `plat_code_35_idx` (`plat_code`),
  KEY `plat_customdate_51_idx` (`plat_customdate`),
  KEY `plat_goods_id_36_idx` (`plat_goods_id`),
  KEY `plat_sku_id_48_idx` (`plat_sku_id`),
  KEY `share_favourable_fee_16_idx` (`share_favourable_fee`),
  KEY `share_order_plat_discount_fee_45_idx` (`share_order_plat_discount_fee`),
  KEY `sub_trade_id_37_idx` (`sub_trade_id`),
  KEY `tax_fee_15_idx` (`tax_fee`),
  KEY `trade_id_1_idx` (`trade_id`),
  KEY `trade_no_2_idx` (`trade_no`),
  KEY `trade_time_3_idx` (`trade_time`),
  KEY `unit_9_idx` (`unit`),
  PRIMARY KEY (`__adb_auto_id__`,`dt`)
) DISTRIBUTE BY HASH(`__adb_auto_id__`) PARTITION BY VALUE(`dt`) LIFECYCLE 30 STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7 ENGINE='XUANWU' BLOCK_SIZE=8192 TABLE_PROPERTIES='{"format":"columnstore"}' COMMENT='销售单查询_货品详情'