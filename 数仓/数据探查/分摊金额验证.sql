create table tmp_check_total as
select
    t2.js_total,
    t1.payment,
    t1."tradeId",
    t1."tradeNo"
from(select * from ods_jky_qm_sale_order where "payTime" like '2024-11%') t1
left join (
    select
        a."tradeId",
        sum(case when b."sellTotal" is not null then cast(b."sellTotal" as decimal(10,2)) - cast(b."shareFavourableFee" as decimal(10,2))  else "shareFavourableAfterFee" end) js_total
    from ods_jky_qm_sale_order_goodsdetail a
    left join ods_jky_qm_sale_order_assembly_goodsdto b on a."tradeId" = b."tradeId" and a."subTradeId" = cast(b."subTradeId" as varchar)
    group by a."tradeId"
)t2 on t1."tradeId" = t2."tradeId"
where t1.payment - t2.js_total > 0.1;

select substr("payTime",0,8) from ods_jky_qm_sale_order;

select
    a."tradeId",
    a."goodsName",
    a."sellTotal",
    a."shareFavourableFee",
    a."shareFavourableAfterFee",
    a."divideSellTotal",
    b."goodsName",
    b."sellTotal",
    b."shareFavourableFee",
    a.*
from ods_jky_qm_sale_order_goodsdetail a
left join ods_jky_qm_sale_order_assembly_goodsdto b on a."tradeId" = b."tradeId" and a."subTradeId" = cast(b."subTradeId" as varchar)
where a."tradeId" = '2020387140849797120';



select
    a."tradeId",
    sum(case when b."sellTotal" is not null then cast(b."sellTotal" as decimal(10,2)) - cast(b."shareFavourableFee" as decimal(10,2))  else "shareFavourableAfterFee" end) js_total
from ods_jky_qm_sale_order_goodsdetail a
left join ods_jky_qm_sale_order_assembly_goodsdto b on a."tradeId" = b."tradeId" and a."subTradeId" = cast(b."subTradeId" as varchar)
where a."tradeId" = '2020387140849797120'
group by a."tradeId";



 select * from ods_jky_qm_sale_order_assembly_goodsdto where "tradeId" = '2073803508509737984';
