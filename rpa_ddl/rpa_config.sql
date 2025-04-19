CREATE DATABASE rpa_config CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE TABLE IF NOT EXISTS user
(
    id           INT AUTO_INCREMENT PRIMARY KEY COMMENT '主键ID，自增',
    platform     int(2)       NOT NULL COMMENT '平台：1：淘宝，2：天猫超市，3：京东，4：拼多多，5：唯品会，6：小红书，7：有赞，8：抖音，9：快手,10:梦饷',
    platform_url varchar(20)  NOT NULL COMMENT '平台链接',
    account_id   varchar(50)  NOT NULL COMMENT '账户id',
    account_name varchar(50)  NOT NULL COMMENT '账户名称',
    password     varchar(50)  NOT NULL COMMENT '账户密码',
    remark       varchar(100) DEFAULT NULL COMMENT '备注',
    created_by   VARCHAR(100) NOT NULL COMMENT '插入人',
    created_at   TIMESTAMP    DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by   VARCHAR(100) COMMENT '更新人',
    updated_at   TIMESTAMP    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) COMMENT ='用户账户表';

CREATE TABLE IF NOT EXISTS crawler_page
(
    id           INT AUTO_INCREMENT PRIMARY KEY COMMENT '主键ID，自增',
    rpa_name     varchar(50)  NOT NULL COMMENT 'rpa应用名称',
    platform     int(2)       NOT NULL COMMENT '平台：1：淘宝，2：天猫超市，3：京东，4：拼多多，5：唯品会，6：小红书，7：有赞，8：抖音，9：快手,10:梦饷',
    crawler_url  varchar(20)  NOT NULL COMMENT '爬虫链接或爬虫页面名称',
    target_table varchar(20)  NOT NULL COMMENT '目标表',
    remark       varchar(100) DEFAULT NULL COMMENT '备注',
    created_by   VARCHAR(100) NOT NULL COMMENT '插入人',
    created_at   TIMESTAMP    DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by   VARCHAR(100) COMMENT '更新人',
    updated_at   TIMESTAMP    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) COMMENT ='爬虫页面详情表';

CREATE TABLE IF NOT EXISTS shop_account
(
    id           INT AUTO_INCREMENT PRIMARY KEY COMMENT '主键ID，自增',
    type         TINYINT      NOT NULL COMMENT '账户类型：1：店铺，2：推广账户',
    account_id   varchar(50)  NOT NULL COMMENT '账户id',
    account_name varchar(50)  NOT NULL COMMENT '账户名称',
    created_by   VARCHAR(100) NOT NULL COMMENT '插入人',
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by   VARCHAR(100) COMMENT '更新人',
    updated_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) COMMENT ='店铺推广账户详情表';

CREATE TABLE IF NOT EXISTS shop_account_ref
(
    shop_account_id      INT          NOT NULL COMMENT '店铺账户id',
    promotion_account_id INT          NOT NULL COMMENT '推广账户id',
    created_by           VARCHAR(100) NOT NULL COMMENT '插入人',
    created_at           TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by           VARCHAR(100) COMMENT '更新人',
    updated_at           TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) COMMENT ='店铺推广账户关系表';


CREATE TABLE IF NOT EXISTS jky_shop_ref
(
    account_id           INT          NOT NULL COMMENT '店铺账户id',
    promotion_account_id INT         default NULL COMMENT '推广账户id，没有怎么为空',
    jky_shop_id          INT         default NULL COMMENT '吉客云店铺id',
    jky_cate             INT         default NULL COMMENT '业务分类',
    jdy_channel          varchar(50) default null comment '所属渠道',
    jky_promotion_id     INT         default NULL COMMENT '推广账户id',
    created_by           VARCHAR(100) NOT NULL COMMENT '插入人',
    created_at           TIMESTAMP   DEFAULT CURRENT_TIMESTAMP COMMENT '插入时间',
    updated_by           VARCHAR(100) COMMENT '更新人',
    updated_at           TIMESTAMP   DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) COMMENT ='吉客云店铺关联关系表';
