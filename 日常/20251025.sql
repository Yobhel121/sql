with tmp as (
    select
        *
    from dwd.trd_erp_pay_order_sku
    where shop_code in('DP0021','DP0018','DP0017','0311','92484088','198337269','13277491','14422985','14597829','11207381','12533898','13038301','14637952','DYSP001')
    and pay_time >= '2025-07-01 00:00:00' and pay_time < '2025-10-01 00:00:00' and trade_status_explain in ('已完成')
)
select goods_field3,shop_code,shop_name,date_format(pay_time, '%Y-%m'),sum(share_favourable_after_fee)  from tmp a
left join dim.jky_storage_goodsinfo b on a.goods_no = b.goods_no and a.sku_id = b.sku_id
group by goods_field3,shop_code,shop_name,date_format(pay_time, '%Y-%m')
;



with tmp as (
    select
        *
    from dwd.trd_erp_pay_order_sku
    where shop_code in('DP0021','DP0018','DP0017','0311','92484088','198337269','13277491','14422985','14597829','11207381','12533898','13038301','14637952','DYSP001')
    and pay_time >= '2025-07-01 00:00:00' and pay_time < '2025-10-01 00:00:00'  and trade_no in ('JY2025080113126')
)
select goods_field3,shop_code,shop_name,date_format(pay_time, '%Y-%m'),* from tmp a
left join dim.jky_storage_goodsinfo b on a.goods_no = b.goods_no and a.sku_id = b.sku_id
;


select goodsDetail,* from jky.qm_trades_fullinfo where tradeNo = 'JY2025080113126';

select * from jky.qm_trades_fullinfo_goodsdetail where tradeNo = 'JY2025080113126';

select * from ods.rpa_jd_performance_product;


select * from dwd.trd_erp_pay_order_sku where trade_no in ('JY202507298983','JY2025081926740','JY202507307872','JY2025072733359','JY202507287789','JY202507286985');

select * from dim.jky_storage_goodsinfo where goods_no = 'D11040501002';


select count(1) from jky.qm_trades_fullinfo_goodsdetail where dt = '2025-10-27';

select count(1) from ods.jky_qm_trades_fullinfo_goodsdetail_2 where dt = '2025-10-27';

create table ods.jky_qm_trades_fullinfo_goodsdetail_2 like ods.jky_qm_trades_fullinfo_goodsdetail;


DP0021	抖音-秋田满满食享母婴专卖店
DP0018	抖音—秋田满满全餐母婴专卖店
DP0017	抖音-秋田满满秋日盈盈母婴专卖店
0311	抖音达播-冲锋小熊童食店
92484088	【微瑕】抖音短视频-冲锋小熊企业店
198337269	新媒体-抖音商城一店
13277491	抖音易播专卖店-停用
14422985	抖音优构专卖店-停用
14597829	抖音-秋田满满识味母婴专卖店-停用
11207381	新媒体-抖音官方旗舰店
12533898	抖音旗舰店
13038301	抖音日赛专卖店
14637952	抖音童食专卖店-停用
DYSP001	抖音-秋田满满食品旗舰店-停用