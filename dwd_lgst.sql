select
    goods_doc_no outbound_id, -- 出库单号
    in_out_date outbound_datetime, -- 出库时间
    bill_no order_number,  -- 订单号
    t1.company_name company, -- 公司
    channel_code shop_id,  -- 店铺id
    channel_name shop_name,  -- 店铺名称
    t1.warehouse_code, -- 发货仓库编码
    t1.warehouse_name, -- 发货仓库名称
    if(t1.warehouse_name like '%冷链%','冷链','常温'), -- 仓库类型
    t1.logistic_code express_company_code, -- 快递公司编码
    t1.logistic_name express_company, -- 快递公司
    logistic_no logistics_number, -- 物流单号
    customer_code customer_id,  -- 客户id
    customer_name,  -- 客户账户
    state province,  -- 收货省
    city, -- 收货市
    district, -- 收货区
    1 as box_code,
    2 as box_name,
    43 outbound_weight
from (select * from ods.jky_erp_storage_goodsdocout_v2 where dt = '2025-04-17' and inout_type = 201) t1
left join(select * from ods.jky_qm_trades_fullinfo) t2 on t1.bill_no = t2.trade_no
;







SELECT * FROM dwd.trd_erp_pay_order_sku WHERE trade_no in('JY202504174724');



select
    b.goods_no,
    b.goods_name,
    b.sell_total,
    b.share_favourable_fee,
    a.share_favourable_after_fee,
 case when b.sell_total is not null then cast(b.sell_total as decimal(10,2)) - cast(b.share_favourable_fee as decimal(10,2))  else a.share_favourable_after_fee end share_favourable_after_fee_js
from(select trade_no,gmt_create from ods.jky_qm_trades_fullinfo where is_delete = 0 and seller_memo not like '%测试单%' and gmt_create > date_format(date_sub('2025-04-17', 90), '%Y-%m-%d')) t -- 销售单查询
left join(select * from ods.jky_qm_trades_fullinfo_goodsdetail where dt = '2025-04-17') a on t.trade_no = a.trade_no -- 销售单查询_货品详情
left join(select * from ods.jky_qm_trades_fullinfo_assembly_goodsdto where dt = '2025-04-17') b on a.trade_no = b.trade_no and a.trade_id = b.trade_id and a.sub_trade_id = b.sub_trade_id
where t.trade_no = 'JY202504174724'
;


select count(1) from jky.erp_storage_goodsdocout_v2 where inOutDate like '2025-02%';




select distinct inout_type_name
from ods.jky_erp_storage_goodsdocout_v2;

select *
from ods.jky_erp_storage_goodsdocout_v2
where dt = '2025-04-08'
  and inout_type_name = '销售出库';

select *
from ods.jky_erp_storage_goodsdocout_v2
where dt = '2025-04-08'
  and bill_no = 'CK202404080015';

select *
from ods.jky_erp_storage_goodsdocout_v2_goodsdocdetail
where dt = '2025-04-08'
  and bill_no = 'CK202404080015';


select * from ods.jky_qm_trades_fullinfo where trade_no = 'JY202504186930'


select payment,* from ods.jky_qm_trades_fullinfo where trade_no = 'JY202504097469';


-- 主表数据结果
select
    sum(1), -- 总单数
    sum(json_length(cast(goodsDocDetailList as json))) -- json总条数
from jky.erp_storage_goodsdocout_v2 a
where substr(inOutDate,1,7) = '2023-10';

-- 子表数据结果
select
    count(distinct goods_doc_no),    -- 总单数
    count(1)    -- json总条数（总货品数）
from jky.erp_storage_goodsdocout_v2_goodsdocdetail
where substr(in_out_date,1,7) = '2023-10';




-- **********************************

show create table ods.fill_bud_fin_import_items_guanbao;


select * from dim.account_cate_zip where dt = '9999-12-31';

select * from dwd.trd_erp_pay_order_sku where trade_type =8 and seller = '影刀专用';

show create table dim.account_cate_zip;

