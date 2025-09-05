CREATE TABLE ads.trd_user_stats
(
    dt                 date comment '分区日期',
    is_smp             int comment '是否派样',
    day_type           varchar comment '日期类型：d:天，w:周，m:月',
    uv                 BIGINT COMMENT '活跃人数',
    total_user_cnt     BIGINT COMMENT '总下单支付购买人数',
    total_amt          DECIMAL(16, 2) COMMENT '总下单支付金额',
    avg_price          DECIMAL(16, 2) COMMENT '客单价',
    new_user_order_cnt BIGINT COMMENT '新客下单人数',
    new_user_order_amt DECIMAL(16, 2) COMMENT '新客下单金额',
    new_user_avg_price DECIMAL(16, 2) COMMENT '新客客单价',
    old_user_order_cnt BIGINT COMMENT '老客下单人数',
    old_user_order_amt DECIMAL(16, 2) COMMENT '老客下单金额',
    old_user_avg_price DECIMAL(16, 2) COMMENT '老客客单价',
    repeat_rate_30d double comment '30天复购率',
    repeat_rate_60d double comment '60天复购率',
    repeat_rate_90d double comment '90天复购率',
    repeat_rate_180d double comment '180天复购率'
) PARTITION BY VALUE(dt,is_smp,day_type) comment '交易域-用户核心指标汇总表';


CREATE TABLE ads.trd_user_stats_by_channel
(
    dt                 date comment '分区日期',
    is_smp             int comment '是否派样',
    day_type           varchar comment '日期类型：d:天，w:周，m:月',
    channel            varchar comment '渠道',
    uv                 BIGINT COMMENT '活跃人数',
    total_user_cnt     BIGINT COMMENT '总下单支付购买人数',
    total_amt          DECIMAL(16, 2) COMMENT '总下单支付金额',
    avg_price          DECIMAL(16, 2) COMMENT '客单价',
    new_user_order_cnt BIGINT COMMENT '新客下单人数',
    new_user_order_amt DECIMAL(16, 2) COMMENT '新客下单金额',
    new_user_avg_price DECIMAL(16, 2) COMMENT '新客客单价',
    old_user_order_cnt BIGINT COMMENT '老客下单人数',
    old_user_order_amt DECIMAL(16, 2) COMMENT '老客下单金额',
    old_user_avg_price DECIMAL(16, 2) COMMENT '老客客单价',
    repeat_rate_30d double comment '30天复购率',
    repeat_rate_60d double comment '60天复购率',
    repeat_rate_90d double comment '90天复购率',
    repeat_rate_180d double comment '180天复购率'
) PARTITION BY VALUE(dt,is_smp,day_type,channel) comment '交易域-用户渠道指标汇总表';


CREATE TABLE ads.trd_user_stats_by_channel_by_cate
(
    dt                 date comment '分区日期',
    day_type           varchar comment '日期类型：d:天，w:周，m:月',
    channel            varchar comment '渠道',
    cate               varchar comment '品类',
    is_smp             int comment '是否派样',
    uv                 BIGINT COMMENT '活跃人数',
    total_user_cnt     BIGINT COMMENT '总下单支付购买人数',
    total_amt          DECIMAL(16, 2) COMMENT '总下单支付金额',
    avg_price          DECIMAL(16, 2) COMMENT '客单价',
    new_user_order_cnt BIGINT COMMENT '新客下单人数',
    new_user_order_amt DECIMAL(16, 2) COMMENT '新客下单金额',
    new_user_avg_price DECIMAL(16, 2) COMMENT '新客客单价',
    old_user_order_cnt BIGINT COMMENT '老客下单人数',
    old_user_order_amt DECIMAL(16, 2) COMMENT '老客下单金额',
    old_user_avg_price DECIMAL(16, 2) COMMENT '老客客单价',
    repeat_rate_30d double comment '30天复购率',
    repeat_rate_60d double comment '60天复购率',
    repeat_rate_90d double comment '90天复购率',
    repeat_rate_180d double comment '180天复购率'
) PARTITION BY VALUE(dt, day_type) comment '交易域-用户渠道品类指标汇总表';


CREATE TABLE ads.trd_user_cohort
(
    mt                  date comment '分区月份',
    n1_repeat_user_cnt  BIGINT COMMENT 'N+1月复购人数',
    n2_repeat_user_cnt  BIGINT COMMENT 'N+2月复购人数',
    n3_repeat_user_cnt  BIGINT COMMENT 'N+3月复购人数',
    n4_repeat_user_cnt  BIGINT COMMENT 'N+4月复购人数',
    n5_repeat_user_cnt  BIGINT COMMENT 'N+5月复购人数',
    n6_repeat_user_cnt  BIGINT COMMENT 'N+6月复购人数',
    n7_repeat_user_cnt  BIGINT COMMENT 'N+7月复购人数',
    n8_repeat_user_cnt  BIGINT COMMENT 'N+8月复购人数',
    n9_repeat_user_cnt  BIGINT COMMENT 'N+9月复购人数',
    n10_repeat_user_cnt BIGINT COMMENT 'N+10月复购人数',
    n11_repeat_user_cnt BIGINT COMMENT 'N+11月复购人数',
    n12_repeat_user_cnt BIGINT COMMENT 'N+12月复购人数',
    n1_repeat_rate double COMMENT 'N+1月复购率',
    n2_repeat_rate double COMMENT 'N+2月复购率',
    n3_repeat_rate double COMMENT 'N+3月复购率',
    n4_repeat_rate double COMMENT 'N+4月复购率',
    n5_repeat_rate double COMMENT 'N+5月复购率',
    n6_repeat_rate double COMMENT 'N+6月复购率',
    n7_repeat_rate double COMMENT 'N+7月复购率',
    n8_repeat_rate double COMMENT 'N+8月复购率',
    n9_repeat_rate double COMMENT 'N+9月复购率',
    n10_repeat_rate double COMMENT 'N+10月复购率',
    n11_repeat_rate double COMMENT 'N+11月复购率',
    n112_repeat_rate double COMMENT 'N+12月复购率',
    n1_repeat_rate_ratio double COMMENT 'N+1月复购率比',
    n2_repeat_rate_ratio double COMMENT 'N+2月复购率比',
    n3_repeat_rate_ratio double COMMENT 'N+3月复购率比',
    n4_repeat_rate_ratio double COMMENT 'N+4月复购率比',
    n5_repeat_rate_ratio double COMMENT 'N+5月复购率比',
    n6_repeat_rate_ratio double COMMENT 'N+6月复购率比',
    n7_repeat_rate_ratio double COMMENT 'N+7月复购率比',
    n8_repeat_rate_ratio double COMMENT 'N+8月复购率比',
    n9_repeat_rate_ratio double COMMENT 'N+9月复购率比',
    n10_repeat_rate_ratio double COMMENT 'N+10月复购率比',
    n11_repeat_rate_ratio double COMMENT 'N+11月复购率比',
    n112_repeat_rate_ratio double COMMENT 'N+12月复购率',
) PARTITION BY VALUE(dt, day_type) comment '交易域-用户cohort分析';


