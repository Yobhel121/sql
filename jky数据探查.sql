-- 商品表
SELECT * FROM ods.jky_storage_goodsinfo where goods_no = 'Q01010101015';
-- flat_data 区分 常温，冷链 和 组装装？
SELECT distinct goods_name , flag_data  FROM ods.jky_storage_goodsinfo;
SELECT *  FROM ods.jky_storage_goodsinfo a right join ods.jky_goods_package b on a.goods_id = b.goods_id where b.goods_id is null;


select distinct freight_template_name from ods.rpa_xhs_order_inquiry;
select freight_template_name,sku_name,shipment_warehouse,* from ods.rpa_xhs_order_inquiry where freight_template_name = '冷链运费模版';
select distinct freight_template_name,sku_name from ods.rpa_xhs_order_inquiry where freight_template_name = '包邮-默认模板';

SELECT cate_full_name,* FROM ods.jky_storage_goodsinfo where goods_no = 'QZHPDD30062';

-- 组合装商品表
select * from jky.storage_goodsinfo;
SELECT * FROM ods.jky_goods_package;
select * from ods.jky_goods_package_detail where package_sku_id = '2042928873849390336';
-- 组合装子件详情

-- goodsAmount
select * from ods.jky_goods_package where sku_id = '2047273716655784192';
-- goodsAmount
select * from ods.jky_goods_package_detail where package_sku_id = '2047273716655784192';

-- 供应商货品价目  唯一键 sku_id
SELECT * FROM ods.jky_goods_source;

-- 货品价目 唯一键 sku_id
select * from ods.jky_pricelist;
-- 分页查询退换补发单（新）_货品信息
select source_subtrade_no,* from ods.jky_return_change_goods_detail order by gmt_create;

select trade_type,* from ods.jky_qm_trades_fullinfo where dt = '2024-10-20';


-- 奇门-销售单组合子件
select * from ods.jky_qm_trades_fullinfo_assembly_goodsdelivery;

select * from ods.jky_qm_trades_fullinfo_assembly_goodsdto;
-- 奇门-销售单
select trade_id,* from ods.jky_qm_trades_fullinfo where trade_no = 'JY2024102015469';
select * from ods.jky_qm_trades_fullinfo where shop_type_code = 'XHS' and customer_type_name = '';
select * from ods.jky_qm_trades_fullinfo_goodsdetail where trade_no = 'JY2024102015469';

select * from ods.jky_qm_trades_fullinfo_assembly_goodsdto where dt = '2024-12-10' and trade_no = 'JY2024102015469';
select * from ods.jky_qm_trades_fullinfo_assembly_goodsdto where dt = '2024-10-31' and sell_count >= 2;

select * from ods.jky_storage_goodsinfo where dt = '2024-12-10' and sku_id = 1822391031441326848;
select * from ods.jky_goods_package where goods_no = 'Q02030101015';

select * from dim.jky_product where goods_no = 'Q02030101015';

select DISTINCT shop_type_code from ods.jky_qm_trades_fullinfo ;
SELECT shop_name,* FROM dwd.trd_erp_pay_order_sku WHERE plat_author_name != '';

select distinct plat_author_name from ods.jky_qm_trades_fullinfo_goodsdetail where plat_author_name like '%李%';
SELECT plat_author_name,* FROM dwd.trd_erp_pay_order_sku WHERE shop_name like '%天猫%' and plat_author_name like '%琦%' ;
select * from ods.jky_qm_trades_fullinfo_goodsdetail where plat_author_id = '1072728766956750';


select * from jky.qm_trades_fullinfo_goodsdetail where tradeNo = 'JY2024103117448';

-- 抖音业务分类
# 胚芽米自播	主播id-sp	[主播id-sp]="1671712258407135" and [订单支付日期]>='2023-11-01' then "胚芽米自播"
# 胚芽米自播	主播id-sp	[主播id-sp]="1662932847966528" and [订单支付日期]>='2023-11-01' then "胚芽米自播"
# 零食直播间	主播id-sp	[主播id-sp]="1072728766956750" and [订单支付日期]>='2024-03-01' then "零食直播间"
# 米粉直播间	主播id-sp	[主播id-sp]="3380370881384764" and [订单支付日期]>='2024-01-01' then "米粉直播间"
# 辅食油直播间	主播id-sp	[主播id-sp]="4095061305340942" then "辅食油直播间"
# 婴标直播间	主播id-sp	[主播id-sp]="3380370881384764" then "婴标直播间"
# 一号直播间	主播id-sp	[主播id-sp]="1072728766956750" then "一号直播间"
# 二号直播间	主播id-sp	[主播id-sp]="1671712258407135" then "二号直播间"
# 二号直播间	主播id-sp	[主播id-sp]="1662932847966528" then "二号直播间"
# 兜兜成长记	主播id-sp	[主播id-sp]="62000710718" then "兜兜成长记"
# 悠悠妈	主播id-sp	[主播id-sp]="2638461630161949" then "悠悠妈"
# 一棵杭白菜	主播id-sp	[主播id-sp]="175575026636192" then "一棵杭白菜"
# 天才靓妈	主播id-sp	[主播id-sp]="1979543796066136" then "天才靓妈"
# 胚芽米自播	主播id-sp	[主播id-sp]="3496897589032280" then "胚芽米自播"
 select distinct tiktok,author_account from rpa_data.dy_alliance_order where author_account ='秋田满满宝宝辅食店';
select payment_time,* from rpa_data.dy_alliance_order where author_account = '秋田满满母婴食品官方账号' order by payment_time desc ;
select * from ods.jky_qm_trades_fullinfo  where online_trade_no = '4921612645219679559';
select plat_author_id,plat_author_name,* from ods.jky_qm_trades_fullinfo_goodsdetail where source_subtrade_no = '6917562199164747028';
select distinct plat_author_id,plat_author_name from ods.jky_qm_trades_fullinfo_goodsdetail where plat_author_id= '3496897589032280';

select * from ods.jky_qm_trades_fullinfo where shop_type_code = 'DVD';
-- 奇门-销售单子件详情
select * from ods.jky_qm_trades_fullinfo_goodsdetail where trade_no = '1919655556885054848';
select plat_goods_id,sub_trade_id,* from ods.jky_qm_trades_fullinfo_goodsdetail;



-- 仓库查询 唯一键 warehouse_code
select * from ods.jky_warehouse_info where dt = '2024-10-20';
select warehouse_category_type,* from ods.jky_warehouse_info where warehouse_code in ('0065','0069');

-- 异常订单号
select * from ods.fill_abnormal_order_numbers where dt = '2024-10-12';


select * from ods.jst_qm_orders_info;
select * from ods.jst_qm_orders_info_sku;


-- 子商品数量售价表  别名 ods_erp_组合子商品信息融合
select package_sku_id,sku_id,goods_amount as goods_cnt, share_price as sale_price,'jky' as erp from ods.jky_goods_package_detail
union all
select sku_id,src_sku_id,qty,sale_price,'jst' as erp from ods.jst_combine_sku_items;



-- 货品价目 基本售价
select * from ods.jky_pricelist;
select
    count(1),
    count(distinct t1.sku_id),
    count(distinct t3.sku_id)
from (select * from ods.jky_storage_goodsinfo where dt = '2024-10-20') t1
left join (select * from ods.jky_goods_package where dt = '2024-10-20') t2 on t1.goods_no = t2.goods_no
left join (select distinct sku_id,price1 from ods.jky_pricelist where dt = '2024-10-20') t3 on t1.sku_id = t3.sku_id
left join (
    select
        *,nvl(date_sub(nvl(lead(start_date) over (partition by sku_id order by start_date),'9999-12-31'),1),'9999-12-31') as end_date
    from(select distinct sku_id,start_date,adjustment_cost from ods.fill_cost_adjustment_template where dt = '2024-10-12')tmp
) t4 on t1.goods_no = t4.sku_id
where t2.sku_id is null
;

-- *********************************************************************************************************************************************************
select *
from (select * from ods.jky_qm_trades_fullinfo where dt = '2024-10-27' and trade_status not in ('5020','5030')) j_order
left join(select * from ods.jky_qm_trades_fullinfo_goodsdetail where dt = '2024-10-27') order_goods on j_order.trade_no = order_goods.trade_no
left join(select * from ods.jky_storage_goodsinfo where dt = '2024-10-27') storage on order_goods.goods_no = storage.goods_no and order_goods.spec_name = storage.sku_name
left join(select * from ods.jky_goods_package where dt = '2024-10-28') goods on order_goods.goods_no = goods.goods_no
left join(select * from ods.jky_goods_package_detail where dt = '2024-10-28') goods_info on goods.sku_id = goods_info.package_sku_id
where j_order.trade_no = 'JY2024070319861';

select trade_id,* from  ods.jky_qm_trades_fullinfo where dt = '2024-10-28' and trade_no = 'JY2024070319861';
select plat_sku_id,* from  ods.jky_qm_trades_fullinfo_goodsdetail where dt = '2024-10-28' and trade_no = 'JY2024070319861';

select * from ods.jky_storage_goodsinfo where dt = '2024-10-27' and goods_no in ('QTMM-DYHTY531-1','Q01030101002','QZHDYRCY1','Q06010300017','QZHDY7088','Q01020101019','QZHDY02003');

select * from ods.jky_goods_package where dt = '2024-10-28' and goods_no in('Q01030101002','QTMM-DYHTY531-1','QZHDY7088','Q06010300017','QZHDY02003','QZHDYRCY1','Q01020101019');
select sku_id,* from ods.jky_goods_package_detail where dt = '2024-10-28' and package_sku_id in('1975398204391162240','1962409820517433856','1874018470293995904','1985697817908085504');




SELECT * FROM dim.product_item_zip where dt = '9999-12-31' and goods_no in('Q01030101002','QTMM-DYHTY531-1','QZHDY7088','Q06010300017','QZHDY02003','QZHDYRCY1','Q01020101019');

select t1.sku_id,price1,*
from (select * from ods.jky_storage_goodsinfo where dt = '2024-10-27') t1
left join (select * from ods.jky_goods_package where dt = '2024-10-27') t2 on t1.goods_no = t2.goods_no
left join (select distinct sku_id,price1 from ods.jky_pricelist where dt = '2024-10-27') t3 on t1.sku_id = t3.sku_id
left join (
    select * from(
        select
            *,nvl(date_sub(lead(start_date) over (partition by sku_id order by start_date),1),'9999-12-31') as end_date
        from(select distinct sku_id,start_date,adjustment_cost from ods.fill_cost_adjustment_template where dt = '2024-10-12')tmp
     )tttt where end_date = '9999-12-31'
) t4 on t1.goods_no = t4.sku_id
where t1.goods_no in('Q01030101002','QTMM-DYHTY531-1','QZHDY7088','Q06010300017','QZHDY02003','QZHDYRCY1','Q01020101019');

select * from ods.jky_goods_package where dt = '2024-10-28' and goods_no in ('QZHDYRCY1','QZHDY02003','QTMM-DYHTY531-1','QZHDY7088');

select * from ods.jky_goods_package_detail where dt = '2024-10-28' and package_sku_id in(1975398204391162240,1985697817908085504,1874018470293995904,1962409820517433856);

# 订单业务分类标注
# 线上:
#     根据rpa订单id 业务分类
#     根据商品sku_id 业务分类
#     根据商品商品链接 业务分类
#     根据商品商品链接 业务分类
# 线下：
#     根据经销商 业务分类

select shopcode,shop_id,* from ods.jky_qm_trades_fullinfo where dt = '2024-10-20';
select DISTINCT shop_id,shop_name from ods.jky_return_change where dt = '2024-10-20';

select distinct channel_code,channel_name from ods.jky_in_storage;

select channel_id,count(1) from ods.jky_sales_channel group by channel_id;

select * from ods.jky_sales_channel where channel_code = 'C2024013014390';

select * from

select * from jky.goods_package_detail;

with tmp as (
    select row_number() over (partition by sub_order_id,product_id order by dt desc) n,* from ods.rpa_tb_tm_living_sale
)
select sub_order_id,product_id,product_title,* from tmp where n >= 2;


select *,row_number() over (partition by sku_id order by end_date desc )n from ods.fill_cost_adjustment_template where dt = '2024-10-12' and end_date is not null ;

with t1 as (
    select distinct sku_id,start_date,adjustment_cost from ods.fill_cost_adjustment_template where sku_id = 'Q01050501008'
),t2 as(
    select sku_id,adjustment_cost,start_date,date_sub(nvl(lead(start_date) over (partition by sku_id order by start_date),'9999-12-31'),1) from t1
)select * from t2;


select * from  ods.jky_pricelist where dt = '2024-10-20' and sku_id = 1937636254734942720;


select sku_id from ods.jky_pricelist where dt = '2024-10-20' having count(1) >=2;



select * from ods.jky_storage_goodsinfo where goods_no = 'Q02030101006';

select *,row_number() over (partition by sku_id order by end_date desc )n from ods.fill_cost_adjustment_template where dt = '2024-10-12' and sku_id = 'D11040101003';

select * from ods.fill_cost_adjustment_template a join ods.jky_storage_goodsinfo b on a.sku_id = b.sku_id;


select count(distinct a.sku_id) from ods.jky_storage_goodsinfo a left join ods.jky_goods_package b on a.goods_no = b.goods_no where b.sku_id is null;

select count(distinct sku_id) from ods.fill_cost_adjustment_template;

# 货品-> sku
# jky订单(多) == 网店订单(多)-> 货品-> sku

with order as(
    select * from ods.jky_qm_trades_fullinfo where dt = '2024-10-20'
),order_goods as(
    select * from ods.jky_qm_trades_fullinfo_goodsdetail where dt = '2024-10-19'
),goods as(
    SELECT * FROM ods.jky_storage_goodsinfo where dt = '2024-10-20'
),ex_order as (
    -- 异常订单号
    select * from ods.fill_abnormal_order_numbers where dt = '2024-10-12'
)
select
    order.trade_no
    ,online_trade_no
    ,source_subtrade_no
    ,trade_id
    ,pay_status
    ,pay_time
    ,trade_time
    ,total_fee
    ,order.tax_fee
    ,order.discount_fee
    ,payment
    ,coupon_fee
    ,received_total
    ,order_goods.goods_no
    ,order_goods.goods_name
    ,plat_code
    ,plat_goods_id
    ,is_fit
    ,is_gift
    ,cost
    ,discount_total
    ,goods_plat_discount_fee
    ,divide_sell_total
    ,share_order_discount_fee
    ,share_order_plat_discount_fee
    ,share_favourable_fee
    ,share_favourable_after_fee
    ,if(internal_order_number is not null,1,0)
    ,country
    ,state
    ,city
    ,district
    ,town
    ,zip
    ,order.warehouse_code
    ,order.warehouse_name
    ,'2024-10-20'
from order
left join order_goods on order.trade_no = order_goods.trade_no
left join goods on order_goods.goods_no = goods.goods_no
left join ex_order on order.trade_no = ex_order.internal_order_number
;

select count(1) from ods.jky_qm_trades_fullinfo_goodsdetail where dt = '2024-10-20';





select goods_plat_discount_fee,* from ods.jky_qm_trades_fullinfo_goodsdetail where dt = '2024-10-24' and source_trade_no = '24081102868606';

select * from ods.jky_qm_trades_fullinfo_goodsdetail where dt = '2024-10-24' and trade_no = 'JY2024081111525';

select total_fee,* from ods.jky_qm_trades_fullinfo where dt = '2024-10-24' and trade_no = 'JY2024081111525';

select * from jky.qm_trades_fullinfo_goodsdetail_goodsdiscount where  tradeNo = 'JY2024081111525';


SELECT * FROM ods.jky_storage_goodsinfo where dt = '2024-10-20' and goods_no in('QTWPHTS001','QZHWPHY20050','QZHWPHY20048','QZHWPHY20047');


select *
from jky.qm_trades_fullinfo_assembly_goodsdto;
-- 吉客云组合装子件分摊后金额 jky_qm_trades_fullinfo_assembly_goodsdto
;


select a.o_id,
       a.o_id      as plt_trad_no,
       outer_oi_id as plt_subtrade_no,
       1           as is_ex,
       shop_id,
       shop_name,
       shop_i_id,
       l_id,
       send_date      consign_time
from ods.jst_qm_orders_info a
         left join ods.jst_qm_orders_info_sku b on a.o_id = b.o_id;

select *
from ods.jst_qm_orders_info;
select *
from ods.jst_qm_orders_info_sku;



select * from dwd.trd_tb_unpaid_order where dt = '2024-10-22' and complete_time like  '%2024-08-21%';

select distinct concat(main_order_id,sub_order_id,product_id)  from ods.rpa_tb_unpaid_order where complete_time like  '%2024-08-21%';

select
    *
from (
    select *, row_number() over (partition by main_order_id,sub_order_id,product_id order by created_at desc) n from ods.rpa_tb_unpaid_order
) tmp
where n = 1 and  complete_time like  '%2024-08-21%';

select * from jky.qm_trades_fullinfo_goodsdetail where platAuthorName like '%秋田满满母婴食品官方账号%';

select TABLE_SCHEMA,TABLE_NAME,TABLE_COMMENT from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA in('dwd','dim','dws');

select a.TABLE_SCHEMA,a.TABLE_NAME,TABLE_COMMENT,COLUMN_NAME,COLUMN_COMMENT from INFORMATION_SCHEMA.COLUMNS a
    join INFORMATION_SCHEMA.TABLES b on a.TABLE_NAME = b.TABLE_NAME  where a.TABLE_SCHEMA in('dwd','dim','dws');

select * from dim.sku_cate_zip;

select gmtCreate,* from jky.ass_business_refundlist where gmtCreate = '';

select * from jky.ass_business_refundlist
where returnChangeNo in('S100018','C2023112530274','DB202411250001','DB202411230011','DB202411230010')
;

select count(1) from jky.ass_business_refundlist
where 1=1
# and gmtCreate >= '2020-11-21 00:00:00'
# and gmtCreate <= '2024-11-28 23:59:59'
;

with tmp as(
    select goodsId,packageSkuId,count(1) cnt from jky.goods_package_detail group by goodsId,packageSkuId
)
select * from tmp where cnt >= 2
;

select * from jky.goods_package where skuId = '1790628014611333504';

select * from jky.goods_package_detail where packageSkuId = '1790628014611333504';