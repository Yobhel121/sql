
select distinct trade_status_explain from ods.jky_qm_trades_fullinfo;

select * from rpa_data.jky_business_log where log_detail like '%审核%';

select * from dwd.lgst_order where dt = '2024-12-05' and order_payment_date like '%2024-11-02%';

select count(1) from ads.lgst_order where dt = '2024-12-05' and order_payment_date like '%2024-11-02%';


select * from zzy.etl_task where chuku_order= 'JY2024090421990';



select pay_time,* from ods.jky_qm_trades_fullinfo where trade_no = 'JY2024090449670';

select *  from ods.zzy_etl_task where chuku_order = 'JY20240730151846';

SELECT
    chuku_order trade_no,
    REPLACE(REPLACE(split(col,'|')[1], '<i>', ''), '</i>', '') order_pickup_date
FROM (select *, split(xiangxiwuliu,'<br>') as numbers_array from ods.zzy_etl_task  where dt = '2024-11-20')
CROSS JOIN UNNEST(numbers_array) as temp_table(col)
where col like '%揽收%';


select * from ods.jky_qm_trades_fullinfo_goodsdetail;

select * from ods.jky_qm_trades_fullinfo_goodsdetail where trade_no = 'JY2024052438994';

select * from ods.zzy_etl_task;

SELECT *
FROM (select *, split(xiangxiwuliu,'<br>') as numbers_array from ods.zzy_etl_task  where dt = '2024-11-20')
CROSS JOIN UNNEST(numbers_array) as temp_table(col)
where col like '%揽收%'
;


select * from ods.jky_warehouse_info;

show create table ods.jky_warehouse_info;


select count(1) from ods.fill_shop_channel_cate;
 select * from ods.jky_qm_trades_fullinfo;