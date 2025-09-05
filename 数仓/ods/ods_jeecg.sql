CREATE TABLE wl_bill (
    id                  varchar(36) not null primary key,
    create_by           varchar(50) null comment '创建人',
    create_time         datetime    null comment '创建日期',
    update_by           varchar(50) null comment '更新人',
    update_time         datetime    null comment '更新日期',
    sys_org_code        varchar(64) null comment '所属部门',
    billing_month DATE COMMENT '账单月份',
    internal_order_number VARCHAR(50) COMMENT '内部订单号',
    warehouse_code VARCHAR(20) COMMENT '分仓编码',
    warehouse_name VARCHAR(100) COMMENT '【通用】仓库名称',
    temperature_type ENUM('常温', '冷链') COMMENT '常温/冷链',
    first_level_center VARCHAR(50) COMMENT '一级中心/部门',
    second_level_channel VARCHAR(50) COMMENT '二级渠道',
    third_level_channel VARCHAR(50) COMMENT '三级渠道',
    cost_center VARCHAR(50) COMMENT '成本中心',
    total_warehouse_rent DECIMAL(12,2) COMMENT '总仓租（2B+2C）',
    warehouse_rent_tob DECIMAL(12,2) COMMENT '仓租费-TOB',
    total_handling_fee DECIMAL(12,2) COMMENT '总装卸费（2B+2C）',
    total_2c_outbound_quantity INT COMMENT '总2C出库数量',
    total_2b_outbound_quantity INT COMMENT '总2B出库数量',
    inbound_handling_fee DECIMAL(12,2) COMMENT '装卸(入库操作费)',
    transfer_handling_fee DECIMAL(12,2) COMMENT '仓间调拨装卸（入库/出库）',
    tob_self_pickup_fee DECIMAL(12,2) COMMENT 'TOB自提操作费',
    toc_transfer_pickup_fee DECIMAL(12,2) COMMENT 'TOC调拨自提操作费',
    interception_fee DECIMAL(12,2) COMMENT '拦截费用',
    return_handling_fee DECIMAL(12,2) COMMENT '退件操作费',
    combination_fee DECIMAL(12,2) COMMENT '组合',
    gift_box_unpacking_fee DECIMAL(12,2) COMMENT '拆礼盒',
    shrink_wrapping_fee DECIMAL(12,2) COMMENT '塑封费用',
    labeling_fee DECIMAL(12,2) COMMENT '贴标费用',
    secondary_inspection_fee DECIMAL(12,2) COMMENT '二次全检费用',
    coding_fee DECIMAL(12,2) COMMENT '喷码费',
    normal_shrink_wrapping_fee DECIMAL(12,2) COMMENT '常温塑封操作费',
    carton_recycling_fee DECIMAL(12,2) COMMENT '纸箱回收',
    deduction_fee DECIMAL(12,2) COMMENT '扣款',
    logistics_compensation DECIMAL(12,2) COMMENT '物流赔偿',
    other_fees DECIMAL(12,2) COMMENT '其他',
    relocation_fee DECIMAL(12,2) COMMENT '搬仓/撤仓费'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='仓储物流-仓库其他对账单';



CREATE TABLE logistics_settlement (
    id                  varchar(36) not null primary key,
    create_by           varchar(50) null comment '创建人',
    create_time         datetime    null comment '创建日期',
    update_by           varchar(50) null comment '更新人',
    update_time         datetime    null comment '更新日期',
    sys_org_code        varchar(64) null comment '所属部门',
    category VARCHAR(50) COMMENT '类别',
    serial_number INT COMMENT '序号',
    logistics_company VARCHAR(100) COMMENT '物流公司',
    follower VARCHAR(50) COMMENT '跟单人',
    order_creator VARCHAR(50) COMMENT '下单人',
    order_number VARCHAR(50) COMMENT '订单号',
    outbound_number VARCHAR(50) COMMENT '出库单号',
    inbound_number VARCHAR(50) COMMENT '入库单号',
    order_date DATE COMMENT '下单日期',
    pickup_date DATE COMMENT '提货日期',
    outbound_date DATE COMMENT '出库日期',
    sign_date DATE COMMENT '签收日期',
    factory_warehouse_name VARCHAR(100) COMMENT '工厂名称/仓库名称',
    factory_warehouse_address VARCHAR(255) COMMENT '工厂地址/仓库地址',
    origin_station VARCHAR(100) COMMENT '始发站',
    receiver VARCHAR(100) COMMENT '收货人',
    receiver_address VARCHAR(255) COMMENT '收货地址',
    destination_station VARCHAR(100) COMMENT '目的站',
    settlement_destination VARCHAR(100) COMMENT '结算目的站',
    receiving_warehouse VARCHAR(100) COMMENT '收货仓库',
    vehicle_type VARCHAR(50) COMMENT '车型',
    transport_storage_type VARCHAR(50) COMMENT '运输储存类型',
    logistics_number VARCHAR(50) COMMENT '物流单号',
    driver_name VARCHAR(50) COMMENT '司机姓名',
    license_plate VARCHAR(20) COMMENT '车牌号',
    settlement_method VARCHAR(50) COMMENT '结算方式',
    transport_method VARCHAR(50) COMMENT '运输方式',
    goods_details TEXT COMMENT '货品明细',
    goods_quantity INT COMMENT '商品数量',
    box_count INT COMMENT '箱数',
    weight DECIMAL(10,2) COMMENT '重量(kg)',
    volume DECIMAL(10,3) COMMENT '体积(m³)',
    weight_price DECIMAL(10,2) COMMENT '重量单价',
    volume_price DECIMAL(10,2) COMMENT '体积单价',
    base_price DECIMAL(10,2) COMMENT '起步价',
    weight_freight DECIMAL(12,2) COMMENT '重量运费',
    volume_freight DECIMAL(12,2) COMMENT '体积运费',
    larger_freight DECIMAL(12,2) COMMENT '取大(运费)',
    settlement_freight DECIMAL(12,2) COMMENT '结算运费',
    other_fees DECIMAL(12,2) COMMENT '其他费用',
    fee_remark TEXT COMMENT '费用备注',
    damage_deduction DECIMAL(12,2) COMMENT '破损扣款',
    final_settlement_freight DECIMAL(12,2) COMMENT '结算运费',
    cost_center VARCHAR(50) COMMENT '费用中心',
    channel VARCHAR(50) COMMENT '渠道',
    brand VARCHAR(50) COMMENT '品牌'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='仓储物流-物流对账单';


CREATE TABLE logistics_company_standard (
    id                  varchar(36) not null primary key,
    create_by           varchar(50) null comment '创建人',
    create_time         datetime    null comment '创建日期',
    update_by           varchar(50) null comment '更新人',
    update_time         datetime    null comment '更新日期',
    sys_org_code        varchar(64) null comment '所属部门',
    company_name VARCHAR(100) COMMENT '名称',
    standard_express_code VARCHAR(50) COMMENT '标准快递编码',
    company_code VARCHAR(50) COMMENT '编号',
    logistics_company VARCHAR(100) COMMENT '物流公司',
    volumetric_factor DECIMAL(10,3) COMMENT '计抛系数',
    volumetric_weight_algorithm VARCHAR(255) COMMENT '体积重量算法'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='仓储物流-计抛系数';


CREATE TABLE express_freight_rate (
    id                  varchar(36) not null primary key,
    create_by           varchar(50) null comment '创建人',
    create_time         datetime    null comment '创建日期',
    update_by           varchar(50) null comment '更新人',
    update_time         datetime    null comment '更新日期',
    sys_org_code        varchar(64) null comment '所属部门',
    version_date DATE COMMENT '版本日期',
    company VARCHAR(100) COMMENT '公司',
    warehouse_name VARCHAR(100) COMMENT '分仓名称',
    warehouse_code VARCHAR(50) COMMENT '分仓编号',
    is_taoke TINYINT(1) DEFAULT 0 COMMENT '是否淘客(1是/0否)',
    express_code VARCHAR(50) COMMENT '快递公司编码',
    express_company VARCHAR(100) COMMENT '快递公司',
    province VARCHAR(50) COMMENT '省份',
    province_code VARCHAR(20) COMMENT '省份编码',
    adov DECIMAL(10,2) COMMENT 'ADOV',
    rate_0_5kg DECIMAL(10,2) COMMENT '0.5KG价格',
    rate_1kg DECIMAL(10,2) COMMENT '1KG价格',
    rate_2kg DECIMAL(10,2) COMMENT '2KG价格',
    rate_3kg DECIMAL(10,2) COMMENT '3KG价格',
    first_3kg_rate DECIMAL(10,2) COMMENT '3kg首重计费单价',
    additional_3kg_rate DECIMAL(10,2) COMMENT '3kg续重计费单价',
    rate_4kg DECIMAL(10,2) COMMENT '4KG价格',
    rate_5kg DECIMAL(10,2) COMMENT '5KG价格',
    rate_6kg DECIMAL(10,2) COMMENT '6KG价格',
    rate_7kg DECIMAL(10,2) COMMENT '7KG价格',
    rate_8kg DECIMAL(10,2) COMMENT '8KG价格',
    rate_9kg DECIMAL(10,2) COMMENT '9KG价格',
    rate_10kg DECIMAL(10,2) COMMENT '10KG价格',
    rate_11kg DECIMAL(10,2) COMMENT '11KG价格',
    rate_12kg DECIMAL(10,2) COMMENT '12KG价格',
    rate_13kg DECIMAL(10,2) COMMENT '13KG价格',
    rate_14kg DECIMAL(10,2) COMMENT '14KG价格',
    rate_15kg DECIMAL(10,2) COMMENT '15KG价格',
    rate_16kg DECIMAL(10,2) COMMENT '16KG价格',
    rate_17kg DECIMAL(10,2) COMMENT '17KG价格',
    rate_18kg DECIMAL(10,2) COMMENT '18KG价格',
    rate_19kg DECIMAL(10,2) COMMENT '19KG价格',
    rate_20kg DECIMAL(10,2) COMMENT '20KG价格',
    rate_21kg DECIMAL(10,2) COMMENT '21KG价格',
    rate_22kg DECIMAL(10,2) COMMENT '22KG价格',
    rate_23kg DECIMAL(10,2) COMMENT '23KG价格',
    rate_24kg DECIMAL(10,2) COMMENT '24KG价格',
    rate_25kg DECIMAL(10,2) COMMENT '25KG价格',
    rate_26kg DECIMAL(10,2) COMMENT '26KG价格',
    rate_27kg DECIMAL(10,2) COMMENT '27KG价格',
    rate_28kg DECIMAL(10,2) COMMENT '28KG价格',
    rate_29kg DECIMAL(10,2) COMMENT '29KG价格',
    rate_30kg DECIMAL(10,2) COMMENT '30KG价格'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='仓储物流-快递费报价单';



CREATE TABLE warehouse_operation_fees (
    id                  varchar(36) not null primary key,
    create_by           varchar(50) null comment '创建人',
    create_time         datetime    null comment '创建日期',
    update_by           varchar(50) null comment '更新人',
    update_time         datetime    null comment '更新日期',
    sys_org_code        varchar(64) null comment '所属部门',

    version_date DATE COMMENT '版本日期',
    warehouse_name VARCHAR(100) COMMENT '【通用】仓库名称',
    temperature_type ENUM('常温','冷链') COMMENT '【通用】常温/冷链',

    -- 非卡计费相关字段
    first_non_card_quantity DECIMAL(10,2) COMMENT '首件非卡计费数量',
    first_non_card_price DECIMAL(10,2) COMMENT '首件非卡计费单价',
    additional_non_card_quantity DECIMAL(10,2) COMMENT '续件非卡计费数量',
    additional_non_card_price DECIMAL(10,2) COMMENT '续件非卡计费单价',

    -- 卡片DM单计费相关字段
    card_dm_additional_quantity DECIMAL(10,2) COMMENT '卡片DM单续件数量',
    card_dm_additional_price DECIMAL(10,2) COMMENT '卡片DM单续件单价',
    card_dm_algorithm VARCHAR(255) COMMENT '卡片DM单算法',

    -- 通用计费单位
    billing_unit VARCHAR(50) COMMENT '计费单位',
    extra_charge_price DECIMAL(10,2) COMMENT '额外加收单价',
    extra_charge_unit VARCHAR(50) COMMENT '额外加收单位',

    -- 出库操作费
    outbound_operation_price DECIMAL(10,2) COMMENT '出库操作单价',
    outbound_billing_unit VARCHAR(50) COMMENT '出库计费单位',

    -- 仓内仓外费用
    in_warehouse_price DECIMAL(10,2) COMMENT '仓内计费单价',
    out_warehouse_price DECIMAL(10,2) COMMENT '仓外计费单价',

    -- 拦截费用
    interception_billing_unit VARCHAR(50) COMMENT '拦截计费单位',

    -- 首续件计费(可能与非卡计费重复，需确认业务逻辑)
    first_billing_quantity DECIMAL(10,2) COMMENT '首件计费数量',
    first_billing_price DECIMAL(10,2) COMMENT '首件计费单价',
    additional_billing_quantity DECIMAL(10,2) COMMENT '续件计费数量',
    additional_billing_price DECIMAL(10,2) COMMENT '续件计费单价',

    -- 体积重量计费
    volume_billing TINYINT(1) COMMENT '按体积',
    volume_unit VARCHAR(20) COMMENT '体积计算单位',
    weight_billing TINYINT(1) COMMENT '按重量',
    weight_unit VARCHAR(20) COMMENT '重量计算单位',

    -- 操作费
    operation_fee DECIMAL(10,2) COMMENT '操作费',
    operation_fee_unit VARCHAR(50) COMMENT '操作费计算单位',

    -- 贴标费用
    labeling_price DECIMAL(10,2) COMMENT '贴标计费单价',
    labeling_unit VARCHAR(50) COMMENT '贴标计费单元',

    -- 塑封费用
    normal_sealing_no_film DECIMAL(10,2) COMMENT '常温塑封（不含膜）',
    normal_sealing_with_film DECIMAL(10,2) COMMENT '常温塑封（含膜）',

    -- 组合拆解费用
    combination_fee DECIMAL(10,2) COMMENT '组合费用',
    giftbox_unpacking_fee DECIMAL(10,2) COMMENT '拆礼盒费用',
    sealing_assembly_unit VARCHAR(50) COMMENT '塑封/组装/拆卸计费单位',

    -- 质检费用
    secondary_inspection DECIMAL(10,2) COMMENT '二次全检/二次理货',
    inspection_unit VARCHAR(50) COMMENT '二次全检/二次理货计费单位',

    -- 耗材价格
    bubble_column_rice DECIMAL(10,2) COMMENT '气泡柱米粉',
    bubble_column_oil DECIMAL(10,2) COMMENT '气泡柱油',
    gourd_film DECIMAL(10,2) COMMENT '葫芦膜',
    ice_pack_250g DECIMAL(10,2) COMMENT '冰袋250g',
    pe_bag DECIMAL(10,2) COMMENT 'PE袋',
    giftbox_express_bag DECIMAL(10,2) COMMENT '礼盒快递袋',
    thermal_bag_1 DECIMAL(10,2) COMMENT '保温袋1号',
    thermal_bag_2 DECIMAL(10,2) COMMENT '保温袋2号',
    thermal_bag_3 DECIMAL(10,2) COMMENT '保温袋3号',
    thermal_bag_4 DECIMAL(10,2) COMMENT '保温袋4号',
    supplies_pricing_unit VARCHAR(50) COMMENT '耗材报价单位',

    -- 其他耗材代码
    p2 DECIMAL(10,2) COMMENT 'P2',
    p3 DECIMAL(10,2) COMMENT 'P3',
    p4 DECIMAL(10,2) COMMENT 'P4',
    p5 DECIMAL(10,2) COMMENT 'P5',
    p6 DECIMAL(10,2) COMMENT 'P6',
    p7 DECIMAL(10,2) COMMENT 'P7',
    p8 DECIMAL(10,2) COMMENT 'P8',
    p9 DECIMAL(10,2) COMMENT 'P9',
    p11 DECIMAL(10,2) COMMENT 'P11',
    p12 DECIMAL(10,2) COMMENT 'P12',
    p13 DECIMAL(10,2) COMMENT 'P13',
    p14 DECIMAL(10,2) COMMENT 'P14',
    sealing_fee DECIMAL(10,2) COMMENT '塑封',

    -- 纸箱规格
    e6_box DECIMAL(10,2) COMMENT 'E-6#纸箱',
    e7_box DECIMAL(10,2) COMMENT 'E-7#纸箱',
    e9_box DECIMAL(10,2) COMMENT 'E-9#纸箱',
    yuexing_4_box DECIMAL(10,2) COMMENT '跃猩4号纸箱',
    box_200011026 DECIMAL(10,2) COMMENT '200011026',
    box_200011263 DECIMAL(10,2) COMMENT '200011263',
    box_40130001 DECIMAL(10,2) COMMENT '40130001',
    box_40130003 DECIMAL(10,2) COMMENT '40130003',

    -- 冷链材料
    dry_ice_500g DECIMAL(10,2) COMMENT '500g干冰',
    dry_ice_250g DECIMAL(10,2) COMMENT '250g干冰',
    water_ice_250g DECIMAL(10,2) COMMENT '250g水冰',

    -- 通用单价和单位
    unit_price DECIMAL(10,2) COMMENT '单价',
    calculation_unit VARCHAR(50) COMMENT '计算单位',

    -- 坪效和算法
    efficiency_per_area DECIMAL(10,2) COMMENT '坪效',
    calculation_algorithm VARCHAR(255) COMMENT '算法'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='仓储物流-仓储报价单';

