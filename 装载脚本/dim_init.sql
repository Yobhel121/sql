insert overwrite dim.product_item_zip
-- 组合装商品价格成本
select
    package_good.goods_id,
    package_good.goods_no,
    package_good.goods_name,
    package_good.sku_id,
    package_good.sku_name,
    package_good.sku_barcode,
    package_good.unit_name,
    package_good.cate_id,
    package_good.cate_name,
    package_good.brand_id,
    package_good.brand_name,
    package_good.sku_code,
    package_good.warehouse_id,
    package_good.warehouse_name,
    package_good.default_vend_id,
    package_good.default_vend_name,
    package_good.is_package,
    package_detail.sku_id as sub_sku_id,
    package_detail.sku_name as sub_sku_name,
    package_detail.goods_amount as sku_cnt,
    sku_price.price1,
    good_cost.adjustment_cost,
    good_cost.start_date,
    good_cost.end_date,
    good_cost.end_date
from (
    select
        t1.goods_id,
        t1.goods_no,
        t1.goods_name,
        t1.sku_id,
        t1.sku_name,
        t1.sku_barcode,
        t1.unit_name,
        t1.cate_id,
        t1.cate_name,
        t1.brand_id,
        t1.brand_name,
        t1.sku_code,
        t1.warehouse_id,
        t1.warehouse_name,
        t1.default_vend_id,
        t1.default_vend_name,
        if(t2.sku_id is not null, 1, 0) as is_package,
        t2.sku_id as package_sku_id,
        t1.retail_price
    from (select * from ods.jky_storage_goodsinfo where dt = '2024-10-28') t1
    left join (select * from ods.jky_goods_package where dt = '2024-10-28') t2 on t1.goods_no = t2.goods_no
    where t2.sku_id is not null
 ) package_good
left join(select * from ods.jky_goods_package_detail where dt = '2024-10-28') package_detail on package_good.package_sku_id = package_detail.package_sku_id
left join(select distinct sku_id,price1 from ods.jky_pricelist where dt = '2024-10-28') sku_price on package_detail.sku_id = sku_price.sku_id
left join(
    select
        *,nvl(date_sub(lead(start_date) over (partition by sku_id order by start_date),1),'9999-12-31') as end_date,sku_id as goods_no
    from(select distinct sku_id,start_date,adjustment_cost from ods.fill_cost_adjustment_template where dt = '2024-10-12')tmp
) good_cost on package_detail.goods_no = good_cost.goods_no
union all
-- 非组合装商品价格成本
select
    package_good.goods_id,
    package_good.goods_no,
    package_good.goods_name,
    package_good.sku_id,
    package_good.sku_name,
    package_good.sku_barcode,
    package_good.unit_name,
    package_good.cate_id,
    package_good.cate_name,
    package_good.brand_id,
    package_good.brand_name,
    package_good.sku_code,
    package_good.warehouse_id,
    package_good.warehouse_name,
    package_good.default_vend_id,
    package_good.default_vend_name,
    package_good.is_package,
    null,
    null,
    1,
    sku_price.price1,
    good_cost.adjustment_cost,
    good_cost.start_date,
    good_cost.end_date,
    good_cost.end_date
from (
    select
        t1.goods_id,
        t1.goods_no,
        t1.goods_name,
        t1.sku_id,
        t1.sku_name,
        t1.sku_barcode,
        t1.unit_name,
        t1.cate_id,
        t1.cate_name,
        t1.brand_id,
        t1.brand_name,
        t1.sku_code,
        t1.warehouse_id,
        t1.warehouse_name,
        t1.default_vend_id,
        t1.default_vend_name,
        if(t2.sku_id is not null, 1, 0) as is_package,
        t2.sku_id as package_sku_id,
        t1.retail_price
    from (select * from ods.jky_storage_goodsinfo where dt = '2024-10-28') t1
    left join (select * from ods.jky_goods_package where dt = '2024-10-28') t2 on t1.goods_no = t2.goods_no
    where t2.sku_id is null
) package_good
left join(select distinct sku_id,price1 from ods.jky_pricelist where dt = '2024-10-28') sku_price on package_good.sku_id = sku_price.sku_id
left join(select
        *,nvl(date_sub(lead(start_date) over (partition by sku_id order by start_date),1),'9999-12-31') as end_date,sku_id as goods_no
    from(select distinct sku_id,start_date,adjustment_cost from ods.fill_cost_adjustment_template where dt = '2024-10-12')tmp
) good_cost on package_good.goods_no = good_cost.goods_no
;
