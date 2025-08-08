insert OVERWRITE dwd.trd_erp_pay_order_sku
select
     'jky' as erp
     , j_order.trade_no
     , j_order.trade_id
     , order_sku.plat_order_id
     -- 是否异常
     , if(internal_order_number is not null, 1, 0)
     , j_order.shop_id
     , j_order.shop_name
     , channel_code
     -- 新渠道编码
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
     , share_favourable_after_fee_js
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
     -- final业务分类
    , case
        -- 线下
        when offline_cate.region is not null then offline_cate.region
        -- 寄样
        when customer.business_cate is not null then customer.business_cate
        -- 淘系
        when channel_code = 'CDL002' then '馋哆啦_达播子订单号'
        when channel_code = '11207308' then (
            case
                when sku_cate.cate = '馋哆啦' then concat(order_cate.cate,'馋哆啦')
                when order_cate.cate is not null then order_cate.cate
            else null end
        )
        -- 抖音
        when channel_code = '198337269' then '抖音商城'
        when channel_code = '11207381' then(
            case
                when sku_cate.cate = '米粉直播间' then '米粉直播间'
                when pay_time > '2024-09-03' and sku_cate.cate = '辅食油直播间' then '辅食油直播间'
                when plat_author_id = '1072728766956750' and pay_time > '2024-03-01' then '零食直播间'
                when plat_author_id = '3380370881384764' and pay_time > '2024-01-01' then '米粉直播间'
                when plat_author_id = '4095061305340942' then '辅食油直播间'
                when plat_author_id = '3380370881384764' then '婴标直播间'
                when plat_author_id = '1072728766956750' then '一号直播间'
                when plat_author_id = '1671712258407135' then '二号直播间'
                when plat_author_id = '1662932847966528' then '二号直播间'
                when plat_author_id = '62000710718' then '兜兜成长记'
                when plat_author_id = '2638461630161949' then '悠悠妈'
                when plat_author_id = '175575026636192' then '一棵杭白菜'
                when plat_author_id = '1979543796066136' then '天才靓妈'
                when plat_author_id = '3496897589032280' then '胚芽米自播'
                when plat_author_id = '1671712258407135' and pay_time > '2023-11-01' then '胚芽米自播'
                when plat_author_id = '1662932847966528' and pay_time > '2023-11-01' then '胚芽米自播'
                when order_cate.cate is not null then order_cate.cate
                when sku_cate.cate is not null then sku_cate.cate
                when account_cate.cate is not null then account_cate.cate
            else '小店及其它' end
        )
        when channel_code = '14028951' then sku_cate.cate
        when channel_code = '12533898' then(
            case
                when goods_name like '%馋哆啦%' and pay_time > '2024-08-01' and order_cate.cate is not null then concat(order_cate.cate,'_馋哆啦')
                when sku_cate.cate is not null then sku_cate.cate
                when order_cate.cate is not null then order_cate.cate
            else '达人直播' end
        )
        when channel_code = '14312172' then '视频号'
        when channel_code = '14532478' then (
            case
                when goods_name like '%DB%' and pay_time >= '22023-07-01' then '达播-视频号'
            else '视频号' end
        )
        when channel_code = 'CDL005' then (
            case
                when order_cate.cate is not null then '短视频'
            else '达人直播' end
        )
        when channel_code = '14637952' then (
            case
                when order_cate.cate is not null then '短视频'
            else '达人直播' end
        )
        when channel_code = 'CDL004' then '达人直播'
        -- 有赞
        when channel_code = '11218477' then (
            case
                when goods_tags like '%分销订单%' or goods_tags like '%有赞采购%' then '分销'
                when goods_tags like '%需供应商发货订单%' and order_sku.plat_sku_id not like 'Q%' and order_sku.plat_sku_id not like 'D%' then '心选业务'
                when goods_name like '%私域新人礼包%' or goods_name like '%新人礼包%' or order_sku.goods_no in  ('QZHYZ00010' ,'QZHYZ02693' ,'QZHYZ03485' ,'QZHYZ03518' ,'QZHYZ03550' ,'QZHYZ01281','QZHYZ03578' ,'QZHYZ03737' ,'QZHYZ04104','QZHYZ04014') then '礼包客户'
                when order_sku.plat_sku_id = '2802316021' then '米卡'
            else '非礼包客户' end
        )
        -- 小红书
        when channel_code = '11207358' then (
            case
                when goods_name like '%SP%' then '小红书-短视频'
                when pay_time > '2023-07-01' then '小红书-达播'
            else '小红书' end
        )
        -- 快手
        when channel_code = '11331057' then (
            case
                when sku_cate.cate is not null then '短视频'
            else '快手零食直播间' end
        )
        when channel_code = '13757144' then (
            case
                when sku_cate.cate is not null then '快手自播'
                when account_cate.cate is not null then '快手短视频'
                when order_cate.cate is not null then '快手短视频'
            else '快手达人' end
        )
        when channel_code = '11888795' then (
            case
                when sku_cate.cate is not null then '快手米粉直播间'
                when account_cate.cate is not null then '快手短视频'
            else '快手达人' end
        )
        when channel_code = '4363590166' then '快手大童零食直播间'
        when channel_code = '13038301' then '代播'
        when channel_code = '14422985' then '代播'
        when channel_code = '14597829' then '代播'
        when channel_code = '14597829' and pay_time > '2023-08-01' then '代播'
        when channel_code = '14422985' and pay_time > '2024-03-01' then '达人直播'
        when channel_code = '13277491' and pay_time > '2024-03-01' then '婴标直播间'
    else null end as business_cate
    , date_format(j_order.gmt_create,'%Y-%m-%d')
from (
    select * from(
        select
            *,row_number() over (partition by trade_id order by gmt_modified desc) n from ods.jky_qm_trades_fullinfo
        where is_delete = 0 and seller_memo not like '%测试单%' and gmt_create like '2024-11%'
    )tmp where n =1 and trade_status not in ('5020','5030')
) j_order
left join(
    select
        a.trade_no,
        a.trade_id,
        c.goods_no as goods_no,
        c.goods_name as goods_name,
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
        -- 拉新赠品
        case
            when (c.flag_data like '%便携装%' and share_favourable_after_fee != 0 and is_gift = 0) then '拉新'
            when is_gift = 1 and nvl(is_giveaway,1) = 1 and c.flag_data like '%便携装%' then '尝鲜装赠品'
            when is_gift = 1 and nvl(is_giveaway,1) = 1 and c.sku_field5 like '%MS%' then 'MS赠品'
            when is_gift = 1 and nvl(is_giveaway,1) = 1 and c.cate_full_name like '%06周边赠品礼盒%' then '非食赠品'
            when is_gift = 1 and nvl(is_giveaway,1) = 1 then '正装赠品'
        else null end gift_flag,
        coalesce(plat_author_id, last_value(plat_author_id) over (partition by a.trade_id order by plat_author_id)) as plat_author_id,
        plat_sku_id,
        goods_tags,
        price1,
        -- 分摊后金额
        -- 1.单品取分摊后金额
        -- 2. 组合装（b，c），b是赠品，分摊后金额为0，c是正装去组合装的分摊后金额，否则按照rsp占比分摊
        #         share_favourable_after_fee share_favourable_after_fee_js
        if(sum(1) over(partition by a.trade_no,a.goods_no,a.sub_trade_id) = 1,share_favourable_after_fee,
            if(is_giveaway = 1 or sum(if(is_giveaway = 1,0,cast(e.price1 as decimal(10,2))*b.sell_count)) over(partition by a.trade_no,a.goods_no,a.sub_trade_id) * cast(share_favourable_after_fee as decimal(10,2)) = 0, 0,
               cast(e.price1 as decimal(10,2)) * b.sell_count / sum(if(is_giveaway = 1,0,cast(e.price1 as decimal(10,2))*b.sell_count)) over(partition by a.trade_no,a.goods_no,a.sub_trade_id) * cast(share_favourable_after_fee as decimal(10,2)))
        ) share_favourable_after_fee_js
    from(select trade_no,gmt_create from ods.jky_qm_trades_fullinfo where is_delete = 0 and seller_memo not like '%测试单%' and gmt_create like '2024-11%') t
    left join(select * from ods.jky_qm_trades_fullinfo_goodsdetail where dt = '2024-12-23') a on t.trade_no = a.trade_no
    left join(select * from ods.jky_qm_trades_fullinfo_assembly_goodsdto where dt = '2024-12-23') b on a.trade_id = b.trade_id and a.sub_trade_id = b.sub_trade_id
    left join(select * from ods.jky_storage_goodsinfo where dt = '2024-12-23' and is_delete = 0) c on nvl(b.goods_no,a.goods_no) = c.goods_no and nvl(b.spec_name,a.spec_name) = c.sku_name
    left join(select distinct sku_id,is_giveaway from ods.jky_goods_package_detail where dt = '2024-12-23' and is_giveaway = 1) d on c.sku_id = d.sku_id
    left join(select sku_id,max(price1) price1 from ods.jky_pricelist where dt = '2024-12-23' and is_current_active = 1 group by sku_id) e on c.sku_id = e.sku_id
)order_sku on j_order.trade_id = order_sku.trade_id
left join(
    select
        *
    from(select sku_id as goods_no,adjustment_cost,row_number() over (partition by sku_id order by start_date desc ) n from ods.fill_cost_adjustment_template where dt = '2024-10-12')tmp
    where n = 1
)good_cost on order_sku.goods_no = good_cost.goods_no
left join(select * from ods.fill_abnormal_order_numbers where dt = '2024-10-12') ex_order on j_order.trade_no = ex_order.internal_order_number
left join(select * from ods.jky_sales_channel where dt = '2024-12-23') channel on j_order.shop_id = channel.channel_id
left join(select * from(select *,row_number() over (partition by trade_id) n from ods.jky_business_log where log_detail like '%取消订单%')tmp where n = 1)jky_log on j_order.trade_id = jky_log.trade_id
left join(select * from dim.sku_cate_zip where dt = '9999-12-31')sku_cate on order_sku.plat_sku_id = sku_cate.plat_sku_id
left join(select * from dim.dealer_zip where dt = '9999-12-31')offline_cate on j_order.customer_code = offline_cate.dealer_id
left join(select * from ods.fill_send_shop_cost)customer on j_order.customer_code = customer.customer_id
left join(select * from dim.account_cate_zip where dt = '9999-12-31')account_cate on order_sku.plat_author_id = account_cate.account_id
left join(
    select order_id,cate from(
        select *,row_number() over (partition by order_id order by type desc) n from (
            select distinct sub_order_id as order_id,order_cate cate,1 as type from dwd.trd_tb_unpaid_order where dt = '2024-12-23'
            union
            select distinct sub_order_id,order_cate,2 as type from dwd.trd_tb_living where dt = '2024-12-23'
        )tmp
    )t where n =1
    union
    select distinct order_id,business_cate from dwd.trd_dy_alliance_order where dt = '2024-12-23'
    union
    SELECT distinct order_id,business_cate FROM ods.tmp_ks_order
)order_cate on order_sku.plat_order_id = order_cate.order_id
;

-- 原数据 分摊后金额核对
with tmp as (
    select
         b.tradeNo,
         avg(payment),
         sum(shareFavourableAfterFee),
         avg(payment) - sum(shareFavourableAfterFee) c
    from ods.tmp_order_11 a
    join jky.qm_trades_fullinfo b on a.trade_id = b.tradeNo
    join jky.qm_trades_fullinfo_goodsdetail c on b.tradeNo = c.tradeNo
    group by b.tradeNo
)
select * from tmp where c > 1;

-- 共有数据
CREATE TABLE ods.tmp_order_11 (
  trade_id   varchar(255)  COMMENT '订单id'
)COMMENT='11月临时订单号';

with tmp as (
    select
        b.*
    from ods.tmp_order_11 a
    join dwd.trd_erp_pay_order_sku b on a.trade_id = b.trade_no
),tmp2 as(
    select trade_no,max(payment) payment,sum(cast(share_favourable_after_fee as decimal(10,2) )) share_favourable_after_fee from tmp group by trade_no
)
select trade_no,payment,share_favourable_after_fee,payment- share_favourable_after_fee
from tmp2
where trade_no = 'JY2024111341676' and payment- share_favourable_after_fee  > 1
;

select sum(share_favourable_after_fee) from dwd.trd_erp_pay_order_sku where trade_no = 'JY2024111341676';
select product_price,share_favourable_after_fee,* from dwd.trd_erp_pay_order_sku where trade_no = 'JY2024111341676';
select * from ods.jky_qm_trades_fullinfo_assembly_goodsdto where dt = '2024-12-23' and trade_no = 'JY2024110813907';
select * from ods.jky_qm_trades_fullinfo_goodsdetail where dt = '2024-12-23' and trade_no = 'JY2024110813907';


select
    a.trade_no,
    a.trade_id,
    c.goods_no as goods_no,
    c.goods_name as goods_name,
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
    -- 拉新赠品
    case
        when (c.flag_data like '%便携装%' and share_favourable_after_fee != 0 and is_gift = 0) then '拉新'
        when is_gift = 1 and nvl(is_giveaway,1) = 1 and c.flag_data like '%便携装%' then '尝鲜装赠品'
        when is_gift = 1 and nvl(is_giveaway,1) = 1 and c.sku_field5 like '%MS%' then 'MS赠品'
        when is_gift = 1 and nvl(is_giveaway,1) = 1 and c.cate_full_name like '%06周边赠品礼盒%' then '非食赠品'
        when is_gift = 1 and nvl(is_giveaway,1) = 1 then '正装赠品'
    else null end gift_flag,
    coalesce(plat_author_id, last_value(plat_author_id) over (partition by a.trade_id order by plat_author_id)) as plat_author_id,
    plat_sku_id,
    goods_tags,
    price1,
    -- 分摊后金额
    -- 1.单品取分摊后金额
    -- 2. 组合装（b，c），b是赠品，分摊后金额为0，c是正装去组合装的分摊后金额，否则按照rsp占比分摊
    #         share_favourable_after_fee share_favourable_after_fee_js
    if(sum(1) over(partition by a.trade_no,a.goods_no,a.sub_trade_id) = 1,share_favourable_after_fee,
        if(is_giveaway = 1 or sum(if(is_giveaway = 1,0,cast(e.price1 as decimal(10,2))*b.sell_count)) over(partition by a.trade_no,a.goods_no,a.sub_trade_id) * cast(share_favourable_after_fee as decimal(10,2)) = 0, 0,
           cast(e.price1 as decimal(10,2)) * b.sell_count / sum(if(is_giveaway = 1,0,cast(e.price1 as decimal(10,2))*b.sell_count)) over(partition by a.trade_no,a.goods_no,a.sub_trade_id) * cast(share_favourable_after_fee as decimal(10,2)))
    ) share_favourable_after_fee_js
from(select trade_no,gmt_create from ods.jky_qm_trades_fullinfo where is_delete = 0 and seller_memo not like '%测试单%' and gmt_create like '2024-11%') t
left join(select * from ods.jky_qm_trades_fullinfo_goodsdetail where dt = '2024-12-23') a on t.trade_no = a.trade_no
left join(select * from ods.jky_qm_trades_fullinfo_assembly_goodsdto where dt = '2024-12-23') b on a.trade_id = b.trade_id and a.sub_trade_id = b.sub_trade_id
left join(select * from ods.jky_storage_goodsinfo where dt = '2024-12-23' and is_delete = 0) c on nvl(b.goods_no,a.goods_no) = c.goods_no and nvl(b.spec_name,a.spec_name) = c.sku_name
left join(select distinct sku_id,is_giveaway from ods.jky_goods_package_detail where dt = '2024-12-23' and is_giveaway = 1) d on c.sku_id = d.sku_id
left join(select sku_id,max(price1) price1 from ods.jky_pricelist where dt = '2024-12-23' and is_current_active = 1 group by sku_id) e on c.sku_id = e.sku_id
where price1 is null
;

select sku_id,price1,* from ods.jky_pricelist where dt = '2024-12-23' and is_current_active = 1 and sku_id = '1822391031441326848';
select * from ods.jky_qm_trades_fullinfo_assembly_goodsdto where dt = '2024-12-23' and trade_no = 'JY2024110334594';
-- -----------

select * from jky.qm_trades_fullinfo_goodsdetail where tradeNo = 'JY2024111341676';

select skuId,* from jky.storage_goodsinfo where goodsNo = 'QZHTMB01213';
select * from ods.jky_pricelist where sku_id = '2066889330084611584';


select * from jky.qm_trades_fullinfo_assembly_goodsdto where tradeNo = 'JY202411121047';
select * from jky.pricelist where skuId = '2066889330084611584';

select
    package_good.sku_id,
    sku_price.price1
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
union all
-- 非组合装商品价格成本
select
    package_good.sku_id,
    sku_price.price1
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

;



select * from jky.qm_trades_fullinfo_goodsdetail where tradeNo = 'JY2024112748109';
select goodsDetail,* from jky.qm_trades_fullinfo where tradeNo = 'JY2024112748109';

select sum(cast(shareFavourableAfterFee as decimal(16,2))) from jky.qm_trades_fullinfo_goodsdetail where tradeNo = 'JY2024112748109';

select assemblyGoodsDetail,* from jky.qm_trades_fullinfo where tradeNo = 'JY202411140006';
select * from jky.qm_trades_fullinfo_goodsdetail where tradeNo = 'JY202411140006';

select platAuthorId,* from jky.qm_trades_fullinfo_goodsdetail where tradeNo = 'JY2024111123369';

select count(1)
from tmp2
where payment- share_favourable_after_fee  > 1
;


select * from dwd.trd_erp_pay_order_sku where trade_no = 'JY202411185619';

select shareFavourableAfterFee,* from jky.qm_trades_fullinfo_goodsdetail where tradeNo = 'JY202411185619';

select * from ods.jky_qm_trades_fullinfo_goodsdetail where dt = '2024-12-23' and trade_no = 'JY202411185619';
-- 排查
with tmp as (
    select b.* from ods.tmp_order_11 a join dwd.trd_erp_pay_order_sku b on a.trade_id = b.trade_no
)
select
    trade_no,goods_name,sku_id,payment,share_favourable_after_fee
from tmp where shop_name = '馋哆啦-京东POP旗舰店';


select payment,share_favourable_after_fee
from dwd.trd_erp_pay_order_sku where trade_no = 'JY202411140006';



with tmp as (
    select
        a.trade_no,
        a.trade_id,
        c.goods_no as goods_no,
        c.goods_name as goods_name,
        c.sku_id as sku_id,
        c.sku_name as sku_name,
        price1,
        c.brand_name,
        -- 分摊后金额
        -- 1.单品取分摊后金额
        -- 2. 组合装（b，c），b是赠品，分摊后金额为0，c是正装去组合装的分摊后金额，否则按照rsp占比分摊
        #         share_favourable_after_fee share_favourable_after_fee_js
        if(sum(1) over(partition by a.trade_no,a.goods_no,a.sub_trade_id) = 1,share_favourable_after_fee,
            if(is_giveaway = 1 or sum(if(is_giveaway = 1,0,cast(e.price1 as decimal(10,2))*b.sell_count)) over(partition by a.trade_no,a.goods_no,a.sub_trade_id) * cast(share_favourable_after_fee as decimal(10,2)) = 0, 0,
               cast(e.price1 as decimal(10,2)) * b.sell_count / sum(if(is_giveaway = 1,0,cast(e.price1 as decimal(10,2))*b.sell_count)) over(partition by a.trade_no,a.goods_no,a.sub_trade_id) * cast(share_favourable_after_fee as decimal(10,2)))
        ) share_favourable_after_fee_js
    from(select trade_no,gmt_create from ods.jky_qm_trades_fullinfo where is_delete = 0 and seller_memo not like '%测试单%' and gmt_create like '2024-11%') t
    left join(select * from ods.jky_qm_trades_fullinfo_goodsdetail where dt = '2024-12-23') a on t.trade_no = a.trade_no
    left join(select * from ods.jky_qm_trades_fullinfo_assembly_goodsdto where dt = '2024-12-23') b on a.trade_id = b.trade_id and a.sub_trade_id = b.sub_trade_id
    left join(select * from ods.jky_storage_goodsinfo where dt = '2024-12-23' and is_delete = 0) c on nvl(b.goods_no,a.goods_no) = c.goods_no and nvl(b.spec_name,a.spec_name) = c.sku_name
    left join(select distinct sku_id,is_giveaway from ods.jky_goods_package_detail where dt = '2024-12-23' and is_giveaway = 1) d on c.sku_id = d.sku_id
    left join(select sku_id,max(price1) price1 from ods.jky_pricelist where dt = '2024-12-23' and is_current_active = 1 group by sku_id) e on c.sku_id = e.sku_id
    where price1 is null
)
select * from tmp where share_favourable_after_fee_js = 0

;



