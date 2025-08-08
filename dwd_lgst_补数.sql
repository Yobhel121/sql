insert OVERWRITE dwd.lgst_outbound_order_item
select
    t1.goods_doc_no outbound_id, -- 出库单号
    t1.in_out_date outbound_datetime, -- 出库时间
    t1.bill_no order_number,  -- 订单号
    plat_order_id online_order_number, -- 网店订单号
    case when concat(t3.seller_memo,t3.append_memo,t3.buyer_memo) like 'SSD' then '刷单'
        when shop_name  = '全渠道寄样专用店铺' then '寄样'
        when trade_type = 7 then '售后'
        when t1.warehouse_name like '%微瑕%' then '微瑕品'
    else '正常' end order_category,
    plat_code platform,
    t2.goods_no as goods_no, -- 商品id
    t2.goods_name as goods_name,-- 商品名称
    cast(sku_cnt as int),
    cast(share_favourable_after_fee_js as decimal(10,2)) as allocated_amt,-- 分摊后金额
    t4.plat_author_id, -- 达人id
    plat_goods_id, -- 外部商品编码
    sku_length, -- 长
    sku_width, -- 宽
    sku_height, -- 高
    sku_length * sku_width * sku_height, -- 体积（立方厘米）
    t4.sku_weight, -- 重量(g)
    cast(is_gift as TINYINT),
    cast(is_card as TINYINT),
    date_format(t1.in_out_date,'%Y-%m-%d')
from (select * from ods.jky_erp_storage_goodsdocout_v2 where dt = '2025-04-27' and date_format(in_out_date,'%Y') = '2025' and inout_type = 201) t1
left join(select * from ods.jky_erp_storage_goodsdocout_v2_goodsdocdetail where dt = '2025-04-27') t2 on t1.goods_doc_no = t2.goods_doc_no
left join(select * from ods.jky_qm_trades_fullinfo where is_delete = 0) t3 on t1.bill_no = t3.trade_no -- 销售单查询
left join(
    select
        a.trade_no, -- 订单编号
        a.plat_code,-- 平台代码
        case when a.plat_code in ('AlibabaC2M','TB','TMCS','TMALL') then nvl(a.source_subtrade_no,a.source_trade_no) else a.source_trade_no end plat_order_id, -- 网店订单号
        nvl(b.sub_trade_id,a.sub_trade_id) sub_trade_id,
        if(a.plat_goods_id != '' and a.plat_goods_id is not null, a.plat_goods_id,max(a.plat_goods_id) over (partition by a.source_trade_no)) plat_goods_id,-- 平台商品id
        coalesce(a.plat_author_id, max(a.plat_author_id) over (partition by a.source_trade_no )) as plat_author_id,-- 平台主播id
        c.goods_no as goods_no, -- 货品编号
        c.goods_name as goods_name,-- 货品名称
        c.sku_id as sku_id,-- 规格ID
        c.sku_name as sku_name,-- 规格名称
        c.sku_length, -- 长
        c.sku_height, -- 高
        c.sku_width, -- 宽
        c.sku_weight, -- 重量(g)
        nvl(b.sell_count,a.sell_count) as sku_cnt, -- 销售数量
        if(a.goods_name like '%卡片%',1,0) is_card, -- 是否卡片
        a.is_gift,-- 是否赠品
        -- 分摊后金额
        case when b.sell_total is not null then cast(b.sell_total as decimal(10,2)) - cast(b.share_favourable_fee as decimal(10,2))  else a.share_favourable_after_fee end share_favourable_after_fee_js
    from (select distinct bill_no from ods.jky_erp_storage_goodsdocout_v2 where dt = '2025-04-27' and date_format(in_out_date,'%Y') = '2025' and inout_type = 201) t
    left join(select * from ods.jky_qm_trades_fullinfo_goodsdetail where dt = '2025-04-27') a on t.bill_no = a.trade_no -- 销售单查询_货品详情
    left join(select * from ods.jky_qm_trades_fullinfo_assembly_goodsdto where dt = '2025-04-27') b on a.trade_no = b.trade_no and a.trade_id = b.trade_id and a.sub_trade_id = b.sub_trade_id -- 销售单查询_组合装子件列表
    left join(select * from ods.jky_storage_goodsinfo where dt = '2025-04-27' and is_delete = 0) c on nvl(b.goods_no,a.goods_no) = c.goods_no and nvl(b.barcode,a.barcode) = c.sku_barcode -- 分页查询货品信息
)t4 on t1.bill_no = t4.trade_no and t2.source_detail_id = t4.sub_trade_id and t2.goods_no = t4.goods_no
;


select * from ods.jky_erp_storage_goodsdocout_v2_goodsdocdetail where dt = '2025-04-27' and goods_doc_no = 'CRK2025030128063';
select * from dwd.lgst_outbound_order_item where order_number='JY2025022847999';