# ************************************修改表生命周期************************************
ALTER TABLE ods.bud_fin_import_items partitions 30;
ALTER TABLE ods.fill_01_financial_daily_product_cost partitions 30;
ALTER TABLE ods.fill_01_warehouse_logistics_cost_ratios partitions 30;
ALTER TABLE ods.fill_10_cold_chain_product_info partitions 30;
ALTER TABLE ods.fill_abnormal_order_numbers partitions 30;
# ALTER TABLE ods.fill_account_calc_rate partitions 30;
# ALTER TABLE ods.fill_account_cate partitions 30;
ALTER TABLE ods.fill_budget_items partitions 30;
ALTER TABLE ods.fill_chanduola_jd_self_operated_products partitions 30;
ALTER TABLE ods.fill_clearance_sku_list partitions 30;
ALTER TABLE ods.fill_cost_adjustment_template partitions 30;
# ALTER TABLE ods.fill_cost_center_ref partitions 30;
ALTER TABLE ods.fill_daily_report_adjustments partitions 30;
# ALTER TABLE ods.fill_dealer partitions 30;
ALTER TABLE ods.fill_discount_rate_tob_shops partitions 30;
# ALTER TABLE ods.fill_distributor partitions 30;
ALTER TABLE ods.fill_douyin_video_account_orders partitions 30;
# ALTER TABLE ods.fill_dy_bussiness_cate partitions 30;
# ALTER TABLE ods.fill_dy_promotion_fee_rate partitions 30;
# ALTER TABLE ods.fill_expense_center_mapping partitions 30;
ALTER TABLE ods.fill_infant_short_video_product_ids partitions 30;
# ALTER TABLE ods.fill_jd_products partitions 30;
# ALTER TABLE ods.fill_kids_king_erp_data partitions 30;
ALTER TABLE ods.fill_kuaishou_official_flagship_store_short_video_product_links partitions 30;
ALTER TABLE ods.fill_kuaishou_rice_noodles_stream_product_links partitions 30;
ALTER TABLE ods.fill_kuaishou_self_broadcast_stream_product_links partitions 30;
ALTER TABLE ods.fill_ledger_supplement_data partitions 30;
ALTER TABLE ods.fill_leyou_product_codes partitions 30;
ALTER TABLE ods.fill_mao_chao_products partitions 30;
ALTER TABLE ods.fill_nsv_budget partitions 30;
ALTER TABLE ods.fill_platform_fee_ratios partitions 30;
ALTER TABLE ods.fill_price_control_tasting_list partitions 30;
ALTER TABLE ods.fill_private_domain_video_store_order_info partitions 30;
ALTER TABLE ods.fill_product_cate partitions 30;
ALTER TABLE ods.fill_product_export_non_food_gifts partitions 30;
ALTER TABLE ods.fill_sales_management_channel_correlation_form partitions 30;
ALTER TABLE ods.fill_sales_management_channel_relations partitions 30;
ALTER TABLE ods.fill_sales_management_shop_code_business_category partitions 30;
ALTER TABLE ods.fill_sales_management_shop_dp_channel_relations partitions 30;
# ALTER TABLE ods.fill_send_shop_cost partitions 30;
# ALTER TABLE ods.fill_shop_cate partitions 30;
# ALTER TABLE ods.fill_shop_channel_cate partitions 30;
ALTER TABLE ods.fill_short_video_luban_promotion_product_id partitions 30;
# ALTER TABLE ods.fill_sku_cate partitions 30;
ALTER TABLE ods.fill_temp_data_non_food_cost partitions 30;
ALTER TABLE ods.fill_temp_data_tasting_cost partitions 30;
ALTER TABLE ods.fill_tianmao_drop_shipping_supply_price partitions 30;
ALTER TABLE ods.fill_tianmao_infant_supply_prices partitions 30;
ALTER TABLE ods.fill_tianmao_wholesale_supply_price partitions 30;
ALTER TABLE ods.fill_ze_yuan_distributors_gift_policies partitions 30;
ALTER TABLE ods.jky_allocate partitions 30;
ALTER TABLE ods.jky_allocate_detail_views partitions 30;
ALTER TABLE ods.jky_allocate_detail_views_batchlist partitions 30;
ALTER TABLE ods.jky_allocate_detail_views_seriallist partitions 30;
ALTER TABLE ods.jky_ass_business_refundlist partitions 30;
ALTER TABLE ods.jky_ass_business_refundlist_refundgoodsitems partitions 30;
ALTER TABLE ods.jky_business_log partitions 30;
ALTER TABLE ods.jky_customer_list partitions 30;
ALTER TABLE ods.jky_customer_list_receivablesaccountarr partitions 30;
ALTER TABLE ods.jky_customer_list_source partitions 30;
ALTER TABLE ods.jky_erp_storage_goodsdocout_v2_logisticlist partitions 30;
ALTER TABLE ods.jky_goods_package partitions 30;
ALTER TABLE ods.jky_goods_package_detail partitions 30;
ALTER TABLE ods.jky_goods_source partitions 30;
ALTER TABLE ods.jky_goods_stock_quantity partitions 30;
ALTER TABLE ods.jky_goods_stock_quantity_batch partitions 30;
ALTER TABLE ods.jky_in_storage partitions 30;
ALTER TABLE ods.jky_in_storage_goodsdocdetail partitions 30;
ALTER TABLE ods.jky_oms_business_order partitions 30;
ALTER TABLE ods.jky_oms_business_order_detai partitions 30;
ALTER TABLE ods.jky_oms_open_trade_settle partitions 30;
ALTER TABLE ods.jky_out_storagev2_logistic partitions 30;
ALTER TABLE ods.jky_pricelist partitions 30;
ALTER TABLE ods.jky_purch_order partitions 30;
ALTER TABLE ods.jky_qm_trades_fullinfo_assembly_goodsdelivery partitions 30;
ALTER TABLE ods.jky_qm_trades_fullinfo_assembly_goodsdto partitions 30;
ALTER TABLE ods.jky_qm_trades_fullinfo_goodscolumnexts partitions 30;
ALTER TABLE ods.jky_qm_trades_fullinfo_goodsdetail partitions 30;
ALTER TABLE ods.jky_qm_trades_fullinfo_goodsdetail_goodsdelivery partitions 30;
ALTER TABLE ods.jky_qm_trades_fullinfo_goodsdetail_goodsdiscount partitions 30;
ALTER TABLE ods.jky_qm_trades_fullinfo_goodsdetail_packagedetail partitions 30;
ALTER TABLE ods.jky_qm_trades_fullinfo_goodsserial partitions 30;
ALTER TABLE ods.jky_qm_trades_fullinfo_otherpaymentfees partitions 30;
ALTER TABLE ods.jky_qm_trades_fullinfo_paylist partitions 30;
ALTER TABLE ods.jky_return_change partitions 30;
ALTER TABLE ods.jky_return_change_goods_attachmentinfo partitions 30;
ALTER TABLE ods.jky_return_change_goods_detail partitions 30;
ALTER TABLE ods.jky_return_change_goods_detail_batch partitions 30;
ALTER TABLE ods.jky_return_change_goods_orderassemblygoodsdto partitions 30;
ALTER TABLE ods.jky_sales_channel partitions 30;
ALTER TABLE ods.jky_stock_out partitions 30;
ALTER TABLE ods.jky_storage_goodsinfo partitions 30;
ALTER TABLE ods.jky_storage_goodsinfo_filelist partitions 30;
ALTER TABLE ods.jky_storage_goodsinfo_goodsinfodescript partitions 30;
ALTER TABLE ods.jky_storage_goodsinfo_goodsunit partitions 30;
ALTER TABLE ods.jky_storage_goodsinfo_imgurllist partitions 30;
ALTER TABLE ods.jky_vend partitions 30;
ALTER TABLE ods.jky_warehouse_info partitions 30;
ALTER TABLE ods.jky_warehouse_info_saleslist partitions 30;
# ALTER TABLE ods.ods_dy_shop_sub_rating_metrics partitions 30;
# ALTER TABLE ods.ods_yy_dialogue_records partitions 30;
# ALTER TABLE ods.shop_share partitions 30;
ALTER TABLE ods.zzy_etl_task partitions 30;

BUILD TABLE ods.bud_fin_import_items;
BUILD TABLE ods.fill_01_financial_daily_product_cost;
BUILD TABLE ods.fill_01_warehouse_logistics_cost_ratios;
BUILD TABLE ods.fill_10_cold_chain_product_info;
BUILD TABLE ods.fill_abnormal_order_numbers;
BUILD TABLE ods.fill_account_calc_rate;
BUILD TABLE ods.fill_account_cate;
BUILD TABLE ods.fill_budget_items;
BUILD TABLE ods.fill_chanduola_jd_self_operated_products;
BUILD TABLE ods.fill_clearance_sku_list;
BUILD TABLE ods.fill_cost_adjustment_template;
BUILD TABLE ods.fill_cost_center_ref;
BUILD TABLE ods.fill_daily_report_adjustments;
BUILD TABLE ods.fill_dealer;
BUILD TABLE ods.fill_discount_rate_tob_shops;
BUILD TABLE ods.fill_distributor;
BUILD TABLE ods.fill_douyin_video_account_orders;
BUILD TABLE ods.fill_dy_bussiness_cate;
BUILD TABLE ods.fill_dy_promotion_fee_rate;
BUILD TABLE ods.fill_expense_center_mapping;
BUILD TABLE ods.fill_infant_short_video_product_ids;
BUILD TABLE ods.fill_jd_products;
BUILD TABLE ods.fill_kids_king_erp_data;
BUILD TABLE ods.fill_kuaishou_official_flagship_store_short_video_product_links;
BUILD TABLE ods.fill_kuaishou_rice_noodles_stream_product_links;
BUILD TABLE ods.fill_kuaishou_self_broadcast_stream_product_links;
BUILD TABLE ods.fill_ledger_supplement_data;
BUILD TABLE ods.fill_leyou_product_codes;
BUILD TABLE ods.fill_mao_chao_products;
BUILD TABLE ods.fill_nsv_budget;
BUILD TABLE ods.fill_platform_fee_ratios;
BUILD TABLE ods.fill_price_control_tasting_list;
BUILD TABLE ods.fill_private_domain_video_store_order_info;
BUILD TABLE ods.fill_product_cate;
BUILD TABLE ods.fill_product_export_non_food_gifts;
BUILD TABLE ods.fill_sales_management_channel_correlation_form;
BUILD TABLE ods.fill_sales_management_channel_relations;
BUILD TABLE ods.fill_sales_management_shop_code_business_category;
BUILD TABLE ods.fill_sales_management_shop_dp_channel_relations;
BUILD TABLE ods.fill_send_shop_cost;
BUILD TABLE ods.fill_shop_cate;
BUILD TABLE ods.fill_shop_channel_cate;
BUILD TABLE ods.fill_short_video_luban_promotion_product_id;
BUILD TABLE ods.fill_sku_cate;
BUILD TABLE ods.fill_temp_data_non_food_cost;
BUILD TABLE ods.fill_temp_data_tasting_cost;
BUILD TABLE ods.fill_tianmao_drop_shipping_supply_price;
BUILD TABLE ods.fill_tianmao_infant_supply_prices;
BUILD TABLE ods.fill_tianmao_wholesale_supply_price;
BUILD TABLE ods.fill_ze_yuan_distributors_gift_policies;
BUILD TABLE ods.jky_allocate;
BUILD TABLE ods.jky_allocate_detail_views;
BUILD TABLE ods.jky_allocate_detail_views_batchlist;
BUILD TABLE ods.jky_allocate_detail_views_seriallist;
BUILD TABLE ods.jky_ass_business_refundlist;
BUILD TABLE ods.jky_ass_business_refundlist_refundgoodsitems;
BUILD TABLE ods.jky_business_log;
BUILD TABLE ods.jky_customer_list;
BUILD TABLE ods.jky_customer_list_receivablesaccountarr;
BUILD TABLE ods.jky_customer_list_source;
BUILD TABLE ods.jky_erp_storage_goodsdocout_v2_logisticlist;
BUILD TABLE ods.jky_goods_package;
BUILD TABLE ods.jky_goods_package_detail;
BUILD TABLE ods.jky_goods_source;
BUILD TABLE ods.jky_goods_stock_quantity;
BUILD TABLE ods.jky_goods_stock_quantity_batch;
BUILD TABLE ods.jky_in_storage;
BUILD TABLE ods.jky_in_storage_goodsdocdetail;
BUILD TABLE ods.jky_oms_business_order;
BUILD TABLE ods.jky_oms_business_order_detai;
BUILD TABLE ods.jky_oms_open_trade_settle;
BUILD TABLE ods.jky_out_storagev2_logistic;
BUILD TABLE ods.jky_pricelist;
BUILD TABLE ods.jky_purch_order;
BUILD TABLE ods.jky_qm_trades_fullinfo_assembly_goodsdelivery;
BUILD TABLE ods.jky_qm_trades_fullinfo_assembly_goodsdto;
BUILD TABLE ods.jky_qm_trades_fullinfo_goodscolumnexts;
BUILD TABLE ods.jky_qm_trades_fullinfo_goodsdetail;
BUILD TABLE ods.jky_qm_trades_fullinfo_goodsdetail_goodsdelivery;
BUILD TABLE ods.jky_qm_trades_fullinfo_goodsdetail_goodsdiscount;
BUILD TABLE ods.jky_qm_trades_fullinfo_goodsdetail_packagedetail;
BUILD TABLE ods.jky_qm_trades_fullinfo_goodsserial;
BUILD TABLE ods.jky_qm_trades_fullinfo_otherpaymentfees;
BUILD TABLE ods.jky_qm_trades_fullinfo_paylist;
BUILD TABLE ods.jky_return_change;
BUILD TABLE ods.jky_return_change_goods_attachmentinfo;
BUILD TABLE ods.jky_return_change_goods_detail;
BUILD TABLE ods.jky_return_change_goods_detail_batch;
BUILD TABLE ods.jky_return_change_goods_orderassemblygoodsdto;
BUILD TABLE ods.jky_sales_channel;
BUILD TABLE ods.jky_stock_out;
BUILD TABLE ods.jky_storage_goodsinfo;
BUILD TABLE ods.jky_storage_goodsinfo_filelist;
BUILD TABLE ods.jky_storage_goodsinfo_goodsinfodescript;
BUILD TABLE ods.jky_storage_goodsinfo_goodsunit;
BUILD TABLE ods.jky_storage_goodsinfo_imgurllist;
BUILD TABLE ods.jky_vend;
BUILD TABLE ods.jky_warehouse_info;
BUILD TABLE ods.jky_warehouse_info_saleslist;
BUILD TABLE ods.ods_dy_shop_sub_rating_metrics;
BUILD TABLE ods.ods_yy_dialogue_records;
BUILD TABLE ods.shop_share;
BUILD TABLE ods.zzy_etl_task;

# ************************************修改热数据分区数************************************

ALTER TABLE ods.bud_fin_import_items STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_01_financial_daily_product_cost STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_01_warehouse_logistics_cost_ratios STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_10_cold_chain_product_info STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_abnormal_order_numbers STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_account_calc_rate STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_account_cate STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_budget_items STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_chanduola_jd_self_operated_products STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_clearance_sku_list STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_cost_adjustment_template STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_cost_center_ref STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_daily_report_adjustments STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_dealer STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_discount_rate_tob_shops STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_distributor STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_douyin_video_account_orders STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_dy_bussiness_cate STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_dy_promotion_fee_rate STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_expense_center_mapping STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_infant_short_video_product_ids STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_jd_products STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_kids_king_erp_data STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_kuaishou_official_flagship_store_short_video_product_links STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_kuaishou_rice_noodles_stream_product_links STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_kuaishou_self_broadcast_stream_product_links STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_ledger_supplement_data STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_leyou_product_codes STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_mao_chao_products STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_nsv_budget STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_platform_fee_ratios STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_price_control_tasting_list STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_private_domain_video_store_order_info STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_product_cate STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_product_export_non_food_gifts STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_sales_management_channel_correlation_form STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_sales_management_channel_relations STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_sales_management_shop_code_business_category STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_sales_management_shop_dp_channel_relations STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_send_shop_cost STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_shop_cate STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_shop_channel_cate STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_short_video_luban_promotion_product_id STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_sku_cate STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_temp_data_non_food_cost STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_temp_data_tasting_cost STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_tianmao_drop_shipping_supply_price STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_tianmao_infant_supply_prices STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_tianmao_wholesale_supply_price STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.fill_ze_yuan_distributors_gift_policies STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_allocate STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_allocate_detail_views STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_allocate_detail_views_batchlist STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_allocate_detail_views_seriallist STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_ass_business_refundlist STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_ass_business_refundlist_refundgoodsitems STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_business_log STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_customer_list STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_customer_list_receivablesaccountarr STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_customer_list_source STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_erp_storage_goodsdocout_v2_logisticlist STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_goods_package STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_goods_package_detail STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_goods_source STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_goods_stock_quantity STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_goods_stock_quantity_batch STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_in_storage STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_in_storage_goodsdocdetail STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_oms_business_order STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_oms_business_order_detai STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_oms_open_trade_settle STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_out_storagev2_logistic STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_pricelist STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_purch_order STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_qm_trades_fullinfo_assembly_goodsdelivery STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_qm_trades_fullinfo_assembly_goodsdto STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_qm_trades_fullinfo_goodscolumnexts STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_qm_trades_fullinfo_goodsdetail STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_qm_trades_fullinfo_goodsdetail_goodsdelivery STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_qm_trades_fullinfo_goodsdetail_goodsdiscount STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_qm_trades_fullinfo_goodsdetail_packagedetail STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_qm_trades_fullinfo_goodsserial STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_qm_trades_fullinfo_otherpaymentfees STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_qm_trades_fullinfo_paylist STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_return_change STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_return_change_goods_attachmentinfo STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_return_change_goods_detail STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_return_change_goods_detail_batch STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_return_change_goods_orderassemblygoodsdto STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_sales_channel STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_stock_out STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_storage_goodsinfo STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_storage_goodsinfo_filelist STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_storage_goodsinfo_goodsinfodescript STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_storage_goodsinfo_goodsunit STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_storage_goodsinfo_imgurllist STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_vend STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_warehouse_info STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.jky_warehouse_info_saleslist STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.ods_dy_shop_sub_rating_metrics STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.ods_yy_dialogue_records STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.shop_share STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
ALTER TABLE ods.zzy_etl_task STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;

BUILD TABLE ods.bud_fin_import_items;
BUILD TABLE ods.fill_01_financial_daily_product_cost;
BUILD TABLE ods.fill_01_warehouse_logistics_cost_ratios;
BUILD TABLE ods.fill_10_cold_chain_product_info;
BUILD TABLE ods.fill_abnormal_order_numbers;
BUILD TABLE ods.fill_account_calc_rate;
BUILD TABLE ods.fill_account_cate;
BUILD TABLE ods.fill_budget_items;
BUILD TABLE ods.fill_chanduola_jd_self_operated_products;
BUILD TABLE ods.fill_clearance_sku_list;
BUILD TABLE ods.fill_cost_adjustment_template;
BUILD TABLE ods.fill_cost_center_ref;
BUILD TABLE ods.fill_daily_report_adjustments;
BUILD TABLE ods.fill_dealer;
BUILD TABLE ods.fill_discount_rate_tob_shops;
BUILD TABLE ods.fill_distributor;
BUILD TABLE ods.fill_douyin_video_account_orders;
BUILD TABLE ods.fill_dy_bussiness_cate;
BUILD TABLE ods.fill_dy_promotion_fee_rate;
BUILD TABLE ods.fill_expense_center_mapping;
BUILD TABLE ods.fill_infant_short_video_product_ids;
BUILD TABLE ods.fill_jd_products;
BUILD TABLE ods.fill_kids_king_erp_data;
BUILD TABLE ods.fill_kuaishou_official_flagship_store_short_video_product_links;
BUILD TABLE ods.fill_kuaishou_rice_noodles_stream_product_links;
BUILD TABLE ods.fill_kuaishou_self_broadcast_stream_product_links;
BUILD TABLE ods.fill_ledger_supplement_data;
BUILD TABLE ods.fill_leyou_product_codes;
BUILD TABLE ods.fill_mao_chao_products;
BUILD TABLE ods.fill_nsv_budget;
BUILD TABLE ods.fill_platform_fee_ratios;
BUILD TABLE ods.fill_price_control_tasting_list;
BUILD TABLE ods.fill_private_domain_video_store_order_info;
BUILD TABLE ods.fill_product_cate;
BUILD TABLE ods.fill_product_export_non_food_gifts;
BUILD TABLE ods.fill_sales_management_channel_correlation_form;
BUILD TABLE ods.fill_sales_management_channel_relations;
BUILD TABLE ods.fill_sales_management_shop_code_business_category;
BUILD TABLE ods.fill_sales_management_shop_dp_channel_relations;
BUILD TABLE ods.fill_send_shop_cost;
BUILD TABLE ods.fill_shop_cate;
BUILD TABLE ods.fill_shop_channel_cate;
BUILD TABLE ods.fill_short_video_luban_promotion_product_id;
BUILD TABLE ods.fill_sku_cate;
BUILD TABLE ods.fill_temp_data_non_food_cost;
BUILD TABLE ods.fill_temp_data_tasting_cost;
BUILD TABLE ods.fill_tianmao_drop_shipping_supply_price;
BUILD TABLE ods.fill_tianmao_infant_supply_prices;
BUILD TABLE ods.fill_tianmao_wholesale_supply_price;
BUILD TABLE ods.fill_ze_yuan_distributors_gift_policies;
BUILD TABLE ods.jky_allocate;
BUILD TABLE ods.jky_allocate_detail_views;
BUILD TABLE ods.jky_allocate_detail_views_batchlist;
BUILD TABLE ods.jky_allocate_detail_views_seriallist;
BUILD TABLE ods.jky_ass_business_refundlist;
BUILD TABLE ods.jky_ass_business_refundlist_refundgoodsitems;
BUILD TABLE ods.jky_business_log;
BUILD TABLE ods.jky_customer_list;
BUILD TABLE ods.jky_customer_list_receivablesaccountarr;
BUILD TABLE ods.jky_customer_list_source;
BUILD TABLE ods.jky_erp_storage_goodsdocout_v2_logisticlist;
BUILD TABLE ods.jky_goods_package;
BUILD TABLE ods.jky_goods_package_detail;
BUILD TABLE ods.jky_goods_source;
BUILD TABLE ods.jky_goods_stock_quantity;
BUILD TABLE ods.jky_goods_stock_quantity_batch;
BUILD TABLE ods.jky_in_storage;
BUILD TABLE ods.jky_in_storage_goodsdocdetail;
BUILD TABLE ods.jky_oms_business_order;
BUILD TABLE ods.jky_oms_business_order_detai;
BUILD TABLE ods.jky_oms_open_trade_settle;
BUILD TABLE ods.jky_out_storagev2_logistic;
BUILD TABLE ods.jky_pricelist;
BUILD TABLE ods.jky_purch_order;
BUILD TABLE ods.jky_qm_trades_fullinfo_assembly_goodsdelivery;
BUILD TABLE ods.jky_qm_trades_fullinfo_assembly_goodsdto;
BUILD TABLE ods.jky_qm_trades_fullinfo_goodscolumnexts;
BUILD TABLE ods.jky_qm_trades_fullinfo_goodsdetail;
BUILD TABLE ods.jky_qm_trades_fullinfo_goodsdetail_goodsdelivery;
BUILD TABLE ods.jky_qm_trades_fullinfo_goodsdetail_goodsdiscount;
BUILD TABLE ods.jky_qm_trades_fullinfo_goodsdetail_packagedetail;
BUILD TABLE ods.jky_qm_trades_fullinfo_goodsserial;
BUILD TABLE ods.jky_qm_trades_fullinfo_otherpaymentfees;
BUILD TABLE ods.jky_qm_trades_fullinfo_paylist;
BUILD TABLE ods.jky_return_change;
BUILD TABLE ods.jky_return_change_goods_attachmentinfo;
BUILD TABLE ods.jky_return_change_goods_detail;
BUILD TABLE ods.jky_return_change_goods_detail_batch;
BUILD TABLE ods.jky_return_change_goods_orderassemblygoodsdto;
BUILD TABLE ods.jky_sales_channel;
BUILD TABLE ods.jky_stock_out;
BUILD TABLE ods.jky_storage_goodsinfo;
BUILD TABLE ods.jky_storage_goodsinfo_filelist;
BUILD TABLE ods.jky_storage_goodsinfo_goodsinfodescript;
BUILD TABLE ods.jky_storage_goodsinfo_goodsunit;
BUILD TABLE ods.jky_storage_goodsinfo_imgurllist;
BUILD TABLE ods.jky_vend;
BUILD TABLE ods.jky_warehouse_info;
BUILD TABLE ods.jky_warehouse_info_saleslist;
BUILD TABLE ods.ods_dy_shop_sub_rating_metrics;
BUILD TABLE ods.ods_yy_dialogue_records;
BUILD TABLE ods.shop_share;
BUILD TABLE ods.zzy_etl_task;

# step1
ALTER TABLE ods.jky_qm_trades_fullinfo partitions 365;
ALTER TABLE ods.jky_qm_trades_fullinfo STORAGE_POLICY='MIXED' HOT_PARTITION_COUNT=7;
# step2
BUILD TABLE ods.jky_qm_trades_fullinfo;
# 查看进度
SELECT table_name, schema_name, status FROM INFORMATION_SCHEMA.KEPLER_META_BUILD_TASK ORDER BY create_time DESC LIMIT 10;
# 查看表ddl修改
show create table ods.jky_qm_trades_fullinfo;



select * from INFORMATION_SCHEMA.PARTITIONS where TABLE_SCHEMA = 'dwd';




ods.bud_fin_import_items
ods.fill_01_financial_daily_product_cost
ods.fill_01_warehouse_logistics_cost_ratios
ods.fill_10_cold_chain_product_info
ods.fill_abnormal_order_numbers
ods.fill_account_calc_rate
ods.fill_account_cate
ods.fill_budget_items
ods.fill_chanduola_jd_self_operated_products
ods.fill_clearance_sku_list
ods.fill_cost_adjustment_template
ods.fill_cost_center_ref
ods.fill_daily_report_adjustments
ods.fill_dealer
ods.fill_discount_rate_tob_shops
ods.fill_distributor
ods.fill_douyin_video_account_orders
ods.fill_dy_bussiness_cate
ods.fill_dy_promotion_fee_rate
ods.fill_expense_center_mapping
ods.fill_infant_short_video_product_ids
ods.fill_jd_products
ods.fill_kids_king_erp_data
ods.fill_kuaishou_official_flagship_store_short_video_product_links
ods.fill_kuaishou_rice_noodles_stream_product_links
ods.fill_kuaishou_self_broadcast_stream_product_links
ods.fill_ledger_supplement_data
ods.fill_leyou_product_codes
ods.fill_mao_chao_products
ods.fill_nsv_budget
ods.fill_platform_fee_ratios
ods.fill_price_control_tasting_list
ods.fill_private_domain_video_store_order_info
ods.fill_product_cate
ods.fill_product_export_non_food_gifts
ods.fill_sales_management_channel_correlation_form
ods.fill_sales_management_channel_relations
ods.fill_sales_management_shop_code_business_category
ods.fill_sales_management_shop_dp_channel_relations
ods.fill_send_shop_cost
ods.fill_shop_cate
ods.fill_shop_channel_cate
ods.fill_short_video_luban_promotion_product_id
ods.fill_sku_cate
ods.fill_temp_data_non_food_cost
ods.fill_temp_data_tasting_cost
ods.fill_tianmao_drop_shipping_supply_price
ods.fill_tianmao_infant_supply_prices
ods.fill_tianmao_wholesale_supply_price
ods.fill_ze_yuan_distributors_gift_policies
ods.jky_allocate
ods.jky_allocate_detail_views
ods.jky_allocate_detail_views_batchlist
ods.jky_allocate_detail_views_seriallist
ods.jky_ass_business_refundlist
ods.jky_ass_business_refundlist_refundgoodsitems
ods.jky_business_log
ods.jky_customer_list
ods.jky_customer_list_receivablesaccountarr
ods.jky_customer_list_source
ods.jky_erp_storage_goodsdocout_v2_logisticlist
ods.jky_goods_package
ods.jky_goods_package_detail
ods.jky_goods_source
ods.jky_goods_stock_quantity
ods.jky_goods_stock_quantity_batch
ods.jky_in_storage
ods.jky_in_storage_goodsdocdetail
ods.jky_oms_business_order
ods.jky_oms_business_order_detai
ods.jky_oms_open_trade_settle
ods.jky_out_storagev2_logistic
ods.jky_pricelist
ods.jky_purch_order
ods.jky_qm_trades_fullinfo
ods.jky_qm_trades_fullinfo_assembly_goodsdelivery
ods.jky_qm_trades_fullinfo_assembly_goodsdto
ods.jky_qm_trades_fullinfo_goodscolumnexts
ods.jky_qm_trades_fullinfo_goodsdetail
ods.jky_qm_trades_fullinfo_goodsdetail_goodsdelivery
ods.jky_qm_trades_fullinfo_goodsdetail_goodsdiscount
ods.jky_qm_trades_fullinfo_goodsdetail_packagedetail
ods.jky_qm_trades_fullinfo_goodsserial
ods.jky_qm_trades_fullinfo_otherpaymentfees
ods.jky_qm_trades_fullinfo_paylist
ods.jky_return_change
ods.jky_return_change_goods_attachmentinfo
ods.jky_return_change_goods_detail
ods.jky_return_change_goods_detail_batch
ods.jky_return_change_goods_orderassemblygoodsdto
ods.jky_sales_channel
ods.jky_stock_out
ods.jky_storage_goodsinfo
ods.jky_storage_goodsinfo_filelist
ods.jky_storage_goodsinfo_goodsinfodescript
ods.jky_storage_goodsinfo_goodsunit
ods.jky_storage_goodsinfo_imgurllist
ods.jky_vend
ods.jky_warehouse_info
ods.jky_warehouse_info_saleslist
ods.jst_actual_receipt_batchs_info
ods.jst_actual_receipt_info
ods.jst_actual_receipt_item_info
ods.jst_category_info
ods.jst_combine_sku_info
ods.jst_combine_sku_items
ods.jst_distributor_info
ods.jst_normal_sku_info
ods.jst_order_action
ods.jst_other_stock_io_batch_info
ods.jst_other_stock_io_info
ods.jst_other_stock_io_item_info
ods.jst_pack_inventory_snapshot
ods.jst_partner_info
ods.jst_partner_inventory
ods.jst_pre_stock_in
ods.jst_pre_stock_in_item
ods.jst_purchase_order_info
ods.jst_purchase_order_item_info
ods.jst_pur_info
ods.jst_pur_info_batchs
ods.jst_pur_info_sku
ods.jst_pur_info_sns
ods.jst_qm_bill_info
ods.jst_qm_bill_share_info
ods.jst_qm_delivery_info
ods.jst_qm_delivery_info_batchs
ods.jst_qm_delivery_info_batchs_new
ods.jst_qm_delivery_info_item
ods.jst_qm_delivery_info_item_new
ods.jst_qm_delivery_info_new
ods.jst_qm_delivery_info_sns
ods.jst_qm_delivery_info_sns_new
ods.jst_qm_orders_info
ods.jst_qm_orders_info_payment
ods.jst_qm_orders_info_sku
ods.jst_qm_order_expense
ods.jst_qm_order_refund_batchs
ods.jst_qm_order_refund_item
ods.jst_qm_order_refund_list
ods.jst_qm_order_refund_sns
ods.jst_qm_raw_bill
ods.jst_shop_info
ods.jst_sku_invty_info
ods.ods_dy_shop_sub_rating_metrics
ods.ods_yy_dialogue_records
ods.rpa_dy_alliance_order
ods.rpa_dy_business_overview
ods.rpa_dy_cid
ods.rpa_dy_expert_analysis
ods.rpa_dy_finance_statement
ods.rpa_dy_merchant_experience_score
ods.rpa_dy_product_constitute
ods.rpa_dy_product_overview
ods.rpa_dy_promotion_fee_consumption
ods.rpa_dy_promotion_global_product
ods.rpa_dy_promotion_global_tiktok
ods.rpa_dy_promotion_living_tiktok
ods.rpa_dy_promotion_product_product
ods.rpa_dy_promotion_product_tiktok
ods.rpa_dy_reception_volume
ods.rpa_dy_short_video_product
ods.rpa_feishu_haiziwang_pos_data
ods.rpa_feishu_leyou_pos_data
ods.rpa_hzw_king_promotion
ods.rpa_hzw_king_return_order
ods.rpa_hzw_transaction_info
ods.rpa_jd_autarky_consumer_overview
ods.rpa_jd_autarky_flow
ods.rpa_jd_autarky_jzt_promotion
ods.rpa_jd_autarky_product
ods.rpa_jd_autarky_product_key_idx
ods.rpa_jd_autarky_product_list
ods.rpa_jd_autarky_product_performance
ods.rpa_jd_autarky_product_stock
ods.rpa_jd_autarky_recharge
ods.rpa_jd_autarky_return_order
ods.rpa_jd_autarky_trade
ods.rpa_jd_jtk_bill
ods.rpa_jd_jtk_product_order
ods.rpa_jd_jzt_bill
ods.rpa_jd_pop_core_idx
ods.rpa_jd_pop_entry_source
ods.rpa_jd_pop_outbound
ods.rpa_jd_pop_stock
ods.rpa_jky_shop_ref
ods.rpa_ks_aftersales_bulk_export
ods.rpa_ks_est_commission
ods.rpa_ks_e_niu_agent_summary_total_cost
ods.rpa_ks_e_niu_financial_transactions
ods.rpa_ks_mkt_ovw_e_niu_acc_details
ods.rpa_ks_operating_data
ods.rpa_ks_order_bulk_export
ods.rpa_ks_short_video_prod_report
ods.rpa_mx_ai_inventory_marketing_order
ods.rpa_mx_funds_account_transactions
ods.rpa_pdd_after_sales_data
ods.rpa_pdd_after_sales_shop_star_rating
ods.rpa_pdd_ddjb_promotion_expenses
ods.rpa_pdd_operate_overview
ods.rpa_pdd_pre_sales_sales_data
ods.rpa_pdd_pre_sales_service_data
ods.rpa_pdd_pre_sales_team_conversion_rate
ods.rpa_pdd_pre_sales_team_data
ods.rpa_pdd_promotion_expenses
ods.rpa_syyz_after_sales_data
ods.rpa_syyz_business_data_overview
ods.rpa_syyz_distribution_analysis
ods.rpa_syyz_procure_order
ods.rpa_syyz_sales_slip
ods.rpa_tb_account_fee
ods.rpa_tb_account_report
ods.rpa_tb_assessment
ods.rpa_tb_cate_shop_gold
ods.rpa_tb_cdl_product_statistics
ods.rpa_tb_cold_product
ods.rpa_tb_core_idx
ods.rpa_tb_coupon_usage
ods.rpa_tb_cps_account_fee
ods.rpa_tb_cps_order
ods.rpa_tb_entry_source
ods.rpa_tb_experience_score
ods.rpa_tb_living_sale
ods.rpa_tb_operate_window
ods.rpa_tb_promotion_report
ods.rpa_tb_service_metrics
ods.rpa_tb_settle_overview
ods.rpa_tb_special_trans
ods.rpa_tb_tm_living_sale
ods.rpa_tb_tm_operate_window
ods.rpa_tb_trans_log
ods.rpa_tb_unpaid_order
ods.rpa_tb_ww_satisfaction
ods.rpa_tm_account_fee
ods.rpa_tm_actual_inventory
ods.rpa_tm_business_overview
ods.rpa_tm_core_idx
ods.rpa_tm_flow
ods.rpa_tm_inventory_performance
ods.rpa_tm_inventory_trans
ods.rpa_tm_living_sale
ods.rpa_tm_product
ods.rpa_tm_promotion_fee
ods.rpa_tm_promotion_performance
ods.rpa_tm_promotion_report
ods.rpa_tm_tk_biz_data
ods.rpa_wph_data_overview
ods.rpa_wph_product_details
ods.rpa_wph_promotion_fee
ods.rpa_wph_supplier_inventory_report
ods.rpa_xhs_dandelion_consumer_discipline
ods.rpa_xhs_estimated_commission_order
ods.rpa_xhs_order_inquiry
ods.rpa_xhs_spotlight_account_flow
ods.shop_share
ods.zzy_etl_task




