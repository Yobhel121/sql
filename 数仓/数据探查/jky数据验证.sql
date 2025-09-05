-- 主表数据结果
select
    sum(1), -- 总订单数
    sum(json_length(cast(goodsDetail as json))) -- json总条数（总货品数）
from jky.qm_trades_fullinfo a
where substr(gmtCreate,1,7) = '2024-09';

-- 子表数据结果
select
    count(distinct b.tradeNo),    -- 总订单数
    count(1)    -- json总条数（总货品数）
from jky.qm_trades_fullinfo a
left join jky.qm_trades_fullinfo_goodsdetail b on a.tradeNo = b.tradeNo
where substr(gmtCreate,1,7) = '2024-09';

-- 每条订单数据验证解析数据量是否匹配
with tmp as (
    select
        a.tradeNo,
        json_length(cast(goodsDetail as json)) a_goods_cnt,
        count(1) b_goods_cnt
    from jky.qm_trades_fullinfo a
    left join jky.qm_trades_fullinfo_goodsdetail b on a.tradeNo = b.tradeNo
    where substr(a.gmtCreate,1,7) = '2024-09' AND goodsDetail != '' and goodsDetail !='[]'
    group by a.tradeNo
)
select * from tmp where a_goods_cnt != b_goods_cnt;

-- 补差异数据 start
drop TABLE  jky.tmp_trade_10;
create table jky.tmp_trade_10 as
with tmp as (
    select
        a.tradeNo
    from jky.qm_trades_fullinfo a
    left join jky.qm_trades_fullinfo_goodsdetail b on a.tradeNo = b.tradeNo
    where substr(a.gmtCreate,1,7) = '2024-10' AND goodsDetail != '' and goodsDetail !='[]'
    and b.tradeNo is null
)
select tradeNo from tmp;
create table jky.tmp_trade_10 as
with tmp as (
    select
        a.tradeNo,
        json_length(cast(goodsDetail as json)) a_goods_cnt,
        count(1) b_goods_cnt
    from jky.qm_trades_fullinfo a
    left join jky.qm_trades_fullinfo_goodsdetail b on a.tradeNo = b.tradeNo
    where substr(a.gmtCreate,1,7) = '2024-10' AND goodsDetail != '' and goodsDetail !='[]'
    group by a.tradeNo
)
select tradeNo from tmp where a_goods_cnt != b_goods_cnt;
delete from jky.qm_trades_fullinfo_goodsdetail where tradeNo in (select tradeNo from jky.tmp_trade_10);
-- 补差异数据 end





with tmp as (
    select
        a.tradeNo,
        json_length(cast(assemblyGoodsDetail as json)) a_goods_cnt,
        count(1) b_goods_cnt
    from jky.qm_trades_fullinfo a
    left join jky.qm_trades_fullinfo_assembly_goodsdto b on a.tradeNo = b.tradeNo
    where substr(a.gmtCreate,1,7) = '2025-01' AND assemblyGoodsDetail != '' and assemblyGoodsDetail !='[]'
    group by a.tradeNo
)
select * from tmp where a_goods_cnt != b_goods_cnt;


select
    substr('2025-01-02',1,7) d_month,
    count(1) as cnt
from (
    select
        a.tradeNo,
        json_length(cast(goodsDetail as json)) a_goods_cnt,
        count(1)                               b_goods_cnt
    from jky.qm_trades_fullinfo a
    left join jky.qm_trades_fullinfo_goodsdetail b on a.tradeNo = b.tradeNo
    where substr(a.gmtCreate, 1, 7) = substr('2025-01-02',1,7) AND goodsDetail != '' and goodsDetail != '[]'
    group by a.tradeNo
)tmp where a_goods_cnt != b_goods_cnt;



select
    substr('2025-01-02',1,7) d_month,
    count(1) as cnt
from (
    select
        a.tradeNo,
        json_length(cast(tradeOrderAssemblyGoodsDtoList as json)) a_goods_cnt,
        count(1) b_goods_cnt
    from jky.qm_trades_fullinfo a
    left join jky.qm_trades_fullinfo_assembly_goodsdto b on a.tradeNo = b.tradeNo
    where substr(a.gmtCreate,1,7) = substr('2025-01-02',1,7) AND tradeOrderAssemblyGoodsDtoList != '' and tradeOrderAssemblyGoodsDtoList !='[]'
    group by a.tradeNo
)tmp where a_goods_cnt != b_goods_cnt;

