select
    t1.tradeNo,
    t1.payment, -- 付款金额
    t2.js_total -- 分摊后金额
from(
    select
        *
    from(
        select
            *,row_number() over (partition by tradeId order by gmtModified desc) n from jky.qm_trades_fullinfo
        where isDelete = 0 and substr(payTime,1,7) = substr('2025-10-28',1,7)
    )tmp where n =1 and tradeStatus not in ('5020','5030')
) t1 left join (
    select
        a.tradeNo,
        sum(case when b.sellTotal is not null then cast(b.sellTotal as decimal(10,2)) - cast(b.shareFavourableFee as decimal(10,2))  else shareFavourableAfterFee end) js_total
    from jky.qm_trades_fullinfo_goodsdetail a
    left join jky.qm_trades_fullinfo_assembly_goodsdto b on a.tradeNo = b.tradeNo and a.tradeId = b.tradeId and a.subTradeId = b.subTradeId
    group by a.tradeNo
)t2 on t1.tradeNo = t2.tradeNo
where abs(t1.payment - t2.js_total) > 0.1;



