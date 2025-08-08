insert OVERWRITE ods.rpa_dy_alliance_order select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.dy_alliance_order;
insert OVERWRITE ods.rpa_dy_business_overview select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.dy_business_overview;
insert OVERWRITE ods.rpa_dy_cid select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.dy_cid;
insert OVERWRITE ods.rpa_dy_expert_analysis select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.dy_expert_analysis;
insert OVERWRITE ods.rpa_dy_finance_statement select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.dy_finance_statement;
insert OVERWRITE ods.rpa_dy_merchant_experience_score select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.dy_merchant_experience_score;
insert OVERWRITE ods.rpa_dy_product_constitute select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.dy_product_constitute;
insert OVERWRITE ods.rpa_dy_product_overview select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.dy_product_overview;
insert OVERWRITE ods.rpa_dy_promotion_fee_consumption select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.dy_promotion_fee_consumption;
insert OVERWRITE ods.rpa_dy_promotion_global_product select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.dy_promotion_global_product;
insert OVERWRITE ods.rpa_dy_promotion_global_tiktok select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.dy_promotion_global_tiktok;
insert OVERWRITE ods.rpa_dy_promotion_living_tiktok select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.dy_promotion_living_tiktok;
insert OVERWRITE ods.rpa_dy_promotion_product_product select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.dy_promotion_product_product;
insert OVERWRITE ods.rpa_dy_promotion_product_tiktok select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.dy_promotion_product_tiktok;
insert OVERWRITE ods.rpa_dy_reception_volume select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.dy_reception_volume;
insert OVERWRITE ods.rpa_dy_short_video_product select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.dy_short_video_product;
insert OVERWRITE ods.rpa_feishu_haiziwang_pos_data select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.feishu_haiziwang_pos_data;
insert OVERWRITE ods.rpa_feishu_leyou_pos_data select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.feishu_leyou_pos_data;
insert OVERWRITE ods.rpa_jd_autarky_consumer_overview select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.jd_autarky_consumer_overview;
insert OVERWRITE ods.rpa_jd_autarky_flow select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.jd_autarky_flow;
insert OVERWRITE ods.rpa_jd_autarky_jzt_promotion select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.jd_autarky_jzt_promotion;
insert OVERWRITE ods.rpa_jd_autarky_product select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.jd_autarky_product;
insert OVERWRITE ods.rpa_jd_autarky_product_key_idx select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.jd_autarky_product_key_idx;
insert OVERWRITE ods.rpa_jd_autarky_product_list select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.jd_autarky_product_list;
insert OVERWRITE ods.rpa_jd_autarky_product_performance select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.jd_autarky_product_performance;
insert OVERWRITE ods.rpa_jd_autarky_product_stock select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.jd_autarky_product_stock;
insert OVERWRITE ods.rpa_jd_autarky_recharge select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.jd_autarky_recharge;
insert OVERWRITE ods.rpa_jd_autarky_return_order select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.jd_autarky_return_order;
insert OVERWRITE ods.rpa_jd_autarky_trade select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.jd_autarky_trade;
insert OVERWRITE ods.rpa_jd_jtk_bill select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.jd_jtk_bill;
insert OVERWRITE ods.rpa_jd_jtk_product_order select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.jd_jtk_product_order;
insert OVERWRITE ods.rpa_jd_jzt_bill select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.jd_jzt_bill;
insert OVERWRITE ods.rpa_jd_pop_core_idx select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.jd_pop_core_idx;
insert OVERWRITE ods.rpa_jd_pop_entry_source select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.jd_pop_entry_source;
insert OVERWRITE ods.rpa_jd_pop_outbound select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.jd_pop_outbound;
insert OVERWRITE ods.rpa_jd_pop_stock select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.jd_pop_stock;
insert OVERWRITE ods.rpa_ks_aftersales_bulk_export select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.ks_aftersales_bulk_export;
insert OVERWRITE ods.rpa_ks_est_commission select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.ks_est_commission;
insert OVERWRITE ods.rpa_ks_e_niu_agent_summary_total_cost select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.ks_e_niu_agent_summary_total_cost;
insert OVERWRITE ods.rpa_ks_e_niu_financial_transactions select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.ks_e_niu_financial_transactions;
insert OVERWRITE ods.rpa_ks_mkt_ovw_e_niu_acc_details select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.ks_mkt_ovw_e_niu_acc_details;
insert OVERWRITE ods.rpa_ks_operating_data select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.ks_operating_data;
insert OVERWRITE ods.rpa_ks_order_bulk_export select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.ks_order_bulk_export;
insert OVERWRITE ods.rpa_ks_short_video_prod_report select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.ks_short_video_prod_report;
insert OVERWRITE ods.rpa_mx_ai_inventory_marketing_order select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.mx_ai_inventory_marketing_order;
insert OVERWRITE ods.rpa_mx_funds_account_transactions select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.mx_funds_account_transactions;
insert OVERWRITE ods.rpa_pdd_after_sales_data select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.pdd_after_sales_data;
insert OVERWRITE ods.rpa_pdd_after_sales_shop_star_rating select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.pdd_after_sales_shop_star_rating;
insert OVERWRITE ods.rpa_pdd_ddjb_promotion_expenses select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.pdd_ddjb_promotion_expenses;
insert OVERWRITE ods.rpa_pdd_operate_overview select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.pdd_operate_overview;
insert OVERWRITE ods.rpa_pdd_pre_sales_sales_data select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.pdd_pre_sales_sales_data;
insert OVERWRITE ods.rpa_pdd_pre_sales_service_data select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.pdd_pre_sales_service_data;
insert OVERWRITE ods.rpa_pdd_pre_sales_team_conversion_rate select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.pdd_pre_sales_team_conversion_rate;
insert OVERWRITE ods.rpa_pdd_pre_sales_team_data select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.pdd_pre_sales_team_data;
insert OVERWRITE ods.rpa_pdd_promotion_expenses select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.pdd_promotion_expenses;
insert OVERWRITE ods.rpa_syyz_after_sales_data select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.syyz_after_sales_data;
insert OVERWRITE ods.rpa_syyz_business_data_overview select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.syyz_business_data_overview;
insert OVERWRITE ods.rpa_syyz_distribution_analysis select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.syyz_distribution_analysis;
insert OVERWRITE ods.rpa_syyz_procure_order select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.syyz_procure_order;
insert OVERWRITE ods.rpa_syyz_sales_slip select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.syyz_sales_slip;
insert OVERWRITE ods.rpa_tb_account_fee select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tb_account_fee;
insert OVERWRITE ods.rpa_tb_account_report select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tb_account_report;
insert OVERWRITE ods.rpa_tb_assessment select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tb_assessment;
insert OVERWRITE ods.rpa_tb_cate_shop_gold select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tb_cate_shop_gold;
insert OVERWRITE ods.rpa_tb_cdl_product_statistics select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tb_cdl_product_statistics;
insert OVERWRITE ods.rpa_tb_cold_product select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tb_cold_product;
insert OVERWRITE ods.rpa_tb_core_idx select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tb_core_idx;
insert OVERWRITE ods.rpa_tb_coupon_usage select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tb_coupon_usage;
insert OVERWRITE ods.rpa_tb_cps_account_fee select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tb_cps_account_fee;
insert OVERWRITE ods.rpa_tb_cps_order select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tb_cps_order;
insert OVERWRITE ods.rpa_tb_entry_source select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tb_entry_source;
insert OVERWRITE ods.rpa_tb_experience_score select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tb_experience_score;
insert OVERWRITE ods.rpa_tb_living_sale select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tb_living_sale;
insert OVERWRITE ods.rpa_tb_operate_window select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tb_operate_window;
insert OVERWRITE ods.rpa_tb_promotion_report select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tb_promotion_report;
insert OVERWRITE ods.rpa_tb_service_metrics select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tb_service_metrics;
insert OVERWRITE ods.rpa_tb_settle_overview select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tb_settle_overview;
insert OVERWRITE ods.rpa_tb_special_trans select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tb_special_trans;
insert OVERWRITE ods.rpa_tb_tm_living_sale select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tb_tm_living_sale;
insert OVERWRITE ods.rpa_tb_tm_operate_window select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tb_tm_operate_window;
insert OVERWRITE ods.rpa_tb_trans_log select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tb_trans_log;
insert OVERWRITE ods.rpa_tb_unpaid_order select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tb_unpaid_order;
insert OVERWRITE ods.rpa_tb_ww_satisfaction select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tb_ww_satisfaction;
insert OVERWRITE ods.rpa_tm_account_fee select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tm_account_fee;
insert OVERWRITE ods.rpa_tm_actual_inventory select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tm_actual_inventory;
insert OVERWRITE ods.rpa_tm_business_overview select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tm_business_overview;
insert OVERWRITE ods.rpa_tm_core_idx select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tm_core_idx;
insert OVERWRITE ods.rpa_tm_flow select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tm_flow;
insert OVERWRITE ods.rpa_tm_inventory_performance select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tm_inventory_performance;
insert OVERWRITE ods.rpa_tm_inventory_trans select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tm_inventory_trans;
insert OVERWRITE ods.rpa_tm_living_sale select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tm_living_sale;
insert OVERWRITE ods.rpa_tm_product select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tm_product;
insert OVERWRITE ods.rpa_tm_promotion_fee select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tm_promotion_fee;
insert OVERWRITE ods.rpa_tm_promotion_performance select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tm_promotion_performance;
insert OVERWRITE ods.rpa_tm_promotion_report select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.tm_promotion_report;
insert OVERWRITE ods.rpa_wph_data_overview select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.wph_data_overview;
insert OVERWRITE ods.rpa_wph_product_details select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.wph_product_details;
insert OVERWRITE ods.rpa_wph_promotion_fee select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.wph_promotion_fee;
insert OVERWRITE ods.rpa_wph_supplier_inventory_report select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.wph_supplier_inventory_report;
insert OVERWRITE ods.rpa_xhs_dandelion_consumer_discipline select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.xhs_dandelion_consumer_discipline;
insert OVERWRITE ods.rpa_xhs_estimated_commission_order select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.xhs_estimated_commission_order;
insert OVERWRITE ods.rpa_xhs_order_inquiry select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.xhs_order_inquiry;
insert OVERWRITE ods.rpa_xhs_spotlight_account_flow select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.xhs_spotlight_account_flow;
insert OVERWRITE ods.rpa_hzw_king_promotion select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.hzw_king_promotion;
insert OVERWRITE ods.ods_yy_dialogue_records select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.yy_dialogue_records;
insert OVERWRITE ods.rpa_syyz_order_details select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.syyz_order_details;


insert OVERWRITE ods.rpa_hzw_king_return_order select id,return_order_number,order_number,application_time,after_sales_requirements,SKUID,product_name,order_quantity,requested_return_quantity,actual_return_quantity,requested_exchange_quantity,payment_amount,refund_amount,shipping_fee,return_order_status,return_reason,tracking_number,courier_company,shop_id,platform_name,created_by,created_at,update_by,updated_at,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.hzw_king_return_order;
insert OVERWRITE ods.rpa_hzw_transaction_info select id,date,visitor_count,page_views,order_customer_count,order_count,order_amount,order_product_count,transaction_customer_count,transaction_order_count,transaction_amount,transaction_product_count,avg_transaction_amount,shop_id,platform_name,created_by,created_at,updated_by,updated_at,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.hzw_transaction_info;

insert OVERWRITE ods.jky_qm_trades_fullinfo select *,date_format(gmtCreate,'%Y-%m-01') from jky.qm_trades_fullinfo;

insert OVERWRITE ods.jky_business_log select * from rpa_data.jky_business_log;


# SELECT COLUMN_NAME from `INFORMATION_SCHEMA`.`COLUMNS` where  TABLE_NAME = 'rpa_hzw_transaction_info';
show create table dwd.dwd_trd_rpa_tb_tm_living_sale;


show create table rpa_data.jd_autarky_return_order;


truncate ods.rpa_jd_autarky_product_performance;
insert OVERWRITE ods.rpa_jd_autarky_product_performance select *,DATE_FORMAT(DATE_SUB(created_at, INTERVAL 1 DAY), '%Y%m%d') from rpa_data.jd_autarky_product_performance;


