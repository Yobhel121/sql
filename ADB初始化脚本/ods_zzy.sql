CREATE TABLE ods.zzy_etl_task
(
    chuku_order    varchar COMMENT '出库单号',
    chuku_time     varchar COMMENT '出库时间',
    wuliu_order    varchar COMMENT '物流单号',
    kdgs           varchar COMMENT '快递公司',
    kdgs_code      varchar COMMENT '快递公司代码',
    mobile         varchar COMMENT '手机号码',
    fencang_num    varchar COMMENT '分仓编号',
    wuliuzhuangtai varchar,
    tiaoshu        varchar,
    fachushijian   varchar,
    zuixinshijian  varchar,
    zuihouwuliu    varchar,
    xiangxiwuliu   varchar,
    chaxunshijian  varchar,
    dingdanhao     varchar,
    create_time    timestamp,
    update_time    timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    task_name      varchar COMMENT '猪猪云快递任务创建名称',
    dt             date comment '分区日期',
    KEY index3 (update_time),
    KEY pk_sys_wuliu_order (wuliu_order),
    PRIMARY KEY (wuliu_order,dt)
) PARTITION BY VALUE(dt) COMMENT = '猪猪云物流信息';

# 查看表ddl修改
show create table zzy.etl_task;










