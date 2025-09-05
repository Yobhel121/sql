CREATE TABLE jst_actual_receipt_batchs_info
(
    io_id            int,
    row_id           int,
    batch_no         varchar(100),
    sku_id           varchar(100),
    qty              int,
    product_date     datetime,
    supplier_id      varchar(100),
    supplier_name    varchar(100),
    last_update_time datetime
);

CREATE TABLE jst_actual_receipt_info
(
    io_id            int,
    o_id             int,
    so_id            varchar(100),
    as_id            int,
    io_date          datetime,
    warehouse        varchar(100),
    modified         datetime,
    lc_id            varchar(100),
    shop_id          int,
    wh_id            int,
    wms_co_id        int,
    drp_co_name      varchar(100),
    last_update_time datetime,
    drp_co_id        int
);

CREATE TABLE jst_actual_receipt_item_info
(
    io_id            int,
    row_id           int,
    sku_id           varchar(100),
    name             varchar(100),
    properties_value varchar(100),
    qty              int,
    sale_price       decimal(10, 4),
    sale_amount      decimal(10, 4),
    last_update_time datetime,
    ioi_id           varchar(100),
    io_date          datetime
);

CREATE TABLE jst_category_info
(
    c_id             int COMMENT '类目id',
    parent_c_id      int COMMENT '父级类目id',
    modified         datetime COMMENT '修改时间',
    name             varchar COMMENT '类目名称',
    last_update_time datetime
);

CREATE TABLE jst_combine_sku_info
(
    i_id             varchar COMMENT '组合装款式编码',
    name             varchar COMMENT '组合装商品名称',
    short_name       varchar COMMENT '组合装简称',
    vc_name          varchar COMMENT '虚拟分类',
    pic              varchar COMMENT '图片地址',
    properties_value varchar COMMENT '组合装颜色及规格',
    sale_price       decimal(10, 4) COMMENT '组合装售价',
    weight           decimal(10, 4) COMMENT '组合装重量',
    sku_id           varchar COMMENT '组合装商品编码',
    modified         datetime COMMENT '修改时间',
    created          varchar COMMENT '创建时间',
    enty_sku_id      varchar COMMENT '组合商品实体编码',
    labels           varchar COMMENT '标签',
    brand            varchar COMMENT '品牌',
    cost_price       decimal(10, 4) COMMENT '组合装商品成本价',
    last_update_time datetime,
    enabled          int
);

CREATE TABLE jst_combine_sku_items
(
    sku_id           varchar COMMENT '组合装商品编码',
    row_id           int,
    src_sku_id       varchar COMMENT '子商品编码',
    qty              int COMMENT '子商品数量',
    sale_price       decimal(10, 4) COMMENT '应占售价',
    modified         datetime COMMENT '修改时间',
    combine_sku_id   varchar COMMENT '组合装商品编码',
    last_update_time datetime COMMENT '最后修改时间',
    created          varchar COMMENT '创建时间'
);

CREATE TABLE jst_distributor_info
(
    drp_co_id        int,
    co_id            int,
    name             varchar(100),
    remark           varchar(100),
    salesman         varchar(100),
    status           varchar(100),
    modified         varchar(25),
    last_update_time datetime
);

CREATE TABLE jst_normal_sku_info
(
    autoid                 varchar(100),
    sku_id                 varchar COMMENT '商品编码',
    i_id                   varchar COMMENT '款式编码',
    name                   varchar COMMENT '商品名称',
    short_name             varchar COMMENT '商品简称',
    sale_price             decimal(10, 4) COMMENT '销售价',
    cost_price             decimal(10, 4) COMMENT '成本价',
    properties_value       varchar COMMENT '颜色规格',
    c_id                   int COMMENT '类目id',
    category               varchar COMMENT '分类',
    pic_big                varchar COMMENT '大图地址',
    pic                    varchar COMMENT '图片地址',
    enabled                int COMMENT '是否启用，0：备用，1：启用，-1：禁用',
    weight                 decimal(10, 4) COMMENT '重量',
    market_price           decimal(10, 4) COMMENT '市场价',
    brand                  varchar COMMENT '品牌',
    supplier_id            varchar COMMENT '供应商编号',
    supplier_name          varchar COMMENT '供应商名称',
    modified               datetime COMMENT '修改时间',
    sku_code               varchar COMMENT '国际码',
    color                  varchar COMMENT '颜色',
    supplier_sku_id        varchar COMMENT '供应商商品编码',
    supplier_i_id          varchar COMMENT '供应商商品款号',
    vc_name                varchar COMMENT '虚拟分类',
    sku_type               varchar COMMENT '商品类型',
    creator                varchar COMMENT '创建者',
    created                varchar COMMENT '创建时间',
    remark                 varchar COMMENT '备注',
    item_type              varchar COMMENT '商品属性，成品，半成品，原材料，包材',
    stock_disabled         int COMMENT '是否禁止同步，0=启用同步，1=禁用同步，2=部分禁用',
    unit                   varchar COMMENT '单位',
    shelf_life             int COMMENT '保质期',
    labels                 varchar COMMENT '商品标签，多个标签时以逗号分隔',
    productionbatch_format varchar COMMENT '生产批次信息',
    production_licence     varchar COMMENT '生产许可证',
    l                      decimal(10, 4) COMMENT '长',
    w                      decimal(10, 4) COMMENT '宽',
    h                      decimal(10, 4) COMMENT '高',
    other_price_1          decimal(10, 4) COMMENT '其他价格1',
    other_price_2          decimal(10, 4) COMMENT '其他价格2',
    other_price_3          decimal(10, 4) COMMENT '其他价格3',
    other_price_4          decimal(10, 4) COMMENT '其他价格4',
    other_price_5          decimal(10, 4) COMMENT '其他价格5',
    other_1                varchar COMMENT '其他属性1',
    other_2                varchar COMMENT '其他属性2',
    other_3                varchar COMMENT '其他属性3',
    other_4                varchar COMMENT '其他属性4',
    other_5                varchar COMMENT '其他属性5',
    other_6                varchar COMMENT '其他属性6',
    stock_type             varchar COMMENT '链接同步状态',
    sku_codes              varchar COMMENT '辅助码',
    last_update_time       datetime
);

CREATE TABLE jst_order_action
(
    oa_id            int,
    o_id             int,
    name             varchar(100),
    remark           varchar(100),
    created          varchar(100),
    creator_name     varchar(100),
    last_update_time datetime
);

CREATE TABLE jst_other_stock_io_batch_info
(
    io_id            int,
    row_id           int,
    batch_no         varchar(100),
    sku_id           varchar(100),
    qty              int,
    product_date     datetime,
    supplier_id      int,
    supplier_name    varchar(100),
    last_update_time datetime
);

CREATE TABLE jst_other_stock_io_info
(
    io_id             int,
    io_date           datetime,
    status            varchar(100),
    so_id             varchar(100),
    type              varchar(100),
    f_status          varchar(100),
    warehouse         varchar(100),
    receiver_name     varchar(100),
    receiver_mobile   varchar(100),
    receiver_state    varchar(100),
    receiver_city     varchar(100),
    receiver_district varchar(100),
    receiver_address  varchar(100),
    wh_id             int,
    remark            varchar(100),
    modified          datetime,
    labels            varchar(100),
    wms_co_id         int,
    creator_name      varchar(100),
    drop_co_name      varchar(100),
    inout_user        varchar(100),
    l_id              varchar(100),
    lc_id             varchar(100),
    logistics_company varchar(100),
    last_update_time  datetime
);

CREATE TABLE jst_other_stock_io_item_info
(
    io_id            int,
    row_id           int,
    ioi_id           int,
    sku_id           varchar(100),
    name             varchar(100),
    properties_value varchar(100),
    qty              int,
    cost_price       decimal(20, 4),
    cost_amount      decimal(20, 4),
    i_id             varchar(100),
    remark           varchar(100),
    sale_price       decimal(20, 4),
    sale_amount      decimal(20, 4),
    batch_id         varchar(100),
    product_date     datetime,
    supplier_id      int,
    expiration_date  datetime,
    io_date          datetime,
    last_update_time datetime
);

CREATE TABLE jst_pack_inventory_snapshot
(
    id               varchar(100),
    last_update_time datetime,
    sku_id           varchar(100),
    wms_co_id        int,
    pack_id          varchar(100),
    pack_type        varchar(100),
    item_bin         varchar(100),
    bin              varchar(100),
    qty              varchar(100),
    wh_id            int,
    batch_no         varchar(100),
    product_date     datetime,
    expiration_date  datetime,
    supplier_id      varchar(100),
    modified         datetime,
    field_5          varchar(100),
    yesterday        varchar(100)
);

CREATE TABLE jst_partner_info
(
    wms_co_id        varchar COMMENT '分仓编号',
    name             varchar COMMENT '分仓名称',
    co_id            varchar COMMENT '主仓公司编号',
    is_main          tinyint COMMENT '是否为主仓，true=主仓',
    status           varchar(100),
    remark1          varchar(100),
    remark2          varchar(100),
    last_update_time datetime
);

CREATE TABLE jst_partner_inventory
(
    sku_id           varchar(100),
    wms_co_id        int,
    i_id             varchar(100),
    qty              int,
    order_lock       int,
    virtual_qty      int,
    purchase_qty     int,
    return_qty       int,
    in_qty           int,
    defective_qty    int,
    modified         datetime,
    min_qty          int,
    max_qty          int,
    pick_lock        int,
    lock_qty         int,
    name             varchar(100),
    customize_qty_1  int,
    customize_qty_2  int,
    customize_qty_3  int,
    last_update_time datetime
);

CREATE TABLE jst_pre_stock_in
(
    po_id            int,
    merge_po_id      varchar(100),
    seller_id        int,
    seller           varchar(100),
    external_id      varchar(100),
    created          varchar(100),
    plan_arrive_date datetime,
    modified         datetime,
    status           varchar(100),
    remark           varchar(100),
    send_address     varchar(100),
    creator_name     varchar(100),
    wms_co_id        int,
    last_update_time datetime
);

CREATE TABLE jst_pre_stock_in_item
(
    po_id            int,
    row_id           int,
    poi_id           int,
    sku_id           varchar(100),
    i_id             varchar(100),
    name             varchar(100),
    properties_value varchar(100),
    qty              int,
    plan_qty         int,
    plan_arrive_qty  int,
    remark           varchar(100),
    in_qty           int,
    last_update_time datetime
);

CREATE TABLE jst_purchase_order_info
(
    po_date          datetime,
    po_id            int,
    so_id            varchar(256),
    remark           varchar(256),
    status           varchar(256),
    supplier_id      int,
    seller           varchar(256),
    tax_rate         int,
    purchaser_name   varchar(256),
    send_address     varchar(256),
    term             varchar(256),
    item_type        varchar(256),
    labels           varchar(256),
    confirm_date     datetime,
    finish_time      varchar(256),
    wms_co_id        int,
    receive_status   varchar(256),
    more_rate        decimal(15, 4),
    last_update_time datetime
);

CREATE TABLE jst_purchase_order_item_info
(
    po_id            int,
    row_id           int,
    sku_id           varchar(256),
    name             varchar(256),
    qty              int,
    price            decimal(15, 4),
    i_id             varchar(256),
    poi_id           int,
    delivery_date    datetime,
    remark           varchar(256),
    last_update_time datetime
);

CREATE TABLE jst_pur_info
(
    io_id            int,
    warehouse        varchar(100),
    po_id            int,
    supplier_id      int,
    supplier_name    varchar(100),
    modified         datetime,
    so_id            varchar(100),
    status           varchar(100),
    io_date          datetime,
    wh_id            varchar(100),
    wms_co_id        int,
    remark           varchar(100),
    tax_rate         decimal(10, 4),
    labels           varchar(100),
    archived         varchar(100),
    merge_so_id      varchar(100),
    type             varchar(100),
    creator_name     varchar(100),
    f_status         varchar(100),
    l_id             varchar(100),
    last_update_time datetime
);

CREATE TABLE jst_pur_info_batchs
(
    io_id            int,
    row_id           int,
    batch_no         varchar(100),
    sku_id           varchar(100),
    qty              int,
    product_date     datetime,
    supplier_id      int,
    supplier_name    varchar(100),
    expiration_date  datetime,
    last_update_time datetime
);

CREATE TABLE jst_pur_info_sku
(
    io_id            int,
    row_id           int,
    ioi_id           int,
    sku_id           varchar(255),
    name             varchar(255),
    qty              int,
    cost_price       decimal(15, 4),
    cost_amount      decimal(15, 4),
    remark           varchar(255),
    last_update_time datetime,
    batch_no         varchar(255)
);

CREATE TABLE jst_pur_info_sns
(
    io_id            int,
    row_id           int,
    sku_id           varchar(100),
    sn               varchar(100),
    last_update_time datetime
);

CREATE TABLE jst_qm_bill_info
(
    auto_id          int,
    shop_id          int,
    so_id            varchar(255),
    amount           decimal(15, 4),
    fee_time         varchar(255),
    fee_name         varchar(255),
    channel          varchar(255),
    csg_code         varchar(255),
    csg_name         varchar(255),
    last_update_time datetime
);

CREATE TABLE jst_qm_bill_share_info
(
    auto_id          int,
    p_auto_id        int,
    shop_id          int,
    so_id            varchar(256),
    amount           decimal(15, 4),
    fee_time         varchar(256),
    fee_name         varchar(256),
    sku_id           varchar(256),
    combine_type     varchar(256),
    shop_sku_id      varchar(256),
    shop_i_id        varchar(256),
    channel          varchar(256),
    last_update_time datetime
);

CREATE TABLE jst_qm_delivery_info
(
    io_id             int COMMENT '出库单号',
    co_id             int COMMENT '公司编号',
    shop_id           int COMMENT '店铺编号',
    o_id              int COMMENT '内部单号',
    so_id             varchar COMMENT '线上单号',
    created           varchar COMMENT '创建时间',
    modified          datetime COMMENT '修改时间',
    status            varchar COMMENT '状态;Archive:归档,WaitConfirm:待出库,Confirmed:已出库,Cancelled:取消,Delete:作废,OuterConfirming:外部发货中',
    order_type        varchar COMMENT '单据类型',
    invoice_title     varchar COMMENT '发票抬头',
    shop_buyer_id     varchar COMMENT '买家帐号',
    receiver_country  varchar COMMENT '国家',
    receiver_state    varchar COMMENT '省',
    receiver_city     varchar COMMENT '市',
    receiver_district varchar COMMENT '区',
    receiver_town     varchar COMMENT '街道',
    receiver_address  varchar COMMENT '地址',
    receiver_name     varchar COMMENT '收件人姓名',
    receiver_phone    varchar COMMENT '收件人手机',
    receiver_mobile   varchar COMMENT '收件人电话',
    buyer_message     varchar COMMENT '买家留言',
    remark            varchar COMMENT '备注',
    is_cod            tinyint COMMENT '是否货到付款',
    pay_amount        decimal(10, 2) COMMENT '应付金额',
    l_id              varchar COMMENT '物流单号',
    io_date           datetime COMMENT '出库时间',
    lc_id             varchar COMMENT '快递公司编码',
    stock_enabled     varchar COMMENT '是否启用库存管理',
    drp_co_id_from    varchar COMMENT '分销商编号',
    labels            varchar COMMENT '标记|多标签',
    paid_amount       decimal(20, 3) COMMENT '实付金额',
    free_amount       decimal(10, 2) COMMENT '优惠金额',
    freight           decimal(10, 2) COMMENT '运费',
    weight            decimal(10, 3) COMMENT '预估重量',
    f_weight          decimal(15, 3) COMMENT '实称重量',
    merge_so_id       varchar COMMENT '合并订单号',
    wms_co_id         int COMMENT '分仓编号',
    business_staff    varchar COMMENT '业务人员',
    currency          varchar COMMENT '货币类型',
    pay_date          datetime COMMENT '付款日期',
    logistics_company varchar COMMENT '物流公司名称',
    wave_id           int COMMENT '拣货批次号',
    seller_flag       int COMMENT '旗帜(1红旗，2黄旗，3绿旗，4蓝旗，5紫旗)）',
    order_staff_id    int COMMENT '订单业务员编号',
    order_staff_name  varchar COMMENT '订单业务员名称',
    last_update_time  datetime,
    open_id           varchar(100),
    node              varchar(100),
    is_print_express  tinyint,
    is_print          tinyint,
    shop_name         varchar(100),
    f_freight         decimal(10, 3),
    ts                varchar(100)
);

CREATE TABLE jst_qm_delivery_info_batchs
(
    io_id            int COMMENT '出库单号',
    row_id           int,
    batch_no         varchar COMMENT '批次号',
    sku_id           varchar COMMENT '商品编码',
    qty              int COMMENT '数量',
    product_date     datetime COMMENT '批次日期',
    supplier_id      int COMMENT '供应商编号',
    supplier_name    varchar COMMENT '供应商名称',
    expiration_date  datetime COMMENT '有效期至',
    last_update_time datetime
);

CREATE TABLE jst_qm_delivery_info_batchs_new
(
    io_id            int,
    row_id           int,
    batch_no         varchar(100),
    sku_id           varchar(100),
    qty              int,
    product_date     datetime,
    supplier_id      int,
    supplier_name    varchar(100),
    expiration_date  datetime,
    last_update_time datetime
);

CREATE TABLE jst_qm_delivery_info_item
(
    io_id            int COMMENT '出库单号',
    row_id           int,
    ioi_id           int COMMENT '子单号',
    pic              varchar COMMENT '图片',
    sku_id           varchar COMMENT '商品编码',
    qty              int COMMENT '数量',
    name             varchar COMMENT '商品名称',
    properties_value varchar COMMENT '颜色规格',
    sale_price       decimal(15, 2) COMMENT '单价',
    sale_amount      decimal(15, 2) COMMENT '金额',
    i_id             varchar COMMENT '款式编码',
    sale_base_price  decimal(15, 2) COMMENT '原价',
    combine_sku_id   varchar COMMENT '组合装商品编码',
    is_gift          tinyint COMMENT '是否赠品',
    last_update_time datetime,
    outer_oi_id      varchar(100),
    batch_id         varchar(100),
    product_date     datetime,
    supplier_id      int,
    expiration_date  datetime
);

CREATE TABLE jst_qm_delivery_info_item_new
(
    io_id            int,
    row_id           int,
    ioi_id           int,
    pic              varchar(256),
    sku_id           varchar(256),
    qty              int,
    name             varchar(256),
    properties_value varchar(256),
    sale_price       decimal(15, 4),
    sale_amount      decimal(15, 4),
    i_id             varchar(256),
    sale_base_price  decimal(15, 4),
    combine_sku_id   varchar(256),
    is_gift          tinyint,
    outer_oi_id      varchar(256),
    batch_id         varchar(256),
    product_date     datetime,
    supplier_id      int,
    expiration_date  datetime,
    last_update_time datetime
);

CREATE TABLE jst_qm_delivery_info_new
(
    io_id             int,
    co_id             int,
    shop_id           int,
    o_id              int,
    so_id             varchar(100),
    created           varchar(100),
    modified          datetime,
    status            varchar(100),
    order_type        varchar(100),
    invoice_title     varchar(100),
    shop_buyer_id     varchar(100),
    open_id           varchar(100),
    receiver_country  varchar(100),
    receiver_state    varchar(100),
    receiver_city     varchar(100),
    receiver_district varchar(100),
    receiver_town     varchar(100),
    receiver_address  varchar(100),
    receiver_name     varchar(100),
    receiver_phone    varchar(100),
    receiver_mobile   varchar(100),
    buyer_message     varchar(100),
    remark            varchar(100),
    is_cod            tinyint,
    pay_amount        decimal(15, 4),
    l_id              varchar(100),
    io_date           datetime,
    lc_id             varchar(100),
    stock_enabled     varchar(100),
    drp_co_id_from    varchar(100),
    labels            varchar(100),
    paid_amount       decimal(20, 4),
    free_amount       decimal(10, 4),
    freight           decimal(15, 4),
    weight            decimal(15, 4),
    f_weight          decimal(15, 4),
    merge_so_id       varchar(100),
    wms_co_id         int,
    business_staff    varchar(100),
    currency          varchar(100),
    pay_date          datetime,
    logistics_company varchar(100),
    wave_id           int,
    seller_flag       int,
    order_staff_id    int,
    order_staff_name  varchar(100),
    node              varchar(100),
    is_print_express  tinyint,
    is_print          tinyint,
    shop_name         varchar(100),
    f_freight         decimal(15, 4),
    ts                varchar(100),
    last_update_time  datetime
);

CREATE TABLE jst_qm_delivery_info_sns
(
    io_id            int COMMENT '出库单号',
    row_id           int,
    sku_id           varchar COMMENT '商品编码',
    sn               varchar COMMENT '唯一码',
    last_update_time datetime
);

CREATE TABLE jst_qm_delivery_info_sns_new
(
    io_id            int,
    row_id           int,
    sku_id           varchar(100),
    sn               varchar(100),
    last_update_time datetime
);

CREATE TABLE jst_qm_orders_info
(
    o_id                 int COMMENT 'ERP 内部订单号，唯一',
    is_cod               tinyint COMMENT '是否货到付款',
    l_id                 varchar COMMENT '快递单号',
    send_date            datetime COMMENT '发货日期',
    pay_date             datetime COMMENT '支付时间',
    freight              varchar(100) COMMENT '运费，保留两位小数，单位（元）',
    receiver_address     varchar COMMENT '收货地址',
    receiver_district    varchar COMMENT '区',
    wms_co_id            varchar COMMENT '发货仓编号',
    logistics_company    varchar COMMENT '快递公司',
    free_amount          varchar COMMENT '抵扣金额',
    shop_name            varchar COMMENT '店铺名称',
    question_type        varchar COMMENT '问题类型，仅当问题订单时有效',
    outer_pay_id         varchar COMMENT '外部支付单号',
    so_id                varchar COMMENT '线上订单号，最长不超过 20;唯一',
    type                 varchar COMMENT '订单类型',
    order_from           varchar COMMENT '订单来源',
    status               varchar COMMENT '待付款：WaitPay；发货中：Delivering；被合并：Merged；异常：Question；被拆分：Split；等供销商|外仓发货：WaitOuterSent；已付款待审核：WaitConfirm；已客审待财审：WaitFConfirm；已发货：Sent；取消：Cancelled',
    pay_amount           varchar COMMENT '应付金额，保留两位小数，单位（元）',
    shop_buyer_id        varchar COMMENT '买家帐号',
    shop_status          varchar COMMENT '平台订单状态',
    receiver_mobile      varchar COMMENT '手机',
    order_date           datetime COMMENT '下单时间',
    question_desc        varchar COMMENT '问题描述',
    receiver_city        varchar COMMENT '收件信息-市',
    receiver_state       varchar COMMENT '收件信息-省',
    receiver_name        varchar COMMENT '收件信息-收件人',
    shop_id              int COMMENT '店铺编号',
    co_id                int COMMENT '公司编号',
    remark               varchar COMMENT '订单备注；卖家备注',
    drp_co_id_from       varchar COMMENT '分销商编号',
    modified             datetime COMMENT '修改时间',
    labels               varchar COMMENT '多标签',
    paid_amount          varchar COMMENT '实际支付金额',
    currency             varchar COMMENT '币种',
    buyer_message        varchar COMMENT '买家留言',
    lc_id                varchar COMMENT '物流公司编码',
    invoice_title        varchar COMMENT '发票抬头',
    invoice_type         varchar COMMENT '发票类型',
    buyer_tax_no         varchar COMMENT '发票税号',
    creator_name         varchar COMMENT '订单业务员',
    plan_delivery_date   datetime COMMENT '计划发货时间',
    node                 varchar COMMENT '线下备注',
    receiver_town        varchar COMMENT '收件信息-街道',
    drp_co_id_to         varchar COMMENT '供销商编号',
    f_freight            varchar COMMENT '运费成本',
    shop_site            varchar COMMENT '店铺站点信息',
    un_lid               varchar COMMENT '国际物流单号',
    end_time             varchar COMMENT '确认收货时间（仅限头条放心购、京东、拼多多）',
    receiver_country     varchar COMMENT '国家代码',
    receiver_zip         varchar COMMENT '邮编',
    seller_flag          int COMMENT '旗帜(1红旗，2黄旗，3绿旗，4蓝旗，5紫旗)）',
    receiver_email       varchar COMMENT '收货邮箱',
    referrer_id          varchar COMMENT '主播id',
    referrer_name        varchar COMMENT '主播名称',
    created              varchar COMMENT '订单创建时间',
    last_update_time     datetime,
    open_id              varchar(100),
    skus                 varchar(100),
    f_weight             decimal(15, 2),
    weight               decimal(15, 2),
    ts                   int,
    buyer_id             varchar(100),
    buyer_paid_amount    varchar(100),
    seller_income_amount varchar(100),
    chosen_channel       varchar(100),
    batch_id             varchar(100),
    produced_date        datetime,
    link_o_id            varchar(100),
    merge_so_id          varchar(100),
    shipment             varchar(100),
    sign_time            varchar(100)
) COMMENT ='订单详情表';

CREATE TABLE jst_qm_orders_info_payment
(
    o_id             int COMMENT 'ERP 内部订单号，唯一',
    row_id           int,
    is_order_pay     varchar COMMENT '是否支付',
    buyer_account    varchar COMMENT '支付帐号',
    amount           varchar COMMENT '支付金额',
    pay_date         datetime COMMENT '支付时间',
    outer_pay_id     varchar COMMENT '外部支付单号',
    pay_id           varchar COMMENT '支付单ID',
    payment          varchar COMMENT '支付渠道',
    last_update_time datetime
);

CREATE TABLE jst_qm_orders_info_sku
(
    o_id                 int COMMENT 'ERP 内部订单号，唯一',
    row_id               int,
    is_gift              varchar COMMENT '是否赠品',
    sku_id               varchar COMMENT '商品编码，对应库存管理的 SKU',
    name                 varchar COMMENT '商品名称',
    refund_status        varchar COMMENT '申请退款的状态 , 未申请：none；退款中：waiting；退款成功：success；退款关闭：closed',
    refund_id            varchar COMMENT '退款的唯一单号',
    price                varchar COMMENT '单价',
    outer_oi_id          varchar COMMENT '子订单号，最长不超过 50',
    item_status          varchar COMMENT '商品状态',
    i_id                 varchar COMMENT '款式编码',
    properties_value     varchar COMMENT '属性',
    oi_id                int COMMENT '子订单号，最长不超过 20',
    amount               varchar COMMENT '总额',
    shop_sku_id          varchar COMMENT '外部sku_id',
    raw_so_id            varchar COMMENT '原始线上单号',
    qty                  int COMMENT '数量',
    is_presale           varchar COMMENT '是否预售',
    base_price           varchar COMMENT '基本售价',
    pic                  varchar COMMENT '商品图片',
    sku_type             varchar COMMENT '商品类型',
    last_update_time     datetime COMMENT '最后修改时间',
    shop_i_id            varchar(100),
    buyer_paid_amount    varchar(100),
    seller_income_amount varchar(100),
    referrer_id          varchar(100),
    lwh_id               varchar(100),
    lwh_name             varchar(100),
    remark               varchar(100)
);

CREATE TABLE jst_qm_order_expense
(
    auto_id          int,
    p_auto_id        int,
    o_id             int,
    shop_id          int,
    so_id            varchar(100),
    drp_co_id_from   int,
    amount           decimal(10, 2),
    fee_time         varchar(100),
    sku_id           varchar(100),
    combine_type     varchar(100),
    shop_sku_id      varchar(100),
    shop_i_id        varchar(100),
    last_update_time datetime
);

CREATE TABLE jst_qm_order_refund_batchs
(
    as_id            int COMMENT 'ERP售后单号',
    row_id           int,
    batch_no         varchar COMMENT '批次号',
    sku_id           varchar COMMENT '商品编码',
    qty              int COMMENT '商品数量',
    product_date     datetime COMMENT '批次日期',
    supplier_id      int COMMENT '供应商编号',
    supplier_name    varchar COMMENT '供应商名称',
    last_update_time datetime
);

CREATE TABLE jst_qm_order_refund_item
(
    as_id            int COMMENT 'ERP售后单号',
    row_id           int,
    asi_id           int COMMENT '售后子单号',
    sku_id           varchar COMMENT '商品编码',
    qty              int COMMENT '数量',
    price            decimal(15, 4) COMMENT '单价',
    amount           decimal(15, 4) COMMENT '金额',
    name             varchar COMMENT '商品名称',
    pic              varchar COMMENT '图片地址',
    type             varchar COMMENT '类型（退货，换货,补发）',
    properties_value varchar COMMENT '颜色规格',
    outer_oi_id      varchar COMMENT '子订单号',
    sku_type         varchar COMMENT '商品类型',
    r_qty            int COMMENT '实收退货数量',
    receive_date     datetime COMMENT '入仓时间',
    combine_sku_id   varchar COMMENT '组合商品编码',
    shop_sku_id      varchar COMMENT '店铺商品编码',
    i_id             varchar COMMENT '款式编码',
    last_update_time datetime COMMENT '最后修改时间',
    defective_qty    int
);

CREATE TABLE jst_qm_order_refund_list
(
    as_id             int COMMENT 'ERP售后单号',
    as_date           datetime COMMENT '申请时间',
    outer_as_id       varchar COMMENT '平台退货退款单号',
    o_id              int COMMENT '内部单号',
    so_id             varchar COMMENT '线上单号',
    type              varchar COMMENT '售后类型，普通退货，其它，拒收退货，仅退款，投诉，补发，换货',
    created           varchar COMMENT '登记时间',
    modified          datetime COMMENT '修改时间',
    status            varchar COMMENT '状态（WaitConfirm:待确认,Confirmed:已确认,Cancelled:作废,Merged:被合并）',
    shop_status       varchar COMMENT 'WAIT_SELLER_AGREE:买家已经申请退款，等待卖家同意,WAIT_BUYER_RETURN_GOODS:卖家已经同意退款，等待买家退货,WAIT_SELLER_CONFIRM_GOODS:买家已经退货，等待卖家确认收货,SELLER_REFUSE_BUYER:卖家拒绝退款,CLOSED:退款关闭,SUCCESS:退款成功',
    remark            varchar COMMENT '备注',
    question_type     varchar COMMENT '问题类型',
    warehouse         varchar COMMENT '仓库',
    refund            decimal(15, 2) COMMENT '退款金额(退货金额+卖家应补)',
    payment           decimal(15, 2) COMMENT '补偿金额(换货金额+买家应补)',
    good_status       varchar COMMENT '货物状态（BUYER_NOT_RECEIVED:买家未收到货,BUYER_RECEIVED:买家已收到货,BUYER_RETURNED_GOODS:买家已退货,SELLER_RECEIVED:卖家已收到退货）',
    node              varchar COMMENT '售后线下备注',
    order_status      varchar COMMENT '原订单状态',
    shop_id           int COMMENT '店铺编号',
    logistics_company varchar COMMENT '物流公司',
    l_id              varchar COMMENT '物流单号',
    wh_id             int COMMENT '仓库编号',
    wms_co_id         int COMMENT '分仓编号',
    confirm_date      datetime COMMENT '最后确认日期',
    freight           varchar COMMENT '卖家应退运费',
    drp_co_id_from    int COMMENT '分销商编号',
    receiver_mobile   varchar COMMENT '收件人电话',
    receiver_name     varchar COMMENT '收件人名称',
    shop_buyer_id     varchar COMMENT '买家账号',
    drp_co_id_to      int COMMENT '供销商编号',
    last_update_time  datetime,
    labels            varchar(100),
    refund_version    varchar(100),
    ts                varchar(100)
);

CREATE TABLE jst_qm_order_refund_sns
(
    as_id            int,
    row_id           int,
    sku_id           varchar COMMENT '商品编码',
    sn               varchar COMMENT 'SN号码',
    last_update_time datetime
);

CREATE TABLE jst_qm_raw_bill
(
    id                   varchar(100),
    create_time          varchar(100),
    shop_id              int,
    pay_order_no         varchar(100),
    oute_trade_detail_no varchar(100),
    merchant_order_no    varchar(100),
    sku_name             varchar(100),
    in_amount            varchar(100),
    out_amount           varchar(100),
    balance              varchar(100),
    business_type        varchar(100),
    memo                 varchar(100),
    business_desc        varchar(100),
    business_from        varchar(100),
    out_trade_no         varchar(100),
    business_order_no    varchar(100),
    last_update_time     datetime
);

CREATE TABLE jst_shop_info
(
    shop_id          varchar,
    shop_name        varchar(100),
    co_id            int,
    shop_site        varchar(100),
    shop_url         varchar(100),
    created          varchar(100),
    nick             varchar(100),
    session_expired  varchar(100),
    session_uid      varchar(100),
    short_name       varchar(100),
    organization     varchar(100),
    last_update_time datetime
);

CREATE TABLE jst_sku_invty_info
(
    sku_id           varchar COMMENT '商品编码',
    i_id             varchar COMMENT '款式编码',
    qty              int COMMENT '主仓实际库存(数量)',
    order_lock       int COMMENT '订单占有数',
    virtual_qty      int COMMENT '虚拟库存',
    purchase_qty     int COMMENT '采购在途数',
    return_qty       int COMMENT '销退仓库存',
    in_qty           int COMMENT '进货仓库存',
    defective_qty    int COMMENT '次品库存',
    modified         datetime COMMENT '修改时间',
    min_qty          int COMMENT '安全库存下限',
    max_qty          int COMMENT '安全库存上限',
    pick_lock        int COMMENT '仓库待发数',
    last_update_time datetime,
    lock_qty         int,
    name             varchar(100),
    customize_qty_1  int,
    customize_qty_2  int,
    customize_qty_3  int
);

SELECT TABLE_NAME from `INFORMATION_SCHEMA`.`TABLES` where TABLE_SCHEMA = 'ods' and TABLE_NAME like '%jst%';

ALTER TABLE ods.jst_actual_receipt_batchs_info storage_policy = 'COLD';
ALTER TABLE ods.jst_actual_receipt_info storage_policy = 'COLD';
ALTER TABLE ods.jst_actual_receipt_item_info storage_policy = 'COLD';
ALTER TABLE ods.jst_category_info storage_policy = 'COLD';
ALTER TABLE ods.jst_combine_sku_info storage_policy = 'COLD';
ALTER TABLE ods.jst_combine_sku_items storage_policy = 'COLD';
ALTER TABLE ods.jst_distributor_info storage_policy = 'COLD';
ALTER TABLE ods.jst_normal_sku_info storage_policy = 'COLD';
ALTER TABLE ods.jst_order_action storage_policy = 'COLD';
ALTER TABLE ods.jst_other_stock_io_batch_info storage_policy = 'COLD';
ALTER TABLE ods.jst_other_stock_io_info storage_policy = 'COLD';
ALTER TABLE ods.jst_other_stock_io_item_info storage_policy = 'COLD';
ALTER TABLE ods.jst_pack_inventory_snapshot storage_policy = 'COLD';
ALTER TABLE ods.jst_partner_info storage_policy = 'COLD';
ALTER TABLE ods.jst_partner_inventory storage_policy = 'COLD';
ALTER TABLE ods.jst_pre_stock_in storage_policy = 'COLD';
ALTER TABLE ods.jst_pre_stock_in_item storage_policy = 'COLD';
ALTER TABLE ods.jst_purchase_order_info storage_policy = 'COLD';
ALTER TABLE ods.jst_purchase_order_item_info storage_policy = 'COLD';
ALTER TABLE ods.jst_pur_info storage_policy = 'COLD';
ALTER TABLE ods.jst_pur_info_batchs storage_policy = 'COLD';
ALTER TABLE ods.jst_pur_info_sku storage_policy = 'COLD';
ALTER TABLE ods.jst_pur_info_sns storage_policy = 'COLD';
ALTER TABLE ods.jst_qm_bill_info storage_policy = 'COLD';
ALTER TABLE ods.jst_qm_bill_share_info storage_policy = 'COLD';
ALTER TABLE ods.jst_qm_delivery_info storage_policy = 'COLD';
ALTER TABLE ods.jst_qm_delivery_info_batchs storage_policy = 'COLD';
ALTER TABLE ods.jst_qm_delivery_info_batchs_new storage_policy = 'COLD';
ALTER TABLE ods.jst_qm_delivery_info_item storage_policy = 'COLD';
ALTER TABLE ods.jst_qm_delivery_info_item_new storage_policy = 'COLD';
ALTER TABLE ods.jst_qm_delivery_info_new storage_policy = 'COLD';
ALTER TABLE ods.jst_qm_delivery_info_sns storage_policy = 'COLD';
ALTER TABLE ods.jst_qm_delivery_info_sns_new storage_policy = 'COLD';
ALTER TABLE ods.jst_qm_orders_info storage_policy = 'COLD';
ALTER TABLE ods.jst_qm_orders_info_payment storage_policy = 'COLD';
ALTER TABLE ods.jst_qm_orders_info_sku storage_policy = 'COLD';
ALTER TABLE ods.jst_qm_order_expense storage_policy = 'COLD';
ALTER TABLE ods.jst_qm_order_refund_batchs storage_policy = 'COLD';
ALTER TABLE ods.jst_qm_order_refund_item storage_policy = 'COLD';
ALTER TABLE ods.jst_qm_order_refund_list storage_policy = 'COLD';
ALTER TABLE ods.jst_qm_order_refund_sns storage_policy = 'COLD';
ALTER TABLE ods.jst_qm_raw_bill storage_policy = 'COLD';
ALTER TABLE ods.jst_shop_info storage_policy = 'COLD';
ALTER TABLE ods.jst_sku_invty_info storage_policy = 'COLD';

BUILD TABLE ods.jst_actual_receipt_batchs_info;
BUILD TABLE ods.jst_actual_receipt_info;
BUILD TABLE ods.jst_actual_receipt_item_info;
BUILD TABLE ods.jst_category_info;
BUILD TABLE ods.jst_combine_sku_info;
BUILD TABLE ods.jst_combine_sku_items;
BUILD TABLE ods.jst_distributor_info;
BUILD TABLE ods.jst_normal_sku_info;
BUILD TABLE ods.jst_order_action;
BUILD TABLE ods.jst_other_stock_io_batch_info;
BUILD TABLE ods.jst_other_stock_io_info;
BUILD TABLE ods.jst_other_stock_io_item_info;
BUILD TABLE ods.jst_pack_inventory_snapshot;
BUILD TABLE ods.jst_partner_info;
BUILD TABLE ods.jst_partner_inventory;
BUILD TABLE ods.jst_pre_stock_in;
BUILD TABLE ods.jst_pre_stock_in_item;
BUILD TABLE ods.jst_purchase_order_info;
BUILD TABLE ods.jst_purchase_order_item_info;
BUILD TABLE ods.jst_pur_info;
BUILD TABLE ods.jst_pur_info_batchs;
BUILD TABLE ods.jst_pur_info_sku;
BUILD TABLE ods.jst_pur_info_sns;
BUILD TABLE ods.jst_qm_bill_info;
BUILD TABLE ods.jst_qm_bill_share_info;
BUILD TABLE ods.jst_qm_delivery_info;
BUILD TABLE ods.jst_qm_delivery_info_batchs;
BUILD TABLE ods.jst_qm_delivery_info_batchs_new;
BUILD TABLE ods.jst_qm_delivery_info_item;
BUILD TABLE ods.jst_qm_delivery_info_item_new;
BUILD TABLE ods.jst_qm_delivery_info_new;
BUILD TABLE ods.jst_qm_delivery_info_sns;
BUILD TABLE ods.jst_qm_delivery_info_sns_new;
BUILD TABLE ods.jst_qm_orders_info;
BUILD TABLE ods.jst_qm_orders_info_payment;
BUILD TABLE ods.jst_qm_orders_info_sku;
BUILD TABLE ods.jst_qm_order_expense;
BUILD TABLE ods.jst_qm_order_refund_batchs;
BUILD TABLE ods.jst_qm_order_refund_item;
BUILD TABLE ods.jst_qm_order_refund_list;
BUILD TABLE ods.jst_qm_order_refund_sns;
BUILD TABLE ods.jst_qm_raw_bill;
BUILD TABLE ods.jst_shop_info;
BUILD TABLE ods.jst_sku_invty_info;

# 查看进度
SELECT table_name, schema_name, status FROM INFORMATION_SCHEMA.KEPLER_META_BUILD_TASK ORDER BY create_time DESC
