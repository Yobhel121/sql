-- 差异
select sum(payment) from(
    select
        *,row_number() over (partition by tradeId order by gmtModified desc) n from jky.qm_trades_fullinfo
    where isDelete = 0 and sellerMemo not like '%测试单%' and payTime >= '2024-02-01' and payTime <= '2024-02-29'
)tmp where n =1 and tradeStatus  in ('5020','5030');


select substr(pay_time,1,7) d_month,cast(sum(share_favourable_after_fee) as int) from dwd.trd_erp_pay_order_sku group by substr(pay_time,1,7);

select substr(dt,1,7) d_month,cast(sum(share_favourable_after_fee) as int) from dwd.trd_erp_pay_order_sku group by substr(dt,1,7);

select
    substr('2024-02',1,7) d_month,
    count(1) as cnt
from (
    select
        a.tradeNo,
        json_length(cast(tradeOrderAssemblyGoodsDtoList as json)) a_goods_cnt,
        count(b.tradeNo) b_goods_cnt
    from jky.qm_trades_fullinfo a
    left join jky.qm_trades_fullinfo_assembly_goodsdto b on a.tradeNo = b.tradeNo
    where substr(a.gmtCreate,1,7) = substr('2024-02',1,7) AND tradeOrderAssemblyGoodsDtoList != '' and tradeOrderAssemblyGoodsDtoList !='[]'
    group by a.tradeNo
)tmp where a_goods_cnt != b_goods_cnt;



select
    substr('2024-02',1,7) d_month,
    count(1) as cnt
from (
    select
        a.tradeNo,
        json_length(cast(tradeOrderAssemblyGoodsDtoList as json)) a_goods_cnt,
        count(b.tradeNo) b_goods_cnt
    from jky.qm_trades_fullinfo a
    left join jky.qm_trades_fullinfo_assembly_goodsdto b on a.tradeNo = b.tradeNo
    where substr(a.gmtCreate,1,7) = substr('2024-02',1,7) AND tradeOrderAssemblyGoodsDtoList != '' and tradeOrderAssemblyGoodsDtoList !='[]'
    group by a.tradeNo
)tmp where a_goods_cnt != b_goods_cnt;



select
    aaa.d_month,
    nvl(bbb.tradeNo,0),
    nvl(cnt,0)
from(
    select substr('2024-02',1,7) as d_month
)aaa left join (
    select
        substr('2024-02',1,7) d_month,
        t1.tradeNo,
        count(1) over() cnt
    from(
        select
            *
        from(
            select
                *,row_number() over (partition by tradeId order by gmtModified desc) n from jky.qm_trades_fullinfo
            where isDelete = 0 and substr(payTime,1,7) = substr('2024-02',1,7)
        )tmp where n =1 and tradeStatus not in ('5020','5030')
    ) t1 left join (
        select
            a.tradeNo,
            sum(case when b.sellTotal is not null then cast(b.sellTotal as decimal(10,2)) - cast(b.shareFavourableFee as decimal(10,2))  else shareFavourableAfterFee end) js_total
        from jky.qm_trades_fullinfo_goodsdetail a
        left join jky.qm_trades_fullinfo_assembly_goodsdto b on a.tradeNo = b.tradeNo and a.tradeId = b.tradeId and a.subTradeId = b.subTradeId
        group by a.tradeNo
    )t2 on t1.tradeNo = t2.tradeNo
    where abs(t1.payment - t2.js_total) > 0.1
    limit 10
)bbb on aaa.d_month = bbb.d_month
;

select count(1),sum(payment) from jky.qm_trades_fullinfo where payTime like '2024-02%';

select sum(payment) from ods.jky_qm_trades_fullinfo where pay_time like '2024-02%' and is_delete = 0 and seller_memo not like '%测试单%' and trade_status not in ('5020','5030');

select * from ods.rpa_pdd_promotion_expenses where shop_id = '248807701';

select count(1),sum(payment) from(
    select
        *,row_number() over (partition by trade_id order by gmt_modified desc) n from ods.jky_qm_trades_fullinfo
    where is_delete = 0 and seller_memo not like '%测试单%' and pay_time like '2024-02%'
)tmp where n =1 and trade_status not in ('5020','5030')



select sum(payment),count(distinct tradeNo) from jky.qm_trades_fullinfo
where isDelete = 0 and sellerMemo not like '%测试单%' and payTime like '2024-02%';


select sum(payment),count(distinct trade_no) from ods.jky_qm_trades_fullinfo
where is_delete = 0 and seller_memo not like '%测试单%' and pay_time like '2024-02%';

select sum(share_favourable_after_fee),count(distinct trade_no)  from dwd.trd_erp_pay_order_sku where pay_time like  '2024-02%';

select
    tradeNo,
    t1.payment,
    t2.sss
from(
    select * from jky.qm_trades_fullinfo where isDelete = 0 and sellerMemo not like '%测试单%' and payTime like '2024-02%'
)t1 left join (
    select trade_no,sum(share_favourable_after_fee) sss from dwd.trd_erp_pay_order_sku where pay_time like  '2024-02%' group by trade_no
)t2 on t1.tradeNo = t2.trade_no
where t2.sss is null;


select * from dwd.trd_erp_pay_order_sku where trade_no = 'JY202402011094';



select
    a.tradeNo,
    sum(case when b.sellTotal is not null then cast(b.sellTotal as decimal(10,2)) - cast(b.shareFavourableFee as decimal(10,2))  else shareFavourableAfterFee end) js_total
from jky.qm_trades_fullinfo_goodsdetail a
left join jky.qm_trades_fullinfo_assembly_goodsdto b on a.tradeNo = b.tradeNo and a.tradeId = b.tradeId and a.subTradeId = b.subTradeId
where a.tradeNo = 'JY202402011094'
group by a.tradeNo;

select * from jky.qm_trades_fullinfo_goodsdetail where tradeNo = 'JY202402011094';


select tradeId,* from jky.qm_trades_fullinfo where tradeNo = 'JY202402011094';


select sum(payment) from(
    select
        *,row_number() over (partition by trade_id order by gmt_modified desc) n from ods.jky_qm_trades_fullinfo
    where is_delete = 0 and seller_memo not like '%测试单%' and gmt_create >= '2024-02-01' and gmt_create <= '2024-02-29'
)tmp where n =1 and trade_status in ('5020','5030')






