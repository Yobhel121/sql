drop table tmp.fulfillment_08;
create table tmp.fulfillment_08 as
select
    flag_names  订单标记
     , channel.company_name 店铺公司名称
     , date_format(pay_time, '%Y-%m-%d') biz_day
     , if(trade_type in(7,8,12),'售后','网店下载')  订单来源
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
     , if(trade_type in(7,8,12),0,product_cost * sku_cnt)  货品成本
     , if(trade_type in(7,8,12),0,item_cost * sku_cnt)  商品成本
     , if(trade_type in(7,8,12),0,gift_cost * sku_cnt)  赠品费用
     , j_order.warehouse_name  发货仓库
     ,j_order.shop_name  销售渠道
     ,j_order.shop_name  店铺
     ,pay_time  付款时间
     , if(trade_type in(7,8,12),0,order_sku.sku_cnt)  数量
     , order_sku.share_favourable_after_fee_js  分摊后金额
     -- 1. 组合装赠品费用，分摊到组合装其它正装上
     ,case
        when sum(share_favourable_after_fee_js) over(partition by order_sku.trade_no,order_sku.a_goods_no) = 0 then 0
        else if(trade_type in(7,8,12),0,if(order_sku.is_fit = 1, share_favourable_after_fee_js/sum(share_favourable_after_fee_js) over(partition by order_sku.trade_no,order_sku.a_goods_no) * sum(gift_cost*sku_cnt) over(partition by order_sku.trade_no,order_sku.a_goods_no),0))
     end 组合装赠品费用
     -- 2. 非组合装赠品分摊到其它 单品上 包括组合装单品上
     ,case
        when sum(share_favourable_after_fee_js) over(partition by order_sku.trade_no) = 0 then 0
        else if(trade_type in(7,8,12),0,share_favourable_after_fee_js/sum(share_favourable_after_fee_js) over(partition by order_sku.trade_no)) * sum(if(order_sku.is_fit = 1 and p_share_favourable_fee_js != 0,0,gift_cost*sku_cnt)) over(partition by order_sku.trade_no)
     end 非组合装赠品分摊
    -- a+b
#     ,case
#         when sum(share_favourable_after_fee_js) over(partition by order_sku.trade_no) = 0 then 0
#         else if(trade_type in(7,8,12),0,share_favourable_after_fee_js/sum(share_favourable_after_fee_js) over(partition by order_sku.trade_no)) * sum(gift_cost*sku_cnt) over(partition by order_sku.trade_no)
#      end 单品赠品分摊
     -- 3. 0元订单赠品  分摊到各个正品上
     -- 各个单品 分摊后金额  / 店铺每日分摊后金额(去除售后）* 每日0元赠品费用总和
     ,case
        when sum(if(share_favourable_after_fee_js>0,share_favourable_after_fee_js,0)) over(partition by channel_code,date_format(pay_time, '%Y-%m-%d')) = 0 then 0
        else if(trade_type in(7,8,12),0,share_favourable_after_fee_js/ sum(if(share_favourable_after_fee_js>0,share_favourable_after_fee_js,0)) over(partition by channel_code,date_format(pay_time, '%Y-%m-%d')) * sum(if(trade_type not in(7,8,12) and payment = 0 ,gift_cost * sku_cnt,0)) over(partition by channel_code,date_format(pay_time, '%Y-%m-%d')))
     end 其他赠品分摊金额
     -- a + b + c
    ,case
        when sum(share_favourable_after_fee_js) over(partition by order_sku.trade_no,order_sku.a_goods_no) = 0 then 0
        else if(trade_type in(7,8,12),0,if(order_sku.is_fit = 1, share_favourable_after_fee_js/sum(share_favourable_after_fee_js) over(partition by order_sku.trade_no,order_sku.a_goods_no) * sum(gift_cost*sku_cnt) over(partition by order_sku.trade_no,order_sku.a_goods_no),0))
     end
     +
     case
        when sum(share_favourable_after_fee_js) over(partition by order_sku.trade_no) = 0 then 0
        else if(trade_type in(7,8,12),0,share_favourable_after_fee_js/sum(share_favourable_after_fee_js) over(partition by order_sku.trade_no)) * sum(if(order_sku.is_fit = 1 and p_share_favourable_fee_js != 0,0,gift_cost*sku_cnt)) over(partition by order_sku.trade_no)
     end
    +
    case
        when sum(if(share_favourable_after_fee_js>0,share_favourable_after_fee_js,0)) over(partition by channel_code,date_format(pay_time, '%Y-%m-%d')) = 0 then 0
        else if(trade_type in(7,8,12),0,share_favourable_after_fee_js/ sum(if(share_favourable_after_fee_js>0,share_favourable_after_fee_js,0)) over(partition by channel_code,date_format(pay_time, '%Y-%m-%d')) * sum(if(trade_type not in(7,8,12) and payment = 0 ,gift_cost * sku_cnt,0)) over(partition by channel_code,date_format(pay_time, '%Y-%m-%d')))
     end 总赠品费用
     ,if(trade_type in(7,8,12),0,sku_cnt * order_sku.sku_weight)  货品重量
     -- JY订单总重量  （剔除赠品，卡片，赠品的便携装，组合装赠品，  ps:即分摊后金额为0）
     ,if(trade_type in(7,8,12),0,sum(if(share_favourable_after_fee_js = 0,0,sku_cnt * order_sku.sku_weight)) over(partition by j_order.trade_no))  JY订单总重量
     ,if(trade_type in(7,8,12),0,if(share_favourable_after_fee_js=0,0,sku_cnt * order_sku.sku_weight/sum(if(share_favourable_after_fee_js = 0,0,sku_cnt * order_sku.sku_weight)) over(partition by j_order.trade_no)))  货品重量占比
     ,if(trade_type in(7,8,12),0,nvl(directional_material_cost,0) * sku_cnt + if(share_favourable_after_fee_js=0,0,sku_cnt * order_sku.sku_weight/sum(if(share_favourable_after_fee_js = 0,0,sku_cnt * order_sku.sku_weight)) over(partition by j_order.trade_no)) * weight_fulfillment)  重量履约分摊
     ,weight_fulfillment 订单总履约费用
from (
    select * from(
        select
            *,row_number() over (partition by trade_id order by gmt_modified desc) n from ods.jky_qm_trades_fullinfo
        where is_delete = 0 and seller_memo not like '%测试单%' and gmt_create > date_format(date_sub('2025-09-04', 90), '%Y-%m-%d')
    )tmp where n =1
           and trade_status not in ('5010','5020','5030')
           and shop_id  not in('1723838592174621184','1726051235912319488','1695714490516406912','1739161925332304256','1799908914256478592','2240803665545987200','2083305436995192192','2069054003205801856','2164494330354370304'
                              ,'1695714467053470336','1729038499259942016','2005022954993549952','1768215165143156736','1777563627112203648')
           and warehouse_name not in('华中微瑕仓2仓','微瑕品仓')
           and shop_name not like '%线下中心%'
           and flag_names not like '%平台发货%'
           and flag_names not like '%外部发货%'
           and pay_time like '2025-07%'
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
    from(select trade_no,gmt_create,pay_time from ods.jky_qm_trades_fullinfo where is_delete = 0 and seller_memo not like '%测试单%' and gmt_create > date_format(date_sub('2025-09-04', 90), '%Y-%m-%d') and pay_time like '2025-07%') t -- 销售单查询
    left join(select * from ods.jky_qm_trades_fullinfo_goodsdetail where dt = '2025-09-04') a on t.trade_no = a.trade_no -- 销售单查询_货品详情
    left join(select * from ods.jky_qm_trades_fullinfo_assembly_goodsdto where dt = '2025-09-04') b on a.trade_no = b.trade_no and a.trade_id = b.trade_id and a.sub_trade_id = b.sub_trade_id -- 销售单查询_组合装子件列表
    left join(select * from ods.jky_storage_goodsinfo where dt = '2025-09-04' and is_delete = 0) c on nvl(b.goods_no,a.goods_no) = c.goods_no and nvl(b.barcode,a.barcode) = c.sku_barcode -- 分页查询货品信息
    left join(
        select product_code as goods_no,standard_cost adjustment_cost from ods.gyl_product where dt = '2025-09-04' -- 成本调整_template
    )d on c.goods_no = d.goods_no
)order_sku on j_order.trade_no = order_sku.trade_no
left join(select * from ods.jky_sales_channel where dt = '2025-09-04') channel on j_order.shop_id = channel.channel_id -- 销售渠道查询
left join(select * from dim.jky_storage_goodsinfo where dt = '2025-09-04' ) tmcate on order_sku.sku_id = tmcate.sku_id
left join(
    select order_id,storage_fee + handling_fee as num_fulfillment, operation_fee_total + material_fee_total + express_fee_total as weight_fulfillment  from ods.gyl_order_fulfillment where dt = '2025-09-04'
)fulfillment on j_order.trade_no = fulfillment.order_id
left join(select * from dim.sku_cate_zip where dt = '9999-12-31')sku_cate on order_sku.plat_goods_id = sku_cate.plat_sku_id and channel.channel_code = sku_cate.shop_id  -- 填报GMV-各平台店铺按规格业务分类
left join(
    select order_id,cate from(
        select *,row_number() over (partition by order_id order by type desc) n from (
            select distinct sub_order_id as order_id,order_cate cate,1 as type from dwd.trd_tb_unpaid_order where dt = '2025-09-04' -- 交易域-淘宝未结算订单数据
            union
            select distinct sub_order_id,order_cate,2 as type from dwd.trd_tb_living where dt = '2025-09-04'    -- 订单域-淘宝直播订单
        )tmp
    )t where n =1
    union
    select distinct order_id,business_cate from dwd.trd_dy_alliance_order where dt = '2025-09-04'  -- 抖音-联盟订单明细
    union
    SELECT distinct order_id,business_cate FROM ods.tmp_ks_order    -- 临时取数表_单号快手米粉直播间区分业务分类7.6
)order_cate on order_sku.plat_order_id = order_cate.order_id
left join(select * from dim.account_cate_zip where dt = '9999-12-31')account_cate on order_sku.plat_author_id = account_cate.account_id -- 账户业务分类
left join(select * from ods.gyl_product_material_cost where dt = '2025-09-04') product_material on order_sku.goods_no = product_material.product_code
;

