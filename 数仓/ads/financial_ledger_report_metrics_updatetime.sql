TRUNCATE TABLE ads.financial_ledger_report_metrics_updatetime;

insert  into ads.financial_ledger_report_metrics_updatetime

select
	`cal_date`	, -- 	日期
    upper(shop_code) as`shop_id`,                                                 -- 店铺id
    ifnull(`business_cate`,'') as business_cate,                                           -- 业务分类
	`expense_center_code`	, -- 	费用中心编号
	`expense_center`	, -- 	费用中心名称
	`department_1`	, -- 	一级部门（组织架构）
	`department_2`	, -- 	二级渠道（组织架构）
	`department_3`	, -- 	三级渠道
	`department_4`	, -- 	四级渠道（店铺名称+业务分类）
sum(`rspgmv`) as 	`rsp_gmv`	, -- 	RSPGMV
sum(`gmv`) as 	`gmv`	, -- 	GMV
sum(`refund_amount`) as 	`refund_amount`	, -- 	退款金额

  sum(`cost_gmv_amt`) as cost_gmv_amt, -- GMV成本
sum( `cost_rfd_amt`) as cost_rfd_amt, -- 退款金额成本合计
sum(`cost_gsv`) as cost_gsv,

sum(shipping_cost) as `shipping_cost`, -- 运费
sum(`gsv`) as 	`gsv`	, -- 	GSV
sum(`gsv`+shipping_cost)-
(sum(`short_video_commission`)	+
sum(`live_stream_offline_commission`)	+
sum(`short_video_darren_commission`)	+
sum(`duoduo_commission`)	+
sum(`haoyiku_commission`)	+
sum(`jingtaoke_commission`)	+
sum(`private_domain_service_fee`)	+
sum(`taobao_commission`)	+
sum(`weixiangke_commission`)	+
sum(`commission`)	+
sum(`live_stream_commission`)	+
sum(`short_video_service_fee`)	+
sum(`live_stream_service_fee`)	+
sum(`cid_ud_ad_spend`)	+
sum(`ka_barcode_fee`)	+
sum(`otd_promotion_cost`)	+
sum(`scene_promotion_cost`)	+
sum(`magnet_gold_pc`)	+
sum(`magnet_gold_mobile`)	+
sum(`douyin_doujia`)	+
sum(`douyin_qianchuan`)	+
sum(`douyin_suixin`)	+
sum(`shopping_touchpoint`)	+
sum(`hai_tou`)	+
sum(`jingxiaozhi_recharge`)	+
sum(`juiguang_platform`)	+
sum(`kuai_che`)	+
sum(`joint_promotion_cost`)	+
sum(`star_shop_promotion`)	+
sum(`brand_zone`)	+
sum(`pinxiao_bao`)	+
sum(`full_site_promotion`)	+
sum(`search_promotion`)	+
sum(`tencent_ad_spend`)	+
sum(`wanxiang_platform`)	+
sum(`wechat_beans`)	+
sum(`offline_venue_rental`)	+
sum(`offline_instore_ad`)	+
sum(`offline_exhibition_fee`)	+
sum(`xiaohongshu_promotion`)	+
sum(`gravity_cube`)	+
sum(`easy_consumables_purchase`)	+
sum(`operation_buyer_show_maintenance`)	+
sum(`smart_targeting`)	+
sum(`zhitongche`)	+
sum(`gift_fee_ms`)	+
sum(`gift_fee_bund`)	+
sum(`gift_fee_non_food_inventory`)	+
sum(`non_food_gift_cost`)	+
sum(`gift_fee_formal_gift`)	+
sum(`ai_calling_cost`)	+
sum(`eka_consumption_card`)	+
sum(`promo_resource_purchase`)	+
sum(`darren_activity_fee`)	+
sum(`sms_cost`)	+
sum(`horizontal_screen_resource_position`)	+
sum(`juhuasuan_subsidy_fee`)	+
sum(`hot_wave_engine_service_fee`)	+
sum(`new_customer_first_order_gift`)	+
sum(`sales_promotion_incentive`)	+
sum(`tp_service_fee`)	+
sum(`tp_service_tax_diff`)	+
sum(`refund_difference`)	+
sum(`small_payment`)	+
sum(`gift_with_order_compensation`)	+
sum(`offline_product_promotion_service_fee`)	+
sum(`offline_consumer_promotion`)	+
sum(`main_project_promotion`)	+
sum(`darren_sample_fee`)	+
sum(`internal_product_usage`)	+
sum(`contract_display_fee`)	+
sum(`contract_rebate`)	+
sum(`contract_fixed_fee`)	+
sum(`contract_other_fees`)	+
sum(`contract_new_store_entry_fee`)	+
sum(`huabei_fee`)	+
sum(`credit_card_fee`)	+
sum(`shop_commission_rate`)	+
sum(`platform_software_service_fee`)	+
sum(`freight_insurance`)	+
sum(`customer_service_travel_expense`)	+
sum(`customer_service_salary`)	+
sum(`customer_service_outsourcing`)	+
sum(`customer_service_software_cost`)	+
sum(`agent_or_darren_payout`)	+
sum(`breach_of_contract_payout`)	+
sum(`business_loss_health_impact_payout`)	+
sum(`copyright_application_fee`)	+
sum(`copyright_purchase_fee`)	+
sum(`price_control_rights_protection`)	+
sum(`service_entitlement_purchase_fee`)	+
sum(`outdoor_film_online_advertising`)	+
sum(`brand_product_promo_production_fee`)	+
sum(`business_cooperation_content_spread`)	+
sum(`packaging_design_fee`)	+
sum(`industrial_design_fee`)	+
sum(`brand_design_fee`)	+
sum(`material_design_fee`)	+
sum(`venue_rental_daily_expenses`)	+
sum(`prop_purchase_fee`)	+
sum(`model_fee`)	+
sum(`video_shooting_fee`)	+
sum(`photo_shooting_fee`)	+
sum(`internal_product_usage_commented`)	+
sum(`douyin_promotion`)	+
sum(`channel_marketing`)	+
sum(`brand_consulting_service_fee`)	+
sum(`external_brand_advisory_fee`)	+
sum(`base_salary`)	+
sum(`human_resources_outsourcing_fee`)	+
sum(`bonus`)	+
sum(`external_training_fee`)	+
sum(`excellence_award_team_personal`)	+
sum(`employee_compensation`)	+
sum(`corporate_culture_activity_fee`)	+
sum(`team_building_fee`)	+
sum(`housing_fund`)	+
sum(`work_injury_insurance`)	+
sum(`unemployment_insurance`)	+
sum(`old_age_insurance`)	+
sum(`medical_insurance`)	+
sum(`overtime_meal_fee`)	+
sum(`overtime_transportation_fee`)	+
sum(`festival_welfare_fee`)	+
sum(`health_checkup_fee`)	+
sum(`accident_insurance`)	+
sum(`employee_care_fee`)	+
sum(`headhunter_fee`)	+
sum(`recruitment_fee`)	+
sum(`internal_product_usage_commented_again`)	+
sum(`testing_fee`)	+
sum(`r_and_d_external_testing_fee`)	+
sum(`vehicle_insurance_registration_fee`)	+
sum(`vehicle_maintenance_repair_fee`)	+
sum(`admin_vehicle_fuel_fee`)	+
sum(`standardization_certification_fee`)	+
sum(`product_certification_fee`)	+
sum(`association_membership_fee`)	+
sum(`channel_system_service_fee`)	+
sum(`network_service_fee`)	+
sum(`information_service_purchase`)	+
sum(`it_project_construction_fee`)	+
sum(`it_system_maintenance_fee`)	+
sum(`sample_purchase_fee`)	+
sum(`third_party_factory_audit_fee`)	+
sum(`legal_fee`)	+
sum(`other_legal_services`)	+
sum(`other_consultancy_fee`)	+
sum(`hr_consultancy_fee`)	+
sum(`regular_audit_fee`)	+
sum(`litigation_fee`)	+
sum(`r_and_d_external_consultancy_fee`)	+
sum(`special_audit_service_fee`)	+
sum(`special_consultancy_fee`)	+
sum(`toll_bridge_parking_fee`)	+
sum(`business_trip_transportation_fee`)	+
sum(`pest_control_fee`)	+
sum(`green_plant_fee`)	+
sum(`large_bucket_water_fee`)	+
sum(`office_equipment_furniture`)	+
sum(`admin_vehicle`)	+
sum(`computer_related_products`)	+
sum(`other_assets`)	+
sum(`trademark_purchase_fee`)	+
sum(`r_and_d_equipment_purchase_fee`)	+
sum(`it_equipment`)	+
sum(`office_equipment_furniture_commented`)	+
sum(`vehicle_commented`)	+
sum(`other_equipment`)	+
sum(`r_and_d_equipment_commented`)	+
sum(`office_supplies_fee`)	+
sum(`admin_low_consumables`)	+
sum(`start_up_special_fees`)	+
sum(`other_office_fees`)	+
sum(`daily_necessities_fee`)	+
sum(`barcode_application_fee`)	+
sum(`document_copying_fee`)	+
sum(`font_image_copyright_purchase_fee`)	+
sum(`meeting_conference_fee`)	+
sum(`admin_express_fee`)	+
sum(`other_communication_fees`)	+
sum(`office_equipment_maintenance_fee`)	+
sum(`media_framework_cooperation`)	+
sum(`online_media_distribution`)	+
sum(`pr_maintenance_business_entertainment`)	+
sum(`customer_relationship_maintenance`)	+
sum(`gift_fee`)	+
sum(`business_entertainment_fee`)	+
sum(`toB_public_opinion_maintenance`)	+
sum(`toC_public_opinion_maintenance`)	+
sum(`contract_margin_protection_2C`)	+
sum(`compensation_due_to_order_review`)	+
sum(`compensation_due_to_operations`)	+
sum(`compensation_due_to_other`)	+
sum(`compensation_due_to_customer_service`)	+
sum(`customer_service_evaluation_fee`)	+
sum(`meal_subsidy`)	+
sum(`railway_air_traffic`)	+
sum(`city_traffic`)	+
sum(`private_car_for_public_use_subsidy`)	+
sum(`accommodation_fee`)	+
sum(`highway_waterway_traffic`)	+
sum(`electricity_fee`)	+
sum(`house_rent`)	+
sum(`infrastructure_repair_fee`)	+
sum(`water_fee`)	+
sum(`property_management_fee`)	+
sum(`decoration_fee`)	+
sum(`financial_institution_service_charge`)	+
sum(`online_bank_transaction_fee`)	+
sum(`interest_income`)  +
sum(`guanghe_commission`)+
sum(`base_salary_test`)
)
 as nsv, 					-- nsv
(
sum(`short_video_commission`)	+
sum(`live_stream_offline_commission`)	+
sum(`short_video_darren_commission`)	+
sum(`duoduo_commission`)	+
sum(`haoyiku_commission`)	+
sum(`jingtaoke_commission`)	+
sum(`private_domain_service_fee`)	+
sum(`taobao_commission`)	+
sum(`weixiangke_commission`)	+
sum(`commission`)	+
sum(`live_stream_commission`)	+
sum(`short_video_service_fee`)	+
sum(`live_stream_service_fee`)	+
sum(`cid_ud_ad_spend`)	+
sum(`ka_barcode_fee`)	+
sum(`otd_promotion_cost`)	+
sum(`scene_promotion_cost`)	+
sum(`magnet_gold_pc`)	+
sum(`magnet_gold_mobile`)	+
sum(`douyin_doujia`)	+
sum(`douyin_qianchuan`)	+
sum(`douyin_suixin`)	+
sum(`shopping_touchpoint`)	+
sum(`hai_tou`)	+
sum(`jingxiaozhi_recharge`)	+
sum(`juiguang_platform`)	+
sum(`kuai_che`)	+
sum(`joint_promotion_cost`)	+
sum(`star_shop_promotion`)	+
sum(`brand_zone`)	+
sum(`pinxiao_bao`)	+
sum(`full_site_promotion`)	+
sum(`search_promotion`)	+
sum(`tencent_ad_spend`)	+
sum(`wanxiang_platform`)	+
sum(`wechat_beans`)	+
sum(`offline_venue_rental`)	+
sum(`offline_instore_ad`)	+
sum(`offline_exhibition_fee`)	+
sum(`xiaohongshu_promotion`)	+
sum(`gravity_cube`)	+
sum(`easy_consumables_purchase`)	+
sum(`operation_buyer_show_maintenance`)	+
sum(`smart_targeting`)	+
sum(`zhitongche`)	+
sum(`gift_fee_ms`)	+
sum(`gift_fee_bund`)	+
sum(`gift_fee_non_food_inventory`)	+
sum(`non_food_gift_cost`)	+
sum(`gift_fee_formal_gift`)	+
sum(`ai_calling_cost`)	+
sum(`eka_consumption_card`)	+
sum(`promo_resource_purchase`)	+
sum(`darren_activity_fee`)	+
sum(`sms_cost`)	+
sum(`horizontal_screen_resource_position`)	+
sum(`juhuasuan_subsidy_fee`)	+
sum(`hot_wave_engine_service_fee`)	+
sum(`new_customer_first_order_gift`)	+
sum(`sales_promotion_incentive`)	+
sum(`tp_service_fee`)	+
sum(`tp_service_tax_diff`)	+
sum(`refund_difference`)	+
sum(`small_payment`)	+
sum(`gift_with_order_compensation`)	+
sum(`offline_product_promotion_service_fee`)	+
sum(`offline_consumer_promotion`)	+
sum(`main_project_promotion`)	+
sum(`darren_sample_fee`)	+
sum(`internal_product_usage`)	+
sum(`contract_display_fee`)	+
sum(`contract_rebate`)	+
sum(`contract_fixed_fee`)	+
sum(`contract_other_fees`)	+
sum(`contract_new_store_entry_fee`)	+
sum(`huabei_fee`)	+
sum(`credit_card_fee`)	+
sum(`shop_commission_rate`)	+
sum(`platform_software_service_fee`)	+
sum(`freight_insurance`)	+
sum(`customer_service_travel_expense`)	+
sum(`customer_service_salary`)	+
sum(`customer_service_outsourcing`)	+
sum(`customer_service_software_cost`)	+
sum(`agent_or_darren_payout`)	+
sum(`breach_of_contract_payout`)	+
sum(`business_loss_health_impact_payout`)	+
sum(`copyright_application_fee`)	+
sum(`copyright_purchase_fee`)	+
sum(`price_control_rights_protection`)	+
sum(`service_entitlement_purchase_fee`)	+
sum(`outdoor_film_online_advertising`)	+
sum(`brand_product_promo_production_fee`)	+
sum(`business_cooperation_content_spread`)	+
sum(`packaging_design_fee`)	+
sum(`industrial_design_fee`)	+
sum(`brand_design_fee`)	+
sum(`material_design_fee`)	+
sum(`venue_rental_daily_expenses`)	+
sum(`prop_purchase_fee`)	+
sum(`model_fee`)	+
sum(`video_shooting_fee`)	+
sum(`photo_shooting_fee`)	+
sum(`internal_product_usage_commented`)	+
sum(`douyin_promotion`)	+
sum(`channel_marketing`)	+
sum(`brand_consulting_service_fee`)	+
sum(`external_brand_advisory_fee`)	+
sum(`base_salary`)	+
sum(`human_resources_outsourcing_fee`)	+
sum(`bonus`)	+
sum(`external_training_fee`)	+
sum(`excellence_award_team_personal`)	+
sum(`employee_compensation`)	+
sum(`corporate_culture_activity_fee`)	+
sum(`team_building_fee`)	+
sum(`housing_fund`)	+
sum(`work_injury_insurance`)	+
sum(`unemployment_insurance`)	+
sum(`old_age_insurance`)	+
sum(`medical_insurance`)	+
sum(`overtime_meal_fee`)	+
sum(`overtime_transportation_fee`)	+
sum(`festival_welfare_fee`)	+
sum(`health_checkup_fee`)	+
sum(`accident_insurance`)	+
sum(`employee_care_fee`)	+
sum(`headhunter_fee`)	+
sum(`recruitment_fee`)	+
sum(`internal_product_usage_commented_again`)	+
sum(`testing_fee`)	+
sum(`r_and_d_external_testing_fee`)	+
sum(`vehicle_insurance_registration_fee`)	+
sum(`vehicle_maintenance_repair_fee`)	+
sum(`admin_vehicle_fuel_fee`)	+
sum(`standardization_certification_fee`)	+
sum(`product_certification_fee`)	+
sum(`association_membership_fee`)	+
sum(`channel_system_service_fee`)	+
sum(`network_service_fee`)	+
sum(`information_service_purchase`)	+
sum(`it_project_construction_fee`)	+
sum(`it_system_maintenance_fee`)	+
sum(`sample_purchase_fee`)	+
sum(`third_party_factory_audit_fee`)	+
sum(`legal_fee`)	+
sum(`other_legal_services`)	+
sum(`other_consultancy_fee`)	+
sum(`hr_consultancy_fee`)	+
sum(`regular_audit_fee`)	+
sum(`litigation_fee`)	+
sum(`r_and_d_external_consultancy_fee`)	+
sum(`special_audit_service_fee`)	+
sum(`special_consultancy_fee`)	+
sum(`toll_bridge_parking_fee`)	+
sum(`business_trip_transportation_fee`)	+
sum(`pest_control_fee`)	+
sum(`green_plant_fee`)	+
sum(`large_bucket_water_fee`)	+
sum(`office_equipment_furniture`)	+
sum(`admin_vehicle`)	+
sum(`computer_related_products`)	+
sum(`other_assets`)	+
sum(`trademark_purchase_fee`)	+
sum(`r_and_d_equipment_purchase_fee`)	+
sum(`it_equipment`)	+
sum(`office_equipment_furniture_commented`)	+
sum(`vehicle_commented`)	+
sum(`other_equipment`)	+
sum(`r_and_d_equipment_commented`)	+
sum(`office_supplies_fee`)	+
sum(`admin_low_consumables`)	+
sum(`start_up_special_fees`)	+
sum(`other_office_fees`)	+
sum(`daily_necessities_fee`)	+
sum(`barcode_application_fee`)	+
sum(`document_copying_fee`)	+
sum(`font_image_copyright_purchase_fee`)	+
sum(`meeting_conference_fee`)	+
sum(`admin_express_fee`)	+
sum(`other_communication_fees`)	+
sum(`office_equipment_maintenance_fee`)	+
sum(`media_framework_cooperation`)	+
sum(`online_media_distribution`)	+
sum(`pr_maintenance_business_entertainment`)	+
sum(`customer_relationship_maintenance`)	+
sum(`gift_fee`)	+
sum(`business_entertainment_fee`)	+
sum(`toB_public_opinion_maintenance`)	+
sum(`toC_public_opinion_maintenance`)	+
sum(`contract_margin_protection_2C`)	+
sum(`compensation_due_to_order_review`)	+
sum(`compensation_due_to_operations`)	+
sum(`compensation_due_to_other`)	+
sum(`compensation_due_to_customer_service`)	+
sum(`customer_service_evaluation_fee`)	+
sum(`meal_subsidy`)	+
sum(`railway_air_traffic`)	+
sum(`city_traffic`)	+
sum(`private_car_for_public_use_subsidy`)	+
sum(`accommodation_fee`)	+
sum(`highway_waterway_traffic`)	+
sum(`electricity_fee`)	+
sum(`house_rent`)	+
sum(`infrastructure_repair_fee`)	+
sum(`water_fee`)	+
sum(`property_management_fee`)	+
sum(`decoration_fee`)	+
sum(`financial_institution_service_charge`)	+
sum(`online_bank_transaction_fee`)	+
sum(`interest_income`) +
sum(`guanghe_commission`)+
sum(`base_salary_test`)
)
as sale_cost_sum, 					-- 销售费用合计
sum(`supply_price_gmv`) as 	`supply_price_gmv`	, -- 	供货价
sum(`rsp_gmv_taste`) as 	`rsp_gmv_taste`	, -- 	RSPGMV-尝鲜装拉新
sum(`gmv_taste`) as 	`gmv_taste`	, -- 	GMV-尝鲜装拉新
sum(`refund_amount_taste`) as 	`refund_amount_taste`	, -- 	退款金额-尝鲜装拉新
sum(`gsv_taste`) as 	`gsv_taste`	, -- 	GSV-尝鲜装拉新

sum(`gsv_supply_price`) as `gsv_supply_price`, -- GSV-供货价
sum(`refund_amount_supply_price`) as `refund_amount_supply_price`, -- 退款金额-供货价
sum(`gmv_supply_price_taste`) as `gmv_supply_price_taste`, -- GMV-供货价尝鲜装拉新
sum(`refund_amount_supply_price_taste`) as `refund_amount_supply_price_taste`, -- 退款金额-供货价尝鲜装拉新
sum(`gsv_supply_price_taste`) as `gsv_supply_price_taste`, -- GSV-供货价尝鲜装拉新
sum(`tax_with_union_funds_and_disability_insurance`) as `tax_with_union_funds_and_disability_insurance`, -- 税金（含工会经费划拨、残保金）
sum(`non_operating_income`) as `non_operating_income`, -- 营业外收入
sum(`other_business_income`) as `other_business_income`, -- 其他业务收入
sum(`other_costs`) as `other_costs`, -- 其他成本
sum(`deposit`) as `deposit`, -- 保证金
sum(`tax_arrears_penalty`) as `tax_arrears_penalty`, -- 税收滞纳金罚款

sum(`short_video_commission`) as 	`short_video_commission`	, -- 	达人短视频线下返佣
sum(`live_stream_offline_commission`) as 	`live_stream_offline_commission`	, -- 	达人直播线下返佣
sum(`short_video_darren_commission`) as 	`short_video_darren_commission`	, -- 	短视频达人佣金
sum(`duoduo_commission`) as 	`duoduo_commission`	, -- 	多多客佣金
sum(`haoyiku_commission`) as 	`haoyiku_commission`	, -- 	好衣库达人佣金
sum(`jingtaoke_commission`) as 	`jingtaoke_commission`	, -- 	京挑客佣金
sum(`private_domain_service_fee`) as 	`private_domain_service_fee`	, -- 	私域外包代运营费
sum(`taobao_commission`) as 	`taobao_commission`	, -- 	淘宝客佣金
sum(`weixiangke_commission`) as 	`weixiangke_commission`	, -- 	唯享客佣金
sum(`commission`) as 	`commission`	, -- 	佣金
sum(`live_stream_commission`) as 	`live_stream_commission`	, -- 	直播达人佣金
sum(`short_video_service_fee`) as 	`short_video_service_fee`	, -- 	达人短视频服务费
sum(`live_stream_service_fee`) as 	`live_stream_service_fee`	, -- 	达人直播服务费
sum(`cid_ud_ad_spend`) as 	`cid_ud_ad_spend`	, -- 	CID、UD信息流投放
sum(`ka_barcode_fee`) as 	`ka_barcode_fee`	, -- 	KA卖进条码费
sum(`otd_promotion_cost`) as 	`otd_promotion_cost`	, -- 	OTD推广费用
sum(`scene_promotion_cost`) as 	`scene_promotion_cost`	, -- 	场景推广
sum(`magnet_gold_pc`) as 	`magnet_gold_pc`	, -- 	磁力金牛PC
sum(`magnet_gold_mobile`) as 	`magnet_gold_mobile`	, -- 	磁力金牛移动
sum(`douyin_doujia`) as 	`douyin_doujia`	, -- 	抖音抖加
sum(`douyin_qianchuan`) as 	`douyin_qianchuan`	, -- 	抖音千川
sum(`douyin_suixin`) as 	`douyin_suixin`	, -- 	抖音随心推
sum(`shopping_touchpoint`) as 	`shopping_touchpoint`	, -- 	购物触点
sum(`hai_tou`) as 	`hai_tou`	, -- 	海投
sum(`jingxiaozhi_recharge`) as 	`jingxiaozhi_recharge`	, -- 	京小智充值
sum(`juiguang_platform`) as 	`juiguang_platform`	, -- 	聚光平台
sum(`kuai_che`) as 	`kuai_che`	, -- 	快车
sum(`joint_promotion_cost`) as 	`joint_promotion_cost`	, -- 	联合推广
sum(`star_shop_promotion`) as 	`star_shop_promotion`	, -- 	明星店铺推广
sum(`brand_zone`) as 	`brand_zone`	, -- 	品牌专区
sum(`pinxiao_bao`) as 	`pinxiao_bao`	, -- 	品销宝
sum(`full_site_promotion`) as 	`full_site_promotion`	, -- 	全站推广
sum(`search_promotion`) as 	`search_promotion`	, -- 	搜索推广
sum(`tencent_ad_spend`) as 	`tencent_ad_spend`	, -- 	腾讯广告费用
sum(`wanxiang_platform`) as 	`wanxiang_platform`	, -- 	万相台
sum(`wechat_beans`) as 	`wechat_beans`	, -- 	微信豆
sum(`offline_venue_rental`) as 	`offline_venue_rental`	, -- 	线下场地租用
sum(`offline_instore_ad`) as 	`offline_instore_ad`	, -- 	线下店内广告费
sum(`offline_exhibition_fee`) as 	`offline_exhibition_fee`	, -- 	线下外部参展费
sum(`xiaohongshu_promotion`) as 	`xiaohongshu_promotion`	, -- 	小红书推广费
sum(`gravity_cube`) as 	`gravity_cube`	, -- 	引力魔方
sum(`easy_consumables_purchase`) as 	`easy_consumables_purchase`	, -- 	易耗道具采购费用
sum(`operation_buyer_show_maintenance`) as 	`operation_buyer_show_maintenance`	, -- 	运营买家秀维护
sum(`smart_targeting`) as 	`smart_targeting`	, -- 	智能投放
sum(`zhitongche`) as 	`zhitongche`	, -- 	直通车
sum(`gift_fee_ms`) as 	`ms_gift`	, -- 	MS赠品
sum(`gift_fee_bund`) as 	`taste_pack_promotion`	, -- 	尝鲜装搭赠
sum(`gift_fee_non_food_inventory`) as 	`non_food_gift_inventory`	, -- 	非食赠品-入库
sum(`non_food_gift_cost`) as 	`non_food_gift_cost`	, -- 	非食赠品采购成本
sum(`gift_fee_formal_gift`) as 	`main_product_gift`	, -- 	正装赠品
sum(`ai_calling_cost`) as 	`ai_calling_cost`	, -- 	AI电话费用
sum(`eka_consumption_card`) as 	`eka_consumption_card`	, -- 	EKA消费卡
sum(`promo_resource_purchase`) as 	`promo_resource_purchase`	, -- 	大促及爆品推广资源采买
sum(`darren_activity_fee`) as 	`darren_activity_fee`	, -- 	达人活动费
sum(`sms_cost`) as 	`sms_cost`	, -- 	短信费用
sum(`horizontal_screen_resource_position`) as 	`horizontal_screen_resource_position`	, -- 	横屏/资源位
sum(`juhuasuan_subsidy_fee`) as 	`juhuasuan_subsidy_fee`	, -- 	聚划算、百亿补贴费用
sum(`hot_wave_engine_service_fee`) as 	`hot_wave_engine_service_fee`	, -- 	热浪引擎服务费
sum(`new_customer_first_order_gift`) as 	`new_customer_first_order_gift`	, -- 	新客首单礼金
sum(`sales_promotion_incentive`) as 	`sales_promotion_incentive`	, -- 	促销员激励

SUM(
    IF(department_3 = '线上分销-代运营',
        gsv - gsv_supply_price - shipping_cost - full_site_promotion - wanxiang_platform
        - cid_ud_ad_spend - ka_barcode_fee - otd_promotion_cost - scene_promotion_cost
        - magnet_gold_pc - magnet_gold_mobile - douyin_doujia - douyin_qianchuan
        - douyin_suixin - shopping_touchpoint - hai_tou - jingxiaozhi_recharge
        - juiguang_platform - kuai_che - joint_promotion_cost - star_shop_promotion
        - brand_zone - pinxiao_bao - search_promotion - tencent_ad_spend - wechat_beans
        - offline_venue_rental - offline_instore_ad - offline_exhibition_fee
        - xiaohongshu_promotion - easy_consumables_purchase - gravity_cube
        - operation_buyer_show_maintenance - zhitongche - smart_targeting
        - jingtaoke_commission - taobao_commission - short_video_commission
        - live_stream_offline_commission - short_video_darren_commission - duoduo_commission
        - haoyiku_commission - private_domain_service_fee - weixiangke_commission
        - commission - live_stream_commission - freight_insurance - shop_commission_rate+tp_service_fee,
        tp_service_fee
    )
) AS tp_service_fee, -- 	TP服务费
sum(`tp_service_tax_diff`) as 	`tp_service_tax_diff`	, -- 	TP服务费税差
sum(`refund_difference`) as 	`refund_difference`	, -- 	退差价
sum(`small_payment`) as 	`small_payment`	, -- 	小额打款
sum(`gift_with_order_compensation`) as 	`gift_with_order_compensation`	, -- 	随箱礼及赠品补差
sum(`offline_product_promotion_service_fee`) as 	`offline_product_promotion_service_fee`	, -- 	线下产品推广服务费
sum(`offline_consumer_promotion`) as 	`offline_consumer_promotion`	, -- 	线下消费者价格促销
sum(`main_project_promotion`) as 	`main_project_promotion`	, -- 	主推项目
sum(`darren_sample_fee`) as 	`darren_sample_fee`	, -- 	达人样品费
sum(`internal_product_usage`) as 	`internal_product_usage`	, -- 	内部产品领用1
sum(`contract_display_fee`) as 	`contract_display_fee`	, -- 	合同条款-陈列费
sum(`contract_rebate`) as 	`contract_rebate`	, -- 	合同条款-返利
sum(`contract_fixed_fee`) as 	`contract_fixed_fee`	, -- 	合同条款-固定费用
sum(`contract_margin_protection`) as 	`contract_margin_protection`	, -- 	合同条款-毛保
sum(`contract_other_fees`) as 	`contract_other_fees`	, -- 	合同条款-其他费
sum(`contract_new_store_entry_fee`) as 	`contract_new_store_entry_fee`	, -- 	合同条款-新店进场费
sum(`huabei_fee`) as 	`huabei_fee`	, -- 	花呗手续费
sum(`credit_card_fee`) as 	`credit_card_fee`	, -- 	信用卡交易手续费
sum(`shop_commission_rate`) as 	`shop_commission_rate`	, -- 	2C店铺扣点
sum(`platform_software_service_fee`) as 	`platform_software_service_fee`	, -- 	平台软件服务费
sum(`freight_insurance`) as 	`freight_insurance`	, -- 	运费险
sum(`warehouse_logistics_payout`) as 	`warehouse_logistics_payout`	, -- 	仓储物流赔付扣款
sum(`warehousing_loss_due_to_logistics`) as 	`warehousing_loss_due_to_logistics`	, -- 	仓配原因类资损
sum(`customer_service_travel_expense`) as 	`customer_service_travel_expense`	, -- 	客服差旅费用
sum(`customer_service_salary`) as 	`customer_service_salary`	, -- 	客服人力工资
sum(`customer_service_outsourcing`) as 	`customer_service_outsourcing`	, -- 	客服人力外包
sum(`customer_service_software_cost`) as 	`customer_service_software_cost`	, -- 	客服软件费用
sum(`agent_or_darren_payout`) as 	`agent_or_darren_payout`	, -- 	代理或达人责任类赔付
sum(`breach_of_contract_payout`) as 	`breach_of_contract_payout`	, -- 	电商违约赔付费用
sum(`business_loss_health_impact_payout`) as 	`business_loss_health_impact_payout`	, -- 	经营亏损、健康影响类赔付
sum(`customer_service_quality_payout`) as 	`customer_service_quality_payout`	, -- 	售后赔付（质量）
sum(`quality_payout`) as 	`quality_payout`	, -- 	质量赔付
sum(`quality_loss_due_to_quality`) as 	`quality_loss_due_to_quality`	, -- 	质量原因类资损
sum(`copyright_application_fee`) as 	`copyright_application_fee`	, -- 	版权申请费
sum(`copyright_purchase_fee`) as 	`copyright_purchase_fee`	, -- 	字体/图库等版权采购费
sum(`price_control_rights_protection`) as 	`price_control_rights_protection`	, -- 	控价维权
sum(`service_entitlement_purchase_fee`) as 	`service_entitlement_purchase_fee`	, -- 	会员等服务/权益采购费用
sum(`outdoor_film_online_advertising`) as 	`outdoor_film_online_advertising`	, -- 	户外、影视综、线上广告
sum(`brand_product_promo_production_fee`) as 	`brand_product_promo_production_fee`	, -- 	品牌/产品宣传片制作费
sum(`business_cooperation_content_spread`) as 	`business_cooperation_content_spread`	, -- 	商务合作、内容传播、营销物料等
sum(`packaging_design_fee`) as 	`packaging_design_fee`	, -- 	包装设计费
sum(`industrial_design_fee`) as 	`industrial_design_fee`	, -- 	工业设计费
sum(`brand_design_fee`) as 	`brand_design_fee`	, -- 	品牌设计费
sum(`material_design_fee`) as 	`material_design_fee`	, -- 	物料设计费
sum(`venue_rental_daily_expenses`) as 	`venue_rental_daily_expenses`	, -- 	场地租赁费、日常费用
sum(`prop_purchase_fee`) as 	`prop_purchase_fee`	, -- 	道具采购费
sum(`model_fee`) as 	`model_fee`	, -- 	模特费
sum(`video_shooting_fee`) as 	`video_shooting_fee`	, -- 	视频拍摄费
sum(`photo_shooting_fee`) as 	`photo_shooting_fee`	, -- 	图片拍摄费
sum(`internal_product_usage_commented`) as 	`internal_product_usage_commented`	, -- 	内部产品领用2
sum(`douyin_promotion`) as 	`douyin_promotion`	, -- 	抖音推广
sum(`channel_marketing`) as 	`channel_marketing`	, -- 	渠道营销
sum(`brand_consulting_service_fee`) as 	`brand_consulting_service_fee`	, -- 	品牌咨询服务费
sum(`external_brand_advisory_fee`) as 	`external_brand_advisory_fee`	, -- 	外部品牌定位/视觉/内容等顾问费
sum(`base_salary`) as 	`base_salary`	, -- 	基本工资
sum(`human_resources_outsourcing_fee`) as 	`human_resources_outsourcing_fee`	, -- 	人力外包费用
sum(`bonus`) as 	`bonus`	, -- 	提成
sum(`external_training_fee`) as 	`external_training_fee`	, -- 	外部培训费
sum(`excellence_award_team_personal`) as 	`excellence_award_team_personal`	, -- 	优秀奖励（含优秀团队/个人）
sum(`employee_compensation`) as 	`employee_compensation`	, -- 	员工赔偿金（含辞退、劳动事故/生育津贴/失业补偿费）
sum(`corporate_culture_activity_fee`) as 	`corporate_culture_activity_fee`	, -- 	企业文化活动费
sum(`team_building_fee`) as 	`team_building_fee`	, -- 	团建费
sum(`housing_fund`) as 	`housing_fund`	, -- 	公积金
sum(`work_injury_insurance`) as 	`work_injury_insurance`	, -- 	工伤保险
sum(`unemployment_insurance`) as 	`unemployment_insurance`	, -- 	失业保险
sum(`old_age_insurance`) as 	`old_age_insurance`	, -- 	养老保险
sum(`medical_insurance`) as 	`medical_insurance`	, -- 	医疗保险
sum(`overtime_meal_fee`) as 	`overtime_meal_fee`	, -- 	加班餐费
sum(`overtime_transportation_fee`) as 	`overtime_transportation_fee`	, -- 	加班交通费
sum(`festival_welfare_fee`) as 	`festival_welfare_fee`	, -- 	节日福利费
sum(`health_checkup_fee`) as 	`health_checkup_fee`	, -- 	体检费
sum(`accident_insurance`) as 	`accident_insurance`	, -- 	意外险
sum(`employee_care_fee`) as 	`employee_care_fee`	, -- 	员工慰问费
sum(`headhunter_fee`) as 	`headhunter_fee`	, -- 	猎头费
sum(`recruitment_fee`) as 	`recruitment_fee`	, -- 	招聘费用（含常规平台服务费、场地及资料费不含差旅）
sum(`internal_product_usage_commented_again`) as 	`internal_product_usage_commented_again`	, -- 	内部产品领用3
sum(`testing_fee`) as 	`testing_fee`	, -- 	检测费
sum(`r_and_d_external_testing_fee`) as 	`r_and_d_external_testing_fee`	, -- 	研发委外检测费
sum(`vehicle_insurance_registration_fee`) as 	`vehicle_insurance_registration_fee`	, -- 	车辆保险/年审费
sum(`vehicle_maintenance_repair_fee`) as 	`vehicle_maintenance_repair_fee`	, -- 	车辆保养/维修费
sum(`admin_vehicle_fuel_fee`) as 	`admin_vehicle_fuel_fee`	, -- 	行政车辆油费
sum(`standardization_certification_fee`) as 	`standardization_certification_fee`	, -- 	标准化体系认证费（管理类信息化类、生产安全类）
sum(`product_certification_fee`) as 	`product_certification_fee`	, -- 	专业服务费-产品认证费用
sum(`association_membership_fee`) as 	`association_membership_fee`	, -- 	协会会费
sum(`channel_system_service_fee`) as 	`channel_system_service_fee`	, -- 	渠道系统服务使用费
sum(`network_service_fee`) as 	`network_service_fee`	, -- 	网络服务费
sum(`information_service_purchase`) as 	`information_service_purchase`	, -- 	信息服务采购
sum(`it_project_construction_fee`) as 	`it_project_construction_fee`	, -- 	信息化项目建设费
sum(`it_system_maintenance_fee`) as 	`it_system_maintenance_fee`	, -- 	信息化系统运维费
sum(`sample_purchase_fee`) as 	`sample_purchase_fee`	, -- 	外购取样费
sum(`third_party_factory_audit_fee`) as 	`third_party_factory_audit_fee`	, -- 	第三方验厂费
sum(`legal_fee`) as 	`legal_fee`	, -- 	律师费
sum(`other_legal_services`) as 	`other_legal_services`	, -- 	其他法律服务
sum(`other_consultancy_fee`) as 	`other_consultancy_fee`	, -- 	其他咨询费
sum(`hr_consultancy_fee`) as 	`hr_consultancy_fee`	, -- 	人力咨询费
sum(`regular_audit_fee`) as 	`regular_audit_fee`	, -- 	日常审计费（财务/财损审计、税务审计、高新税审）
sum(`litigation_fee`) as 	`litigation_fee`	, -- 	诉讼费
sum(`r_and_d_external_consultancy_fee`) as 	`r_and_d_external_consultancy_fee`	, -- 	研发外部咨询服务费
sum(`special_audit_service_fee`) as 	`special_audit_service_fee`	, -- 	专项审计及服务费（含上市审计、尽调、上市顾问服务）
sum(`special_consultancy_fee`) as 	`special_consultancy_fee`	, -- 	专项咨询服务费（含各专题外部咨询及服务）
sum(`toll_bridge_parking_fee`) as 	`toll_bridge_parking_fee`	, -- 	过路过桥/停车费
sum(`business_trip_transportation_fee`) as 	`business_trip_transportation_fee`	, -- 	因公外出交通费
sum(`pest_control_fee`) as 	`pest_control_fee`	, -- 	虫害费
sum(`green_plant_fee`) as 	`green_plant_fee`	, -- 	绿植费
sum(`large_bucket_water_fee`) as 	`large_bucket_water_fee`	, -- 	内部大桶装水费
sum(`office_equipment_furniture`) as 	`office_equipment_furniture`	, -- 	办公设备及家具
sum(`admin_vehicle`) as 	`admin_vehicle`	, -- 	行政车辆
sum(`computer_related_products`) as 	`computer_related_products`	, -- 	计算机及相关产品
sum(`other_assets`) as 	`other_assets`	, -- 	其他资产
sum(`trademark_purchase_fee`) as 	`trademark_purchase_fee`	, -- 	外部商标购买
sum(`r_and_d_equipment_purchase_fee`) as 	`r_and_d_equipment_purchase_fee`	, -- 	研发设备购置费
sum(`it_equipment`) as 	`it_equipment`	, -- 	IT设备
sum(`office_equipment_furniture_commented`) as 	`office_equipment_furniture_commented`	, -- 	办公设备及家具
sum(`vehicle_commented`) as 	`vehicle_commented`	, -- 	车辆
sum(`other_equipment`) as 	`other_equipment`	, -- 	其他设备
sum(`r_and_d_equipment_commented`) as 	`r_and_d_equipment_commented`	, -- 	研发设备
sum(`office_supplies_fee`) as 	`office_supplies_fee`	, -- 	办公用品费
sum(`admin_low_consumables`) as 	`admin_low_consumables`	, -- 	行政低耗品
sum(`start_up_special_fees`) as 	`start_up_special_fees`	, -- 	开办费及特殊费用
sum(`other_office_fees`) as 	`other_office_fees`	, -- 	其他办公费
sum(`daily_necessities_fee`) as 	`daily_necessities_fee`	, -- 	日用品费用
sum(`barcode_application_fee`) as 	`barcode_application_fee`	, -- 	条码申请费用
sum(`document_copying_fee`) as 	`document_copying_fee`	, -- 	文件影印费
sum(`font_image_copyright_purchase_fee`) as 	`font_image_copyright_purchase_fee`	, -- 	字体/图库等版权采购费
sum(`meeting_conference_fee`) as 	`meeting_conference_fee`	, -- 	会议会务费（含内、外部）
sum(`admin_express_fee`) as 	`admin_express_fee`	, -- 	行政快递费
sum(`other_communication_fees`) as 	`other_communication_fees`	, -- 	其他通讯费
sum(`office_equipment_maintenance_fee`) as 	`office_equipment_maintenance_fee`	, -- 	办公设备维修费
sum(`media_framework_cooperation`) as 	`media_framework_cooperation`	, -- 	媒体框架合作
sum(`online_media_distribution`) as 	`online_media_distribution`	, -- 	网络媒体普发投放
sum(`pr_maintenance_business_entertainment`) as 	`pr_maintenance_business_entertainment`	, -- 	公关维护及业务招待费（不含专项认证费）
sum(`customer_relationship_maintenance`) as 	`customer_relationship_maintenance`	, -- 	客情维护
sum(`gift_fee`) as 	`gift_fee`	, -- 	礼品费
sum(`business_entertainment_fee`) as 	`business_entertainment_fee`	, -- 	业务招待费
sum(`toB_public_opinion_maintenance`) as 	`toB_public_opinion_maintenance`	, -- 	toB舆情维护
sum(`toC_public_opinion_maintenance`) as 	`toC_public_opinion_maintenance`	,  -- 	toC舆情维护
 sum(`contract_margin_protection_2C`) as	contract_margin_protection_2C , -- 	合同条款-毛保(2C)

sum(`raw_material`) as `raw_material`, -- 原料
sum(`packaging_material_1`) as `packaging_material_1`, -- 包材1
sum(`packaging_material_sampling_fee`) as `packaging_material_sampling_fee`, -- 包材打样费
sum(`plate_making_fee`) as `plate_making_fee`, -- 制版费
sum(`achievement_award_declaration_paper_publication_fee`) as `achievement_award_declaration_paper_publication_fee`, -- 成果/奖项申报/论文发表费
sum(`compensation_due_to_warehouse_distribution`) as `compensation_due_to_warehouse_distribution`, -- 仓配原因类赔付
sum(`compensation_due_to_order_review`) as `compensation_due_to_order_review`, -- 审单原因类赔付
sum(`compensation_due_to_operations`) as `compensation_due_to_operations`, -- 运营原因类赔付
sum(`compensation_due_to_other`) as `compensation_due_to_other`, -- 其他原因类赔付
sum(`compensation_due_to_customer_service`) as `compensation_due_to_customer_service`, -- 客服服务原因类赔付
sum(`customer_service_evaluation_fee`) as `customer_service_evaluation_fee`, -- 客服评价费用
sum(`scrap_cost`) as `scrap_cost`, -- 报废成本
sum(`meal_subsidy`) as `meal_subsidy`, -- 餐费补贴
sum(`railway_air_traffic`) as `railway_air_traffic`, -- 铁路航空交通
sum(`city_traffic`) as `city_traffic`, -- 市内交通
sum(`private_car_for_public_use_subsidy`) as `private_car_for_public_use_subsidy`, -- 私车公用补贴
sum(`accommodation_fee`) as `accommodation_fee`, -- 住宿费
sum(`highway_waterway_traffic`) as `highway_waterway_traffic`, -- 公路水路交通
sum(`electricity_fee`) as `electricity_fee`, -- 电费
sum(`house_rent`) as `house_rent`, -- 房租费
sum(`infrastructure_repair_fee`) as `infrastructure_repair_fee`, -- 基建维修费
sum(`water_fee`) as `water_fee`, -- 水费
sum(`property_management_fee`) as `property_management_fee`, -- 物业管理费
sum(`decoration_fee`) as `decoration_fee`, -- 装修费
sum(`financial_institution_service_charge`) as `financial_institution_service_charge`, -- 金融机构手续费（含银行）
sum(`online_bank_transaction_fee`) as `online_bank_transaction_fee`, -- 网银交易手续费
sum(`interest_income`) as `interest_income`, -- 利息收入
sum(`packaging_material_scrap_cost`) as `packaging_material_scrap_cost`, -- 包材报废成本
sum(`raw_material_scrap_cost`) as `raw_material_scrap_cost`, -- 原料报废成本
sum(`reverse_operation_fee`) as `reverse_operation_fee`, -- 逆向操作费
sum(`loading_unloading_operation_fee`) as `loading_unloading_operation_fee`, -- 装卸操作费
sum(`performance_penalty_income`) as `performance_penalty_income`, -- 绩效罚款收入
sum(`product_inventory_loss_compensation`) as `product_inventory_loss_compensation`, -- 商品盘点损失赔付
sum(`drop_shipping_service_fee`) as `drop_shipping_service_fee`, -- 一件代发服务费
sum(`carton_recycling_income`) as `carton_recycling_income`, -- 纸箱回收收入
sum(`packaging_material_2`) as `packaging_material_2`, -- 包材2
sum(`product_design_service_fee`) as `product_design_service_fee`, -- 产品设计服务费
sum(`raw_materials`) as `raw_materials`, -- 原材料
sum(`expert_consulting_fee`) as `expert_consulting_fee`, -- 专家咨询费
sum(`finished_goods_purchase`) as `finished_goods_purchase`, -- 成品采购
sum(`outsourced_joint_rnd_fee`) as `outsourced_joint_rnd_fee`, -- 委外联合研发费
sum(`offline_logistics_fee`) as `offline_logistics_fee`, -- 线下物流费用
sum(`r_d_consumables`) as `r_d_consumables`, -- 研发耗材
sum(`product_cost`) as `product_cost`, -- 商品成本
sum(`warehouse_rent`) as `warehouse_rent`, -- 仓租费
sum(`offline_tob_return_freight`) as `offline_tob_return_freight`, -- 线下TOB退货运费
sum(`consumables_fee`) as `consumables_fee`, -- 耗材费
sum(`outbound_operation_fee`) as `outbound_operation_fee`, -- 出库操作费
sum(`value_added_service_fee`) as `value_added_service_fee`, -- 增值服务费
sum(`warehouse_transfer_fee`) as `warehouse_transfer_fee`, -- 仓间调拨费用
sum(`express_fee_1`) as `express_fee_1`, -- 快递费1
sum(`product_inventory_loss`) as `product_inventory_loss`, -- 商品盘点损失
sum(`finished_sample_production_fee`) as `finished_sample_production_fee`, -- 成品打样费
sum(`competitor_purchase_fee`) as `competitor_purchase_fee`, -- 竞品采购费
sum(`standard_setting_fee`) as `standard_setting_fee`, -- 标准制订费
sum(`patent_fee`) as `patent_fee`, -- 专利费
sum(`guanghe_commission`) as `guanghe_commission`, -- 光合

CURRENT_TIMESTAMP() as update_time,
UNIX_TIMESTAMP() as unix_timestamp,
sum(`base_salary_test`) as `base_salary_test`-- '基本工资_预估'

from(
-- 吉客云数据
select
      	t2.`cal_date`,											-- 统计日期
        upper(t2.shop_code) as shop_code,                                                 -- 店铺id
        ifnull(t2.business_cate,'') as business_cate,                                           -- 业务分类
      	t2.`expense_center_code`,									-- 费用中心编码
      	t2.`expense_center`,										-- 费用中心名称
      	t2.`department_1`,										-- 一级部门（组织架构）
      	t2.`department_2`,										-- 二级渠道（组织架构）
      	t2.`department_3`,										-- 三级渠道
      	t2.`department_4`,										-- 四级渠道（店铺名称+业务分类）
      	sum(t2.`rspgmv`) `rspgmv`, 								-- rspgmv
      	sum(t2.`gmv`) `gmv`,										-- gmv
      	sum(t2.`rfd_amt`) as `refund_amount`, 					-- 退款金额
		sum(t2.`cost_gmv_amt`) as cost_gmv_amt, -- GMV成本
			  sum(t2.`cost_rfd_amt`) as cost_rfd_amt, -- 退款金额成本合计
				sum(t2.`cost_gmv_amt` - t2.`cost_rfd_amt`) as cost_gsv,						-- gsv
      	0 as shipping_cost,
      	sum(t2.`gmv` - t2.`rfd_amt`) as gsv,						-- gsv
      	sum(t2.`supply_price_gmv`) as `supply_price_gmv`, 									-- 	供货价
     	sum(t2.`rspgmv_new_user`) `rsp_gmv_taste`, 				-- rspgmv_尝鲜装拉新
     	sum(t2.`gmv_new_user`) `gmv_taste`, 						-- gmv_尝鲜装拉新
      	sum(t2.`rfd_amt_new_user`) as `refund_amount_taste`, 		-- 退款金额_尝鲜装拉新
      	sum(t2.`gmv_new_user` - t2.`rfd_amt_new_user`) as gsv_taste, -- gsv_尝鲜装拉新
sum(t2.`supply_price_gmv`-t2.`refund_amount_supply_price`) as`gsv_supply_price`, -- GSV-供货价
sum(t2.`refund_amount_supply_price`) as`refund_amount_supply_price`, -- 退款金额-供货价
sum(t2.`gmv_supply_price_taste`) as`gmv_supply_price_taste`, -- GMV-供货价尝鲜装拉新
sum(t2.`refund_amount_supply_price_taste`) as`refund_amount_supply_price_taste`, -- 退款金额-供货价尝鲜装拉新
sum(t2.`gmv_supply_price_taste` - t2.`refund_amount_supply_price_taste`) as`gsv_supply_price_taste`, -- GSV-供货价尝鲜装拉新
0 as`tax_with_union_funds_and_disability_insurance`, -- 税金（含工会经费划拨、残保金）
0 as`non_operating_income`, -- 营业外收入
0 as`other_business_income`, -- 其他业务收入
0 as`other_costs`, -- 其他成本
0 as`deposit`, -- 保证金
0 as`tax_arrears_penalty`, -- 税收滞纳金罚款

      	0 as 	`short_video_commission`	, -- 	达人短视频线下返佣
	  	0 as 	`live_stream_offline_commission`	, -- 	达人直播线下返佣
	  	0 as 	`short_video_darren_commission`	, -- 	短视频达人佣金
	  	0 as 	`duoduo_commission`	, -- 	多多客佣金
		0 as 	`haoyiku_commission`	, -- 	好衣库达人佣金
		0 as 	`jingtaoke_commission`	, -- 	京挑客佣金
		0 as 	`private_domain_service_fee`	, -- 	私域外包代运营费
		0 as 	`taobao_commission`	, -- 	淘宝客佣金
		0 as 	`weixiangke_commission`	, -- 	唯享客佣金
		0 as 	`commission`	, -- 	佣金
		0 as 	`live_stream_commission`	, -- 	直播达人佣金
		0 as 	`short_video_service_fee`	, -- 	达人短视频服务费
		0 as 	`live_stream_service_fee`	, -- 	达人直播服务费
		0 as 	`cid_ud_ad_spend`	, -- 	CID、UD信息流投放
		0 as 	`ka_barcode_fee`	, -- 	KA卖进条码费
		0 as 	`otd_promotion_cost`	, -- 	OTD推广费用
		0 as 	`scene_promotion_cost`	, -- 	场景推广
		0 as 	`magnet_gold_pc`	, -- 	磁力金牛PC
		0 as 	`magnet_gold_mobile`	, -- 	磁力金牛移动
		0 as 	`douyin_doujia`	, -- 	抖音抖加
		0 as 	`douyin_qianchuan`	, -- 	抖音千川
		0 as 	`douyin_suixin`	, -- 	抖音随心推
		0 as 	`shopping_touchpoint`	, -- 	购物触点
		0 as 	`hai_tou`	, -- 	海投
		0 as 	`jingxiaozhi_recharge`	, -- 	京小智充值
		0 as 	`juiguang_platform`	, -- 	聚光平台
		0 as 	`kuai_che`	, -- 	快车
		0 as 	`joint_promotion_cost`	, -- 	联合推广
		0 as 	`star_shop_promotion`	, -- 	明星店铺推广
		0 as 	`brand_zone`	, -- 	品牌专区
		0 as 	`pinxiao_bao`	, -- 	品销宝
		0 as 	`full_site_promotion`	, -- 	全站推广
		0 as 	`search_promotion`	, -- 	搜索推广
		0 as 	`tencent_ad_spend`	, -- 	腾讯广告费用
		0 as 	`wanxiang_platform`	, -- 	万相台
		0 as 	`wechat_beans`	, -- 	微信豆
		0 as 	`offline_venue_rental`	, -- 	线下场地租用
		0 as 	`offline_instore_ad`	, -- 	线下店内广告费
		0 as 	`offline_exhibition_fee`	, -- 	线下外部参展费
		0 as 	`xiaohongshu_promotion`	, -- 	小红书推广费
		0 as 	`gravity_cube`	, -- 	引力魔方
		0 as 	`easy_consumables_purchase`	, -- 	易耗道具采购费用
		0 as 	`operation_buyer_show_maintenance`	, -- 	运营买家秀维护
		0 as 	`smart_targeting`	, -- 	智能投放
		0 as 	`zhitongche`	, -- 	直通车
      	sum(t2.`gift_fee_ms_forward` - t2.`gift_fee_ms_backward`) `gift_fee_ms`,						-- 赠品费用_MS赠品
      	sum(t2.`gift_fee_bund_forward` - t2.`gift_fee_bund_backward`) `gift_fee_bund`, 					-- 赠品费用_尝鲜装搭赠
      	sum(t2.`gift_fee_non_food_inventory_forward` - t2.`gift_fee_non_food_inventory_backward`) `gift_fee_non_food_inventory`, 			-- 赠品费用_非食赠品-入库
      	0 as `non_food_gift_cost`, -- 非食赠品采购成本
      	sum(t2.`gift_fee_formal_gift_forward` - t2.`gift_fee_formal_gift_backward`) `gift_fee_formal_gift`, 	-- 赠品费用_正装赠品
      	0 as 	`ai_calling_cost`	, -- 	AI电话费用
		0 as 	`eka_consumption_card`	, -- 	EKA消费卡
		0 as 	`promo_resource_purchase`	, -- 	大促及爆品推广资源采买
		0 as 	`darren_activity_fee`	, -- 	达人活动费
		0 as 	`sms_cost`	, -- 	短信费用
		0 as 	`horizontal_screen_resource_position`	, -- 	横屏/资源位
		0 as 	`juhuasuan_subsidy_fee`	, -- 	聚划算、百亿补贴费用
		0 as 	`hot_wave_engine_service_fee`	, -- 	热浪引擎服务费
		0 as 	`new_customer_first_order_gift`	, -- 	新客首单礼金
		0 as 	`sales_promotion_incentive`	, -- 	促销员激励
		0 as 	`tp_service_fee`	, -- 	TP服务费
		0 as 	`tp_service_tax_diff`	, -- 	TP服务费税差
		0 as 	`refund_difference`	, -- 	退差价
		0 as 	`small_payment`	, -- 	小额打款
		0 as 	`gift_with_order_compensation`	, -- 	随箱礼及赠品补差
		0 as 	`offline_product_promotion_service_fee`	, -- 	线下产品推广服务费
		0 as 	`offline_consumer_promotion`	, -- 	线下消费者价格促销
		0 as 	`main_project_promotion`	, -- 	主推项目
		0 as 	`darren_sample_fee`	, -- 	达人样品费
		sum(t2.internal_product_usage) as 	`internal_product_usage`	, -- 	内部产品领用1
		0 as 	`contract_display_fee`	, -- 	合同条款-陈列费
		0 as 	`contract_rebate`	, -- 	合同条款-返利
		0 as 	`contract_fixed_fee`	, -- 	合同条款-固定费用
		0 as 	`contract_margin_protection`	, -- 	合同条款-毛保
		0 as 	`contract_other_fees`	, -- 	合同条款-其他费
		0 as 	`contract_new_store_entry_fee`	, -- 	合同条款-新店进场费
		0 as 	`huabei_fee`	, -- 	花呗手续费
		0 as 	`credit_card_fee`	, -- 	信用卡交易手续费
		0 as 	`shop_commission_rate`	, -- 	2C店铺扣点
		0 as 	`platform_software_service_fee`	, -- 	平台软件服务费
		0 as 	`freight_insurance`	, -- 	运费险
		0 as 	`warehouse_logistics_payout`	, -- 	仓储物流赔付扣款
		0 as 	`warehousing_loss_due_to_logistics`	, -- 	仓配原因类资损
		0 as 	`customer_service_travel_expense`	, -- 	客服差旅费用
		0 as 	`customer_service_salary`	, -- 	客服人力工资
		0 as 	`customer_service_outsourcing`	, -- 	客服人力外包
		0 as 	`customer_service_software_cost`	, -- 	客服软件费用
		0 as 	`agent_or_darren_payout`	, -- 	代理或达人责任类赔付
		0 as 	`breach_of_contract_payout`	, -- 	电商违约赔付费用
		0 as 	`business_loss_health_impact_payout`	, -- 	经营亏损、健康影响类赔付
		0 as 	`customer_service_quality_payout`	, -- 	售后赔付（质量）
		0 as 	`quality_payout`	, -- 	质量赔付
		0 as 	`quality_loss_due_to_quality`	, -- 	质量原因类资损
		0 as 	`copyright_application_fee`	, -- 	版权申请费
		0 as 	`copyright_purchase_fee`	, -- 	字体/图库等版权采购费
		0 as 	`price_control_rights_protection`	, -- 	控价维权
		0 as 	`service_entitlement_purchase_fee`	, -- 	会员等服务/权益采购费用
		0 as 	`outdoor_film_online_advertising`	, -- 	户外、影视综、线上广告
		0 as 	`brand_product_promo_production_fee`	, -- 	品牌/产品宣传片制作费
		0 as 	`business_cooperation_content_spread`	, -- 	商务合作、内容传播、营销物料等
		0 as 	`packaging_design_fee`	, -- 	包装设计费
		0 as 	`industrial_design_fee`	, -- 	工业设计费
		0 as 	`brand_design_fee`	, -- 	品牌设计费
		0 as 	`material_design_fee`	, -- 	物料设计费
		0 as 	`venue_rental_daily_expenses`	, -- 	场地租赁费、日常费用
		0 as 	`prop_purchase_fee`	, -- 	道具采购费
		0 as 	`model_fee`	, -- 	模特费
		0 as 	`video_shooting_fee`	, -- 	视频拍摄费
		0 as 	`photo_shooting_fee`	, -- 	图片拍摄费
		0 as 	`internal_product_usage_commented`	, -- 	内部产品领用2
		0 as 	`douyin_promotion`	, -- 	抖音推广
		0 as 	`channel_marketing`	, -- 	渠道营销
		0 as 	`brand_consulting_service_fee`	, -- 	品牌咨询服务费
		0 as 	`external_brand_advisory_fee`	, -- 	外部品牌定位/视觉/内容等顾问费
		0 as 	`base_salary`	, -- 	基本工资
        0 as 	`human_resources_outsourcing_fee`	, -- 	人力外包费用
        0 as 	`bonus`	, -- 	提成
        0 as 	`external_training_fee`	, -- 	外部培训费
        0 as 	`excellence_award_team_personal`	, -- 	优秀奖励（含优秀团队/个人）
        0 as 	`employee_compensation`	, -- 	员工赔偿金（含辞退、劳动事故/生育津贴/失业补偿费）
        0 as 	`corporate_culture_activity_fee`	, -- 	企业文化活动费
        0 as 	`team_building_fee`	, -- 	团建费
        0 as 	`housing_fund`	, -- 	公积金
        0 as 	`work_injury_insurance`	, -- 	工伤保险
        0 as 	`unemployment_insurance`	, -- 	失业保险
        0 as 	`old_age_insurance`	, -- 	养老保险
        0 as 	`medical_insurance`	, -- 	医疗保险
        0 as 	`overtime_meal_fee`	, -- 	加班餐费
        0 as 	`overtime_transportation_fee`	, -- 	加班交通费
        0 as 	`festival_welfare_fee`	, -- 	节日福利费
        0 as 	`health_checkup_fee`	, -- 	体检费
        0 as 	`accident_insurance`	, -- 	意外险
        0 as 	`employee_care_fee`	, -- 	员工慰问费
        0 as 	`headhunter_fee`	, -- 	猎头费
        0 as 	`recruitment_fee`	, -- 	招聘费用（含常规平台服务费、场地及资料费不含差旅）
        0 as 	`internal_product_usage_commented_again`	, -- 	内部产品领用3
        0 as 	`testing_fee`	, -- 	检测费
        0 as 	`r_and_d_external_testing_fee`	, -- 	研发委外检测费
        0 as 	`vehicle_insurance_registration_fee`	, -- 	车辆保险/年审费
        0 as 	`vehicle_maintenance_repair_fee`	, -- 	车辆保养/维修费
        0 as 	`admin_vehicle_fuel_fee`	, -- 	行政车辆油费
        0 as 	`standardization_certification_fee`	, -- 	标准化体系认证费（管理类信息化类、生产安全类）
        0 as 	`product_certification_fee`	, -- 	专业服务费-产品认证费用
        0 as 	`association_membership_fee`	, -- 	协会会费
        0 as 	`channel_system_service_fee`	, -- 	渠道系统服务使用费
        0 as 	`network_service_fee`	, -- 	网络服务费
        0 as 	`information_service_purchase`	, -- 	信息服务采购
        0 as 	`it_project_construction_fee`	, -- 	信息化项目建设费
        0 as 	`it_system_maintenance_fee`	, -- 	信息化系统运维费
        0 as 	`sample_purchase_fee`	, -- 	外购取样费
        0 as 	`third_party_factory_audit_fee`	, -- 	第三方验厂费
        0 as 	`legal_fee`	, -- 	律师费
        0 as 	`other_legal_services`	, -- 	其他法律服务
        0 as 	`other_consultancy_fee`	, -- 	其他咨询费
        0 as 	`hr_consultancy_fee`	, -- 	人力咨询费
        0 as 	`regular_audit_fee`	, -- 	日常审计费（财务/财损审计、税务审计、高新税审）
        0 as 	`litigation_fee`	, -- 	诉讼费
        0 as 	`r_and_d_external_consultancy_fee`	, -- 	研发外部咨询服务费
        0 as 	`special_audit_service_fee`	, -- 	专项审计及服务费（含上市审计、尽调、上市顾问服务）
        0 as 	`special_consultancy_fee`	, -- 	专项咨询服务费（含各专题外部咨询及服务）
        0 as 	`toll_bridge_parking_fee`	, -- 	过路过桥/停车费
        0 as 	`business_trip_transportation_fee`	, -- 	因公外出交通费
        0 as 	`pest_control_fee`	, -- 	虫害费
        0 as 	`green_plant_fee`	, -- 	绿植费
        0 as 	`large_bucket_water_fee`	, -- 	内部大桶装水费
        0 as 	`office_equipment_furniture`	, -- 	办公设备及家具
        0 as 	`admin_vehicle`	, -- 	行政车辆
        0 as 	`computer_related_products`	, -- 	计算机及相关产品
        0 as 	`other_assets`	, -- 	其他资产
        0 as 	`trademark_purchase_fee`	, -- 	外部商标购买
        0 as 	`r_and_d_equipment_purchase_fee`	, -- 	研发设备购置费
        0 as 	`it_equipment`	, -- 	IT设备
        0 as 	`office_equipment_furniture_commented`	, -- 	办公设备及家具
        0 as 	`vehicle_commented`	, -- 	车辆
        0 as 	`other_equipment`	, -- 	其他设备
        0 as 	`r_and_d_equipment_commented`	, -- 	研发设备
        0 as 	`office_supplies_fee`	, -- 	办公用品费
        0 as 	`admin_low_consumables`	, -- 	行政低耗品
        0 as 	`start_up_special_fees`	, -- 	开办费及特殊费用
        0 as 	`other_office_fees`	, -- 	其他办公费
        0 as 	`daily_necessities_fee`	, -- 	日用品费用
        0 as 	`barcode_application_fee`	, -- 	条码申请费用
        0 as 	`document_copying_fee`	, -- 	文件影印费
        0 as 	`font_image_copyright_purchase_fee`	, -- 	字体/图库等版权采购费
        0 as 	`meeting_conference_fee`	, -- 	会议会务费（含内、外部）
        0 as 	`admin_express_fee`	, -- 	行政快递费
        0 as 	`other_communication_fees`	, -- 	其他通讯费
        0 as 	`office_equipment_maintenance_fee`	, -- 	办公设备维修费
        0 as 	`media_framework_cooperation`	, -- 	媒体框架合作
        0 as 	`online_media_distribution`	, -- 	网络媒体普发投放
        0 as 	`pr_maintenance_business_entertainment`	, -- 	公关维护及业务招待费（不含专项认证费）
        0 as 	`customer_relationship_maintenance`	, -- 	客情维护
        0 as 	`gift_fee`	, -- 	礼品费
        0 as 	`business_entertainment_fee`	, -- 	业务招待费
        0 as 	`toB_public_opinion_maintenance`	, -- 	toB舆情维护
        0 as 	`toC_public_opinion_maintenance`,	  -- 	toC舆情维护
    0 as 	`contract_margin_protection_2C`	,  -- 	合同条款-毛保(2C)
0 as`raw_material`, -- 原料
0 as`packaging_material_1`, -- 包材1
0 as`packaging_material_sampling_fee`, -- 包材打样费
0 as`plate_making_fee`, -- 制版费
0 as`achievement_award_declaration_paper_publication_fee`, -- 成果/奖项申报/论文发表费
0 as`compensation_due_to_warehouse_distribution`, -- 仓配原因类赔付
0 as`compensation_due_to_order_review`, -- 审单原因类赔付
0 as`compensation_due_to_operations`, -- 运营原因类赔付
0 as`compensation_due_to_other`, -- 其他原因类赔付
0 as`compensation_due_to_customer_service`, -- 客服服务原因类赔付
0 as`customer_service_evaluation_fee`, -- 客服评价费用
0 as`scrap_cost`, -- 报废成本
0 as`meal_subsidy`, -- 餐费补贴
0 as`railway_air_traffic`, -- 铁路航空交通
0 as`city_traffic`, -- 市内交通
0 as`private_car_for_public_use_subsidy`, -- 私车公用补贴
0 as`accommodation_fee`, -- 住宿费
0 as`highway_waterway_traffic`, -- 公路水路交通
0 as`electricity_fee`, -- 电费
0 as`house_rent`, -- 房租费
0 as`infrastructure_repair_fee`, -- 基建维修费
0 as`water_fee`, -- 水费
0 as`property_management_fee`, -- 物业管理费
0 as`decoration_fee`, -- 装修费
0 as`financial_institution_service_charge`, -- 金融机构手续费（含银行）
0 as`online_bank_transaction_fee`, -- 网银交易手续费
0 as`interest_income`, -- 利息收入
0 as`packaging_material_scrap_cost`, -- 包材报废成本
0 as`raw_material_scrap_cost`, -- 原料报废成本
0 as`reverse_operation_fee`, -- 逆向操作费
0 as`loading_unloading_operation_fee`, -- 装卸操作费
0 as`performance_penalty_income`, -- 绩效罚款收入
0 as`product_inventory_loss_compensation`, -- 商品盘点损失赔付
0 as`drop_shipping_service_fee`, -- 一件代发服务费
0 as`carton_recycling_income`, -- 纸箱回收收入
0 as`packaging_material_2`, -- 包材2
0 as`product_design_service_fee`, -- 产品设计服务费
0 as`raw_materials`, -- 原材料
0 as`expert_consulting_fee`, -- 专家咨询费
0 as`finished_goods_purchase`, -- 成品采购
0 as`outsourced_joint_rnd_fee`, -- 委外联合研发费
0 as`offline_logistics_fee`, -- 线下物流费用
0 as`r_d_consumables`, -- 研发耗材
0 as`product_cost`, -- 商品成本
0 as`warehouse_rent`, -- 仓租费
0 as`offline_tob_return_freight`, -- 线下TOB退货运费
0 as`consumables_fee`, -- 耗材费
0 as`outbound_operation_fee`, -- 出库操作费
0 as`value_added_service_fee`, -- 增值服务费
0 as`warehouse_transfer_fee`, -- 仓间调拨费用
0 as`express_fee_1`, -- 快递费1
0 as`product_inventory_loss`, -- 商品盘点损失
0 as`finished_sample_production_fee`, -- 成品打样费
0 as`competitor_purchase_fee`, -- 竞品采购费
0 as`standard_setting_fee`, -- 标准制订费
0 as`patent_fee`, -- 专利费
0 as `guanghe_commission` ,-- 光合
0 as `base_salary_test` -- '基本工资_预估'
from(

-- 寄样数据

  select
	  t1.`cal_date`,	-- 支付日期
      t1.shop_code,                 -- 店铺id
      t1.business_cate,						-- 业务分类
      t1.`department_1`,					-- 一级部门（组织架构）
      t1.`department_2`,					-- 二级渠道（组织架构）
      t1.`department_3`,					-- 三级渠道
      t1.`department_4`,					-- 四级渠道（店铺名称+业务分类）
      t1.`expense_center`,					-- 费用中心名称
      t1.`expense_center_code`,				-- 费用中心编码
      0 as  `rspgmv`, -- rspgmv
      0 as  `gmv`, -- gmv
      0 as `rfd_amt`, -- 退款金额
	0 as `cost_gmv_amt`,-- GMV成本合计',
			0 as `cost_rfd_amt`, -- 退款金额成本合计
      0 as  `rspgmv_new_user`, -- rspgmv_尝鲜装拉新
      0 as  `gmv_new_user`, -- gmv_尝鲜装拉新
      0 as `rfd_amt_new_user`, -- 退款金额_尝鲜装拉新
      0 as `gift_fee_ms_forward`, -- 赠品费用_MS赠品_正向
      0 as `gift_fee_bund_forward`, -- 赠品费用_尝鲜装搭赠_正向
      0 as `gift_fee_non_food_inventory_forward`, -- 赠品费用_非食赠品-入库_正向
      0 as `gift_fee_formal_gift_forward`, -- 赠品费用_正装赠品_正向
      0 as `gift_fee_ms_backward`, -- 赠品费用_MS赠品_逆向
      0 as `gift_fee_bund_backward`, -- 赠品费用_尝鲜装搭赠_逆向
      0 as `gift_fee_non_food_inventory_backward`, -- 赠品费用_非食赠品-入库_逆向
      0 as `gift_fee_formal_gift_backward`, -- 赠品费用_正装赠品_逆向
      sum(`internal_product_usage_forward` - `internal_product_usage_backward`) as internal_product_usage, -- 内部产品领用1
	  0 as `supply_price_gmv`	, -- 	供货价
	  0 as`refund_amount_supply_price`, -- 退款金额-供货价
	  0 as`gmv_supply_price_taste`, -- GMV-供货价尝鲜装拉新
	  0 as`refund_amount_supply_price_taste` -- 退款金额-供货价尝鲜装拉新

from(
-- 寄样店铺 内部产品领用 正向
SELECT
      LEFT(case when (t1.`department_1` = '线下营销中心' or (department_3 like '%线上分销%' and t1.department_3 not in ('线上分销-代运营','线上分销-私域'))) then t1.send_time else t1.pay_time end,10) as `cal_date`,	-- 支付日期
			      t1.shop_code,                 -- 店铺id
      t1.business_cate,						-- 业务分类
      t1.`department_1`,					-- 一级部门（组织架构）
      t1.`department_2`,					-- 二级渠道（组织架构）
      t1.`department_3`,					-- 三级渠道
      t1.`department_4`,					-- 四级渠道（店铺名称+业务分类）
      t1.`expense_center`,					-- 费用中心名称
      t1.`expense_center_code`,				-- 费用中心编码
      sum(t1.sell_count * t1.product_cost) as `internal_product_usage_forward`,	-- 	内部产品领用正向
      0 as `internal_product_usage_backward`	-- 	内部产品领用反向
    from
      `dws`.`trd_erp_pay_order_sku` t1 -- 交易域-吉客云&聚水潭订单支付表
    where
       t1.trade_type_explain not in ('售后退货','仅退款')
       and t1.money_type = 'gmv'
       and t1.send_shop_type = '寄样'
      group by
      LEFT(case when (t1.`department_1` = '线下营销中心' or (department_3 like '%线上分销%' and t1.department_3 not in ('线上分销-代运营','线上分销-私域'))) then t1.send_time else t1.pay_time end,10),	-- 支付日期
      t1.shop_code,
      t1.business_cate,						-- 业务分类
      t1.`department_1`,					-- 一级部门（组织架构）
      t1.`department_2`,					-- 二级渠道（组织架构）
      t1.`department_3`,					-- 三级渠道
      t1.`department_4`,					-- 四级渠道（店铺名称+业务分类）
      t1.`expense_center`,					-- 费用中心名称
      t1.`expense_center_code`				-- 费用中心编码



union all
-- 寄样店铺 内部产品领用 逆向

SELECT
      LEFT(ifnull(t1.cancel_time,t1.pay_time),10) as `cal_date`,	-- 支付日期
      t1.shop_code,
      t1.business_cate,						-- 业务分类
      t1.`department_1`,					-- 一级部门（组织架构）
      t1.`department_2`,					-- 二级渠道（组织架构）
      t1.`department_3`,					-- 三级渠道
      t1.`department_4`,					-- 四级渠道（店铺名称+业务分类）
      t1.`expense_center`,					-- 费用中心名称
      t1.`expense_center_code`,				-- 费用中心编码
      0 as `internal_product_usage_forward`,	-- 	内部产品领用正向
      sum(t1.sell_count * t1.product_cost) `internal_product_usage_backward` -- 内部产品领用反向
      from
      `dws`.`trd_erp_pay_order_sku` t1 -- 交易域-吉客云&聚水潭订单支付表
    where
       (t1.trade_type_explain in ('售后退货', '仅退款') or t1.trade_status_explain in ('已取消'))
       and t1.money_type = 'rfd'
       and t1.send_shop_type = '寄样'
       group by
      LEFT(ifnull(t1.cancel_time,t1.pay_time),10),	-- 退款日期
      t1.shop_code,
      t1.business_cate,						-- 业务分类
      t1.`department_1`,					-- 一级部门（组织架构）
      t1.`department_2`,					-- 二级渠道（组织架构）
      t1.`department_3`,					-- 三级渠道
      t1.`department_4`,					-- 四级渠道（店铺名称+业务分类）
      t1.`expense_center`,					-- 费用中心名称
      t1.`expense_center_code`				-- 费用中心编码
) t1
group by
	  t1.`cal_date`,	-- 支付日期
      t1.shop_code,
      t1.business_cate,						-- 业务分类
      t1.`department_1`,					-- 一级部门（组织架构）
      t1.`department_2`,					-- 二级渠道（组织架构）
      t1.`department_3`,					-- 三级渠道
      t1.`department_4`,					-- 四级渠道（店铺名称+业务分类）
      t1.`expense_center`,					-- 费用中心名称
      t1.`expense_center_code`				-- 费用中心编码


union all
-- 非 孩子王乐友POS业务分类的GMV相关数据
SELECT
      LEFT(case when (t1.`department_1` = '线下营销中心' or (department_3 like '%线上分销%' and t1.department_3 not in ('线上分销-代运营','线上分销-私域'))) then t1.send_time else t1.pay_time end,10) as `cal_date`,	-- 支付日期
      t1.shop_code,
      t1.business_cate,						-- 业务分类
      t1.`department_1`,					-- 一级部门（组织架构）
      t1.`department_2`,					-- 二级渠道（组织架构）
      t1.`department_3`,					-- 三级渠道
      t1.`department_4`,					-- 四级渠道（店铺名称+业务分类）
      t1.`expense_center`,					-- 费用中心名称
      t1.`expense_center_code`,				-- 费用中心编码
      -- sum(case when t1.sell_count * t1.product_price - t1.discount_total = 0 then 0 else t1.product_price_rsp * t1.sell_count end) `rspgmv`, -- rspgmv
      sum(case when (t1.gift_flag = '尝鲜装拉新' or t1.gift_flag is null) then t1.product_price_rsp * t1.sell_count else 0 end) `rspgmv`, -- rspgmv
       case when (t1.department_3='线上分销-批采' or t1.department_1 = '线下营销中心') then sum(t1.sell_count * t1.product_price - t1.discount_total) else sum(t1.share_favourable_after_fee) end `gmv`, -- gmv
      0 as `rfd_amt`, -- 退款金额
	sum(case when (t1.gift_flag = '尝鲜装拉新' or t1.gift_flag is null or t1.gift_flag='') then t1.`sell_count` * t1.`product_cost` else 0 end) as `cost_gmv_amt`,-- GMV成本合计',
			0 as `cost_rfd_amt`, -- 退款金额成本合计

      sum(case when t1.gift_flag = '尝鲜装拉新' then t1.product_price_rsp * t1.sell_count else 0 end) `rspgmv_new_user`, -- rspgmv_尝鲜装拉新
      sum(case when t1.gift_flag = '尝鲜装拉新' then t1.share_favourable_after_fee else 0 end) `gmv_new_user`, -- gmv_尝鲜装拉新
      0 as `rfd_amt_new_user`, -- 退款金额_尝鲜装拉新
      sum(case when t1.gift_flag = 'MS赠品' then t1.product_cost * t1.sell_count else 0 end) `gift_fee_ms_forward`, -- 赠品费用_MS赠品_正向
      sum(case when t1.gift_flag = '尝鲜装搭赠' then t1.product_cost * t1.sell_count else 0 end) `gift_fee_bund_forward`, -- 赠品费用_尝鲜装搭赠_正向
      sum(case when t1.gift_flag = '非食赠品-入库' then t1.product_cost * t1.sell_count else 0 end) `gift_fee_non_food_inventory_forward`, -- 赠品费用_非食赠品-入库_正向
      sum(case when t1.gift_flag = '正装赠品' then t1.product_cost * t1.sell_count else 0 end) `gift_fee_formal_gift_forward`, -- 赠品费用_正装赠品_正向
      0 as `gift_fee_ms_backward`, -- 赠品费用_MS赠品_逆向
      0 as `gift_fee_bund_backward`, -- 赠品费用_尝鲜装搭赠_逆向
      0 as `gift_fee_non_food_inventory_backward`, -- 赠品费用_非食赠品-入库_逆向
      0 as `gift_fee_formal_gift_backward`, -- 赠品费用_正装赠品_逆向
      0 as internal_product_usage, -- 内部产品领用1
      sum(case when t1.department_3 like '%线上分销%' and t1.department_3 in ('线上分销-代运营','线上分销-私域') then t1.product_price_rsp * t1.sell_count*0.5 else 0 end) as `supply_price_gmv`, -- '供货价GMV',
  	  0 as `refund_amount_supply_price`, -- '供货价退款金额',
  	  sum(case when t1.gift_flag = '尝鲜装拉新' and t1.department_3 like '%线上分销%' and t1.department_3 in ('线上分销-代运营','线上分销-私域') then t1.product_price_rsp * t1.sell_count*0.5 else 0 end) as `gmv_supply_price_taste`, -- '尝鲜装供货价gmv',
  	  0 as `refund_amount_supply_price_taste` -- '尝鲜装供货价退款金额',
    from
      `dws`.`trd_erp_pay_order_sku` t1 -- 交易域-吉客云&聚水潭订单支付表
    where
       t1.trade_type_explain not in ('售后退货','仅退款')
       and (t1.business_cate not in('孩子王','乐友') or t1.business_cate is null)
       and t1.money_type = 'gmv'
       and t1.send_shop_type = '非寄样'
       group by
      LEFT(case when (t1.`department_1` = '线下营销中心' or (department_3 like '%线上分销%' and t1.department_3 not in ('线上分销-代运营','线上分销-私域'))) then t1.send_time else t1.pay_time end,10),	-- 支付日期
      t1.shop_code,
      t1.business_cate,						-- 业务分类
      t1.`department_1`,					-- 一级部门（组织架构）
      t1.`department_2`,					-- 二级渠道（组织架构）
      t1.`department_3`,					-- 三级渠道
      t1.`department_4`,					-- 四级渠道（店铺名称+业务分类）
      t1.`expense_center`,					-- 费用中心名称
      t1.`expense_center_code`				-- 费用中心编码

      union all
-- 京东自营与线上分销互换业绩，线上分销正向增加的部分，京东自营的逆向扣减在任务fin_jd_GMV_promotion_fee
SELECT
      t1.biz_day   as `cal_date`,	-- 支付日期
      t2.shop_id,
      t2.business_cate,						-- 业务分类
      t2.`department_1`,					-- 一级部门（组织架构）
      t2.`department_2`,					-- 二级渠道（组织架构）
      t2.`department_3`,					-- 三级渠道
      t2.`department_4`,					-- 四级渠道（店铺名称+业务分类）
      t2.`expense_center`,					-- 费用中心名称
      t2.`expense_center_code`,				-- 费用中心编码
      sum(rspgmv)	as `rspgmv`, -- rspgmv
      sum(revenue)  as `gmv`, -- gmv
      0 as `rfd_amt`, -- 退款金额
	  sum(goods_cost)  as `cost_gmv_amt`,-- GMV成本合计',
	  0 as `cost_rfd_amt`, -- 退款金额成本合计
      0 as `rspgmv_new_user`, -- rspgmv_尝鲜装拉新
      0 as `gmv_new_user`, -- gmv_尝鲜装拉新
      0 as `rfd_amt_new_user`, -- 退款金额_尝鲜装拉新
      0 as `gift_fee_ms_forward`, -- 赠品费用_MS赠品_正向
      0 as `gift_fee_bund_forward`, -- 赠品费用_尝鲜装搭赠_正向
      0 as `gift_fee_non_food_inventory_forward`, -- 赠品费用_非食赠品-入库_正向
      0 as `gift_fee_formal_gift_forward`, -- 赠品费用_正装赠品_正向
      0 as `gift_fee_ms_backward`, -- 赠品费用_MS赠品_逆向
      0 as `gift_fee_bund_backward`, -- 赠品费用_尝鲜装搭赠_逆向
      0 as `gift_fee_non_food_inventory_backward`, -- 赠品费用_非食赠品-入库_逆向
      0 as `gift_fee_formal_gift_backward`, -- 赠品费用_正装赠品_逆向
      0 as internal_product_usage, -- 内部产品领用1
      0 as `supply_price_gmv`, -- '供货价GMV',
  	  0 as `refund_amount_supply_price`, -- '供货价退款金额',
  	  0 as `gmv_supply_price_taste`, -- '尝鲜装供货价gmv',
  	  0 as `refund_amount_supply_price_taste` -- '尝鲜装供货价退款金额',
    	from
      ads.sale_jd_xsfx_change t1 -- 交易域-吉客云&聚水潭订单支付表
      left join (select distinct * from ods.fill_expense_center_mapping where dt = '${yd}') t2
	  on t2.shop_id='XSFXZXXTDJ' and t1.biz_day between date(t2.start_date) and date(t2.end_date)
      group by
      t1.biz_day,	-- 支付日期
      t2.shop_id,
      t2.business_cate,						-- 业务分类
      t2.`department_1`,					-- 一级部门（组织架构）
      t2.`department_2`,					-- 二级渠道（组织架构）
      t2.`department_3`,					-- 三级渠道
      t2.`department_4`,					-- 四级渠道（店铺名称+业务分类）
      t2.`expense_center`,					-- 费用中心名称
      t2.`expense_center_code`				-- 费用中心编码

 union all
-- 非 孩子王、乐友POS业务分类的退款相关数据
SELECT
      LEFT(ifnull(t1.cancel_time,t1.pay_time),10) as `cal_date`,	-- 支付日期
      t1.shop_code,
      t1.business_cate,						-- 业务分类
      t1.`department_1`,					-- 一级部门（组织架构）
      t1.`department_2`,					-- 二级渠道（组织架构）
      t1.`department_3`,					-- 三级渠道
      t1.`department_4`,					-- 四级渠道（店铺名称+业务分类）
      t1.`expense_center`,					-- 费用中心名称
      t1.`expense_center_code`,				-- 费用中心编码
      0 as  `rspgmv`, -- rspgmv
      0 as `gmv`, -- gmv
      sum(case when t1.trade_type_explain in ('售后退货', '仅退款') and (t1.department_3='线上分销-批采' or t1.department_1 = '线下营销中心') then - (t1.sell_count * t1.product_price - t1.discount_total)
  when t1.trade_type_explain in ('售后退货', '仅退款') and (t1.department_3 <> '线上分销-批采' and t1.department_1 <> '线下营销中心') then -t1.share_favourable_after_fee
  when t1.trade_status_explain in ('已取消') and (t1.department_3='线上分销-批采' or t1.department_1 = '线下营销中心') then (t1.sell_count * t1.product_price - t1.discount_total)
  when t1.trade_status_explain in ('已取消') and (t1.department_3 <> '线上分销-批采' and t1.department_1 <> '线下营销中心') then t1.share_favourable_after_fee
  end) `rfd_amt`, -- 退款金额
0  as `cost_gmv_amt`,-- 2025.4.7 GMV成本合计',
			sum(case
			when( (t1.gift_flag = '尝鲜装拉新' or t1.gift_flag is null or t1.gift_flag='') and t1.trade_type_explain in ('售后退货', '仅退款')) then -t1.product_cost * t1.sell_count
			when ((t1.gift_flag = '尝鲜装拉新' or t1.gift_flag is null or t1.gift_flag='') and t1.trade_status_explain in ('已取消')) then t1.product_cost * t1.sell_count else 0 end) as `cost_rfd_amt`, -- 退款金额成本合计
      0 as `rspgmv_new_user`, -- rspgmv_尝鲜装拉新
      0 as `gmv_new_user`, -- gmv_尝鲜装拉新
      sum(case when t1.gift_flag = '尝鲜装拉新' then (case when (t1.department_3='线上分销-批采' or t1.department_1 = '线下营销中心') then - t1.divide_sell_total
  when t1.trade_type_explain in ('售后退货', '仅退款') then -t1.share_favourable_after_fee
      when t1.trade_status_explain in ('已取消') and t1.department_3 not in ('线上分销-批采','线上分销-一件代发') then t1.share_favourable_after_fee end) else 0 end) `rfd_amt_new_user`, -- 退款金额_尝鲜装拉新
      0 as `gift_fee_ms_forward`, -- 赠品费用_MS赠品_正向
      0 as `gift_fee_bund_forward`, -- 赠品费用_尝鲜装搭赠_正向
      0 as `gift_fee_non_food_inventory_forward`, -- 赠品费用_非食赠品-入库_正向
      0 as `gift_fee_formal_gift_forward`, -- 赠品费用_正装赠品_正向
      sum(case when (t1.gift_flag = 'MS赠品' and t1.trade_type_explain in ('售后退货', '仅退款')) then -t1.product_cost * t1.sell_count when (t1.gift_flag = 'MS赠品' and t1.trade_status_explain in ('已取消')) then t1.product_cost * t1.sell_count else 0 end) `gift_fee_ms_backward`, -- 赠品费用_MS赠品_逆向
      sum(case when (t1.gift_flag = '尝鲜装搭赠' and t1.trade_type_explain in ('售后退货', '仅退款')) then -t1.product_cost * t1.sell_count when (t1.gift_flag = '尝鲜装搭赠' and t1.trade_status_explain in ('已取消')) then t1.product_cost * t1.sell_count else 0 end) `gift_fee_bund_backward`, -- 赠品费用_尝鲜装搭赠_逆向
      sum(case when (t1.gift_flag = '非食赠品-入库' and t1.trade_type_explain in ('售后退货', '仅退款')) then -t1.product_cost * t1.sell_count when (t1.gift_flag = '非食赠品-入库' and t1.trade_status_explain in ('已取消'))  then t1.product_cost * t1.sell_count else 0 end) `gift_fee_non_food_inventory_backward`, -- 赠品费用_非食赠品-入库_逆向
      sum(case when (t1.gift_flag = '正装赠品' and t1.trade_type_explain in ('售后退货', '仅退款')) then -t1.product_cost * t1.sell_count when (t1.gift_flag = '正装赠品' and t1.trade_status_explain in ('已取消')) then t1.product_cost * t1.sell_count else 0 end) `gift_fee_formal_gift_backward`, -- 赠品费用_正装赠品_逆向
      0 as internal_product_usage, -- 内部产品领用1
      0 as `supply_price_gmv`, -- '供货价GMV',
  	  sum(case when t1.trade_type_explain in ('售后退货', '仅退款') and t1.department_3 like '%线上分销%' and t1.department_3 in ('线上分销-代运营','线上分销-私域') then -t1.product_price_rsp * t1.sell_count*0.5
      when t1.trade_status_explain in ('已取消') and t1.department_3 like '%线上分销%' and t1.department_3 in ('线上分销-代运营','线上分销-私域') then t1.product_price_rsp * t1.sell_count*0.5
  	  else 0 end) as `refund_amount_supply_price`, -- '供货价退款金额',
  	  0 as `gmv_supply_price_taste`, -- '尝鲜装供货价gmv',
  	  sum(case when t1.gift_flag = '尝鲜装拉新' and t1.trade_type_explain in ('售后退货', '仅退款') and t1.department_3 like '%线上分销%' and t1.department_3 in ('线上分销-代运营','线上分销-私域') then -t1.product_price_rsp * t1.sell_count*0.5
      when t1.gift_flag = '尝鲜装拉新' and t1.trade_status_explain in ('已取消') and t1.department_3 like '%线上分销%' and t1.department_3 in ('线上分销-代运营','线上分销-私域') then t1.product_price_rsp * t1.sell_count*0.5
  	  else 0 end) as `refund_amount_supply_price_taste` -- '尝鲜装供货价退款金额',
      from
      `dws`.`trd_erp_pay_order_sku` t1 -- 交易域-吉客云&聚水潭订单支付表
    where
       (t1.trade_type_explain in ('售后退货', '仅退款') or t1.trade_status_explain in ('已取消'))
       and (t1.business_cate not in('孩子王','乐友') or t1.business_cate is null)
       and t1.money_type = 'rfd'
       and t1.send_shop_type = '非寄样'
    group by
      LEFT(ifnull(t1.cancel_time,t1.pay_time),10),	-- 退款日期
      t1.shop_code,
      t1.business_cate,						-- 业务分类
      t1.`department_1`,					-- 一级部门（组织架构）
      t1.`department_2`,					-- 二级渠道（组织架构）
      t1.`department_3`,					-- 三级渠道
      t1.`department_4`,					-- 四级渠道（店铺名称+业务分类）
      t1.`expense_center`,					-- 费用中心名称
      t1.`expense_center_code`				-- 费用中心编码

UNION ALL
-- 孩子王乐友POS从吉客云获取的正向赠品费用的数据
SELECT
      LEFT(case when (t1.`department_1` = '线下营销中心' or (department_3 like '%线上分销%' and t1.department_3 not in ('线上分销-代运营','线上分销-私域'))) then t1.send_time else t1.pay_time end,10) as `cal_date`,	-- 支付日期
      t1.shop_code,
      t1.business_cate,						-- 业务分类
      t1.`department_1`,					-- 一级部门（组织架构）
      t1.`department_2`,					-- 二级渠道（组织架构）
      t1.`department_3`,					-- 三级渠道
      t1.`department_4`,					-- 四级渠道（店铺名称+业务分类）
      t1.`expense_center`,					-- 费用中心名称
      t1.`expense_center_code`,				-- 费用中心编码
      0  as `rspgmv`, -- rspgmv
      0 as  `gmv`, -- gmv
      0 as `rfd_amt`, -- 退款金额
	  0 as `cost_gmv_amt`, -- 2025.4.7 GMV成本合计'
      0 as `cost_rfd_amt`, -- 退款金额成本合计
      0 as  `rspgmv_new_user`, -- rspgmv_尝鲜装拉新
      0 as  `gmv_new_user`, -- gmv_尝鲜装拉新
      0 as `rfd_amt_new_user`, -- 退款金额_尝鲜装拉新
      sum(case when t1.gift_flag = 'MS赠品' then t1.product_cost * t1.sell_count else 0 end) `gift_fee_ms`, -- 赠品费用_MS赠品
      sum(case when t1.gift_flag = '尝鲜装搭赠' then t1.product_cost * t1.sell_count else 0 end) `gift_fee_bund`, -- 赠品费用_尝鲜装搭赠
      sum(case when t1.gift_flag = '非食赠品-入库' then t1.product_cost * t1.sell_count else 0 end) `gift_fee_non_food_inventory`, -- 赠品费用_非食赠品-入库
      sum(case when t1.gift_flag = '正装赠品' then t1.product_cost * t1.sell_count else 0 end) `gift_fee_formal_gift`, -- 赠品费用_正装赠品
      0 as `gift_fee_ms_backward`, -- 赠品费用_MS赠品_逆向
      0 as `gift_fee_bund_backward`, -- 赠品费用_尝鲜装搭赠_逆向
      0 as `gift_fee_non_food_inventory_backward`, -- 赠品费用_非食赠品-入库_逆向
      0 as `gift_fee_formal_gift_backward`, -- 赠品费用_正装赠品_逆向
      0 as internal_product_usage, -- 内部产品领用1
      0 as `supply_price_gmv`	, -- 	供货价
	  0 as`refund_amount_supply_price`, -- 退款金额-供货价
	  0 as`gmv_supply_price_taste`, -- GMV-供货价尝鲜装拉新
	  0 as`refund_amount_supply_price_taste` -- 退款金额-供货价尝鲜装拉新
    from
      `dws`.`trd_erp_pay_order_sku` t1 -- 交易域-吉客云&聚水潭订单支付表
    where
       t1.trade_type_explain not in ('售后退货','仅退款')
       and (t1.business_cate in('孩子王','乐友'))
       and t1.money_type = 'gmv'
       and t1.send_shop_type = '非寄样'
       group by
      LEFT(case when (t1.`department_1` = '线下营销中心' or (department_3 like '%线上分销%' and t1.department_3 not in ('线上分销-代运营','线上分销-私域'))) then t1.send_time else t1.pay_time end,10),	-- 支付日期
      t1.shop_code,
      t1.business_cate,						-- 业务分类
      t1.`department_1`,					-- 一级部门（组织架构）
      t1.`department_2`,					-- 二级渠道（组织架构）
      t1.`department_3`,					-- 三级渠道
      t1.`department_4`,					-- 四级渠道（店铺名称+业务分类）
      t1.`expense_center`,					-- 费用中心名称
      t1.`expense_center_code`				-- 费用中心编码

union all


-- 孩子王乐友POS从吉客云获取的逆向赠品费用的数据
SELECT
      LEFT(ifnull(t1.cancel_time,t1.pay_time),10) as `cal_date`,	-- 支付日期
      t1.shop_code,
      t1.business_cate,						-- 业务分类
      t1.`department_1`,					-- 一级部门（组织架构）
      t1.`department_2`,					-- 二级渠道（组织架构）
      t1.`department_3`,					-- 三级渠道
      t1.`department_4`,					-- 四级渠道（店铺名称+业务分类）
      t1.`expense_center`,					-- 费用中心名称
      t1.`expense_center_code`,				-- 费用中心编码
      0  as `rspgmv`, -- rspgmv
      0 as  `gmv`, -- gmv
      0 as `rfd_amt`, -- 退款金额
	0 as `cost_gmv_amt`,-- 2025.4.7 GMV成本合计',
			0 as `cost_rfd_amt`, -- 退款金额成本合计
      0 as  `rspgmv_new_user`, -- rspgmv_尝鲜装拉新
      0 as  `gmv_new_user`, -- gmv_尝鲜装拉新
      0 as `rfd_amt_new_user`, -- 退款金额_尝鲜装拉新
      0 as `gift_fee_ms_forward`, -- 赠品费用_MS赠品_正向
      0 as `gift_fee_bund_forward`, -- 赠品费用_尝鲜装搭赠_正向
      0 as `gift_fee_non_food_inventory_forward`, -- 赠品费用_非食赠品-入库_正向
      0 as `gift_fee_formal_gift_forward`, -- 赠品费用_正装赠品_正向
      sum(case when (t1.gift_flag = 'MS赠品' and t1.trade_type_explain in ('售后退货', '仅退款')) then -t1.product_cost * t1.sell_count when (t1.gift_flag = 'MS赠品' and t1.trade_status_explain in ('已取消')) then t1.product_cost * t1.sell_count else 0 end) `gift_fee_ms_backward`, -- 赠品费用_MS赠品_逆向
      sum(case when (t1.gift_flag = '尝鲜装搭赠' and t1.trade_type_explain in ('售后退货', '仅退款')) then -t1.product_cost * t1.sell_count when (t1.gift_flag = '尝鲜装搭赠' and t1.trade_status_explain in ('已取消')) then t1.product_cost * t1.sell_count else 0 end) `gift_fee_bund_backward`, -- 赠品费用_尝鲜装搭赠_逆向
      sum(case when (t1.gift_flag = '非食赠品-入库' and t1.trade_type_explain in ('售后退货', '仅退款')) then -t1.product_cost * t1.sell_count when (t1.gift_flag = '非食赠品-入库' and t1.trade_status_explain in ('已取消'))  then t1.product_cost * t1.sell_count else 0 end) `gift_fee_non_food_inventory_backward`, -- 赠品费用_非食赠品-入库_逆向
      sum(case when (t1.gift_flag = '正装赠品' and t1.trade_type_explain in ('售后退货', '仅退款')) then -t1.product_cost * t1.sell_count when (t1.gift_flag = '正装赠品' and t1.trade_status_explain in ('已取消')) then t1.product_cost * t1.sell_count else 0 end) `gift_fee_formal_gift_backward`, -- 赠品费用_正装赠品_逆向
      0 as internal_product_usage, -- 内部产品领用1
      0 as `supply_price_gmv`	, -- 	供货价
	  0 as`refund_amount_supply_price`, -- 退款金额-供货价
	  0 as`gmv_supply_price_taste`, -- GMV-供货价尝鲜装拉新
	  0 as`refund_amount_supply_price_taste` -- 退款金额-供货价尝鲜装拉新
    from
      `dws`.`trd_erp_pay_order_sku` t1 -- 交易域-吉客云&聚水潭订单支付表
    where
       (t1.trade_type_explain in ('售后退货', '仅退款') or t1.trade_status_explain in ('已取消'))
       and (t1.business_cate in('孩子王','乐友'))
       and t1.money_type = 'rfd'
       and t1.send_shop_type = '非寄样'
       group by
      LEFT(ifnull(t1.cancel_time,t1.pay_time),10),
      t1.shop_code,
      t1.business_cate,						-- 业务分类
      t1.`department_1`,					-- 一级部门（组织架构）
      t1.`department_2`,					-- 二级渠道（组织架构）
      t1.`department_3`,					-- 三级渠道
      t1.`department_4`,					-- 四级渠道（店铺名称+业务分类）
      t1.`expense_center`,					-- 费用中心名称
      t1.`expense_center_code`				-- 费用中心编码

UNION ALL

-- 孩子王、乐友POS数据
SELECT
      LEFT(t1.pay_time,10) as `cal_date`,	-- 支付日期
      t1.shop_code,
      t1.business_cate,						-- 业务分类
      t1.`department_1`,					-- 一级部门（组织架构）
      t1.`department_2`,					-- 二级渠道（组织架构）
      t1.`department_3`,					-- 三级渠道
      t1.`department_4`,					-- 四级渠道（店铺名称+业务分类）
      t1.`expense_center`,					-- 费用中心名称
      t1.`expense_center_code`,				-- 费用中心编码
      sum(t1.product_price_rsp) as `rspgmv`, -- rspgmv
      sum(gmv) as `gmv`, -- gmv
      0 as `rfd_amt`, -- 退款金额
      sum(product_cost) as `cost_gmv_amt`,
	  0 as `cost_rfd_amt`, -- 退款金额成本合计
      0 as  `rspgmv_new_user`, -- rspgmv_尝鲜装拉新
      0 as  `gmv_new_user`, -- gmv_尝鲜装拉新
      0 as `rfd_amt_new_user`, -- 退款金额_尝鲜装拉新
      0 as `gift_fee_ms_forward`, -- 赠品费用_MS赠品_正向
      0 as `gift_fee_bund_forward`, -- 赠品费用_尝鲜装搭赠_正向
      0 as `gift_fee_non_food_inventory_forward`, -- 赠品费用_非食赠品-入库_正向
      0 as `gift_fee_formal_gift_forward`, -- 赠品费用_正装赠品_正向
      0 as `gift_fee_ms_backward`, -- 赠品费用_MS赠品_逆向
      0 as `gift_fee_bund_backward`, -- 赠品费用_尝鲜装搭赠_逆向
      0 as `gift_fee_non_food_inventory_backward`, -- 赠品费用_非食赠品-入库_逆向
      0 as `gift_fee_formal_gift_backward`, -- 赠品费用_正装赠品_逆向
      0 as internal_product_usage, -- 内部产品领用1
      0 as `supply_price_gmv`	, -- 	供货价
	  0 as`refund_amount_supply_price`, -- 退款金额-供货价
	  0 as`gmv_supply_price_taste`, -- GMV-供货价尝鲜装拉新
	  0 as`refund_amount_supply_price_taste` -- 退款金额-供货价尝鲜装拉新
    from
      dws.`trd_haiziwang_leyou_pay_order_sku` t1 -- 孩子王乐友POS数据
    group by
      LEFT(t1.pay_time,10),	-- 支付日期
      t1.shop_code,
      t1.business_cate,						-- 业务分类
      t1.`department_1`,					-- 一级部门（组织架构）
      t1.`department_2`,					-- 二级渠道（组织架构）
      t1.`department_3`,					-- 三级渠道
      t1.`department_4`,					-- 四级渠道（店铺名称+业务分类）
      t1.`expense_center`,					-- 费用中心名称
      t1.`expense_center_code`				-- 费用中心编码
) t2
group by
      	t2.`cal_date`,											-- 统计日期
        t2.shop_code,
        ifnull(t2.business_cate,''),
      	t2.`expense_center_code`,									-- 费用中心编码
      	t2.`expense_center`,										-- 费用中心名称
      	t2.`department_1`,										-- 一级部门（组织架构）
      	t2.`department_2`,										-- 二级渠道（组织架构）
      	t2.`department_3`,										-- 三级渠道
      	t2.`department_4`										-- 四级渠道（店铺名称+业务分类）

union all

-- 推广费

select `biz_day`,											-- 统计日期
      `shop_id` as shop_code,                 -- 店铺id
      ifnull(`business_cate`,'') as business_cate,						-- 业务分类
      	`expense_center_code`,									-- 费用中心编码
      	`expense_center`,										-- 费用中心名称
      	`department_1`,										-- 一级部门（组织架构）
      	`department_2`,										-- 二级渠道（组织架构）
      	`department_3`,										-- 三级渠道
      	`department_4`,										-- 四级渠道（店铺名称+业务分类）
      	rspgmv , 								-- rspgmv
      	GMV,										-- gmv
      	refund_amount, 					-- 退款金额
	goods_coat  as `cost_gmv_amt`, -- GMV成本
			0 as `cost_rfd_amt`, -- 退款金额成本合计
			goods_coat  as `cost_gsv`,
      	0 as shipping_cost,
      	GSV,						-- gsv
      	supply_price_amount, 									-- 	供货价
     	`rsp_gmv_taste`, 				-- rspgmv_尝鲜装拉新
     	`gmv_taste`, 						-- gmv_尝鲜装拉新
      	`refund_amount_taste`, 		-- 退款金额_尝鲜装拉新
      	 gsv_taste, -- gsv_尝鲜装拉新
  supply_amount_gsv as`gsv_supply_price`, -- GSV-供货价
refund_supply_price_amount as`refund_amount_supply_price`, -- 退款金额-供货价
supply_gmv_taste as`gmv_supply_price_taste`, -- GMV-供货价尝鲜装拉新
supply_refund_amount_taste as`refund_amount_supply_price_taste`, -- 退款金额-供货价尝鲜装拉新
supply_gsv_taste as`gsv_supply_price_taste`, -- GSV-供货价尝鲜装拉新
0 as`tax_with_union_funds_and_disability_insurance`, -- 税金（含工会经费划拨、残保金）
0 as`non_operating_income`, -- 营业外收入
0 as`other_business_income`, -- 其他业务收入
0 as`other_costs`, -- 其他成本
0 as`deposit`, -- 保证金
0 as`tax_arrears_penalty`, -- 税收滞纳金罚款

      	0 as 	`short_video_commission`	, -- 	达人短视频线下返佣
	  	platform_commission as 	`live_stream_offline_commission`	, -- 	达人直播线下返佣
	  case when business_cate like '%短视频' then expert_commission else 0 end  as 	`short_video_darren_commission`	, -- 	短视频达人佣金
	  	ddjb_commission_fee as 	`duoduo_commission`	, -- 	多多客佣金
		case when shop_id='12784930' then expert_commission else 0 end as 	`haoyiku_commission`	, -- 	好衣库达人佣金
		jtk_amount as 	`jingtaoke_commission`	, -- 	京挑客佣金
		0 as 	`private_domain_service_fee`	, -- 	私域外包代运营费
		taobao_customer as 	`taobao_commission`	, -- 	淘宝客佣金
		only_enjoy_customer as 	`weixiangke_commission`	, -- 	唯享客佣金
		0 as 	`commission`	, -- 	佣金
		case when business_cate ='达人直播' then expert_commission else 0 end as 	`live_stream_commission`	, -- 	直播达人佣金
		0 as 	`short_video_service_fee`	, -- 	达人短视频服务费
		0 as 	`live_stream_service_fee`	, -- 	达人直播服务费
		cid_consume as 	`cid_ud_ad_spend`	, -- 	CID、UD信息流投放
		0 as 	`ka_barcode_fee`	, -- 	KA卖进条码费
		platform_promotion_fee as 	`otd_promotion_cost`	, -- 	OTD推广费用
		0 as 	`scene_promotion_cost`	, -- 	场景推广
		e_niu_cost as 	`magnet_gold_pc`	, -- 	磁力金牛PC
		0 as 	`magnet_gold_mobile`	, -- 	磁力金牛移动
		0 as 	`douyin_doujia`	, -- 	抖音抖加
		qianchuan_pc as 	`douyin_qianchuan`	, -- 	抖音千川
		feel_free_push as 	`douyin_suixin`	, -- 	抖音随心推
		shopp_contact as 	`shopping_touchpoint`	, -- 	购物触点
		haitou as 	`hai_tou`	, -- 	海投
		0 as 	`jingxiaozhi_recharge`	, -- 	京小智充值
		0 as 	`juiguang_platform`	, -- 	聚光平台
		express_train as 	`kuai_che`	, -- 	快车
		0 as 	`joint_promotion_cost`	, -- 	联合推广
		0 as 	`star_shop_promotion`	, -- 	明星店铺推广
		brand_zone as 	`brand_zone`	, -- 	品牌专区
		pinxiaobao 	, -- 	品销宝
		full_site_promotion as 	`full_site_promotion`	, -- 	全站推广
		0 as 	`search_promotion`	, -- 	搜索推广
		0 as 	`tencent_ad_spend`	, -- 	腾讯广告费用
		wanxiangtai as 	`wanxiang_platform`	, -- 	万相台
		0 as 	`wechat_beans`	, -- 	微信豆
		0 as 	`offline_venue_rental`	, -- 	线下场地租用
		0 as 	`offline_instore_ad`	, -- 	线下店内广告费
		0 as 	`offline_exhibition_fee`	, -- 	线下外部参展费
		xhs_promotion as 	`xiaohongshu_promotion`	, -- 	小红书推广费
		gravity_cube as 	`gravity_cube`	, -- 	引力魔方
		0 as 	`easy_consumables_purchase`	, -- 	易耗道具采购费用
		0 as 	`operation_buyer_show_maintenance`	, -- 	运营买家秀维护
		chip_launch as 	`smart_targeting`	, -- 	智能投放
		direct_train as 	`zhitongche`	, -- 	直通车
      	0 as `gift_fee_ms`,						-- 赠品费用_MS赠品
      	0 as `gift_fee_bund`, 					-- 赠品费用_尝鲜装搭赠
      	non_food_gift_inventory as `gift_fee_non_food_inventory`, 			-- 赠品费用_非食赠品-入库
      	0 as `non_food_gift_cost`, -- 非食赠品采购成本
      	0 as`gift_fee_formal_gift`, 	-- 赠品费用_正装赠品
      	0 as 	`ai_calling_cost`	, -- 	AI电话费用
		gift_amount as 	`eka_consumption_card`	, -- 	EKA消费卡
		0 as 	`promo_resource_purchase`	, -- 	大促及爆品推广资源采买
		0 as 	`darren_activity_fee`	, -- 	达人活动费
		0 as 	`sms_cost`	, -- 	短信费用
		hp_resource 	`horizontal_screen_resource_position`	, -- 	横屏/资源位
		0 as 	`juhuasuan_subsidy_fee`	, -- 	聚划算、百亿补贴费用
		0 as 	`hot_wave_engine_service_fee`	, -- 	热浪引擎服务费
		0 as 	`new_customer_first_order_gift`	, -- 	新客首单礼金
		0 as 	`sales_promotion_incentive`	, -- 	促销员激励
		0 as 	`tp_service_fee`	, -- 	TP服务费
		0 as 	`tp_service_tax_diff`	, -- 	TP服务费税差
		0 as 	`refund_difference`	, -- 	退差价
		0 as 	`small_payment`	, -- 	小额打款
		0 as 	`gift_with_order_compensation`	, -- 	随箱礼及赠品补差
		0 as 	`offline_product_promotion_service_fee`	, -- 	线下产品推广服务费
		0 as 	`offline_consumer_promotion`	, -- 	线下消费者价格促销
		0 as 	`main_project_promotion`	, -- 	主推项目
		0 as 	`darren_sample_fee`	, -- 	达人样品费
		0 as 	`internal_product_usage`	, -- 	内部产品领用1
		0 as 	`contract_display_fee`	, -- 	合同条款-陈列费
		0 as 	`contract_rebate`	, -- 	合同条款-返利
		0 as 	`contract_fixed_fee`	, -- 	合同条款-固定费用
		maobao as 	`contract_margin_protection`	, -- 	合同条款-毛保
		0 as 	`contract_other_fees`	, -- 	合同条款-其他费
		0 as 	`contract_new_store_entry_fee`	, -- 	合同条款-新店进场费
		0 as 	`huabei_fee`	, -- 	花呗手续费
		0 as 	`credit_card_fee`	, -- 	信用卡交易手续费
		0 as 	`shop_commission_rate`	, -- 	2C店铺扣点
		0 as 	`platform_software_service_fee`	, -- 	平台软件服务费
		0 as 	`freight_insurance`	, -- 	运费险
		0 as 	`warehouse_logistics_payout`	, -- 	仓储物流赔付扣款
		0 as 	`warehousing_loss_due_to_logistics`	, -- 	仓配原因类资损
		0 as 	`customer_service_travel_expense`	, -- 	客服差旅费用
		0 as 	`customer_service_salary`	, -- 	客服人力工资
		0 as 	`customer_service_outsourcing`	, -- 	客服人力外包
		0 as 	`customer_service_software_cost`	, -- 	客服软件费用
		0 as 	`agent_or_darren_payout`	, -- 	代理或达人责任类赔付
		0 as 	`breach_of_contract_payout`	, -- 	电商违约赔付费用
		0 as 	`business_loss_health_impact_payout`	, -- 	经营亏损、健康影响类赔付
		0 as 	`customer_service_quality_payout`	, -- 	售后赔付（质量）
		0 as 	`quality_payout`	, -- 	质量赔付
		0 as 	`quality_loss_due_to_quality`	, -- 	质量原因类资损
		0 as 	`copyright_application_fee`	, -- 	版权申请费
		0 as 	`copyright_purchase_fee`	, -- 	字体/图库等版权采购费
		0 as 	`price_control_rights_protection`	, -- 	控价维权
		0 as 	`service_entitlement_purchase_fee`	, -- 	会员等服务/权益采购费用
		0 as 	`outdoor_film_online_advertising`	, -- 	户外、影视综、线上广告
		0 as 	`brand_product_promo_production_fee`	, -- 	品牌/产品宣传片制作费
		0 as 	`business_cooperation_content_spread`	, -- 	商务合作、内容传播、营销物料等
		0 as 	`packaging_design_fee`	, -- 	包装设计费
		0 as 	`industrial_design_fee`	, -- 	工业设计费
		0 as 	`brand_design_fee`	, -- 	品牌设计费
		0 as 	`material_design_fee`	, -- 	物料设计费
		0 as 	`venue_rental_daily_expenses`	, -- 	场地租赁费、日常费用
		0 as 	`prop_purchase_fee`	, -- 	道具采购费
		0 as 	`model_fee`	, -- 	模特费
		0 as 	`video_shooting_fee`	, -- 	视频拍摄费
		0 as 	`photo_shooting_fee`	, -- 	图片拍摄费
		0 as 	`internal_product_usage_commented`	, -- 	内部产品领用2
		0 as 	`douyin_promotion`	, -- 	抖音推广
		0 as 	`channel_marketing`	, -- 	渠道营销
		0 as 	`brand_consulting_service_fee`	, -- 	品牌咨询服务费
		0 as 	`external_brand_advisory_fee`	, -- 	外部品牌定位/视觉/内容等顾问费
		0 as 	`base_salary`	, -- 	基本工资
        0 as 	`human_resources_outsourcing_fee`	, -- 	人力外包费用
        0 as 	`bonus`	, -- 	提成
        0 as 	`external_training_fee`	, -- 	外部培训费
        0 as 	`excellence_award_team_personal`	, -- 	优秀奖励（含优秀团队/个人）
        0 as 	`employee_compensation`	, -- 	员工赔偿金（含辞退、劳动事故/生育津贴/失业补偿费）
        0 as 	`corporate_culture_activity_fee`	, -- 	企业文化活动费
        0 as 	`team_building_fee`	, -- 	团建费
        0 as 	`housing_fund`	, -- 	公积金
        0 as 	`work_injury_insurance`	, -- 	工伤保险
        0 as 	`unemployment_insurance`	, -- 	失业保险
        0 as 	`old_age_insurance`	, -- 	养老保险
        0 as 	`medical_insurance`	, -- 	医疗保险
        0 as 	`overtime_meal_fee`	, -- 	加班餐费
        0 as 	`overtime_transportation_fee`	, -- 	加班交通费
        0 as 	`festival_welfare_fee`	, -- 	节日福利费
        0 as 	`health_checkup_fee`	, -- 	体检费
        0 as 	`accident_insurance`	, -- 	意外险
        0 as 	`employee_care_fee`	, -- 	员工慰问费
        0 as 	`headhunter_fee`	, -- 	猎头费
        0 as 	`recruitment_fee`	, -- 	招聘费用（含常规平台服务费、场地及资料费不含差旅）
        0 as 	`internal_product_usage_commented_again`	, -- 	内部产品领用3
        0 as 	`testing_fee`	, -- 	检测费
        0 as 	`r_and_d_external_testing_fee`	, -- 	研发委外检测费
        0 as 	`vehicle_insurance_registration_fee`	, -- 	车辆保险/年审费
        0 as 	`vehicle_maintenance_repair_fee`	, -- 	车辆保养/维修费
        0 as 	`admin_vehicle_fuel_fee`	, -- 	行政车辆油费
        0 as 	`standardization_certification_fee`	, -- 	标准化体系认证费（管理类信息化类、生产安全类）
        0 as 	`product_certification_fee`	, -- 	专业服务费-产品认证费用
        0 as 	`association_membership_fee`	, -- 	协会会费
        0 as 	`channel_system_service_fee`	, -- 	渠道系统服务使用费
        0 as 	`network_service_fee`	, -- 	网络服务费
        0 as 	`information_service_purchase`	, -- 	信息服务采购
        0 as 	`it_project_construction_fee`	, -- 	信息化项目建设费
        0 as 	`it_system_maintenance_fee`	, -- 	信息化系统运维费
        0 as 	`sample_purchase_fee`	, -- 	外购取样费
        0 as 	`third_party_factory_audit_fee`	, -- 	第三方验厂费
        0 as 	`legal_fee`	, -- 	律师费
        0 as 	`other_legal_services`	, -- 	其他法律服务
        0 as 	`other_consultancy_fee`	, -- 	其他咨询费
        0 as 	`hr_consultancy_fee`	, -- 	人力咨询费
        0 as 	`regular_audit_fee`	, -- 	日常审计费（财务/财损审计、税务审计、高新税审）
        0 as 	`litigation_fee`	, -- 	诉讼费
        0 as 	`r_and_d_external_consultancy_fee`	, -- 	研发外部咨询服务费
        0 as 	`special_audit_service_fee`	, -- 	专项审计及服务费（含上市审计、尽调、上市顾问服务）
        0 as 	`special_consultancy_fee`	, -- 	专项咨询服务费（含各专题外部咨询及服务）
        0 as 	`toll_bridge_parking_fee`	, -- 	过路过桥/停车费
        0 as 	`business_trip_transportation_fee`	, -- 	因公外出交通费
        0 as 	`pest_control_fee`	, -- 	虫害费
        0 as 	`green_plant_fee`	, -- 	绿植费
        0 as 	`large_bucket_water_fee`	, -- 	内部大桶装水费
        0 as 	`office_equipment_furniture`	, -- 	办公设备及家具
        0 as 	`admin_vehicle`	, -- 	行政车辆
        0 as 	`computer_related_products`	, -- 	计算机及相关产品
        0 as 	`other_assets`	, -- 	其他资产
        0 as 	`trademark_purchase_fee`	, -- 	外部商标购买
        0 as 	`r_and_d_equipment_purchase_fee`	, -- 	研发设备购置费
        0 as 	`it_equipment`	, -- 	IT设备
        0 as 	`office_equipment_furniture_commented`	, -- 	办公设备及家具
        0 as 	`vehicle_commented`	, -- 	车辆
        0 as 	`other_equipment`	, -- 	其他设备
        0 as 	`r_and_d_equipment_commented`	, -- 	研发设备
        0 as 	`office_supplies_fee`	, -- 	办公用品费
        0 as 	`admin_low_consumables`	, -- 	行政低耗品
        0 as 	`start_up_special_fees`	, -- 	开办费及特殊费用
        0 as 	`other_office_fees`	, -- 	其他办公费
        0 as 	`daily_necessities_fee`	, -- 	日用品费用
        0 as 	`barcode_application_fee`	, -- 	条码申请费用
        0 as 	`document_copying_fee`	, -- 	文件影印费
        0 as 	`font_image_copyright_purchase_fee`	, -- 	字体/图库等版权采购费
        0 as 	`meeting_conference_fee`	, -- 	会议会务费（含内、外部）
        0 as 	`admin_express_fee`	, -- 	行政快递费
        0 as 	`other_communication_fees`	, -- 	其他通讯费
        0 as 	`office_equipment_maintenance_fee`	, -- 	办公设备维修费
        0 as 	`media_framework_cooperation`	, -- 	媒体框架合作
        0 as 	`online_media_distribution`	, -- 	网络媒体普发投放
        0 as 	`pr_maintenance_business_entertainment`	, -- 	公关维护及业务招待费（不含专项认证费）
        0 as 	`customer_relationship_maintenance`	, -- 	客情维护
        0 as 	`gift_fee`	, -- 	礼品费
        0 as 	`business_entertainment_fee`	, -- 	业务招待费
        0 as 	`toB_public_opinion_maintenance`	, -- 	toB舆情维护
        0 as 	`toC_public_opinion_maintenance`	,  -- 	toC舆情维护
        maobao_supply as 	`contract_margin_protection_2C`	 , -- 	合同条款-毛保(2C)
0 as`raw_material`, -- 原料
0 as`packaging_material_1`, -- 包材1
0 as`packaging_material_sampling_fee`, -- 包材打样费
0 as`plate_making_fee`, -- 制版费
0 as`achievement_award_declaration_paper_publication_fee`, -- 成果/奖项申报/论文发表费
0 as`compensation_due_to_warehouse_distribution`, -- 仓配原因类赔付
0 as`compensation_due_to_order_review`, -- 审单原因类赔付
0 as`compensation_due_to_operations`, -- 运营原因类赔付
0 as`compensation_due_to_other`, -- 其他原因类赔付
0 as`compensation_due_to_customer_service`, -- 客服服务原因类赔付
0 as`customer_service_evaluation_fee`, -- 客服评价费用
0 as`scrap_cost`, -- 报废成本
0 as`meal_subsidy`, -- 餐费补贴
0 as`railway_air_traffic`, -- 铁路航空交通
0 as`city_traffic`, -- 市内交通
0 as`private_car_for_public_use_subsidy`, -- 私车公用补贴
0 as`accommodation_fee`, -- 住宿费
0 as`highway_waterway_traffic`, -- 公路水路交通
0 as`electricity_fee`, -- 电费
0 as`house_rent`, -- 房租费
0 as`infrastructure_repair_fee`, -- 基建维修费
0 as`water_fee`, -- 水费
0 as`property_management_fee`, -- 物业管理费
0 as`decoration_fee`, -- 装修费
0 as`financial_institution_service_charge`, -- 金融机构手续费（含银行）
0 as`online_bank_transaction_fee`, -- 网银交易手续费
0 as`interest_income`, -- 利息收入
0 as`packaging_material_scrap_cost`, -- 包材报废成本
0 as`raw_material_scrap_cost`, -- 原料报废成本
0 as`reverse_operation_fee`, -- 逆向操作费
0 as`loading_unloading_operation_fee`, -- 装卸操作费
0 as`performance_penalty_income`, -- 绩效罚款收入
0 as`product_inventory_loss_compensation`, -- 商品盘点损失赔付
0 as`drop_shipping_service_fee`, -- 一件代发服务费
0 as`carton_recycling_income`, -- 纸箱回收收入
0 as`packaging_material_2`, -- 包材2
0 as`product_design_service_fee`, -- 产品设计服务费
0 as`raw_materials`, -- 原材料
0 as`expert_consulting_fee`, -- 专家咨询费
0 as`finished_goods_purchase`, -- 成品采购
0 as`outsourced_joint_rnd_fee`, -- 委外联合研发费
0 as`offline_logistics_fee`, -- 线下物流费用
0 as`r_d_consumables`, -- 研发耗材
0 as`product_cost`, -- 商品成本
0 as`warehouse_rent`, -- 仓租费
0 as`offline_tob_return_freight`, -- 线下TOB退货运费
0 as`consumables_fee`, -- 耗材费
0 as`outbound_operation_fee`, -- 出库操作费
0 as`value_added_service_fee`, -- 增值服务费
0 as`warehouse_transfer_fee`, -- 仓间调拨费用
0 as`express_fee_1`, -- 快递费1
0 as`product_inventory_loss`, -- 商品盘点损失
0 as`finished_sample_production_fee`, -- 成品打样费
0 as`competitor_purchase_fee`, -- 竞品采购费
0 as`standard_setting_fee`, -- 标准制订费
0 as`patent_fee`, -- 专利费
guanghe_commission as `guanghe_commission`, -- 光合
0 as `base_salary_test` -- '基本工资_预估'



        from dws.fin_omni_channel_promotion_fee


UNION ALL


select
biz_day ,
shop_id,
business_cate,
expense_center_code,
expense_center,
department_1,
department_2,
department_3,
department_4,
sum( case when budget_subject_code in('1')then ft_value_center_get else 0 end) as rsp_gmv,-- RSPGMV
sum( case when budget_subject_code in('2')then ft_value_center_get else 0 end) as gmv,-- GMV
 0  as refund_amount,-- 退款金额
	0 as `cost_gmv_amt`, -- GMV成本
			0 as `cost_rfd_amt`, -- 退款金额成本合计
			0  as `cost_gsv`,
sum( case when budget_subject_code in('15')then ft_value_center_get else 0 end) as shipping_cost,-- 运费
sum( case when budget_subject_code in('4')then ft_value_center_get else 0 end) as gsv,-- GSV
sum( case when budget_subject_code in('5')then ft_value_center_get else 0 end) as supply_price_gmv,-- 供货价GMV
sum( case when budget_subject_code in('6')then ft_value_center_get else 0 end) as rsp_gmv_taste,-- RSPGMV-尝鲜装拉新
sum( case when budget_subject_code in('7')then ft_value_center_get else 0 end) as gmv_taste,-- GMV-尝鲜装拉新
sum( case when budget_subject_code in('8')then ft_value_center_get else 0 end) as refund_amount_taste,-- 退款金额-尝鲜装拉新
sum( case when budget_subject_code in('9')then ft_value_center_get else 0 end) as gsv_taste,-- GSV-尝鲜装拉新

sum(case when budget_subject_code in('10')then ft_value_center_get else 0 end ) as gsv_supply_price,-- GSV-供货价
sum(case when budget_subject_code in('11')then ft_value_center_get else 0 end ) as refund_amount_supply_price,-- 退款金额-供货价
sum(case when budget_subject_code in('12')then ft_value_center_get else 0 end ) as gmv_supply_price_taste,-- GMV-供货价尝鲜装拉新
sum(case when budget_subject_code in('13')then ft_value_center_get else 0 end ) as refund_amount_supply_price_taste,-- 退款金额-供货价尝鲜装拉新
sum(case when budget_subject_code in('14')then ft_value_center_get else 0 end ) as gsv_supply_price_taste,-- GSV-供货价尝鲜装拉新
sum(case when budget_subject_code in('16')then ft_value_center_get else 0 end ) as tax_with_union_funds_and_disability_insurance,-- 税金（含工会经费划拨、残保金）
sum(case when budget_subject_code in('17')then ft_value_center_get else 0 end ) as non_operating_income,-- 营业外收入
sum(case when budget_subject_code in('18')then ft_value_center_get else 0 end ) as other_business_income,-- 其他业务收入
sum(case when budget_subject_code in('19')then ft_value_center_get else 0 end ) as other_costs,-- 其他成本
sum(case when budget_subject_code in('20')then ft_value_center_get else 0 end ) as deposit,-- 保证金
sum(case when budget_subject_code in('21')then ft_value_center_get else 0 end ) as tax_arrears_penalty,-- 税收滞纳金罚款


sum( case when budget_subject_code in('Y16002059','C1006001')then ft_value_center_get else 0 end) as short_video_commission,-- 达人短视频线下返佣
sum( case when budget_subject_code in('Y16002063','C1006002')then ft_value_center_get else 0 end) as live_stream_offline_commission,-- 达人直播线下返佣
sum( case when budget_subject_code in('Y16002078','C1006008')then ft_value_center_get else 0 end) as short_video_darren_commission,-- 短视频达人佣金
sum( case when budget_subject_code in('Y16002080','C1006006')then ft_value_center_get else 0 end) as duoduo_commission,-- 多多客佣金
sum( case when budget_subject_code in('Y16002090')then ft_value_center_get else 0 end) as haoyiku_commission,-- 好衣库达人佣金
sum( case when budget_subject_code in('Y16002110','C1006004')then ft_value_center_get else 0 end) as jingtaoke_commission,-- 京挑客佣金
sum( case when budget_subject_code in('Y16002171')then ft_value_center_get else 0 end) as private_domain_service_fee,-- 私域外包代运营费
sum( case when budget_subject_code in('Y16002175','C1006003')then ft_value_center_get else 0 end) as taobao_commission,-- 淘宝客佣金
sum( case when budget_subject_code in('Y16002193','C1006005')then ft_value_center_get else 0 end) as weixiangke_commission,-- 唯享客佣金
sum( case when budget_subject_code in('Y16002227','C1006009')then ft_value_center_get else 0 end) as commission,-- 佣金
sum( case when budget_subject_code in('Y16002239','C1006007')then ft_value_center_get else 0 end) as live_stream_commission,-- 直播达人佣金
sum( case when budget_subject_code in('Y16029058','C1004001')then ft_value_center_get else 0 end) as short_video_service_fee,-- 达人短视频服务费
sum( case when budget_subject_code in('Y16029062','C1004002')then ft_value_center_get else 0 end) as live_stream_service_fee,-- 达人直播服务费
sum( case when budget_subject_code in('Y16083003','C1005009')then ft_value_center_get else 0 end) as cid_ud_ad_spend,-- CID、UD信息流投放
sum( case when budget_subject_code in('Y16083006')then ft_value_center_get else 0 end) as ka_barcode_fee,-- KA卖进条码费
sum( case when budget_subject_code in('Y16083008','C1005006')then ft_value_center_get else 0 end) as otd_promotion_cost,-- OTD推广费用
sum( case when budget_subject_code in('Y16083047','C1005019')then ft_value_center_get else 0 end) as scene_promotion_cost,-- 场景推广
sum( case when budget_subject_code in('Y16083055','C1005026')then ft_value_center_get else 0 end) as magnet_gold_pc,-- 磁力金牛PC
sum( case when budget_subject_code in('Y16083056','C1005027')then ft_value_center_get else 0 end) as magnet_gold_mobile,-- 磁力金牛移动
sum( case when budget_subject_code in('Y16083074','C1005011')then ft_value_center_get else 0 end) as douyin_doujia,-- 抖音抖加
sum( case when budget_subject_code in('Y16083075','C1005010')then ft_value_center_get else 0 end) as douyin_qianchuan,-- 抖音千川
sum( case when budget_subject_code in('Y16083076','C1005012')then ft_value_center_get else 0 end) as douyin_suixin,-- 抖音随心推
sum( case when budget_subject_code in('Y16083087','C1005015')then ft_value_center_get else 0 end) as shopping_touchpoint,-- 购物触点
sum( case when budget_subject_code in('Y16083089','C1005014')then ft_value_center_get else 0 end) as hai_tou,-- 海投
sum( case when budget_subject_code in('Y16083111','C1005008')then ft_value_center_get else 0 end) as jingxiaozhi_recharge,-- 京小智充值
sum( case when budget_subject_code in('Y16083114','C1005025')then ft_value_center_get else 0 end) as juiguang_platform,-- 聚光平台
sum( case when budget_subject_code in('Y16083125','C1005013')then ft_value_center_get else 0 end) as kuai_che,-- 快车
sum( case when budget_subject_code in('Y16083128','C1005020')then ft_value_center_get else 0 end) as joint_promotion_cost,-- 联合推广
sum( case when budget_subject_code in('Y16083133','C1005021')then ft_value_center_get else 0 end) as star_shop_promotion,-- 明星店铺推广
sum( case when budget_subject_code in('Y16083140','C1005028')then ft_value_center_get else 0 end) as brand_zone,-- 品牌专区
sum( case when budget_subject_code in('Y16083142','C1005029')then ft_value_center_get else 0 end) as pinxiao_bao,-- 品销宝
sum( case when budget_subject_code in('Y16083155','C1005017')then ft_value_center_get else 0 end) as full_site_promotion,-- 全站推广
sum( case when budget_subject_code in('Y16083172','C1005018')then ft_value_center_get else 0 end) as search_promotion,-- 搜索推广
sum( case when budget_subject_code in('Y16083176','C1005023')then ft_value_center_get else 0 end) as tencent_ad_spend,-- 腾讯广告费用
sum( case when budget_subject_code in('Y16083188','C1005004')then ft_value_center_get else 0 end) as wanxiang_platform,-- 万相台
sum( case when budget_subject_code in('Y16083192','C1005024')then ft_value_center_get else 0 end) as wechat_beans,-- 微信豆
sum( case when budget_subject_code in('Y16083199','C1101005')then ft_value_center_get else 0 end) as offline_venue_rental,-- 线下场地租用
sum( case when budget_subject_code in('Y16083200')then ft_value_center_get else 0 end) as offline_instore_ad,-- 线下店内广告费
sum( case when budget_subject_code in('Y16083201','C1105001')then ft_value_center_get else 0 end) as offline_exhibition_fee,-- 线下外部参展费
sum( case when budget_subject_code in('Y16083205','C0805001')then ft_value_center_get else 0 end) as xiaohongshu_promotion,-- 小红书推广费
sum( case when budget_subject_code in('Y16083226','C1005005')then ft_value_center_get else 0 end) as gravity_cube,-- 引力魔方
sum( case when budget_subject_code in('Y16083224','C1005030')then ft_value_center_get else 0 end) as easy_consumables_purchase,-- 易耗道具采购费用
sum( case when budget_subject_code in('Y16083235','C1907001')then ft_value_center_get else 0 end) as operation_buyer_show_maintenance,-- 运营买家秀维护
sum( case when budget_subject_code in('Y16083245','C1005016')then ft_value_center_get else 0 end) as smart_targeting,-- 智能投放
sum( case when budget_subject_code in('Y16083240','C1005003')then ft_value_center_get else 0 end) as zhitongche,-- 直通车
sum( case when budget_subject_code in('Y20004007','C1008004')then ft_value_center_get else 0 end) as ms_gift,-- MS赠品
sum( case when budget_subject_code in('Y20023045','C1008002')then ft_value_center_get else 0 end) as taste_pack_promotion,-- 尝鲜装搭赠
sum( case when budget_subject_code in('Y20035083','C1008003')then ft_value_center_get else 0 end) as non_food_gift_inventory,-- 非食赠品-入库
sum( case when budget_subject_code in('Y20035082','C0101001')then ft_value_center_get else 0 end) as non_food_gift_cost,-- 非食赠品采购成本
sum( case when budget_subject_code in('Y20101238','C1008005')then ft_value_center_get else 0 end) as main_product_gift,-- 正装赠品
sum( case when budget_subject_code in('Y07001002','C1007009')then ft_value_center_get else 0 end) as ai_calling_cost,-- AI电话费用
sum( case when budget_subject_code in('Y07003004','C1005007')then ft_value_center_get else 0 end) as eka_consumption_card,-- EKA消费卡
sum( case when budget_subject_code in('Y07027064','C1005001')then ft_value_center_get else 0 end) as promo_resource_purchase,-- 大促及爆品推广资源采买
sum( case when budget_subject_code in('Y07027060')then ft_value_center_get else 0 end) as darren_activity_fee,-- 达人活动费
sum( case when budget_subject_code in('Y07027079')then ft_value_center_get else 0 end) as sms_cost,-- 短信费用
sum( case when budget_subject_code in('Y07027097','C1005032')then ft_value_center_get else 0 end) as horizontal_screen_resource_position,-- 横屏/资源位
sum( case when budget_subject_code in('Y07027115','C1007001')then ft_value_center_get else 0 end) as juhuasuan_subsidy_fee,-- 聚划算、百亿补贴费用
sum( case when budget_subject_code in('Y07027156')then ft_value_center_get else 0 end) as hot_wave_engine_service_fee,-- 热浪引擎服务费
sum( case when budget_subject_code in('Y07027207','C1007002')then ft_value_center_get else 0 end) as new_customer_first_order_gift,-- 新客首单礼金
sum( case when budget_subject_code in('Y07028057','C1103005')then ft_value_center_get else 0 end) as sales_promotion_incentive,-- 促销员激励
sum( case when budget_subject_code in('Y07032025','C1001001')then ft_value_center_get else 0 end) as tp_service_fee,-- TP服务费
sum( case when budget_subject_code in('Y07032026')then ft_value_center_get else 0 end) as tp_service_tax_diff,-- TP服务费税差
sum( case when budget_subject_code in('Y07079183','C1002009')then ft_value_center_get else 0 end) as refund_difference,-- 退差价
sum( case when budget_subject_code in('Y07079203')then ft_value_center_get else 0 end) as small_payment,-- 小额打款
sum( case when budget_subject_code in('Y07081174')then ft_value_center_get else 0 end) as gift_with_order_compensation,-- 随箱礼及赠品补差
sum( case when budget_subject_code in('Y07086198','C1101003')then ft_value_center_get else 0 end) as offline_product_promotion_service_fee,-- 线下产品推广服务费
sum( case when budget_subject_code in('Y07087202','C1103006')then ft_value_center_get else 0 end) as offline_consumer_promotion,-- 线下消费者价格促销
sum( case when budget_subject_code in('Y07105246','C1101006')then ft_value_center_get else 0 end) as main_project_promotion,-- 主推项目
sum( case when budget_subject_code in('Y19030061','C1004003')then ft_value_center_get else 0 end) as darren_sample_fee,-- 达人样品费
sum( case when budget_subject_code in('Y19059135')then ft_value_center_get else 0 end) as internal_product_usage,-- 内部产品领用1
sum( case when budget_subject_code in('Y12038091','C1101001')then ft_value_center_get else 0 end) as contract_display_fee,-- 合同条款-陈列费
sum( case when budget_subject_code in('Y12039092','C1005002')then ft_value_center_get else 0 end) as contract_rebate,-- 合同条款-返利
sum( case when budget_subject_code in('Y12040093')then ft_value_center_get else 0 end) as contract_fixed_fee,-- 合同条款-固定费用
sum( case when budget_subject_code in('Y12041094','C1007007')then ft_value_center_get else 0 end) as contract_margin_protection,-- 合同条款-毛保
sum( case when budget_subject_code in('Y12042095','C1102002')then ft_value_center_get else 0 end) as contract_other_fees,-- 合同条款-其他费
sum( case when budget_subject_code in('Y12043096','C1101007')then ft_value_center_get else 0 end) as contract_new_store_entry_fee,-- 合同条款-新店进场费
sum( case when budget_subject_code in('Y12050099','C1007004')then ft_value_center_get else 0 end) as huabei_fee,-- 花呗
sum( case when budget_subject_code in('Y12050211','C1007003')then ft_value_center_get else 0 end) as credit_card_fee,-- 信用卡交易手续费
sum( case when budget_subject_code in('Y12057001','C1007006')then ft_value_center_get else 0 end) as shop_commission_rate,-- 2C店铺扣点
sum( case when budget_subject_code in('Y12066143','C1102016')then ft_value_center_get else 0 end) as platform_software_service_fee,-- 平台软件服务费
sum( case when budget_subject_code in('Y12099234','C1007005')then ft_value_center_get else 0 end) as freight_insurance,-- 运费险
sum( case when budget_subject_code in('Y10019040','C0901001')then ft_value_center_get else 0 end) as warehouse_logistics_payout,-- 仓储物流赔付扣款
sum( case when budget_subject_code in('Y10019042')then ft_value_center_get else 0 end) as warehousing_loss_due_to_logistics,-- 仓配原因类资损
sum( case when budget_subject_code in('Y10051117')then ft_value_center_get else 0 end) as customer_service_travel_expense,-- 客服差旅费用
sum( case when budget_subject_code in('Y10052120')then ft_value_center_get else 0 end) as customer_service_salary,-- 客服人力工资
sum( case when budget_subject_code in('Y10053121')then ft_value_center_get else 0 end) as customer_service_outsourcing,-- 客服人力外包
sum( case when budget_subject_code in('Y10054122')then ft_value_center_get else 0 end) as customer_service_software_cost,-- 客服软件费用
sum( case when budget_subject_code in('Y10079065','C1002007')then ft_value_center_get else 0 end) as agent_or_darren_payout,-- 代理或达人责任类赔付
sum( case when budget_subject_code in('Y10079069','C1007012')then ft_value_center_get else 0 end) as breach_of_contract_payout,-- 电商违约赔付费用
sum( case when budget_subject_code in('Y10079112','C1002001')then ft_value_center_get else 0 end) as business_loss_health_impact_payout,-- 经营亏损、健康影响类赔付
sum( case when budget_subject_code in('Y10104168','C1607001')then ft_value_center_get else 0 end) as customer_service_quality_payout,-- 售后赔付（质量）
sum( case when budget_subject_code in('Y10104243')then ft_value_center_get else 0 end) as quality_payout,-- 质量赔付
sum( case when budget_subject_code in('Y10104244')then ft_value_center_get else 0 end) as quality_loss_due_to_quality,-- 质量原因类资损
sum( case when budget_subject_code in('Y15011026','C0401001')then ft_value_center_get else 0 end) as copyright_application_fee,-- 版权申请费
sum( case when budget_subject_code in('Y01012254','C0401003')then ft_value_center_get else 0 end) as copyright_purchase_fee,-- 字体/图库等版权采购费2
sum( case when budget_subject_code in('Y15056124','C1007010')then ft_value_center_get else 0 end) as price_control_rights_protection,-- 控价维权
sum( case when budget_subject_code in('Y15065101')then ft_value_center_get else 0 end) as service_entitlement_purchase_fee,-- 会员等服务/权益采购费用
sum( case when budget_subject_code in('Y15062098')then ft_value_center_get else 0 end) as outdoor_film_online_advertising,-- 户外、影视综、线上广告
sum( case when budget_subject_code in('Y15063138')then ft_value_center_get else 0 end) as brand_product_promo_production_fee,-- 品牌/产品宣传片制作费
sum( case when budget_subject_code in('Y15064164','C0803003')then ft_value_center_get else 0 end) as business_cooperation_content_spread,-- 商务合作、内容传播、营销物料等
sum( case when budget_subject_code in('Y15075033','C0601001')then ft_value_center_get else 0 end) as packaging_design_fee,-- 包装设计费
sum( case when budget_subject_code in('Y15075084','C0601003')then ft_value_center_get else 0 end) as industrial_design_fee,-- 工业设计费
sum( case when budget_subject_code in('Y15075139','C0601005')then ft_value_center_get else 0 end) as brand_design_fee,-- 品牌设计费
sum( case when budget_subject_code in('Y15075196')then ft_value_center_get else 0 end) as material_design_fee,-- 物料设计费
sum( case when budget_subject_code in('Y15076046','C0501001')then ft_value_center_get else 0 end) as venue_rental_daily_expenses,-- 场地租赁费、日常费用
sum( case when budget_subject_code in('Y15076066','C0501002')then ft_value_center_get else 0 end) as prop_purchase_fee,-- 道具采购费
sum( case when budget_subject_code in('Y15076134','C0501004')then ft_value_center_get else 0 end) as model_fee,-- 模特费
sum( case when budget_subject_code in('Y15076167','C0501005')then ft_value_center_get else 0 end) as video_shooting_fee,-- 视频拍摄费
sum( case when budget_subject_code in('Y15076181','C0501006')then ft_value_center_get else 0 end) as photo_shooting_fee,-- 图片拍摄费
sum( case when budget_subject_code in('Y15077135')then ft_value_center_get else 0 end) as internal_product_usage_commented,-- 内部产品领用2
sum( case when budget_subject_code in('Y15078077','C0805002')then ft_value_center_get else 0 end) as douyin_promotion,-- 抖音推广
sum( case when budget_subject_code in('Y15078153','C0105001')then ft_value_center_get else 0 end) as channel_marketing,-- 渠道营销
sum( case when budget_subject_code in('Y15108141')then ft_value_center_get else 0 end) as brand_consulting_service_fee,-- 品牌咨询服务费
sum( case when budget_subject_code in('Y15108185','C0401004')then ft_value_center_get else 0 end) as external_brand_advisory_fee,-- 外部品牌定位/视觉/内容等顾问费
sum( case when budget_subject_code in('Y13045102','C0701004')then ft_value_center_get else 0 end) as base_salary,-- 基本工资
sum( case when budget_subject_code in('Y13045157','C0704005')then ft_value_center_get else 0 end) as human_resources_outsourcing_fee,-- 人力外包费用
sum( case when budget_subject_code in('Y13048177','C0705003')then ft_value_center_get else 0 end) as bonus,-- 提成
sum( case when budget_subject_code in('Y13061184','C0702001')then ft_value_center_get else 0 end) as external_training_fee,-- 外部培训费
sum( case when budget_subject_code in('Y13067228','C0705001')then ft_value_center_get else 0 end) as excellence_award_team_personal,-- 优秀奖励（含优秀团队/个人）
sum( case when budget_subject_code in('Y13068229','C0704003')then ft_value_center_get else 0 end) as employee_compensation,-- 员工赔偿金（含辞退、劳动事故/生育津贴/失业补偿费）
sum( case when budget_subject_code in('Y13069151','C0703001')then ft_value_center_get else 0 end) as corporate_culture_activity_fee,-- 企业文化活动费
sum( case when budget_subject_code in('Y13069182','C0703002')then ft_value_center_get else 0 end) as team_building_fee,-- 团建费
sum( case when budget_subject_code in('Y13085223','C0701002')then ft_value_center_get else 0 end) as housing_fund,-- 公积金
sum( case when budget_subject_code in('Y13085224','C0701003')then ft_value_center_get else 0 end) as work_injury_insurance,-- 工伤保险
sum( case when budget_subject_code in('Y13085225','C0701007')then ft_value_center_get else 0 end) as unemployment_insurance,-- 失业保险
sum( case when budget_subject_code in('Y13085221','C0701008')then ft_value_center_get else 0 end) as old_age_insurance,-- 养老保险
sum( case when budget_subject_code in('Y13085222','C0701009')then ft_value_center_get else 0 end) as medical_insurance,-- 医疗保险
sum( case when budget_subject_code in('Y13096232','C0706001')then ft_value_center_get else 0 end) as overtime_meal_fee,-- 加班餐费
sum( case when budget_subject_code in('Y13096106','C0706002')then ft_value_center_get else 0 end) as overtime_transportation_fee,-- 加班交通费
sum( case when budget_subject_code in('Y13096108','C0706005')then ft_value_center_get else 0 end) as festival_welfare_fee,-- 节日福利费
sum( case when budget_subject_code in('Y13096178','C0706006')then ft_value_center_get else 0 end) as health_checkup_fee,-- 体检费
sum( case when budget_subject_code in('Y13096231','C0701010')then ft_value_center_get else 0 end) as accident_insurance,-- 意外险
sum( case when budget_subject_code in('Y13096230','C0706004')then ft_value_center_get else 0 end) as employee_care_fee,-- 员工慰问费
sum( case when budget_subject_code in('Y13100129','C0707001')then ft_value_center_get else 0 end) as headhunter_fee,-- 猎头费
sum( case when budget_subject_code in('Y13100237','C0707002')then ft_value_center_get else 0 end) as recruitment_fee,-- 招聘费用（含常规平台服务费、场地及资料费，不含差旅）
sum( case when budget_subject_code in('Y06026135','C0804002')then ft_value_center_get else 0 end) as internal_product_usage_commented_again,-- 内部产品领用3
sum( case when budget_subject_code in('Y11049107','C1602001')then ft_value_center_get else 0 end) as testing_fee,-- 检测费
sum( case when budget_subject_code in('Y11049220','C0201008')then ft_value_center_get else 0 end) as r_and_d_external_testing_fee,-- 研发委外检测费
sum( case when budget_subject_code in('Y11070049','C1505001')then ft_value_center_get else 0 end) as vehicle_insurance_registration_fee,-- 车辆保险/年审费
sum( case when budget_subject_code in('Y11070050','C1505002')then ft_value_center_get else 0 end) as vehicle_maintenance_repair_fee,-- 车辆保养/维修费
sum( case when budget_subject_code in('Y11070213','C1505004')then ft_value_center_get else 0 end) as admin_vehicle_fuel_fee,-- 行政车辆油费
sum( case when budget_subject_code in('Y11071035','C1603001')then ft_value_center_get else 0 end) as standardization_certification_fee,-- 标准化体系认证费（管理类，信息化类、生产安全类）
sum( case when budget_subject_code in('Y11071252','C1603005')then ft_value_center_get else 0 end) as product_certification_fee,-- 专业服务费-产品认证费用
sum( case when budget_subject_code in('Y11088206','C1605001')then ft_value_center_get else 0 end) as association_membership_fee,-- 协会会费
sum( case when budget_subject_code in('Y11089152','C1401002')then ft_value_center_get else 0 end) as channel_system_service_fee,-- 渠道系统服务使用费
sum( case when budget_subject_code in('Y11089189','C1401003')then ft_value_center_get else 0 end) as network_service_fee,-- 网络服务费
sum( case when budget_subject_code in('Y11089208','C1401004')then ft_value_center_get else 0 end) as information_service_purchase,-- 信息服务采购
sum( case when budget_subject_code in('Y11089210','C1402001')then ft_value_center_get else 0 end) as it_project_construction_fee,-- 信息化项目建设费
sum( case when budget_subject_code in('Y11089209','C1403001')then ft_value_center_get else 0 end) as it_system_maintenance_fee,-- 信息化系统运维费
sum( case when budget_subject_code in('Y11092187')then ft_value_center_get else 0 end) as sample_purchase_fee,-- 外购取样费
sum( case when budget_subject_code in('Y11091067','C1602003')then ft_value_center_get else 0 end) as third_party_factory_audit_fee,-- 第三方验厂费
sum( case when budget_subject_code in('Y11108130','C1504001')then ft_value_center_get else 0 end) as legal_fee,-- 律师费
sum( case when budget_subject_code in('Y11108145','C1504002')then ft_value_center_get else 0 end) as other_legal_services,-- 其他法律服务
sum( case when budget_subject_code in('Y11108149','C1710002')then ft_value_center_get else 0 end) as other_consultancy_fee,-- 其他咨询费
sum( case when budget_subject_code in('Y11108158','C0708001')then ft_value_center_get else 0 end) as hr_consultancy_fee,-- 人力咨询费
sum( case when budget_subject_code in('Y11108159','C1705001')then ft_value_center_get else 0 end) as regular_audit_fee,-- 日常审计费（财务/财损审计、税务审计、高新税审）
sum( case when budget_subject_code in('Y11108173','C1504003')then ft_value_center_get else 0 end) as litigation_fee,-- 诉讼费
sum( case when budget_subject_code in('Y11108219','C0205001')then ft_value_center_get else 0 end) as r_and_d_external_consultancy_fee,-- 研发外部咨询服务费
sum( case when budget_subject_code in('Y11108250','C1705002')then ft_value_center_get else 0 end) as special_audit_service_fee,-- 专项审计及服务费（含上市审计、尽调、上市顾问服务）
sum( case when budget_subject_code in('Y11108251','C1710001')then ft_value_center_get else 0 end) as special_consultancy_fee,-- 专项咨询服务费（含各专题外部咨询及服务）
sum( case when budget_subject_code in('Y05021088','C1505003')then ft_value_center_get else 0 end) as toll_bridge_parking_fee,-- 过路过桥/停车费
sum( case when budget_subject_code in('Y05021225','C1511001')then ft_value_center_get else 0 end) as business_trip_transportation_fee,-- 因公外出交通费
sum( case when budget_subject_code in('Y08060054','C1506003')then ft_value_center_get else 0 end) as pest_control_fee,-- 虫害费
sum( case when budget_subject_code in('Y08060131','C1506005')then ft_value_center_get else 0 end) as green_plant_fee,-- 绿植费
sum( case when budget_subject_code in('Y08060136','C1506001')then ft_value_center_get else 0 end) as large_bucket_water_fee,-- 内部大桶装水费
sum( case when budget_subject_code in('Y21109027')then ft_value_center_get else 0 end) as office_equipment_furniture,-- 办公设备及家具1
sum( case when budget_subject_code in('Y21109212','C1805007')then ft_value_center_get else 0 end) as admin_vehicle,-- 行政车辆
sum( case when budget_subject_code in('Y21109104','C1805004')then ft_value_center_get else 0 end) as computer_related_products,-- 计算机及相关产品
sum( case when budget_subject_code in('Y21109150','C1805005')then ft_value_center_get else 0 end) as other_assets,-- 其他资产
sum( case when budget_subject_code in('Y21109186','C1805006')then ft_value_center_get else 0 end) as trademark_purchase_fee,-- 外部商标购买
sum( case when budget_subject_code in('Y21109218','C1805001')then ft_value_center_get else 0 end) as r_and_d_equipment_purchase_fee,-- 研发设备购置费
sum( case when budget_subject_code in('Y21110005','C1806002')then ft_value_center_get else 0 end) as it_equipment,-- IT设备
sum( case when budget_subject_code in('Y21110027','C1805002')then ft_value_center_get else 0 end) as office_equipment_furniture_commented,-- 办公设备及家具2
sum( case when budget_subject_code in('Y21110048','C1806005')then ft_value_center_get else 0 end) as vehicle_commented,-- 车辆
sum( case when budget_subject_code in('Y21110146','C1806004')then ft_value_center_get else 0 end) as other_equipment,-- 其他设备
sum( case when budget_subject_code in('Y21110217','C1806003')then ft_value_center_get else 0 end) as r_and_d_equipment_commented,-- 研发设备
sum( case when budget_subject_code in('Y01012029','C1501002')then ft_value_center_get else 0 end) as office_supplies_fee,-- 办公用品费
sum( case when budget_subject_code in('Y01012214','C1501003')then ft_value_center_get else 0 end) as admin_low_consumables,-- 行政低耗品
sum( case when budget_subject_code in('Y01012116','C1708001')then ft_value_center_get else 0 end) as start_up_special_fees,-- 开办费及特殊费用
sum( case when budget_subject_code in('Y01012144','C1501004')then ft_value_center_get else 0 end) as other_office_fees,-- 其他办公费
sum( case when budget_subject_code in('Y01012160','C1506004')then ft_value_center_get else 0 end) as daily_necessities_fee,-- 日用品费用
sum( case when budget_subject_code in('Y01012179','C1007011')then ft_value_center_get else 0 end) as barcode_application_fee,-- 条码申请费用
sum( case when budget_subject_code in('Y01012195','C1501005')then ft_value_center_get else 0 end) as document_copying_fee,-- 文件影印费
sum( case when budget_subject_code in('Y15011254')then ft_value_center_get else 0 end) as font_image_copyright_purchase_fee,-- 字体/图库等版权采购费1
sum( case when budget_subject_code in('Y01044100','C1507001')then ft_value_center_get else 0 end) as meeting_conference_fee,-- 会议会务费（含内、外部）
sum( case when budget_subject_code in('Y01058215','C1501008')then ft_value_center_get else 0 end) as admin_express_fee,-- 行政快递费
sum( case when budget_subject_code in('Y01082147','C1509001')then ft_value_center_get else 0 end) as other_communication_fees,-- 其他通讯费
sum( case when budget_subject_code in('Y01084028','C1501001')then ft_value_center_get else 0 end) as office_equipment_maintenance_fee,-- 办公设备维修费
sum( case when budget_subject_code in('Y09036132','C0301002')then ft_value_center_get else 0 end) as media_framework_cooperation,-- 媒体框架合作
sum( case when budget_subject_code in('Y09036190','C0301001')then ft_value_center_get else 0 end) as online_media_distribution,-- 网络媒体普发投放
sum( case when budget_subject_code in('Y09037085','C0302001')then ft_value_center_get else 0 end) as pr_maintenance_business_entertainment,-- 公关维护及业务招待费（不含专项认证费）
sum( case when budget_subject_code in('Y09055123','C0305001')then ft_value_center_get else 0 end) as customer_relationship_maintenance,-- 客情维护
sum( case when budget_subject_code in('Y09093126','C1510001')then ft_value_center_get else 0 end) as gift_fee,-- 礼品费
sum( case when budget_subject_code in('Y09093222','C1510002')then ft_value_center_get else 0 end) as business_entertainment_fee,-- 业务招待费
sum( case when budget_subject_code in('Y09095013','C0304001')then ft_value_center_get else 0 end) as toB_public_opinion_maintenance,-- toB舆情维护
sum( case when budget_subject_code in('Y09095022','C0304002')then ft_value_center_get else 0 end) as toC_public_opinion_maintenance ,-- toC舆情维护
sum( case when budget_subject_code in('Y12041093')then ft_value_center_get else 0 end) as contract_margin_protection_2C, -- 	合同条款-毛保(2C)

sum(case when budget_subject_code in('Y14073232')then ft_value_center_get else 0 end ) as raw_material,-- 原料
sum(case when budget_subject_code in('Y14073030')then ft_value_center_get else 0 end ) as packaging_material_1,-- 包材1
sum(case when budget_subject_code in('Y06031032')then ft_value_center_get else 0 end ) as packaging_material_sampling_fee,-- 包材打样费
sum(case when budget_subject_code in('Y06103242')then ft_value_center_get else 0 end ) as plate_making_fee,-- 制版费
sum(case when budget_subject_code in('Y18024051')then ft_value_center_get else 0 end ) as achievement_award_declaration_paper_publication_fee,-- 成果/奖项申报/论文发表费
sum(case when budget_subject_code in('Y10019041')then ft_value_center_get else 0 end ) as compensation_due_to_warehouse_distribution,-- 仓配原因类赔付
sum(case when budget_subject_code in('Y10079165')then ft_value_center_get else 0 end ) as compensation_due_to_order_review,-- 审单原因类赔付
sum(case when budget_subject_code in('Y10079236')then ft_value_center_get else 0 end ) as compensation_due_to_operations,-- 运营原因类赔付
sum(case when budget_subject_code in('Y10079148')then ft_value_center_get else 0 end ) as compensation_due_to_other,-- 其他原因类赔付
sum(case when budget_subject_code in('Y10079118')then ft_value_center_get else 0 end ) as compensation_due_to_customer_service,-- 客服服务原因类赔付
sum(case when budget_subject_code in('Y10079119')then ft_value_center_get else 0 end ) as customer_service_evaluation_fee,-- 客服评价费用
sum(case when budget_subject_code in('Y14015034')then ft_value_center_get else 0 end ) as scrap_cost,-- 报废成本
sum(case when budget_subject_code in('Y05021039')then ft_value_center_get else 0 end ) as meal_subsidy,-- 餐费补贴
sum(case when budget_subject_code in('Y05021180')then ft_value_center_get else 0 end ) as railway_air_traffic,-- 铁路航空交通
sum(case when budget_subject_code in('Y05021166')then ft_value_center_get else 0 end ) as city_traffic,-- 市内交通
sum(case when budget_subject_code in('Y05021170')then ft_value_center_get else 0 end ) as private_car_for_public_use_subsidy,-- 私车公用补贴
sum(case when budget_subject_code in('Y05021247')then ft_value_center_get else 0 end ) as accommodation_fee,-- 住宿费
sum(case when budget_subject_code in('Y05021086')then ft_value_center_get else 0 end ) as highway_waterway_traffic,-- 公路水路交通
sum(case when budget_subject_code in('Y08080068')then ft_value_center_get else 0 end ) as electricity_fee,-- 电费
sum(case when budget_subject_code in('Y08034081')then ft_value_center_get else 0 end ) as house_rent,-- 房租费
sum(case when budget_subject_code in('Y08107103')then ft_value_center_get else 0 end ) as infrastructure_repair_fee,-- 基建维修费
sum(case when budget_subject_code in('Y08080169')then ft_value_center_get else 0 end ) as water_fee,-- 水费
sum(case when budget_subject_code in('Y08034197')then ft_value_center_get else 0 end ) as property_management_fee,-- 物业管理费
sum(case when budget_subject_code in('Y08107253')then ft_value_center_get else 0 end ) as decoration_fee,-- 装修费
sum(case when budget_subject_code in('Y03017109')then ft_value_center_get else 0 end ) as financial_institution_service_charge,-- 金融机构手续费（含银行）
sum(case when budget_subject_code in('Y03017191')then ft_value_center_get else 0 end ) as online_bank_transaction_fee,-- 网银交易手续费
sum(case when budget_subject_code in('Y03017127')then ft_value_center_get else 0 end ) as interest_income,-- 利息收入
sum(case when budget_subject_code in('Y02014031')then ft_value_center_get else 0 end ) as packaging_material_scrap_cost,-- 包材报废成本
sum(case when budget_subject_code in('Y02098233')then ft_value_center_get else 0 end ) as raw_material_scrap_cost,-- 原料报废成本
sum(case when budget_subject_code in('Y0400101')then ft_value_center_get else 0 end ) as reverse_operation_fee,-- 逆向操作费
sum(case when budget_subject_code in('Y0400201')then ft_value_center_get else 0 end ) as loading_unloading_operation_fee,-- 装卸操作费
sum(case when budget_subject_code in('Y0400301')then ft_value_center_get else 0 end ) as performance_penalty_income,-- 绩效罚款收入
sum(case when budget_subject_code in('Y0400401')then ft_value_center_get else 0 end ) as product_inventory_loss_compensation,-- 商品盘点损失赔付
sum(case when budget_subject_code in('Y0400501')then ft_value_center_get else 0 end ) as drop_shipping_service_fee,-- 一件代发服务费
sum(case when budget_subject_code in('Y0400601')then ft_value_center_get else 0 end ) as carton_recycling_income,-- 纸箱回收收入
sum(case when budget_subject_code in('Y06013030')then ft_value_center_get else 0 end ) as packaging_material_2,-- 包材2
sum(case when budget_subject_code in('Y06022044')then ft_value_center_get else 0 end ) as product_design_service_fee,-- 产品设计服务费
sum(case when budget_subject_code in('Y06097231')then ft_value_center_get else 0 end ) as raw_materials,-- 原材料
sum(case when budget_subject_code in('Y06108248')then ft_value_center_get else 0 end ) as expert_consulting_fee,-- 专家咨询费
sum(case when budget_subject_code in('Y14025052')then ft_value_center_get else 0 end ) as finished_goods_purchase,-- 成品采购
sum(case when budget_subject_code in('Y17072194')then ft_value_center_get else 0 end ) as outsourced_joint_rnd_fee,-- 委外联合研发费
sum(case when budget_subject_code in('Y0400701')then ft_value_center_get else 0 end ) as offline_logistics_fee,-- 线下物流费用
sum(case when budget_subject_code in('Y06090216')then ft_value_center_get else 0 end ) as r_d_consumables,-- 研发耗材
sum(case when budget_subject_code in('Y14073161')then ft_value_center_get else 0 end ) as product_cost,-- 商品成本
sum(case when budget_subject_code in('Y0400801')then ft_value_center_get else 0 end ) as warehouse_rent,-- 仓租费
sum(case when budget_subject_code in('Y0400901')then ft_value_center_get else 0 end ) as offline_tob_return_freight,-- 线下TOB退货运费
sum(case when budget_subject_code in('Y04001001')then ft_value_center_get else 0 end ) as consumables_fee,-- 耗材费
sum(case when budget_subject_code in('Y04001101')then ft_value_center_get else 0 end ) as outbound_operation_fee,-- 出库操作费
sum(case when budget_subject_code in('Y04001201')then ft_value_center_get else 0 end ) as value_added_service_fee,-- 增值服务费
sum(case when budget_subject_code in('Y04001301')then ft_value_center_get else 0 end ) as warehouse_transfer_fee,-- 仓间调拨费用
sum(case when budget_subject_code in('Y04001401')then ft_value_center_get else 0 end ) as express_fee_1,-- 快递费1
sum(case when budget_subject_code in('Y04001501')then ft_value_center_get else 0 end ) as product_inventory_loss,-- 商品盘点损失
sum(case when budget_subject_code in('Y06031053')then ft_value_center_get else 0 end ) as finished_sample_production_fee,-- 成品打样费
sum(case when budget_subject_code in('Y06092113')then ft_value_center_get else 0 end ) as competitor_purchase_fee,-- 竞品采购费
sum(case when budget_subject_code in('Y18016036')then ft_value_center_get else 0 end ) as standard_setting_fee,-- 标准制订费
sum(case when budget_subject_code in('Y18106249')then ft_value_center_get else 0 end ) as patent_fee,-- 专利费
sum(case when budget_subject_code in('Y16083246')then ft_value_center_get else 0 end ) as guanghe_commission, -- 光合
sum(case when budget_subject_code in('Y13045103')then ft_value_center_get else 0 end ) as base_salary_test -- '基本工资_预估'

from ads.bud_fin_import_items_middle_ft_last
WHERE   biz_day>='2024-12-01'
group by
biz_day ,
shop_id,
business_cate,
expense_center_code,
expense_center,
department_1,
department_2,
department_3,
department_4

-- 运费表
UNION all
select
      	left(t1.send_time,10) as `cal_date`,											-- 统计日期
        upper(t1.shop_code) as shop_code,                                                 -- 店铺id
        ifnull(t1.business_cate,'') as business_cate,                                           -- 业务分类
      	t1.`expense_center_code`,									-- 费用中心编码
      	t1.`expense_center`,										-- 费用中心名称
      	t1.`department_1`,										-- 一级部门（组织架构）
      	t1.`department_2`,										-- 二级渠道（组织架构）
      	t1.`department_3`,										-- 三级渠道
      	t1.`department_4`,										-- 四级渠道（店铺名称+业务分类）
      	0 as  `rspgmv`, 								-- rspgmv
      	0 as `gmv`,										-- gmv
      	0 as `refund_amount`, 					-- 退款金额
 0 as `cost_gmv_amt`,
       0 as `cost_rfd_amt`,
       0 as `cost_gsv`,
      	SUM(t1.picking_fee_total + t1.logistic_fee_total) as shipping_cost,
      	0 as gsv,						-- gsv
      	0 as `supply_price_gmv`, 									-- 	供货价
     	0 `rsp_gmv_taste`, 				-- rspgmv_尝鲜装拉新
     	0 `gmv_taste`, 						-- gmv_尝鲜装拉新
      	0 as `refund_amount_taste`, 		-- 退款金额_尝鲜装拉新
      	0 as gsv_taste, -- gsv_尝鲜装拉新
0 as`gsv_supply_price`, -- GSV-供货价
0 as`refund_amount_supply_price`, -- 退款金额-供货价
0 as`gmv_supply_price_taste`, -- GMV-供货价尝鲜装拉新
0 as`refund_amount_supply_price_taste`, -- 退款金额-供货价尝鲜装拉新
0 as`gsv_supply_price_taste`, -- GSV-供货价尝鲜装拉新
0 as`tax_with_union_funds_and_disability_insurance`, -- 税金（含工会经费划拨、残保金）
0 as`non_operating_income`, -- 营业外收入
0 as`other_business_income`, -- 其他业务收入
0 as`other_costs`, -- 其他成本
0 as`deposit`, -- 保证金
0 as`tax_arrears_penalty`, -- 税收滞纳金罚款

      	0 as 	`short_video_commission`	, -- 	达人短视频线下返佣
	  	0 as 	`live_stream_offline_commission`	, -- 	达人直播线下返佣
	  	0 as 	`short_video_darren_commission`	, -- 	短视频达人佣金
	  	0 as 	`duoduo_commission`	, -- 	多多客佣金
		0 as 	`haoyiku_commission`	, -- 	好衣库达人佣金
		0 as 	`jingtaoke_commission`	, -- 	京挑客佣金
		0 as 	`private_domain_service_fee`	, -- 	私域外包代运营费
		0 as 	`taobao_commission`	, -- 	淘宝客佣金
		0 as 	`weixiangke_commission`	, -- 	唯享客佣金
		0 as 	`commission`	, -- 	佣金
		0 as 	`live_stream_commission`	, -- 	直播达人佣金
		0 as 	`short_video_service_fee`	, -- 	达人短视频服务费
		0 as 	`live_stream_service_fee`	, -- 	达人直播服务费
		0 as 	`cid_ud_ad_spend`	, -- 	CID、UD信息流投放
		0 as 	`ka_barcode_fee`	, -- 	KA卖进条码费
		0 as 	`otd_promotion_cost`	, -- 	OTD推广费用
		0 as 	`scene_promotion_cost`	, -- 	场景推广
		0 as 	`magnet_gold_pc`	, -- 	磁力金牛PC
		0 as 	`magnet_gold_mobile`	, -- 	磁力金牛移动
		0 as 	`douyin_doujia`	, -- 	抖音抖加
		0 as 	`douyin_qianchuan`	, -- 	抖音千川
		0 as 	`douyin_suixin`	, -- 	抖音随心推
		0 as 	`shopping_touchpoint`	, -- 	购物触点
		0 as 	`hai_tou`	, -- 	海投
		0 as 	`jingxiaozhi_recharge`	, -- 	京小智充值
		0 as 	`juiguang_platform`	, -- 	聚光平台
		0 as 	`kuai_che`	, -- 	快车
		0 as 	`joint_promotion_cost`	, -- 	联合推广
		0 as 	`star_shop_promotion`	, -- 	明星店铺推广
		0 as 	`brand_zone`	, -- 	品牌专区
		0 as 	`pinxiao_bao`	, -- 	品销宝
		0 as 	`full_site_promotion`	, -- 	全站推广
		0 as 	`search_promotion`	, -- 	搜索推广
		0 as 	`tencent_ad_spend`	, -- 	腾讯广告费用
		0 as 	`wanxiang_platform`	, -- 	万相台
		0 as 	`wechat_beans`	, -- 	微信豆
		0 as 	`offline_venue_rental`	, -- 	线下场地租用
		0 as 	`offline_instore_ad`	, -- 	线下店内广告费
		0 as 	`offline_exhibition_fee`	, -- 	线下外部参展费
		0 as 	`xiaohongshu_promotion`	, -- 	小红书推广费
		0 as 	`gravity_cube`	, -- 	引力魔方
		0 as 	`easy_consumables_purchase`	, -- 	易耗道具采购费用
		0 as 	`operation_buyer_show_maintenance`	, -- 	运营买家秀维护
		0 as 	`smart_targeting`	, -- 	智能投放
		0 as 	`zhitongche`	, -- 	直通车
      	0 as `gift_fee_ms`,						-- 赠品费用_MS赠品
      	0 as `gift_fee_bund`, 					-- 赠品费用_尝鲜装搭赠
      	0 as  `gift_fee_non_food_inventory`, 			-- 赠品费用_非食赠品-入库
      	0 as `non_food_gift_cost`, -- 非食赠品采购成本
      	0 as `gift_fee_formal_gift`, 	-- 赠品费用_正装赠品
      	0 as 	`ai_calling_cost`	, -- 	AI电话费用
		0 as 	`eka_consumption_card`	, -- 	EKA消费卡
		0 as 	`promo_resource_purchase`	, -- 	大促及爆品推广资源采买
		0 as 	`darren_activity_fee`	, -- 	达人活动费
		0 as 	`sms_cost`	, -- 	短信费用
		0 as 	`horizontal_screen_resource_position`	, -- 	横屏/资源位
		0 as 	`juhuasuan_subsidy_fee`	, -- 	聚划算、百亿补贴费用
		0 as 	`hot_wave_engine_service_fee`	, -- 	热浪引擎服务费
		0 as 	`new_customer_first_order_gift`	, -- 	新客首单礼金
		0 as 	`sales_promotion_incentive`	, -- 	促销员激励
		0 as 	`tp_service_fee`	, -- 	TP服务费
		0 as 	`tp_service_tax_diff`	, -- 	TP服务费税差
		0 as 	`refund_difference`	, -- 	退差价
		0 as 	`small_payment`	, -- 	小额打款
		0 as 	`gift_with_order_compensation`	, -- 	随箱礼及赠品补差
		0 as 	`offline_product_promotion_service_fee`	, -- 	线下产品推广服务费
		0 as 	`offline_consumer_promotion`	, -- 	线下消费者价格促销
		0 as 	`main_project_promotion`	, -- 	主推项目
		0 as 	`darren_sample_fee`	, -- 	达人样品费
		0 as 	`internal_product_usage`	, -- 	内部产品领用1
		0 as 	`contract_display_fee`	, -- 	合同条款-陈列费
		0 as 	`contract_rebate`	, -- 	合同条款-返利
		0 as 	`contract_fixed_fee`	, -- 	合同条款-固定费用
		0 as 	`contract_margin_protection`	, -- 	合同条款-毛保
		0 as 	`contract_other_fees`	, -- 	合同条款-其他费
		0 as 	`contract_new_store_entry_fee`	, -- 	合同条款-新店进场费
		0 as 	`huabei_fee`	, -- 	花呗手续费
		0 as 	`credit_card_fee`	, -- 	信用卡交易手续费
		0 as 	`shop_commission_rate`	, -- 	2C店铺扣点
		0 as 	`platform_software_service_fee`	, -- 	平台软件服务费
		0 as 	`freight_insurance`	, -- 	运费险
		0 as 	`warehouse_logistics_payout`	, -- 	仓储物流赔付扣款
		0 as 	`warehousing_loss_due_to_logistics`	, -- 	仓配原因类资损
		0 as 	`customer_service_travel_expense`	, -- 	客服差旅费用
		0 as 	`customer_service_salary`	, -- 	客服人力工资
		0 as 	`customer_service_outsourcing`	, -- 	客服人力外包
		0 as 	`customer_service_software_cost`	, -- 	客服软件费用
		0 as 	`agent_or_darren_payout`	, -- 	代理或达人责任类赔付
		0 as 	`breach_of_contract_payout`	, -- 	电商违约赔付费用
		0 as 	`business_loss_health_impact_payout`	, -- 	经营亏损、健康影响类赔付
		0 as 	`customer_service_quality_payout`	, -- 	售后赔付（质量）
		0 as 	`quality_payout`	, -- 	质量赔付
		0 as 	`quality_loss_due_to_quality`	, -- 	质量原因类资损
		0 as 	`copyright_application_fee`	, -- 	版权申请费
		0 as 	`copyright_purchase_fee`	, -- 	字体/图库等版权采购费
		0 as 	`price_control_rights_protection`	, -- 	控价维权
		0 as 	`service_entitlement_purchase_fee`	, -- 	会员等服务/权益采购费用
		0 as 	`outdoor_film_online_advertising`	, -- 	户外、影视综、线上广告
		0 as 	`brand_product_promo_production_fee`	, -- 	品牌/产品宣传片制作费
		0 as 	`business_cooperation_content_spread`	, -- 	商务合作、内容传播、营销物料等
		0 as 	`packaging_design_fee`	, -- 	包装设计费
		0 as 	`industrial_design_fee`	, -- 	工业设计费
		0 as 	`brand_design_fee`	, -- 	品牌设计费
		0 as 	`material_design_fee`	, -- 	物料设计费
		0 as 	`venue_rental_daily_expenses`	, -- 	场地租赁费、日常费用
		0 as 	`prop_purchase_fee`	, -- 	道具采购费
		0 as 	`model_fee`	, -- 	模特费
		0 as 	`video_shooting_fee`	, -- 	视频拍摄费
		0 as 	`photo_shooting_fee`	, -- 	图片拍摄费
		0 as 	`internal_product_usage_commented`	, -- 	内部产品领用2
		0 as 	`douyin_promotion`	, -- 	抖音推广
		0 as 	`channel_marketing`	, -- 	渠道营销
		0 as 	`brand_consulting_service_fee`	, -- 	品牌咨询服务费
		0 as 	`external_brand_advisory_fee`	, -- 	外部品牌定位/视觉/内容等顾问费
		0 as 	`base_salary`	, -- 	基本工资
        0 as 	`human_resources_outsourcing_fee`	, -- 	人力外包费用
        0 as 	`bonus`	, -- 	提成
        0 as 	`external_training_fee`	, -- 	外部培训费
        0 as 	`excellence_award_team_personal`	, -- 	优秀奖励（含优秀团队/个人）
        0 as 	`employee_compensation`	, -- 	员工赔偿金（含辞退、劳动事故/生育津贴/失业补偿费）
        0 as 	`corporate_culture_activity_fee`	, -- 	企业文化活动费
        0 as 	`team_building_fee`	, -- 	团建费
        0 as 	`housing_fund`	, -- 	公积金
        0 as 	`work_injury_insurance`	, -- 	工伤保险
        0 as 	`unemployment_insurance`	, -- 	失业保险
        0 as 	`old_age_insurance`	, -- 	养老保险
        0 as 	`medical_insurance`	, -- 	医疗保险
        0 as 	`overtime_meal_fee`	, -- 	加班餐费
        0 as 	`overtime_transportation_fee`	, -- 	加班交通费
        0 as 	`festival_welfare_fee`	, -- 	节日福利费
        0 as 	`health_checkup_fee`	, -- 	体检费
        0 as 	`accident_insurance`	, -- 	意外险
        0 as 	`employee_care_fee`	, -- 	员工慰问费
        0 as 	`headhunter_fee`	, -- 	猎头费
        0 as 	`recruitment_fee`	, -- 	招聘费用（含常规平台服务费、场地及资料费不含差旅）
        0 as 	`internal_product_usage_commented_again`	, -- 	内部产品领用3
        0 as 	`testing_fee`	, -- 	检测费
        0 as 	`r_and_d_external_testing_fee`	, -- 	研发委外检测费
        0 as 	`vehicle_insurance_registration_fee`	, -- 	车辆保险/年审费
        0 as 	`vehicle_maintenance_repair_fee`	, -- 	车辆保养/维修费
        0 as 	`admin_vehicle_fuel_fee`	, -- 	行政车辆油费
        0 as 	`standardization_certification_fee`	, -- 	标准化体系认证费（管理类信息化类、生产安全类）
        0 as 	`product_certification_fee`	, -- 	专业服务费-产品认证费用
        0 as 	`association_membership_fee`	, -- 	协会会费
        0 as 	`channel_system_service_fee`	, -- 	渠道系统服务使用费
        0 as 	`network_service_fee`	, -- 	网络服务费
        0 as 	`information_service_purchase`	, -- 	信息服务采购
        0 as 	`it_project_construction_fee`	, -- 	信息化项目建设费
        0 as 	`it_system_maintenance_fee`	, -- 	信息化系统运维费
        0 as 	`sample_purchase_fee`	, -- 	外购取样费
        0 as 	`third_party_factory_audit_fee`	, -- 	第三方验厂费
        0 as 	`legal_fee`	, -- 	律师费
        0 as 	`other_legal_services`	, -- 	其他法律服务
        0 as 	`other_consultancy_fee`	, -- 	其他咨询费
        0 as 	`hr_consultancy_fee`	, -- 	人力咨询费
        0 as 	`regular_audit_fee`	, -- 	日常审计费（财务/财损审计、税务审计、高新税审）
        0 as 	`litigation_fee`	, -- 	诉讼费
        0 as 	`r_and_d_external_consultancy_fee`	, -- 	研发外部咨询服务费
        0 as 	`special_audit_service_fee`	, -- 	专项审计及服务费（含上市审计、尽调、上市顾问服务）
        0 as 	`special_consultancy_fee`	, -- 	专项咨询服务费（含各专题外部咨询及服务）
        0 as 	`toll_bridge_parking_fee`	, -- 	过路过桥/停车费
        0 as 	`business_trip_transportation_fee`	, -- 	因公外出交通费
        0 as 	`pest_control_fee`	, -- 	虫害费
        0 as 	`green_plant_fee`	, -- 	绿植费
        0 as 	`large_bucket_water_fee`	, -- 	内部大桶装水费
        0 as 	`office_equipment_furniture`	, -- 	办公设备及家具
        0 as 	`admin_vehicle`	, -- 	行政车辆
        0 as 	`computer_related_products`	, -- 	计算机及相关产品
        0 as 	`other_assets`	, -- 	其他资产
        0 as 	`trademark_purchase_fee`	, -- 	外部商标购买
        0 as 	`r_and_d_equipment_purchase_fee`	, -- 	研发设备购置费
        0 as 	`it_equipment`	, -- 	IT设备
        0 as 	`office_equipment_furniture_commented`	, -- 	办公设备及家具
        0 as 	`vehicle_commented`	, -- 	车辆
        0 as 	`other_equipment`	, -- 	其他设备
        0 as 	`r_and_d_equipment_commented`	, -- 	研发设备
        0 as 	`office_supplies_fee`	, -- 	办公用品费
        0 as 	`admin_low_consumables`	, -- 	行政低耗品
        0 as 	`start_up_special_fees`	, -- 	开办费及特殊费用
        0 as 	`other_office_fees`	, -- 	其他办公费
        0 as 	`daily_necessities_fee`	, -- 	日用品费用
        0 as 	`barcode_application_fee`	, -- 	条码申请费用
        0 as 	`document_copying_fee`	, -- 	文件影印费
        0 as 	`font_image_copyright_purchase_fee`	, -- 	字体/图库等版权采购费
        0 as 	`meeting_conference_fee`	, -- 	会议会务费（含内、外部）
        0 as 	`admin_express_fee`	, -- 	行政快递费
        0 as 	`other_communication_fees`	, -- 	其他通讯费
        0 as 	`office_equipment_maintenance_fee`	, -- 	办公设备维修费
        0 as 	`media_framework_cooperation`	, -- 	媒体框架合作
        0 as 	`online_media_distribution`	, -- 	网络媒体普发投放
        0 as 	`pr_maintenance_business_entertainment`	, -- 	公关维护及业务招待费（不含专项认证费）
        0 as 	`customer_relationship_maintenance`	, -- 	客情维护
        0 as 	`gift_fee`	, -- 	礼品费
        0 as 	`business_entertainment_fee`	, -- 	业务招待费
        0 as 	`toB_public_opinion_maintenance`	, -- 	toB舆情维护
        0 as 	`toC_public_opinion_maintenance`,	  -- 	toC舆情维护
    0 as 	`contract_margin_protection_2C`	,  -- 	合同条款-毛保(2C)
0 as`raw_material`, -- 原料
0 as`packaging_material_1`, -- 包材1
0 as`packaging_material_sampling_fee`, -- 包材打样费
0 as`plate_making_fee`, -- 制版费
0 as`achievement_award_declaration_paper_publication_fee`, -- 成果/奖项申报/论文发表费
0 as`compensation_due_to_warehouse_distribution`, -- 仓配原因类赔付
0 as`compensation_due_to_order_review`, -- 审单原因类赔付
0 as`compensation_due_to_operations`, -- 运营原因类赔付
0 as`compensation_due_to_other`, -- 其他原因类赔付
0 as`compensation_due_to_customer_service`, -- 客服服务原因类赔付
0 as`customer_service_evaluation_fee`, -- 客服评价费用
0 as`scrap_cost`, -- 报废成本
0 as`meal_subsidy`, -- 餐费补贴
0 as`railway_air_traffic`, -- 铁路航空交通
0 as`city_traffic`, -- 市内交通
0 as`private_car_for_public_use_subsidy`, -- 私车公用补贴
0 as`accommodation_fee`, -- 住宿费
0 as`highway_waterway_traffic`, -- 公路水路交通
0 as`electricity_fee`, -- 电费
0 as`house_rent`, -- 房租费
0 as`infrastructure_repair_fee`, -- 基建维修费
0 as`water_fee`, -- 水费
0 as`property_management_fee`, -- 物业管理费
0 as`decoration_fee`, -- 装修费
0 as`financial_institution_service_charge`, -- 金融机构手续费（含银行）
0 as`online_bank_transaction_fee`, -- 网银交易手续费
0 as`interest_income`, -- 利息收入
0 as`packaging_material_scrap_cost`, -- 包材报废成本
0 as`raw_material_scrap_cost`, -- 原料报废成本
0 as`reverse_operation_fee`, -- 逆向操作费
0 as`loading_unloading_operation_fee`, -- 装卸操作费
0 as`performance_penalty_income`, -- 绩效罚款收入
0 as`product_inventory_loss_compensation`, -- 商品盘点损失赔付
0 as`drop_shipping_service_fee`, -- 一件代发服务费
0 as`carton_recycling_income`, -- 纸箱回收收入
0 as`packaging_material_2`, -- 包材2
0 as`product_design_service_fee`, -- 产品设计服务费
0 as`raw_materials`, -- 原材料
0 as`expert_consulting_fee`, -- 专家咨询费
0 as`finished_goods_purchase`, -- 成品采购
0 as`outsourced_joint_rnd_fee`, -- 委外联合研发费
0 as`offline_logistics_fee`, -- 线下物流费用
0 as`r_d_consumables`, -- 研发耗材
0 as`product_cost`, -- 商品成本
0 as`warehouse_rent`, -- 仓租费
0 as`offline_tob_return_freight`, -- 线下TOB退货运费
0 as`consumables_fee`, -- 耗材费
0 as`outbound_operation_fee`, -- 出库操作费
0 as`value_added_service_fee`, -- 增值服务费
0 as`warehouse_transfer_fee`, -- 仓间调拨费用
0 as`express_fee_1`, -- 快递费1
0 as`product_inventory_loss`, -- 商品盘点损失
0 as`finished_sample_production_fee`, -- 成品打样费
0 as`competitor_purchase_fee`, -- 竞品采购费
0 as`standard_setting_fee`, -- 标准制订费
0 as`patent_fee`, -- 专利费
0 as `guanghe_commission` ,-- 光合
0 as `base_salary_test` -- '基本工资_预估'
 FROM dws.`ads_trade_fee_report` t1
 GROUP BY
        left(t1.send_time,10),											-- 统计日期
        upper(t1.shop_code) ,                                                 -- 店铺id
        ifnull(t1.business_cate,'') ,                                           -- 业务分类
      	t1.`expense_center_code`,									-- 费用中心编码
      	t1.`expense_center`,										-- 费用中心名称
      	t1.`department_1`,										-- 一级部门（组织架构）
      	t1.`department_2`,										-- 二级渠道（组织架构）
      	t1.`department_3`,										-- 三级渠道
      	t1.`department_4`									-- 四级渠道（店铺名称+业务分类）



)
group by
	`cal_date`	, -- 	日期
    upper(shop_code),-- 店铺id
    ifnull(`business_cate`,''),
	`expense_center_code`	, -- 	费用中心编号
	`expense_center`	, -- 	费用中心名称
	`department_1`	, -- 	一级部门（组织架构）
	`department_2`	, -- 	二级渠道（组织架构）
	`department_3`	, -- 	三级渠道
	`department_4`	 -- 	四级渠道（店铺名称+业务分类）
;


-- -- 和ads表合并 2025.3.1之后
-- -- shipping_cost  运费 预算编码15

-- UPDATE ads.financial_ledger_report_metrics a
-- JOIN (
--     SELECT
--         t1.send_time,  -- 支付日期
--         t1.shop_code,
--         t1.business_cate,  -- 业务分类
--         t1.`department_1`,  -- 一级部门（组织架构）
--         t1.`department_2`,  -- 二级渠道（组织架构）
--         t1.`department_3`,  -- 三级渠道
--         t1.`department_4`,  -- 四级渠道（店铺名称+业务分类）
--         t1.`expense_center_code`,
--         SUM(t1.picking_fee_total + t1.logistic_fee_total) AS shipping_cost
--     FROM dws.`ads_trade_fee_report` t1
--     GROUP BY
--         t1.send_time,  -- 支付日期
--         t1.shop_code,
--         t1.business_cate,  -- 业务分类
--         t1.`expense_center_code`
-- ) b
-- ON
--     a.cal_date = b.send_time  -- 支付日期
--     AND a.shop_id = b.shop_code
--     AND ifnull(a.business_cate,'') =ifnull(b.business_cate,'')  -- 业务分类
--     AND a.`expense_center_code` = b.`expense_center_code`  -- 费用中心编码
-- SET
--     a.shipping_cost = b.shipping_cost
--     a.gsv =ifnull(a.gsv,0)+ b.shipping_cost

-- ;


