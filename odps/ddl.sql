CREATE TABLE IF NOT EXISTS ods_jky_purch_order
(
    json_str  STRING COMMENT '接口数据'
)
PARTITIONED BY
(
    dt        STRING COMMENT '日期'
    ,ht       STRING COMMENT '日期'
)
TBLPROPERTIES ('columnar.nested.type' = 'true','comment' = '采购单查询')
;

CREATE TABLE IF NOT EXISTS ods_jky_goods_stock_quantity
(
    json_str  STRING COMMENT '接口数据'
)
PARTITIONED BY
(
    dt        STRING COMMENT '日期'
)
TBLPROPERTIES ('columnar.nested.type' = 'true','comment' = '库存分页查询')
;

SELECT  *
FROM    ods_jky_storage_goodsinfo
WHERE   dt = '20250101'
LIMIT   10
;


DROP TABLE qtmm_pro.tmp_erp_storage_goodsdocout_v2;
CREATE TABLE qtmm_pro.tmp_erp_storage_goodsdocout_v2 like qtmm_test.tmp_erp_storage_goodsdocout_v2;


SELECT * from qtmm_pro.tmp_erp_storage_goodsdocout_v2 where dt = '20251117' limit 10;


show CREATE TABLE qtmm_pro.tmp_erp_storage_goodsdocout_v2;