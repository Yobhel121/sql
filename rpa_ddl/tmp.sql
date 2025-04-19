select distinct author_account,tiktok from rpa_data.dy_alliance_order;
select distinct order_source from rpa_data.dy_alliance_order;
select * from rpa_data.dy_alliance_order where tiktok = 'qtmm1' order by payment_time desc ;
select * from rpa_data.dy_alliance_order where tiktok = '' ;


drop  table rpa_config.`filed_mapping`;
CREATE TABLE rpa_config.`filed_mapping` (
  `rpa_route` varchar(100) comment 'rpa路径',
  `table_name` varchar(100) comment '表名',
  `column_name` varchar(100) comment '字段名',
  `type_name` varchar(100) comment '字段类型',
  `column_comment` varchar(100) comment '字段注释',
  `date_type` varchar(100) comment '字段类型',
  `data_length` bigint comment '数据长度',
  PRIMARY KEY (`rpa_route`,table_name,column_name)
);
/*+REDISTRIBUTE_TABLE_WRITES=true*/
insert into rpa_config.filed_mapping(rpa_route, table_name, column_name,type_name,column_comment,date_type,data_length)
select
    'com.mysql.jdbc.PacketTooBigException:' as rpa_route,
    TABLE_NAME as table_name,
    COLUMN_NAME as column_name,
    TYPE_NAME as type_name,
    COLUMN_COMMENT as column_comment,
    DATA_TYPE as date_type,
    CHARACTER_MAXIMUM_LENGTH as data_length
from information_schema.COLUMNS
where TABLE_SCHEMA = 'rpa_data' and column_name not in ('id','created_by','created_at','updated_by','updated_at');



create table rpa_config.tmp_filed_mapping as
select
    'com.mysql.jdbc.PacketTooBigException:' as rpa_route,
    TABLE_NAME as table_name,
    COLUMN_NAME as column_name,
    TYPE_NAME as type_name,
    COLUMN_COMMENT as column_comment,
    DATA_TYPE as date_type,
    CHARACTER_MAXIMUM_LENGTH as data_length
from information_schema.COLUMNS
where TABLE_SCHEMA = 'rpa_data';

insert into rpa_config.filed_mapping(rpa_route, table_name, column_name,type_name,column_comment,date_type,data_length)
select
    'null' ,
    TABLE_NAME ,
    COLUMN_NAME ,
    TYPE_NAME ,
    COLUMN_COMMENT ,
    date_type ,
    data_length
from rpa_config.tmp_xxx;

drop table tmp_xxx;

drop table rpa_data.ods_filed_mapping;
CREATE TABLE rpa_data.ods_filed_mapping (
  `rpa_route` varchar(100) comment 'rpa路径',
  `table_name` varchar(100) comment '表名',
  `column_name` varchar(100) comment '字段名',
  `type_name` varchar(100) comment '字段类型',
  `column_comment` varchar(100) comment '字段注释',
  `date_type` varchar(100) comment '字段类型',
  `data_length` bigint comment '数据长度');

insert into rpa_data.ods_filed_mapping
select *
from rpa_config.filed_mapping;



select * from tmp_filed_mapping where column_name in ('id','created_by','created_at','updated_by','updated_at');


select * from rpa_data.tm_inventory_performance where created_by = 'rpa_ddl';

show create table rpa_data.tb_promotion_report;

select distinct table_name from rpa_config.tmp_filed_mapping where rpa_route = 'com.mysql.jdbc.PacketTooBigException:';

# [{"data_name":"万相台无界版-账户-账户明细-优惠券花费明细"},{"data_name":"万相台无界版-账户-账户明细-专款交易明细"}]
# [{"data_name":"万相台无界版-账户-账户明细-优惠券花费明细"},{"data_name":"万相台无界版-账户-账户明细-专款交易明细"}]

SELECT TABLE_NAME from `INFORMATION_SCHEMA`.`TABLES` where TABLE_SCHEMA = 'rpa_data' and (TABLE_NAME like 'feishu%' or TABLE_NAME like 'ks%' or TABLE_NAME like 'mx%' or TABLE_NAME like 'pdd%' or TABLE_NAME like 'syyz%' or TABLE_NAME like 'wph%' or TABLE_NAME like 'xhs%');

SELECT TABLE_NAME,TABLE_COMMENT from `INFORMATION_SCHEMA`.`TABLES` where TABLE_SCHEMA = 'ods' and TABLE_NAME like '%jky%';


SELECT * from `INFORMATION_SCHEMA`.`COLUMNS` where  TABLE_NAME = 'rpa_hzw_king_promotion';

SELECT concat(',',COLUMN_NAME) from `INFORMATION_SCHEMA`.`COLUMNS` where  TABLE_NAME = 'tb_tm_living_sale';

show create table rpa_data.hzw_king_return_order;

select * from `rpa_data`.`hzw_king_promotion`
drop table rpa_data.hzw_king_promotion;
create table rpa_data.hzw_king_promotion
(
    id               bigint auto_increment comment '主键ID，自增'  primary key,
    date             timestamp                                   not null comment '日期',
    shop_id          varchar(50) charset utf8                    null comment '店铺ID',
    platform_name    varchar(50) charset utf8                    null comment '平台名称',
    project_name     varchar(50) charset utf8                    null comment '项目名称',
    transaction_type varchar(50) charset utf8                    null comment '交易类型',
    business_type    varchar(50) charset utf8                    null comment '业务类型',
    account_type     varchar(50) charset utf8                    null comment '账户类型',
    amount_kcoin     decimal(10, 2)                              null comment '金额（K币）',
    balance_kcoin    decimal(10, 2)                              null comment '余额（K币）',
    remark           varchar(255) charset utf8                   null comment '备注',
    created_by       varchar(100) NOT NULL COMMENT '插入人',
    created_at       timestamp    DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by       varchar(100) COMMENT '更新人',
    updated_at       timestamp    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
)comment '孩子王-推广';

create table rpa_data.tmp_hzw_king_promotion as  select * from rpa_data.hzw_king_promotion;


insert OVERWRITE rpa_data.hzw_king_promotion select id,date,shop_id,platform_name,project_name,transaction_type,business_type,account_type,amount_kcoin,balance_kcoin,remark,created_by,created_at,null,null from rpa_data.tmp_hzw_king_promotion;


truncate table rpa_data.tb_tm_living_sale;


show create jky.qm_trades_fullinfo_assembly_goodsdto;


update rpa_data.tb_settle_overview set shop_id = 117626295 where shop_id is null

select distinct shop_id from rpa_data.tb_settle_overview;