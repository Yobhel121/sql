with tttt as (
    select
        distinct
        outbound_id,
        order_number,
        warehouse_name,
        source_trade_no
    from (
        select
            row_number() over (partition by t2.rec_id order by t1.rec_id) n,
            t1.goods_doc_no outbound_id, -- 出库单号
            t1.in_out_date outbound_datetime, -- 出库时间
            t1.bill_no order_number,  -- 订单号
            source_trade_no, -- 网店订单号
            source_subtrade_no, -- 网店订单号
            case when concat(t3.seller_memo,t3.append_memo,t3.buyer_memo) like 'SSD' then '刷单'
                when shop_name  = '全渠道寄样专用店铺' then '寄样'
                when trade_type = 7 then '售后'
                when t1.warehouse_name like '%微瑕%' then '微瑕品'
            else '正常' end order_category,
            plat_code platform,
            t2.goods_no as goods_no, -- 商品id
            t2.goods_name as goods_name,-- 商品名称
            cast(quantity as int) quantity_cnt,
            cast(share_favourable_after_fee_js as decimal(10,2)) as allocated_amt,-- 分摊后金额
            t4.plat_author_id, -- 达人id
            plat_goods_id, -- 外部商品编码
            sku_length, -- 长
            sku_width, -- 宽
            sku_height, -- 高
            sku_length * sku_width * sku_height sku_v, -- 体积（立方厘米）
            t4.sku_weight, -- 重量(g)
            cast(is_gift as TINYINT) is_gift,
            cast(is_card as TINYINT) is_card,
            flag_names,
            t1.warehouse_name,
            date_format(t1.in_out_date,'%Y-%m-%d') in_out_day
        from (select * from ods.jky_erp_storage_goodsdocout_v2 where dt = '2025-09-14' and date_format(in_out_date,'%Y-%m') = '2025-08' and inout_type = 201) t1
        left join(select * from ods.jky_erp_storage_goodsdocout_v2_goodsdocdetail where dt = '2025-09-14') t2 on t1.goods_doc_no = t2.goods_doc_no
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
                a.source_trade_no, -- 网店主订单号
                a.source_subtrade_no, -- 网店子订单号
                -- 分摊后金额
                case when b.sell_total is not null then cast(b.sell_total as decimal(10,2)) - cast(b.share_favourable_fee as decimal(10,2))  else a.share_favourable_after_fee end share_favourable_after_fee_js
            from (select distinct bill_no from ods.jky_erp_storage_goodsdocout_v2 where dt = '2025-09-14' and date_format(in_out_date,'%Y-%m') = '2025-08' and inout_type = 201) t
            left join(select * from ods.jky_qm_trades_fullinfo_goodsdetail where dt = '2025-09-14') a on t.bill_no = a.trade_no -- 销售单查询_货品详情
            left join(select * from ods.jky_qm_trades_fullinfo_assembly_goodsdto where dt = '2025-09-14') b on a.trade_no = b.trade_no and a.trade_id = b.trade_id and a.sub_trade_id = b.sub_trade_id -- 销售单查询_组合装子件列表
            left join(select * from ods.jky_storage_goodsinfo where dt = '2025-09-14' and is_delete = 0) c on nvl(b.goods_no,a.goods_no) = c.goods_no and nvl(b.barcode,a.barcode) = c.sku_barcode -- 分页查询货品信息
        )t4 on t1.bill_no = t4.trade_no and t2.source_detail_id = t4.sub_trade_id and t2.goods_no = t4.goods_no
    )tmp where n =1
)
select *
from(select *,row_number() over (partition by outbound_id,order_number,warehouse_name,source_trade_no) n from tttt) z where n =2
;




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
    a.source_trade_no, -- 网店主订单号
    a.source_subtrade_no, -- 网店子订单号
    -- 分摊后金额
    case when b.sell_total is not null then cast(b.sell_total as decimal(10,2)) - cast(b.share_favourable_fee as decimal(10,2))  else a.share_favourable_after_fee end share_favourable_after_fee_js
from (select distinct bill_no from ods.jky_erp_storage_goodsdocout_v2 where dt = '2025-09-14' and date_format(in_out_date,'%Y-%m') = '2025-08' and inout_type = 201) t
left join(select * from ods.jky_qm_trades_fullinfo_goodsdetail where dt = '2025-09-14') a on t.bill_no = a.trade_no -- 销售单查询_货品详情
left join(select * from ods.jky_qm_trades_fullinfo_assembly_goodsdto where dt = '2025-09-14') b on a.trade_no = b.trade_no and a.trade_id = b.trade_id and a.sub_trade_id = b.sub_trade_id -- 销售单查询_组合装子件列表
left join(select * from ods.jky_storage_goodsinfo where dt = '2025-09-14' and is_delete = 0) c on nvl(b.goods_no,a.goods_no) = c.goods_no and nvl(b.barcode,a.barcode) = c.sku_barcode -- 分页查询货品信息
;

with tmp as (
    select *,row_number() over (partition by bill_no)n from ods.jky_erp_storage_goodsdocout_v2 where dt = '2025-09-14' and date_format(in_out_date,'%Y-%m') = '2025-08' and inout_type = 201
)
select * from tmp where n =2;

with tmp as (
    select
        distinct
        source_trade_no,
        warehouse_name,
        a.trade_no
    from(select * from ods.jky_qm_trades_fullinfo where is_delete = 0 and pay_time like '2025-08%') a
    join(select * from ods.jky_qm_trades_fullinfo_goodsdetail where dt = '2025-09-14') b on a.trade_no = b.trade_no
)select * from(select *,row_number() over (partition by source_trade_no)n from tmp)x where n =2;


select warehouse_name,trade_no,* from ods.jky_qm_trades_fullinfo where trade_no = 'JY2025082315155';
select * from ods.jky_qm_trades_fullinfo_goodsdetail where dt = '2025-09-14' and source_trade_no = '4698349203242730301';

select * from rpa_data.dy_finance_statement where account_id = '1841499656890380';

select * from rpa_data.jky_sales_order_details order by created_at desc;

show create table rpa_data.jky_sales_order_details;

select count(1) from rpa_data.jky_sales_order_details ;


select * from rpa_data.pdd_promotion_expenses order by created_at desc ;

select * from rpa_data.product_search_records where platform = '京东';

select shop_id,biz_day,count(1) from rpa_data.jd_autarky_product
group by shop_id,biz_day
order by biz_day desc
;

select * from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'jky_sales_order_details';

select * from ods.jky_in_storage_goodsDocDetail;



select * from rpa_data.htzt_finance order by created_at desc ;



select * from rpa_data.pdd_pre_sales_sales_data;

select * from rpa_data.dy_promotion_fee_consumption where biz_day = '2025-09-24' and account_id = '1806981083831563';

select * from rpa_data.dy_promotion_global_product where  biz_day = '2025-09-24' and account_id = '1806981083831563';



select biz_day,count(distinct account_id) from rpa_data.dy_promotion_global_product group by biz_day  order by biz_day desc ;

select biz_day,count(distinct account_id) from rpa_data.dy_promotion_product_product group by biz_day  order by biz_day desc ;


select * from rpa_data.trd_tmcs_category_name


show create table rpa_data.trd_tmcs_category_name;

select biz_day,count(distinct account_id) from ods.rpa_dy_finance_statement group by biz_day  order by biz_day desc ;


select biz_day,account_id,count(1) from ods.rpa_dy_promotion_global_product group by biz_day,account_id  order by biz_day desc ;

select biz_day,account_id,count(1) from ods.rpa_dy_promotion_product_product group by biz_day,account_id  order by biz_day desc ;

select * from `rpa_data`.`dy_finance_statement` WHERE  account_id  in ('1824569247191385')   order by biz_day desc ;


select
        distinct
        biz_day,send_goods_count cnt
    from Jackyun.jky_send_order_count where biz_day >= date_sub('2025-09-28',7)


select count(1)  from ods.fill_bud_fin_import_items where dt = '2025-10-20';