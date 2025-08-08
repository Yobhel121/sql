drop table mk_reimburse;
CREATE TABLE mk_reimburse
(
    form_sub_type_biz_code               varchar COMMENT '单据小类编码',
    form_sub_type_name_zh                varchar COMMENT '单据小类编码-中文',
    form_sub_type_name_en                varchar COMMENT '单据小类编码-英文',
    form_sub_type_name                   varchar COMMENT '单据小类名称',
    form_code                            varchar COMMENT '单据号',
    form_data_code                       varchar COMMENT '单据内部编码',
    form_name                            varchar COMMENT '单据名称',
    request_user_code                    varchar COMMENT '请求用户编码',
    employee_name                        varchar COMMENT '提单人姓名',
    employee_id                          varchar COMMENT '提单人工号',
    fill_employee_name                   varchar COMMENT '填单人姓名',
    fill_employee_id                     varchar COMMENT '填单人工号',
    cover_employee_name                  varchar COMMENT '承担人姓名',
    cover_employee_id                    varchar COMMENT '承担人工号',
    amount_currency                      varchar COMMENT '报销金额-币种',
    amount_amount                        decimal(18, 2) COMMENT '报销金额-金额',
    base_amount_currency                 varchar COMMENT '本币金额-币种',
    base_amount_amount                   decimal(18, 2) COMMENT '本币金额-金额',
    submitted_at                         bigint COMMENT '提单时间',
    form_status                          varchar COMMENT '单据状态',
    status_text                          varchar COMMENT '单据状态描述',
    form_type                            varchar COMMENT '单据类型，REIMBURSE报销单',
    payment_amount_currency              varchar COMMENT '应付金额-币种',
    payment_amount_amount                decimal(18, 2) COMMENT '应付金额-金额',
    payment_base_amount_currency         varchar COMMENT '应付本币金额-币种',
    payment_base_amount_amount           decimal(18, 2) COMMENT '应付本币金额-金额',
    approved_at                          bigint COMMENT '审批通过时间，最后一个审批节点的通过时间',
    approved_amount_currency             varchar COMMENT '审批通过金额-币种',
    approved_amount_amount               decimal(18, 2) COMMENT '审批通过金额-金额',
    approved_base_amount_currency        varchar COMMENT '审批通过本币金额-币种',
    approved_base_amount_amount          decimal(18, 2) COMMENT '审批通过本币金额-金额',
    legal_entity_biz_code                varchar COMMENT '公司抬头业务编码',
    legal_entity_name                    varchar COMMENT '公司抬头名称',
    department_biz_code                  varchar COMMENT '部门业务编码',
    department_code                      varchar COMMENT '部门编码',
    department_name                      varchar COMMENT '部门名称',
    settled_at                           bigint COMMENT '支付时间，非标记支付时间，用户可以手动填写该时间',
    audited_at                           bigint COMMENT '审核时间，最后一个审核节点的通过时间',
    proc_inst_end_time                   bigint COMMENT '流程结束时间，所有流程节点完成，包含支付、审核节点',
    allocated                            varchar COMMENT '是否使用分摊',
    trading_partner_name                 varchar COMMENT '往来单位名称',
    trading_partner_biz_code             varchar COMMENT '往来单位业务编码',
    export_status                        int COMMENT '导出状态 0-未导出、1-已导出',
    export_comments                      varchar COMMENT '导出备注',
    external_voucher_codes               varchar COMMENT '使用单据标记接口写入的外部凭证编码',
    external_state                       varchar COMMENT '外部状态,A-Z的枚举值',
    created_at                           bigint COMMENT '单据创建时间',
    installment                          varchar COMMENT '是否使用分期付款',
    first_period_payable_amount_currency varchar COMMENT '报销单分期付款首期金额-币种',
    first_period_payable_amount_amount   decimal(18, 2) COMMENT '报销单分期付款首期金额-金额',
    travel_partner_info                  varchar COMMENT '参与人',
    accept_ccy                           varchar COMMENT '',
    base_ccy                             varchar COMMENT '',
    multiple_payee_flag                  varchar COMMENT '',
    legal_entity_code                    varchar COMMENT '',
    form_sub_type_code                   varchar COMMENT '',
    department_heir_code                 varchar COMMENT '',
    updated_at                           varchar COMMENT '',
    trading_partner_code                 varchar COMMENT '',
    overdue_deduction                    varchar COMMENT '',
    expect_repay_date                    varchar COMMENT '',
    PRIMARY KEY (form_code)
) COMMENT ='报销单据表';

drop table mk_reimburse_info;
CREATE TABLE mk_reimburse_info
(
    form_data_code                  varchar COMMENT '单据内码',
    form_code                       varchar COMMENT '单据号',
    form_sub_type_biz_code          varchar COMMENT '单据小类编码',
    form_sub_type_name              varchar COMMENT '单据小类名称',
    reimburse_name                  varchar COMMENT '报销事由',
    cover_employee_name             varchar COMMENT '承担人姓名',
    cover_employee_id               varchar COMMENT '承担人工号',
    department_biz_code             varchar COMMENT '部门业务编码',
    department_dingtalk_id          varchar COMMENT '钉钉部门ID',
    department_name                 varchar COMMENT '部门名称',
    comment                         varchar COMMENT '备注',
    payee_account                   varchar COMMENT '收款账户',
    payer_accounts                  varchar COMMENT '支付信息列表',
    legal_entity_biz_code           varchar COMMENT '公司抬头信息',
    legal_entity_name               varchar COMMENT '公司抬头名称',
    consume_application_codes       varchar COMMENT '关联申请单的号列表',
    associated_form_codes           varchar COMMENT '关联内部单据号列表',
    associated_forms                varchar COMMENT '关联单据组件对象列表',
    associated_external_form_list   varchar COMMENT '关联外部单据对象列表',
    contract_numbers                varchar COMMENT '关联合同编号列表',
    contract_codes                  varchar COMMENT '关联合同单据号列表',
    trading_partner_biz_code        varchar COMMENT '往来单位编码',
    trading_partner_parent_biz_code varchar COMMENT '往来单位上级分类编码',
    trading_partner_name            varchar COMMENT '往来单位名称',
    submitted_at                    bigint COMMENT '最新一次提单时间',
    first_submitted_at              bigint COMMENT '首次提单时间',
    amount                          varchar COMMENT '报销金额（收款币种）',
    base_amount                     varchar COMMENT '报销本币金额',
    reim_employee_name              varchar COMMENT '提单人姓名',
    fill_employee_name              varchar COMMENT '填单人姓名',
    fill_employee_id                varchar COMMENT '填单人工号',
    form_status                     varchar COMMENT '单据状态',
    payment_amount                  varchar COMMENT '应付金额（收款币种）',
    payment_base_amount             varchar COMMENT '应付本币金额',
    approved_at                     bigint COMMENT '审批通过时间',
    approved_amount                 varchar COMMENT '审批通过金额',
    approved_base_amount            varchar COMMENT '审批通过本币金额',
    settled_at                      bigint COMMENT '支付时间',
    audited_at                      bigint COMMENT '审核时间',
    created_at                      bigint COMMENT '第一次单据创建时间',
    expense_list                    varchar COMMENT '费用列表',
    custom_object                   varchar COMMENT '自定义字段Map集合',
    loan_deductions                 varchar COMMENT '借款核销信息',
    collection_schedule             varchar COMMENT '多人收款',
    installment                     varchar COMMENT '是否使用分期付款',
    installment_status              varchar COMMENT '分期状态',
    external_voucher_codes          varchar COMMENT '外部凭证编码',
    validation_result               varchar COMMENT '单据校验结果',
    sign_employee_name              varchar COMMENT '签收人姓名',
    sign_employee_id                varchar COMMENT '签收人工号',
    credit_score                    bigint COMMENT '信用分',
    credit_rank                     bigint COMMENT '信用等级',
    form_deduction_amount           varchar COMMENT '核销金额',
    first_period_payment            varchar COMMENT '首期是否随本单支付',
    generate_voucher                varchar COMMENT '单据生成凭证标识',
    invoice_bag_code                varchar COMMENT '发票袋编码',
    detail_total_amount             varchar COMMENT '明细组件总金额',
    tax_deduct_base_amount          varchar COMMENT '单据税额抵扣本币金额',
    tax_deduct_accept_amount        varchar COMMENT '单据税额抵扣收款金额',
    payer_account_object            varchar COMMENT '支付账户组件',
    travel_route_list               varchar COMMENT '行程',
    submit_user_department_biz_code varchar COMMENT '提单人部门编码',
    submit_user_department_name     varchar COMMENT '提单人部门名称',
    tag_list                        varchar COMMENT '标签列表',
    datahub_bill_list               varchar COMMENT '月结账单',
    plan_pay_time                   bigint COMMENT '计划付款时间',
    budget_occupy_time              bigint COMMENT '预算使用月份',
    payer_account                   varchar COMMENT '',
    reim_employee_id                varchar COMMENT '',
    base_ccy                        varchar COMMENT '',
    base_ccy_symbol                 varchar COMMENT '',
    attachments                     varchar COMMENT '',
    invoice_count                   varchar COMMENT '',
    report_position                 varchar COMMENT '',
    travel_partner_info             varchar COMMENT '',
    capital_plan_payment_log_list   varchar COMMENT '',
    head_count                      varchar COMMENT '',
    PRIMARY KEY (form_code)
) COMMENT ='报销单据详情表';

drop table rpa_data.mk_reimburse_info_expense_list;
CREATE TABLE IF NOT EXISTS rpa_data.mk_reimburse_info_expense_list
(
    form_code                       varchar COMMENT '单据号',
    expense_type_biz_code           varchar COMMENT '费用类型编码',
    expense_type_name               varchar COMMENT '费用类型名称',
    code                            varchar COMMENT '费用内码，全局唯一',
    vice_expense_type_biz_code      varchar COMMENT '辅助费用类型编码',
    vice_expense_type_name          varchar COMMENT '辅助费用类型名称',
    consume_amount                  varchar COMMENT '消费金额（消费币种）',
    consume_base_amount             varchar COMMENT '消费本币金额（公司抬头本币币种）',
    approved_amount                 varchar COMMENT '审批通过金额（收款币种，修改后金额）',
    approved_base_amount            varchar COMMENT '审批通过本币金额（公司抬头本币币种，修改后金额）',
    comments                        varchar COMMENT '备注',
    air_class                       varchar COMMENT '舱位(只有飞机标准关联了该费用类型才会有该字段)',
    train_seat                      varchar COMMENT '座位(只有火车标准关联了该费用类型才会有该字段)',
    contain_breakfast               varchar COMMENT '是否包含早餐',
    consume_time                    varchar COMMENT '消费时间',
    consume_location                varchar COMMENT '消费城市',
    invoice_list                    varchar COMMENT '发票列表',
    attachments                     varchar COMMENT '附件',
    allocation_list                 varchar COMMENT '分摊信息，每个费用至少有一条分摊',
    custom_object                   varchar COMMENT '自定义对象',
    invoice_status                  varchar COMMENT '发票状态',
    invoice_submit_time             varchar COMMENT '发票到票时间',
    invoice_expect_submit_time      varchar COMMENT '发票预计到票时间',
    status                          varchar COMMENT 'OPEN 未报销；PROCESSING 已报销；HOLD 已移除；CLOSED 已报销；FREE 免报销',
    order_details_from_data_hub     varchar COMMENT '从datahub获取到的订单详情',
    corp_expense                    varchar COMMENT '是否对公费用',
    corp_type                       varchar COMMENT '业务类型：ALL_RECEIPTS-全部到票；NO_RECEIPT-未到票；RECEIPT_DEDUCTION-到票核销；RECEIPT_PAY_SOME-到票部分支付或不支付；PAY_BEFORE_RECEIPT-支付前期已到的发票',
    receipt_amount                  varchar COMMENT '到票金额',
    non_receipt_amount              varchar COMMENT '未到票金额',
    forecast_receipt_date           varchar COMMENT '预计到票日期',
    trading_partner_biz_code        varchar COMMENT '往来单位业务编码',
    trading_partner_parent_biz_code varchar COMMENT '当前往来单位的上一级分类的编码',
    trading_partner_name            varchar COMMENT '往来单位业务名称',
    record_deduction_amount         varchar COMMENT '核销未到票记录金额（到票核销场景的"本次到票"金额）',
    pay_before_receipt_amount       varchar COMMENT '支付前期已到的发票金额（支付前期已到的发票场景的"付款金额"）',
    air_line_company                varchar COMMENT '航空公司',
    split_tag                       varchar COMMENT '费用拆分状态，NOTSPLIT-未被拆分，SPLIT_SOURCE拆分来源，SPLIT_TARGET-拆分后费用',
    split_source_code               varchar COMMENT '拆分来源的费用Code',
    travel_partner_info             varchar COMMENT '行程参与人',
    deduction_list                  varchar COMMENT '当前对公费用核销的数据（当前到票核销场景核销了哪些"预付未到票"记录）',
    pay_before_deduction_list       varchar COMMENT '支付前期已到的发票的明细记录（当前支付前期已到的发票场景支付了哪些的"到票部分支付或不支付"记录）',
    no_tax_uite                     varchar COMMENT '不含税组件信息',
    receipted_deduction_list        varchar COMMENT '核销记录（当前预付未到票场景的"到票记录"）',
    paid_deduction_list             varchar COMMENT '支付记录（当前到票部分支付或不支付场景的"支付记录"）',
    source_type                     varchar COMMENT '第三方平台，清单',
    source_id                       varchar COMMENT '第三方订单id',
    apply_rules                     varchar COMMENT '应用规则',
    settle_type                     varchar COMMENT 'personal_advance（个人垫付）；ent_paid_order（企业支付）；pay_afterwards（事后统一支付）',
    invoice_count                   varchar COMMENT '发票数量',
    pre_consume_code_list           varchar COMMENT '关联的申请单号',
    deduction_expense               varchar COMMENT '费用的逾期扣款信息',
    consume_to_accept_exchange_rate varchar COMMENT '消费币种到收款币种汇率',
    accept_to_base_exchange_rate    varchar COMMENT '收款币种到公司抬头本币汇率',
    consume_to_base_exchange_rate   varchar COMMENT '消费币种到公司抬头本币汇率',
    custom_exchange_rate            varchar COMMENT '用户自定义的汇率',
    detail_total_amount             varchar COMMENT '明细组件下的金额组件的总金额（计算后的）',
    accrual_reconcile               varchar COMMENT '预提核销',
    accrual_reconciles              varchar COMMENT '预提核销列表',
    expense_deduction_tax_amount    varchar COMMENT '费用级抵扣税额（消费币种）',
    labour_tax                      varchar COMMENT '劳务报酬个税',
    form_rank_code                  varchar COMMENT '费用表单序号',
    corp_expense_responsible_user   varchar COMMENT '责任人',
    dyna_tags                       varchar COMMENT '动态标签',
    head_count                      varchar COMMENT '人数'
) COMMENT ='报销单据详情表-费用列表';

CREATE TABLE IF NOT EXISTS rpa_data.mk_reimburse_info_expense_list_allocation_list
(
    code                         varchar COMMENT '唯一编码',
    allocated_amount             varchar COMMENT '分摊金额',
    allocated_ratio              varchar COMMENT '分摊比例',
    legal_entity_biz_code        varchar COMMENT '法人实体业务编码',
    legal_entity_name            varchar COMMENT '法人实体名称',
    cover_department_biz_code    varchar COMMENT '分摊部门业务编码',
    cover_department_name        varchar COMMENT '分摊部门名称',
    cover_department_dingtalk_id varchar COMMENT '分摊部门业务钉钉Id',
    cover_user_name              varchar COMMENT '分摊人员姓名',
    cover_empoyee_no             varchar COMMENT '分摊人员工号',
    approved_base_amount         varchar COMMENT '审批通过的本币金额',
    cover_dimension_ext          varchar COMMENT '根据选项组分摊的选项组业务编码',
    custom_object                varchar COMMENT '自定义字段的信息',
    accrual_reconcile            varchar COMMENT '预提核销',
    accrual_reconciles           varchar COMMENT '预提核销列表',
    consume_tax_deduction_amount varchar COMMENT '分摊抵扣税额金额',
    consume_no_tax_amount        varchar COMMENT '分摊不含税金额',
    trading_partner_code         varchar COMMENT '往来单位编码',
    trading_partner_name         varchar COMMENT '往来单位名称',
    trading_partner_biz_code     varchar COMMENT '往来单位业务编码'
) comment '报销单据详情表-费用列表-分摊信息';

select count(1)
from rpa_data.mk_reimburse;

select count(1)
from rpa_data.mk_reimburse_info;

select *
from rpa_data.mk_reimburse
where form_sub_type_biz_code = 'FT2109271GCVRFUO';
select *
from rpa_data.mk_reimburse
where form_sub_type_biz_code = 'FT2109271MCCZR40';
select *
from rpa_data.mk_reimburse
where form_sub_type_biz_code = 'FT2109241HPL0AYO';



select *
from rpa_data.mk_reimburse_info
where form_sub_type_biz_code = 'FT2109271GCVRFUO';
select *
from rpa_data.mk_reimburse_info
where form_sub_type_biz_code = 'FT2109271MCCZR40';
select *
from rpa_data.mk_reimburse_info
where form_sub_type_biz_code = 'FT2109241HPL0AYO';



select * from rpa_data.mk_reimburse_info_expense_list;
select * from rpa_data.mk_reimburse_info_expense_list_allocation_list;

delete from rpa_data.mk_reimburse_info_expense_list where form_code not in ('MK25051416', 'MK25051361');
delete from rpa_data.mk_reimburse_info_expense_list_allocation_list where code not in ('FD157898644522021059','FD157763374030008420');