show create table dwd.trd_rfd_item;

drop table dwd.trd_rfd_item;
CREATE TABLE dwd.`trd_rfd_item` (
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
  `rfd_time` datetime COMMENT '退款时间',
  `shop_id` varchar COMMENT '店铺id',
  `shop_name` varchar COMMENT '店铺名称',
  `package_item_id`         varchar COMMENT '组合装id',
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
  `rfd_amt` decimal(10, 2) COMMENT '退款总金额',
  `mt` varchar COMMENT '分区月份',
  PRIMARY KEY (`__adb_auto_id__`,`mt`)
) DISTRIBUTE BY HASH(`__adb_auto_id__`) PARTITION BY VALUE(`mt`) INDEX_ALL='Y' STORAGE_POLICY='HOT' ENGINE='XUANWU' TABLE_PROPERTIES='{"format":"columnstore"}' COMMENT='交易域-支付成功商品事实表'



drop table dwd.trd_pay_item;
CREATE TABLE dwd.`trd_pay_item`
(
    `__adb_auto_id__`         bigint AUTO_INCREMENT,
    `order_id`                varchar COMMENT '订单ID(吉客云)',
    `order_type`              varchar COMMENT '订单类型',
    `order_status`            varchar COMMENT '订单状态',
    `company_name`            varchar COMMENT '公司',
    `plat_code`               varchar COMMENT '网店平台编码',
    `plat_name`               varchar COMMENT '网店平台名称',
    `plat_order_id`           varchar COMMENT '平台网店主订单id',
    `plat_sub_order_id`       varchar COMMENT '平台网店主子订单id',
    `user_id`                 varchar COMMENT '用户ID',
    `seller_memo`             varchar COMMENT '客服备注',
    `buyer_memo`              varchar COMMENT '买家备注',
    `country`                 varchar COMMENT '国家',
    `state`                   varchar COMMENT '省',
    `city`                    varchar COMMENT '城市',
    `district`                varchar COMMENT '区县',
    `town`                    varchar COMMENT '街道',
    `zip`                     varchar COMMENT '邮编',
    `pay_time`                datetime COMMENT '支付时间',
    `shop_id`                 varchar COMMENT '店铺id',
    `shop_name`               varchar COMMENT '店铺名称',
    `package_item_id`         varchar COMMENT '组合装id',
    `package_item_name`       varchar COMMENT '组合装名称',
    `is_package`              varchar COMMENT '是否组合装',
    `item_id`                 varchar COMMENT '商品id',
    `item_name`               varchar COMMENT '商品名称',
    `item_cate`               varchar COMMENT '商品分类',
    `gift_flag`               varchar COMMENT '赠品标识（赠品标识:尝鲜装赠品，NS赠品，非食赠品，正装赠品)',
    `is_samp`                 varchar COMMENT '是否派样',
    `sku_id`                  varchar COMMENT '规格id',
    `sku_code`                varchar COMMENT '规格编号',
    `first_level`             varchar COMMENT '一级分类',
    `second_level`            varchar COMMENT '二级分类',
    `first_cate`              varchar COMMENT '一级品类',
    `second_cate`             varchar COMMENT '二级分类',
    `strategic_level`         varchar COMMENT '战略分级(货)',
    `channel_strategic_level` varchar COMMENT '渠道战略分级(货)',
    `spu_id`                  varchar COMMENT 'SPU ID',
    `spu_name`                varchar COMMENT 'SPU名称',
    `sku_barcode`             varchar COMMENT '条码',
    `item_price`              decimal(10, 2) COMMENT '商品单价',
    `item_cost`               decimal(10, 2) COMMENT '商品成本',
    `item_count`              int COMMENT '商品数量',
    `total_amt`               decimal(10, 2) COMMENT '下单金额',
    `mt`                      varchar COMMENT '分区月份',
    PRIMARY KEY (`__adb_auto_id__`, `mt`)
) COMMENT ='交易域-支付成功商品事实表';


select distinct plat_name from dwd.trd_pay_item;

with all_order_item as (
    select a.* from dwd.trd_pay_item a
    left join (select distinct order_id from dwd.trd_rfd_item)b on a.order_id = b.order_id
    where b.order_id is null and a.plat_name = '天猫商城'
), user_row as (
    select * from(select row_number() over (partition by user_id,first_cate order by pay_time) n,* from all_order_item)t
),first_user as (
    select * from user_row where pay_time like '2025-01%' and n = 1
),final_order as (
    select a.* from all_order_item a left join first_user b on a.user_id = b.user_id and  a.first_cate = b.first_cate  where a.pay_time > '2025-01-01 00:00:00' and a.pay_time < '2025-07-01 00:00:00'
),res_a as (
    select first_cate,count(distinct user_id) cnt from first_user group by first_cate
),res_b as (
    select first_cate,sum(total_amt) from final_order group by first_cate
)
select * from res_a a left join res_b b on a.first_cate = b.first_cate
;


with all_order_item as (
    select a.* from dwd.trd_pay_item a
    left join (select distinct trade_no from ods.jky_qm_trades_fullinfo where trade_type in(8,12))b on a.order_id = b.trade_no
    where b.trade_no is null and a.plat_name = '天猫商城'
), user_row as (
    select * from(select row_number() over (partition by user_id,first_cate order by pay_time) n,* from all_order_item)t
),first_user as (
    select * from user_row where pay_time like '2025-01%' and n = 1
),final_order as (
    select a.*,sum(a.total_amt) over(partition by a.plat_order_id) amt from all_order_item a join first_user b on a.user_id = b.user_id and  a.first_cate = b.first_cate  where a.pay_time > '2025-01-01 00:00:00' and a.pay_time < '2025-07-01 00:00:00'
),res_a as (
    select first_cate,count(distinct user_id) cnt from first_user group by first_cate
),res_b as (
    select first_cate,sum(amt) t_amt from final_order group by first_cate
)
select *,t_amt/cnt from res_a a left join res_b b on a.first_cate = b.first_cate
;

select  row_number() over (partition by user_id,first_cate order by pay_time),* from dwd.trd_pay_item where user_id = 'C202409028232';










