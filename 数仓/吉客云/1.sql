select substr(gmtCreate,1,7),count(1) from jky.qm_trades_fullinfo
group by substr(gmtCreate,1,7);