TRUNCATE TABLE ads.tmp_order_user;
insert into ads.tmp_order_user
(pay_date,
pay_week,
pay_month,
shop_id,
shop_name,
user_id,
order_cnt,
total_amt,
rfd_amt,
rfd_flag)
select 
date(p.pay_time) pay_date,
DATE_SUB(date(p.pay_time), INTERVAL WEEKDAY(date(p.pay_time)) DAY) AS pay_week,
CONCAT(DATE_FORMAT(p.pay_time, '%Y-%m'), '-01') as pay_month,
p.shop_id,
p.shop_name,
p.user_id , 
COUNT(DISTINCT p.plat_order_id) as order_cnt,
SUM(p.total_amt) as total_amt,
COALESCE(MAX(r.rfd_amt), 0) as rfd_amt, -- 退款金额
max(case when r.plat_order_id is not null then 1 else 0 end) rfd_flag -- 是否有退款
FROM dws.trd_pay_item p
LEFT JOIN (
    -- 性能优化：先根据支付表的订单号过滤退款表，避免全表扫描
    SELECT 
        r.plat_order_id,
        SUM(r.rfd_amt) as rfd_amt
    FROM dwd.trd_rfd_item r
    WHERE r.plat_order_id IN (
        -- 先获取指定时间段内的订单号列表
        SELECT DISTINCT plat_order_id 
        FROM dws.trd_pay_item 
        WHERE pay_time >= '2025-08-01' AND pay_time < '2025-09-01'
    )
    GROUP BY r.plat_order_id
) r ON p.plat_order_id = r.plat_order_id -- 通过订单号，拿到退款金额
WHERE p.pay_time >='2025-08-01' AND p.pay_time<'2025-09-01'
GROUP BY p.shop_id, p.user_id, DATE(p.pay_time);





-- 6月份中的下单客户，历史和今后的所有订单表,(用于拿到首次下单时间，和店铺用户的订单序号)
TRUNCATE TABLE ads.tmp_order_user_all; -- 2056462
insert into ads.tmp_order_user_all
(
pay_date,
shop_id,
shop_name,
user_id,
order_cnt,
total_amt,
first_user_order,
first_user_shop,
order_sequence
)
SELECT 
    pay_date, 
    shop_id, 
    shop_name, 
    user_id, 
    order_cnt,
    total_amt,
    user_first_order_date,
    usershop_first_order_date,
    -- 添加历次下单序号
    ROW_NUMBER() OVER(PARTITION BY user_id, shop_id ORDER BY pay_date) AS order_sequence
FROM (
    SELECT 
        pay_date, 
        shop_id, 
        shop_name, 
        user_id, 
        COUNT(DISTINCT plat_order_id) as order_cnt, 
        SUM(total_amt) as total_amt,
        -- 用户的首次下单日期
        MIN(pay_date) OVER(PARTITION BY user_id) as user_first_order_date,
        MIN(pay_date) OVER(PARTITION BY user_id,shop_id) as usershop_first_order_date
    FROM ( 
        SELECT 
            LEFT(pay_time,10) as pay_date, 
            a.shop_id, 
            a.shop_name, 
            a.user_id, 
            a.plat_order_id, 
            a.total_amt 
        FROM dws.trd_pay_item a 
        JOIN ads.`tmp_order_user` b ON a.user_id=b.user_id AND a.shop_id=b.shop_id 
    ) t 
    GROUP BY pay_date, shop_id, user_id 
) base_data 
ORDER BY user_id, shop_id, pay_date;

-- 更新用户首次下单时间，+用户在店铺的下单序号 -- 2w

UPDATE ads.tmp_order_user t1 
JOIN ads.tmp_order_user_all t2 ON t1.user_id = t2.user_id 
AND t1.shop_id = t2.shop_id AND t1.pay_date = t2.pay_date 
SET 
t1.first_user_order = t2.first_user_order, -- 只判断用户
-- 以下字段针对店铺
t1.first_user_shop = t2.first_user_shop, 
t1.first_user_shop_week = DATE_SUB(DATE(t2.first_user_shop), INTERVAL WEEKDAY(DATE(t2.first_user_shop)) DAY), 
t1.first_user_shop_month = CONCAT(DATE_FORMAT(t2.first_user_shop, '%Y-%m'), '-01'), 
t1.order_sequence = t2.order_sequence;

-- 更新日复购标签
-- 更新30天复购标签 12w
UPDATE ads.tmp_order_user t1 
SET repurchase_30d = 1 
WHERE EXISTS (
    SELECT 1 FROM ads.tmp_order_user_all t2 
    WHERE t2.user_id = t1.user_id 
      AND t2.shop_id = t1.shop_id
      AND DATEDIFF(t2.pay_date, t1.pay_date) BETWEEN 1 AND 30
);

-- 更新60天复购标签 13w
UPDATE ads.tmp_order_user t1 
SET repurchase_60d = 1 
WHERE EXISTS (
    SELECT 1 FROM ads.tmp_order_user_all t2 
    WHERE t2.user_id = t1.user_id 
      AND t2.shop_id = t1.shop_id
      AND DATEDIFF(t2.pay_date, t1.pay_date) BETWEEN 1 AND 60
);

-- 更新90天复购标签 13w
UPDATE ads.tmp_order_user t1 
SET repurchase_90d = 1 
WHERE EXISTS (
    SELECT 1 FROM ads.tmp_order_user_all t2 
    WHERE t2.user_id = t1.user_id 
      AND t2.shop_id = t1.shop_id
      AND DATEDIFF(t2.pay_date, t1.pay_date) BETWEEN 1 AND 90
);

-- 更新180天复购标签 13w
UPDATE ads.tmp_order_user t1 
SET repurchase_180d = 1 
WHERE EXISTS (
    SELECT 1 FROM ads.tmp_order_user_all t2 
    WHERE t2.user_id = t1.user_id 
      AND t2.shop_id = t1.shop_id
      AND DATEDIFF(t2.pay_date, t1.pay_date) BETWEEN 1 AND 180
);

-- 更新365天复购标签 13w
UPDATE ads.tmp_order_user t1 
SET repurchase_365d = 1 
WHERE EXISTS (
    SELECT 1 FROM ads.tmp_order_user_all t2 
    WHERE t2.user_id = t1.user_id 
      AND t2.shop_id = t1.shop_id
      AND DATEDIFF(t2.pay_date, t1.pay_date) BETWEEN 1 AND 365
);



-- 更新30天复购周标签

truncate table ads.`tmp_order_user_last_pay`;
insert into ads.tmp_order_user_last_pay(user_id,shop_id, pay_week,last_pay_date)
SELECT user_id, shop_id, pay_week, MAX(pay_date) as last_pay_date
FROM ads.tmp_order_user 
GROUP BY user_id, shop_id, pay_week;


UPDATE ads.tmp_order_user t1 
INNER JOIN ads.tmp_order_user_last_pay w 
    ON w.user_id = t1.user_id 
    AND w.shop_id = t1.shop_id 
    AND w.pay_week = t1.pay_week
SET t1.repurchase_30d_w = 1
WHERE EXISTS (
    SELECT 1 FROM ads.tmp_order_user_all t2 
    WHERE t2.user_id = w.user_id 
      AND t2.shop_id = w.shop_id
      AND DATEDIFF(t2.pay_date, w.last_pay_date) BETWEEN 1 AND 30
);

-- 更新60天复购周标签
UPDATE ads.tmp_order_user t1 
INNER JOIN ads.tmp_order_user_last_pay w 
    ON w.user_id = t1.user_id 
    AND w.shop_id = t1.shop_id 
    AND w.pay_week = t1.pay_week
SET t1.repurchase_60d_w = 1
WHERE EXISTS (
    SELECT 1 FROM ads.tmp_order_user_all t2 
    WHERE t2.user_id = w.user_id 
      AND t2.shop_id = w.shop_id
      AND DATEDIFF(t2.pay_date, w.last_pay_date) BETWEEN 1 AND 60
);

-- 更新90天复购周标签
UPDATE ads.tmp_order_user t1 
INNER JOIN ads.tmp_order_user_last_pay w 
    ON w.user_id = t1.user_id 
    AND w.shop_id = t1.shop_id 
    AND w.pay_week = t1.pay_week
SET t1.repurchase_90d_w = 1
WHERE EXISTS (
    SELECT 1 FROM ads.tmp_order_user_all t2 
    WHERE t2.user_id = w.user_id 
      AND t2.shop_id = w.shop_id
      AND DATEDIFF(t2.pay_date, w.last_pay_date) BETWEEN 1 AND 90
);

-- 更新180天复购周标签
UPDATE ads.tmp_order_user t1 
INNER JOIN ads.tmp_order_user_last_pay w 
    ON w.user_id = t1.user_id 
    AND w.shop_id = t1.shop_id 
    AND w.pay_week = t1.pay_week
SET t1.repurchase_180d_w = 1
WHERE EXISTS (
    SELECT 1 FROM ads.tmp_order_user_all t2 
    WHERE t2.user_id = w.user_id 
      AND t2.shop_id = w.shop_id
      AND DATEDIFF(t2.pay_date, w.last_pay_date) BETWEEN 1 AND 180
);

-- 更新365天复购周标签
UPDATE ads.tmp_order_user t1 
INNER JOIN ads.tmp_order_user_last_pay w 
    ON w.user_id = t1.user_id 
    AND w.shop_id = t1.shop_id 
    AND w.pay_week = t1.pay_week
SET t1.repurchase_365d_w = 1
WHERE EXISTS (
    SELECT 1 FROM ads.tmp_order_user_all t2 
    WHERE t2.user_id = w.user_id 
      AND t2.shop_id = w.shop_id
      AND DATEDIFF(t2.pay_date, w.last_pay_date) BETWEEN 1 AND 365
);



-- =============================================
-- 更新复购月标签 (基于pay_month聚合)
-- =============================================

-- 创建月聚合临时表
truncate table ads.tmp_order_user_last_pay;
insert into ads.tmp_order_user_last_pay(user_id,shop_id, pay_month,last_pay_date)
SELECT user_id, shop_id, pay_month, MAX(pay_date) as last_pay_date
FROM ads.tmp_order_user 
GROUP BY user_id, shop_id, pay_month;

-- 更新30天复购月标签
UPDATE ads.tmp_order_user t1 
INNER JOIN ads.tmp_order_user_last_pay m 
    ON m.user_id = t1.user_id 
    AND m.shop_id = t1.shop_id 
    AND m.pay_month = t1.pay_month
SET t1.repurchase_30d_m = 1
WHERE EXISTS (
    SELECT 1 FROM ads.tmp_order_user_all t2 
    WHERE t2.user_id = m.user_id 
      AND t2.shop_id = m.shop_id
      AND DATEDIFF(t2.pay_date, m.last_pay_date) BETWEEN 1 AND 30
);

-- 更新60天复购月标签
UPDATE ads.tmp_order_user t1 
INNER JOIN ads.tmp_order_user_last_pay m 
    ON m.user_id = t1.user_id 
    AND m.shop_id = t1.shop_id 
    AND m.pay_month = t1.pay_month
SET t1.repurchase_60d_m = 1
WHERE EXISTS (
    SELECT 1 FROM ads.tmp_order_user_all t2 
    WHERE t2.user_id = m.user_id 
      AND t2.shop_id = m.shop_id
      AND DATEDIFF(t2.pay_date, m.last_pay_date) BETWEEN 1 AND 60
);

-- 更新90天复购月标签
UPDATE ads.tmp_order_user t1 
INNER JOIN ads.tmp_order_user_last_pay m 
    ON m.user_id = t1.user_id 
    AND m.shop_id = t1.shop_id 
    AND m.pay_month = t1.pay_month
SET t1.repurchase_90d_m = 1
WHERE EXISTS (
    SELECT 1 FROM ads.tmp_order_user_all t2 
    WHERE t2.user_id = m.user_id 
      AND t2.shop_id = m.shop_id
      AND DATEDIFF(t2.pay_date, m.last_pay_date) BETWEEN 1 AND 90
);

-- 更新180天复购月标签
UPDATE ads.tmp_order_user t1 
INNER JOIN ads.tmp_order_user_last_pay m 
    ON m.user_id = t1.user_id 
    AND m.shop_id = t1.shop_id 
    AND m.pay_month = t1.pay_month
SET t1.repurchase_180d_m = 1
WHERE EXISTS (
    SELECT 1 FROM ads.tmp_order_user_all t2 
    WHERE t2.user_id = m.user_id 
      AND t2.shop_id = m.shop_id
      AND DATEDIFF(t2.pay_date, m.last_pay_date) BETWEEN 1 AND 180
);

-- 更新365天复购月标签
UPDATE ads.tmp_order_user t1 
INNER JOIN ads.tmp_order_user_last_pay m 
    ON m.user_id = t1.user_id 
    AND m.shop_id = t1.shop_id 
    AND m.pay_month = t1.pay_month
SET t1.repurchase_365d_m = 1
WHERE EXISTS (
    SELECT 1 FROM ads.tmp_order_user_all t2 
    WHERE t2.user_id = m.user_id 
      AND t2.shop_id = m.shop_id
      AND DATEDIFF(t2.pay_date, m.last_pay_date) BETWEEN 1 AND 365
);

-- 
delete from ads.`ads_customer_order_analysis_detail_1` 
where date_type='日'
and pay_date >=(select min(pay_date) from ads.tmp_order_user )
and pay_date<=(select max(pay_date) from ads.tmp_order_user );

delete from ads.`ads_customer_order_analysis_detail_1` 
where date_type='周'
and pay_date >=(select min(pay_week) from ads.tmp_order_user )
and pay_date<=(select max(pay_week) from ads.tmp_order_user );

delete from ads.`ads_customer_order_analysis_detail_1` 
where date_type='月'
and pay_date >=(select min(pay_month) from ads.tmp_order_user )
and pay_date<=(select max(pay_month) from ads.tmp_order_user );





-- 查询结果1
insert into ads.`ads_customer_order_analysis_detail_1`(
pay_date,
date_type,
total_customer_count,
total_amount,
avg_purchase_frequency,-- 订单数量
avg_unit_price,
avg_unit_value,
avg_unit_day,
avg_ltv
)
 SELECT 
    pay_date, -- 下单日期
    '日' as date_type,
    count(distinct user_id) as total_customer_count, -- 总成交人数
	  sum(total_amt), -- 分摊后金额(订单金额)
	  sum(order_cnt)/count(distinct user_id), -- 订单数量(平均购物频次一人一天可能有多个订单)
    avg(total_amt) as avg_unit_price ,  -- 平均客单价
    sum(total_amt)/sum(order_cnt) as avg_unit_value,  -- 平均用户价值
    sum(TIMESTAMPDIFF(day,first_user_order,pay_date))/count(distinct user_id) avg_unit_day,  -- 平均生命周期(平均购买间隔)
    (sum(total_amt)/sum(order_cnt))*(sum(TIMESTAMPDIFF(day,first_user_order,pay_date))/ count(distinct user_id)) as avg_ltv
FROM ads.tmp_order_user a 
group BY  pay_date  -- 聚合日
union all
-- 周

 SELECT 
     pay_week, 
    '周' as date_type,
    count(distinct user_id) as total_customer_count, -- 总成交人数
	  sum(total_amt), -- 分摊后金额(订单金额)
	  sum(order_cnt)/count(distinct user_id), -- 订单数量(平均购物频次一人一天可能有多个订单)
    avg(total_amt) as avg_unit_price ,  -- 平均客单价
    sum(total_amt)/sum(order_cnt) as avg_unit_value,  -- 平均用户价值
    sum(TIMESTAMPDIFF(day,first_user_order,pay_date))/count(distinct user_id) avg_unit_day,  -- 平均生命周期(平均购买间隔)
    (sum(total_amt)/sum(order_cnt))*(sum(TIMESTAMPDIFF(day,first_user_order,pay_date))/ count(distinct user_id)) as avg_ltv
FROM ads.tmp_order_user a 
group BY  pay_week  -- 聚合周
union all
-- 月
 SELECT 
    pay_month, 
    '月' as date_type,
    count(distinct user_id) as total_customer_count, -- 总成交人数
	  sum(total_amt), -- 分摊后金额(订单金额)
	  sum(order_cnt)/count(distinct user_id), -- 订单数量(平均购物频次一人一天可能有多个订单)
    avg(total_amt) as avg_unit_price ,  -- 平均客单价
    sum(total_amt)/sum(order_cnt) as avg_unit_value,  -- 平均用户价值
    sum(TIMESTAMPDIFF(day,first_user_order,pay_date))/count(distinct user_id) avg_unit_day,  -- 平均生命周期(平均购买间隔)
    (sum(total_amt)/sum(order_cnt))*(sum(TIMESTAMPDIFF(day,first_user_order,pay_date))/ count(distinct user_id)) as avg_ltv
FROM ads.tmp_order_user a 
group BY  pay_month  -- 聚合月
;


-- 增量更新
delete from ads.`ads_customer_order_analysis_detail_2` 
where date_type='日'
and pay_date >=(select min(pay_date) from ads.tmp_order_user )
and pay_date<=(select max(pay_date) from ads.tmp_order_user );

delete from ads.`ads_customer_order_analysis_detail_2` 
where date_type='周'
and pay_date >=(select min(pay_week) from ads.tmp_order_user )
and pay_date<=(select max(pay_week) from ads.tmp_order_user );

delete from ads.`ads_customer_order_analysis_detail_2` 
where date_type='月'
and pay_date >=(select min(pay_month) from ads.tmp_order_user )
and pay_date<=(select max(pay_month) from ads.tmp_order_user );
-- 查询结果2
insert into ads.ads_customer_order_analysis_detail_2
(
pay_date,
date_type,
shop_id,
shop_name,
new_customer_count_rfd,
new_customer_amount_rfd,
old_customer_count_rfd,
old_customer_amount_rfd,
new_customer_count,
new_customer_amount,
new_customer_unit_price,
old_customer_count,
old_customer_amount,
old_customer_unit_price,
old_customer_purchase_frequency,
old_customer_purchase_interval,
old_customer_ltv,
-- 新客复购
repurchase_count_30d_new,
repurchase_count_60d_new,
repurchase_count_90d_new,
repurchase_count_180d_new,
repurchase_count_365d_new,
repurchase_rate_30d_new,
repurchase_rate_60d_new,
repurchase_rate_90d_new,
repurchase_rate_180d_new,
repurchase_rate_365d_new,
-- 全部复购
repurchase_count_30d,
repurchase_count_60d,
repurchase_count_90d,
repurchase_count_180d,
repurchase_count_365d,
repurchase_rate_30d,
repurchase_rate_60d,
repurchase_rate_90d,
repurchase_rate_180d,
repurchase_rate_365d
)
SELECT 
     pay_date, 
     '日' AS date_type, 
     shop_id, 
     shop_name, 
     -- 退款指标
     SUM(CASE WHEN order_sequence = 1 and rfd_flag=1 THEN 1 ELSE 0 END) AS new_customer_count_rfd, -- 新客退人数
     SUM(CASE WHEN order_sequence = 1 and rfd_flag=1 THEN rfd_amt ELSE 0 END) AS new_customer_amount_rfd, -- 新客退款金额
     SUM(CASE WHEN order_sequence > 1 and rfd_flag=1 THEN 1 ELSE 0 END) AS old_customer_count_rfd, -- 老客退人数
     SUM(CASE WHEN order_sequence > 1 and rfd_flag=1 then rfd_amt ELSE 0 END) AS old_customer_amount_rfd, -- 老客退款金额
     -- 新客指标 
     SUM(CASE WHEN order_sequence = 1 THEN 1 ELSE 0 END) AS new_customer_count, -- 新客成交人数
     SUM(CASE WHEN order_sequence = 1 THEN total_amt ELSE 0 END) AS new_customer_amount, -- 新客成功金额
     CASE 
         WHEN SUM(CASE WHEN order_sequence = 1 THEN 1 ELSE 0 END) > 0 
         THEN SUM(CASE WHEN order_sequence = 1 THEN total_amt ELSE 0 END) / 
              SUM(CASE WHEN order_sequence = 1 THEN 1 ELSE 0 END)
         ELSE 0 
     END AS new_customer_unit_price, -- 客单价
     -- 老客指标 
     SUM(CASE WHEN order_sequence > 1 THEN 1 ELSE 0 END) AS old_customer_count, -- 老客成交人数
     SUM(CASE WHEN order_sequence > 1 THEN total_amt ELSE 0 END) AS old_customer_amount, -- 老客成交金额
     CASE 
         WHEN SUM(CASE WHEN order_sequence > 1 THEN 1 ELSE 0 END) > 0 
         THEN SUM(CASE WHEN order_sequence > 1 THEN total_amt ELSE 0 END) / 
              SUM(CASE WHEN order_sequence > 1 THEN 1 ELSE 0 END)
         ELSE 0 
     END AS old_customer_unit_price,  -- 老客客单价
     -- 老客平均购买频次
     CASE 
         WHEN SUM(CASE WHEN order_sequence > 1 THEN 1 ELSE 0 END) > 0 
         THEN SUM(CASE WHEN order_sequence > 1 THEN order_cnt ELSE 0 END) / 
              SUM(CASE WHEN order_sequence > 1 THEN 1 ELSE 0 END)
         ELSE 0 
     END AS old_customer_purchase_frequency,
     -- 老客平均生命周期（后减前）
     CASE 
         WHEN SUM(CASE WHEN order_sequence > 1 THEN 1 ELSE 0 END) > 0 
         THEN SUM(CASE WHEN order_sequence > 1 THEN TIMESTAMPDIFF(day,first_user_shop,pay_date) ELSE 0 END) / 
              SUM(CASE WHEN order_sequence > 1 THEN 1 ELSE 0 END)
         ELSE 0 
     END AS old_customer_purchase_interval,
    -- ltv=平均用户价值*平均生命周期（修正语法错误）
     CASE 
         WHEN SUM(CASE WHEN order_sequence > 1 THEN order_cnt ELSE 0 END) > 0 
              AND SUM(CASE WHEN order_sequence > 1 THEN 1 ELSE 0 END) > 0 
         THEN (SUM(CASE WHEN order_sequence > 1 THEN total_amt ELSE 0 END) / 
               SUM(CASE WHEN order_sequence > 1 THEN order_cnt ELSE 0 END)) * 
              (SUM(CASE WHEN order_sequence > 1 THEN TIMESTAMPDIFF(DAY,first_user_shop,pay_date) ELSE 0 END) / 
               SUM(CASE WHEN order_sequence > 1 THEN 1 ELSE 0 END))
         ELSE 0 
     END AS old_customer_ltv, 
		 
		 -- 新客复购率
		 COUNT(DISTINCT CASE WHEN repurchase_30d = 1 and order_sequence = 1 THEN user_id END) AS repurchase_count_30d_new, 
     COUNT(DISTINCT CASE WHEN repurchase_60d = 1 and order_sequence = 1 THEN user_id END) AS repurchase_count_60d_new, 
     COUNT(DISTINCT CASE WHEN repurchase_90d = 1 and order_sequence = 1 THEN user_id END) AS repurchase_count_90d_new, 
     COUNT(DISTINCT CASE WHEN repurchase_180d = 1 and order_sequence = 1 THEN user_id END) AS repurchase_count_180d_new, 
     COUNT(DISTINCT CASE WHEN repurchase_365d = 1 and order_sequence = 1 THEN user_id END) AS repurchase_count_365d_new, 
     -- 复购率（安全处理分母为0的情况）
     CASE 
         WHEN SUM(CASE WHEN order_sequence = 1  THEN 1 ELSE 0 END) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_30d = 1 and order_sequence = 1 THEN user_id END) / 
              SUM(CASE WHEN order_sequence = 1 THEN 1 ELSE 0 END)
         ELSE 0 
     END AS repurchase_rate_30d_new,
     CASE 
         WHEN SUM(CASE WHEN order_sequence = 1 THEN 1 ELSE 0 END) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_60d = 1 and order_sequence = 1 THEN user_id END) / 
              SUM(CASE WHEN order_sequence = 1 THEN 1 ELSE 0 END)
         ELSE 0 
     END AS repurchase_rate_60d_new,
     CASE 
         WHEN SUM(CASE WHEN order_sequence = 1 THEN 1 ELSE 0 END) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_90d = 1 and order_sequence = 1 THEN user_id END) / 
              SUM(CASE WHEN order_sequence = 1 THEN 1 ELSE 0 END)
         ELSE 0 
     END AS repurchase_rate_90d_new,
     CASE 
         WHEN SUM(CASE WHEN order_sequence = 1 THEN 1 ELSE 0 END) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_180d = 1 and order_sequence = 1 THEN user_id END) / 
              SUM(CASE WHEN order_sequence = 1 THEN 1 ELSE 0 END)
         ELSE 0 
     END AS repurchase_rate_180d_new,
     CASE 
         WHEN SUM(CASE WHEN order_sequence = 1 THEN 1 ELSE 0 END) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_365d = 1 and order_sequence = 1 THEN user_id END) / 
              SUM(CASE WHEN order_sequence = 1 THEN 1 ELSE 0 END)
         ELSE 0 
     END AS repurchase_rate_365d_new,
		 
     -- 复购人数指标
     COUNT(DISTINCT CASE WHEN repurchase_30d = 1 THEN user_id END) AS repurchase_count_30d, 
     COUNT(DISTINCT CASE WHEN repurchase_60d = 1 THEN user_id END) AS repurchase_count_60d, 
     COUNT(DISTINCT CASE WHEN repurchase_90d = 1 THEN user_id END) AS repurchase_count_90d, 
     COUNT(DISTINCT CASE WHEN repurchase_180d = 1 THEN user_id END) AS repurchase_count_180d, 
     COUNT(DISTINCT CASE WHEN repurchase_365d = 1 THEN user_id END) AS repurchase_count_365d, 
     -- 复购率（安全处理分母为0的情况）
     CASE 
         WHEN count(distinct user_id) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_30d = 1 THEN user_id END) / 
              count(distinct user_id)
         ELSE 0 
     END AS repurchase_rate_30d,
     CASE 
         WHEN count(distinct user_id) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_60d = 1 THEN user_id END) / 
             count(distinct user_id)
         ELSE 0 
     END AS repurchase_rate_60d,
     CASE 
         WHEN count(distinct user_id) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_90d = 1 THEN user_id END) / 
              count(distinct user_id) 
         ELSE 0 
     END AS repurchase_rate_90d,
     CASE 
         WHEN count(distinct user_id) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_180d = 1 THEN user_id END) / 
              count(distinct user_id) 
         ELSE 0 
     END AS repurchase_rate_180d,
     CASE 
         WHEN count(distinct user_id) > 0  
         THEN COUNT(DISTINCT CASE WHEN repurchase_365d = 1 THEN user_id END) / 
              count(distinct user_id) 
         ELSE 0 
     END AS repurchase_rate_365d
FROM ads.tmp_order_user t1 
GROUP BY pay_date, shop_id

union all
SELECT 
    pay_week,
    '周' AS date_type,
    shop_id,
    shop_name,
     -- 退款指标
     COUNT(DISTINCT CASE WHEN pay_week =first_user_shop_week and rfd_flag=1 THEN user_id END) AS new_customer_count_rfd, -- 新客退人数
     SUM(CASE WHEN pay_week =first_user_shop_week and rfd_flag=1 THEN rfd_amt ELSE 0 END) AS new_customer_amount_rfd, -- 新客退款金额
     COUNT(DISTINCT CASE WHEN pay_week !=first_user_shop_week  and rfd_flag=1 THEN user_id END) AS old_customer_count_rfd, -- 老客退人数
     SUM(CASE WHEN pay_week !=first_user_shop_week and rfd_flag=1 THEN rfd_amt  ELSE 0 END) AS old_customer_amount_rfd, -- 老客退款金额
     
    -- 新客指标（统计当周首次下单的用户,订单序号是首次下单，并且下单周相同）
    COUNT(DISTINCT CASE WHEN pay_week =first_user_shop_week THEN user_id END) AS new_customer_count, -- 新客成交人数
    SUM(CASE WHEN pay_week =first_user_shop_week THEN total_amt ELSE 0 END) AS new_customer_amount,-- 成交金额
    CASE  WHEN COUNT(DISTINCT CASE WHEN pay_week =first_user_shop_week THEN user_id END) > 0 
        THEN SUM(CASE WHEN pay_week =first_user_shop_week THEN total_amt ELSE 0 END) / 
             COUNT(DISTINCT CASE WHEN pay_week =first_user_shop_week  THEN user_id END)
             ELSE 0 END AS new_customer_unit_price, -- 成交金额
    -- 老客指标（统计当周非首次下单的用户）
    COUNT(DISTINCT CASE WHEN pay_week !=first_user_shop_week THEN user_id END) AS old_customer_count,
    SUM(CASE WHEN pay_week !=first_user_shop_week THEN total_amt ELSE 0 END) AS old_customer_amount,
    CASE WHEN COUNT(DISTINCT CASE WHEN pay_week !=first_user_shop_week THEN user_id END) > 0 
        THEN SUM(CASE WHEN pay_week !=first_user_shop_week THEN total_amt ELSE 0 END) / 
             COUNT(DISTINCT CASE WHEN pay_week !=first_user_shop_week THEN user_id END)
        ELSE 0 END AS old_customer_unit_price,-- 老客客单价
    -- 老客购买频次（当周老客的平均下单次数）
    CASE WHEN COUNT(DISTINCT CASE WHEN pay_week !=first_user_shop_week THEN user_id END) > 0 
        THEN SUM(CASE WHEN pay_week !=first_user_shop_week THEN order_cnt ELSE 0 END) / 
             COUNT(DISTINCT CASE WHEN pay_week !=first_user_shop_week THEN user_id END)
        ELSE 0 END AS old_customer_purchase_frequency,

    -- 老客购买间隔（当周老客的平均下单间隔天数）
    CASE WHEN COUNT(DISTINCT CASE WHEN pay_week !=first_user_shop_week THEN user_id END) > 0 
        THEN SUM(CASE WHEN pay_week !=first_user_shop_week THEN TIMESTAMPDIFF(day,first_user_shop,pay_date) ELSE 0 END) / 
             COUNT(DISTINCT CASE WHEN pay_week !=first_user_shop_week THEN user_id END)
        ELSE 0 END AS old_customer_purchase_interval,
    -- 老客LTV（当周老客的客户生命周期价值）
	-- 老客LTV（当周老客的客户生命周期价值）- 修正版
	CASE 
	    WHEN SUM(CASE WHEN pay_week != first_user_shop_week THEN order_cnt ELSE 0 END) > 0 
	         AND COUNT(DISTINCT CASE WHEN pay_week != first_user_shop_week THEN user_id END) > 0 
	    THEN (SUM(CASE WHEN pay_week != first_user_shop_week THEN total_amt ELSE 0 END) / 
	          SUM(CASE WHEN pay_week != first_user_shop_week THEN order_cnt ELSE 0 END)) * 
	         (SUM(CASE WHEN pay_week != first_user_shop_week THEN TIMESTAMPDIFF(DAY,first_user_shop,pay_date) ELSE 0 END) / 
	          COUNT(DISTINCT CASE WHEN pay_week != first_user_shop_week THEN user_id END))
	    ELSE 0 
	END AS old_customer_ltv,
	-- 新客复购
    COUNT(DISTINCT CASE WHEN repurchase_30d_w = 1 and pay_week =first_user_shop_week THEN user_id END) AS repurchase_count_30d_new,
    COUNT(DISTINCT CASE WHEN repurchase_60d_w = 1  and pay_week =first_user_shop_week THEN user_id END) AS repurchase_count_60d_new,
    COUNT(DISTINCT CASE WHEN repurchase_90d_w = 1  and pay_week =first_user_shop_week THEN user_id END) AS repurchase_count_90d_new,
    COUNT(DISTINCT CASE WHEN repurchase_180d_w = 1  and pay_week =first_user_shop_week THEN user_id END) AS repurchase_count_180d_new,
    COUNT(DISTINCT CASE WHEN repurchase_365d_w = 1  and pay_week =first_user_shop_week THEN user_id END) AS repurchase_count_365d_new,
    -- 复购率（安全处理分母为0的情况）
    CASE WHEN COUNT(DISTINCT CASE WHEN pay_week =first_user_shop_week THEN user_id END) > 0 
        THEN COUNT(DISTINCT CASE WHEN repurchase_30d_w = 1  and pay_week =first_user_shop_week THEN user_id END) / 
             COUNT(DISTINCT CASE WHEN pay_week =first_user_shop_week THEN user_id END)
             ELSE 0 END AS repurchase_rate_30d_new,
    CASE WHEN COUNT(DISTINCT CASE WHEN pay_week =first_user_shop_week THEN user_id END) > 0 
        THEN COUNT(DISTINCT CASE WHEN repurchase_60d_w = 1  and pay_week =first_user_shop_week THEN user_id END) / 
             COUNT(DISTINCT CASE WHEN pay_week =first_user_shop_week THEN user_id END)
        ELSE 0 END AS repurchase_rate_60d_new,
    CASE WHEN COUNT(DISTINCT CASE WHEN pay_week =first_user_shop_week THEN user_id END) > 0 
        THEN COUNT(DISTINCT CASE WHEN repurchase_90d_w = 1 and pay_week =first_user_shop_week  THEN user_id END) / 
             COUNT(DISTINCT CASE WHEN pay_week =first_user_shop_week THEN user_id END)
        ELSE 0 END AS repurchase_rate_90d_new,
    CASE 
        WHEN COUNT(DISTINCT CASE WHEN pay_week =first_user_shop_week THEN user_id END) > 0 
        THEN COUNT(DISTINCT CASE WHEN repurchase_180d_w = 1  and pay_week =first_user_shop_week THEN user_id END) / 
             COUNT(DISTINCT CASE WHEN pay_week =first_user_shop_week THEN user_id END)
        ELSE 0 END AS repurchase_rate_180d_new,
    CASE 
        WHEN COUNT(DISTINCT CASE WHEN pay_week =first_user_shop_week THEN user_id END) > 0 
        THEN COUNT(DISTINCT CASE WHEN repurchase_365d_w = 1 and pay_week =first_user_shop_week  THEN user_id END) / 
             COUNT(DISTINCT CASE WHEN pay_week =first_user_shop_week THEN user_id END)
        ELSE 0 END AS repurchase_rate_365d_new,
    -- 复购人数指标,全部
    COUNT(DISTINCT CASE WHEN repurchase_30d_w = 1 THEN user_id END) AS repurchase_count_30d,
    COUNT(DISTINCT CASE WHEN repurchase_60d_w = 1 THEN user_id END) AS repurchase_count_60d,
    COUNT(DISTINCT CASE WHEN repurchase_90d_w = 1 THEN user_id END) AS repurchase_count_90d,
    COUNT(DISTINCT CASE WHEN repurchase_180d_w = 1 THEN user_id END) AS repurchase_count_180d,
    COUNT(DISTINCT CASE WHEN repurchase_365d_w = 1 THEN user_id END) AS repurchase_count_365d,
    -- 复购率（安全处理分母为0的情况）
    CASE WHEN COUNT(DISTINCT user_id) > 0 
        THEN COUNT(DISTINCT CASE WHEN repurchase_30d_w = 1 THEN user_id END) / 
              COUNT(DISTINCT user_id)
             ELSE 0 END AS repurchase_rate_30d,
    CASE WHEN COUNT(DISTINCT user_id) > 0 
        THEN COUNT(DISTINCT CASE WHEN repurchase_60d_w = 1 THEN user_id END) / 
             COUNT(DISTINCT user_id)
        ELSE 0 END AS repurchase_rate_60d,
    CASE WHEN  COUNT(DISTINCT user_id) > 0 
        THEN COUNT(DISTINCT CASE WHEN repurchase_90d_w = 1 THEN user_id END) / 
             COUNT(DISTINCT user_id)
        ELSE 0 END AS repurchase_rate_90d,
    CASE 
        WHEN  COUNT(DISTINCT user_id) > 0 
        THEN COUNT(DISTINCT CASE WHEN repurchase_180d_w = 1 THEN user_id END) / 
              COUNT(DISTINCT user_id)
        ELSE 0 END AS repurchase_rate_180d,
    CASE 
        WHEN  COUNT(DISTINCT user_id) > 0 
        THEN COUNT(DISTINCT CASE WHEN repurchase_365d_w = 1 THEN user_id END) / 
              COUNT(DISTINCT user_id)
        ELSE 0 END AS repurchase_rate_365d
FROM ads.tmp_order_user t1 
GROUP BY pay_week, shop_id

union all
SELECT 
    pay_month,
    '月' AS date_type,
    shop_id,
    shop_name,
         -- 退款指标
     COUNT(DISTINCT CASE WHEN pay_month = first_user_shop_month and rfd_flag=1 THEN user_id END) AS new_customer_count_rfd, -- 新客退人数
     SUM(CASE WHEN pay_month = first_user_shop_month and rfd_flag=1 THEN rfd_amt ELSE 0 END) AS new_customer_amount_rfd, -- 新客退款金额
     COUNT(DISTINCT CASE WHEN pay_month !=first_user_shop_month  and rfd_flag=1 THEN user_id END) AS old_customer_count_rfd, -- 老客退人数
     SUM(CASE WHEN pay_month !=first_user_shop_month and rfd_flag=1 THEN rfd_amt  ELSE 0 END) AS old_customer_amount_rfd, -- 老客退款金额
     
    -- 新客指标（只统计当月首次下单的用户）
    COUNT(DISTINCT CASE WHEN pay_month = first_user_shop_month THEN user_id END) AS new_customer_count,
    SUM(CASE WHEN pay_month = first_user_shop_month THEN total_amt ELSE 0 END) AS new_customer_amount,
    CASE 
        WHEN COUNT(DISTINCT CASE WHEN pay_month = first_user_shop_month THEN user_id END) > 0 
        THEN SUM(CASE WHEN pay_month = first_user_shop_month THEN total_amt ELSE 0 END) / 
             COUNT(DISTINCT CASE WHEN pay_month = first_user_shop_month THEN user_id END)
        ELSE 0 
    END AS new_customer_unit_price,
    -- 老客指标（只统计当月非首次下单的用户）
    COUNT(DISTINCT CASE WHEN pay_month != first_user_shop_month THEN user_id END) AS old_customer_count,
    SUM(CASE WHEN pay_month != first_user_shop_month THEN total_amt ELSE 0 END) AS old_customer_amount,
    CASE 
        WHEN COUNT(DISTINCT CASE WHEN pay_month != first_user_shop_month THEN user_id END) > 0 
        THEN SUM(CASE WHEN pay_month != first_user_shop_month THEN total_amt ELSE 0 END) / 
             COUNT(DISTINCT CASE WHEN pay_month != first_user_shop_month THEN user_id END)
        ELSE 0 
    END AS old_customer_unit_price,
    -- 老客购买频次（当月老客的平均下单次数）
    CASE 
        WHEN COUNT(DISTINCT CASE WHEN pay_month != first_user_shop_month THEN user_id END) > 0 
        THEN SUM(CASE WHEN pay_month != first_user_shop_month THEN order_cnt ELSE 0 END) / 
             COUNT(DISTINCT CASE WHEN pay_month != first_user_shop_month THEN user_id END)
        ELSE 0 
    END AS old_customer_purchase_frequency,

    -- 老客购买间隔（当月老客的平均下单间隔天数）
    CASE 
        WHEN COUNT(DISTINCT CASE WHEN pay_month != first_user_shop_month THEN user_id END) > 0 
        THEN SUM(CASE WHEN pay_month != first_user_shop_month THEN TIMESTAMPDIFF(DAY,first_user_shop,pay_date) ELSE 0 END) / 
             COUNT(DISTINCT CASE WHEN pay_month != first_user_shop_month THEN user_id END)
        ELSE 0 
    END AS old_customer_purchase_interval,

    -- 老客LTV（当月老客的客户生命周期价值）
    CASE 
        WHEN SUM(CASE WHEN pay_month != first_user_shop_month THEN order_cnt ELSE 0 END) > 0 
             AND COUNT(DISTINCT CASE WHEN pay_month != first_user_shop_month THEN user_id END) > 0 
        THEN (SUM(CASE WHEN pay_month != first_user_shop_month THEN total_amt ELSE 0 END) / 
              SUM(CASE WHEN pay_month != first_user_shop_month THEN order_cnt ELSE 0 END)) * 
             (SUM(CASE WHEN pay_month != first_user_shop_month THEN TIMESTAMPDIFF(DAY,first_user_shop,pay_date) ELSE 0 END) / 
              COUNT(DISTINCT CASE WHEN pay_month != first_user_shop_month THEN user_id END))
        ELSE 0 
    END AS old_customer_ltv,
		-- 新客复购
		COUNT(DISTINCT CASE WHEN repurchase_30d_m = 1 and  pay_month = first_user_shop_month THEN user_id END) AS repurchase_count_30d_new, 
     COUNT(DISTINCT CASE WHEN repurchase_60d_m = 1 and  pay_month = first_user_shop_month THEN user_id END) AS repurchase_count_60d_new, 
     COUNT(DISTINCT CASE WHEN repurchase_90d_m = 1 and  pay_month = first_user_shop_month THEN user_id END) AS repurchase_count_90d_new, 
     COUNT(DISTINCT CASE WHEN repurchase_180d_m = 1 and pay_month = first_user_shop_month THEN user_id END) AS repurchase_count_180d_new, 
     COUNT(DISTINCT CASE WHEN repurchase_365d_m = 1 and pay_month = first_user_shop_month THEN user_id END) AS repurchase_count_365d_new, 
     -- 复购率（安全处理分母为0的情况）
     CASE 
         WHEN COUNT(DISTINCT CASE WHEN pay_month = first_user_shop_month THEN user_id END) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_30d_m = 1 and pay_month = first_user_shop_month THEN user_id END) / 
              COUNT(DISTINCT CASE WHEN pay_month = first_user_shop_month THEN user_id END)
         ELSE 0 
     END AS repurchase_rate_30d_new,
     CASE 
         WHEN COUNT(DISTINCT CASE WHEN pay_month = first_user_shop_month THEN user_id END) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_60d_m = 1 and pay_month = first_user_shop_month THEN user_id END) / 
              COUNT(DISTINCT CASE WHEN pay_month = first_user_shop_month THEN user_id END)
         ELSE 0 
     END AS repurchase_rate_60d_new,
     CASE 
         WHEN COUNT(DISTINCT CASE WHEN pay_month = first_user_shop_month THEN user_id END) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_90d_m = 1 and pay_month = first_user_shop_month THEN user_id END) / 
              COUNT(DISTINCT CASE WHEN pay_month = first_user_shop_month THEN user_id END)
         ELSE 0 
     END AS repurchase_rate_90d_new,
     CASE 
         WHEN COUNT(DISTINCT CASE WHEN pay_month = first_user_shop_month THEN user_id END) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_180d_m = 1 and pay_month = first_user_shop_month THEN user_id END) / 
              COUNT(DISTINCT CASE WHEN pay_month = first_user_shop_month THEN user_id END)
         ELSE 0 
     END AS repurchase_rate_180d_new,
     CASE 
         WHEN COUNT(DISTINCT CASE WHEN pay_month = first_user_shop_month THEN user_id END) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_365d_m = 1 and pay_month = first_user_shop_month THEN user_id END) / 
              COUNT(DISTINCT CASE WHEN pay_month = first_user_shop_month THEN user_id END)
         ELSE 0 
     END AS repurchase_rate_365d_new,
         -- 复购人数指标
     COUNT(DISTINCT CASE WHEN repurchase_30d_m = 1 THEN user_id END) AS repurchase_count_30d, 
     COUNT(DISTINCT CASE WHEN repurchase_60d_m = 1 THEN user_id END) AS repurchase_count_60d, 
     COUNT(DISTINCT CASE WHEN repurchase_90d_m = 1 THEN user_id END) AS repurchase_count_90d, 
     COUNT(DISTINCT CASE WHEN repurchase_180d_m = 1 THEN user_id END) AS repurchase_count_180d, 
     COUNT(DISTINCT CASE WHEN repurchase_365d_m = 1 THEN user_id END) AS repurchase_count_365d, 
     -- 复购率（安全处理分母为0的情况）
     CASE 
         WHEN COUNT(DISTINCT  user_id ) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_30d_m = 1 THEN user_id END) / 
             COUNT(DISTINCT  user_id ) 
         ELSE 0 
     END AS repurchase_rate_30d,
     CASE 
         WHEN COUNT(DISTINCT  user_id ) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_60d_m = 1 THEN user_id END) / 
             COUNT(DISTINCT  user_id ) 
         ELSE 0 
     END AS repurchase_rate_60d,
     CASE 
         WHEN COUNT(DISTINCT  user_id ) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_90d_m = 1 THEN user_id END) / 
              COUNT(DISTINCT  user_id )
         ELSE 0 
     END AS repurchase_rate_90d,
     CASE 
         WHEN COUNT(DISTINCT  user_id ) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_180d_m = 1 THEN user_id END) / 
              COUNT(DISTINCT  user_id )
         ELSE 0 
     END AS repurchase_rate_180d,
     CASE 
         WHEN COUNT(DISTINCT  user_id ) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_365d_m = 1 THEN user_id END) / 
              COUNT(DISTINCT  user_id )
         ELSE 0 
     END AS repurchase_rate_365d
FROM ads.tmp_order_user t1 
GROUP BY pay_month, shop_id;


truncate table ads.`tmp_order_user_cate`;
insert into ads.`tmp_order_user_cate`(pay_date,shop_id,user_id,first_cate,item_amt)
select date(pay_time)as pay_date,shop_id,user_id,first_cate_market as first_cate ,sum(total_amt) as item_amt
FROM dws.trd_pay_item 
where 
date(pay_time) >=(select min(pay_date) from ads.tmp_order_user )
and date(pay_time)<=(select max(pay_date) from ads.tmp_order_user )
group by pay_date,shop_id,user_id,first_cate_market;




-- 增量更新
delete from ads.`ads_customer_order_analysis_detail_3` 
where date_type='日'
and pay_date >=(select min(pay_date) from ads.tmp_order_user )
and pay_date<=(select max(pay_date) from ads.tmp_order_user );

delete from ads.`ads_customer_order_analysis_detail_3` 
where date_type='周'
and pay_date >=(select min(pay_week) from ads.tmp_order_user )
and pay_date<=(select max(pay_week) from ads.tmp_order_user );

delete from ads.`ads_customer_order_analysis_detail_3` 
where date_type='月'
and pay_date >=(select min(pay_month) from ads.tmp_order_user )
and pay_date<=(select max(pay_month) from ads.tmp_order_user );



-- 查询结果3



insert into ads.ads_customer_order_analysis_detail_3
(
pay_date,
date_type,
shop_id,
shop_name,
category_level1,
new_customer_count,
new_customer_amount,
new_customer_unit_price,
old_customer_count,
old_customer_amount,
old_customer_unit_price,
old_customer_purchase_frequency,
old_customer_purchase_interval,
old_customer_ltv,
-- 新客复购
repurchase_count_30d_new,
repurchase_count_60d_new,
repurchase_count_90d_new,
repurchase_count_180d_new,
repurchase_count_365d_new,
repurchase_rate_30d_new,
repurchase_rate_60d_new,
repurchase_rate_90d_new,
repurchase_rate_180d_new,
repurchase_rate_365d_new,
-- 全部复购
repurchase_count_30d,
repurchase_count_60d,
repurchase_count_90d,
repurchase_count_180d,
repurchase_count_365d,
repurchase_rate_30d,
repurchase_rate_60d,
repurchase_rate_90d,
repurchase_rate_180d,
repurchase_rate_365d
)
SELECT 
     t1.pay_date, 
     '日' AS date_type, 
     t1.shop_id, 
     t1.shop_name, 
		 t2.first_cate,
     -- 新客指标 
     SUM(CASE WHEN order_sequence = 1 THEN 1 ELSE 0 END) AS new_customer_count, -- 新客成交人数
     SUM(CASE WHEN order_sequence = 1 THEN t2.item_amt ELSE 0 END) AS new_customer_amount, -- 新客成功金额
     CASE 
         WHEN SUM(CASE WHEN order_sequence = 1 THEN 1 ELSE 0 END) > 0 
         THEN SUM(CASE WHEN order_sequence = 1 THEN t2.item_amt ELSE 0 END) / 
              SUM(CASE WHEN order_sequence = 1 THEN 1 ELSE 0 END)
         ELSE 0 
     END AS new_customer_unit_price, -- 客单价
     -- 老客指标 
     SUM(CASE WHEN order_sequence > 1 THEN 1 ELSE 0 END) AS old_customer_count, -- 老客成交人数
     SUM(CASE WHEN order_sequence > 1 THEN t2.item_amt ELSE 0 END) AS old_customer_amount, -- 老客成交金额
     CASE 
         WHEN SUM(CASE WHEN order_sequence > 1 THEN 1 ELSE 0 END) > 0 
         THEN SUM(CASE WHEN order_sequence > 1 THEN t2.item_amt ELSE 0 END) / 
              SUM(CASE WHEN order_sequence > 1 THEN 1 ELSE 0 END)
         ELSE 0 
     END AS old_customer_unit_price,  -- 老客客单价
     -- 老客平均购买频次
     CASE 
         WHEN SUM(CASE WHEN order_sequence > 1 THEN 1 ELSE 0 END) > 0 
         THEN SUM(CASE WHEN order_sequence > 1 THEN order_cnt ELSE 0 END) / 
              SUM(CASE WHEN order_sequence > 1 THEN 1 ELSE 0 END)
         ELSE 0 
     END AS old_customer_purchase_frequency,
     -- 老客平均生命周期（后减前）
     CASE 
         WHEN SUM(CASE WHEN order_sequence > 1 THEN 1 ELSE 0 END) > 0 
         THEN SUM(CASE WHEN order_sequence > 1 THEN TIMESTAMPDIFF(day,first_user_shop,t1.pay_date) ELSE 0 END) / 
              SUM(CASE WHEN order_sequence > 1 THEN 1 ELSE 0 END)
         ELSE 0 
     END AS old_customer_purchase_interval,
    -- ltv=平均用户价值*平均生命周期（修正语法错误）
     CASE 
         WHEN SUM(CASE WHEN order_sequence > 1 THEN order_cnt ELSE 0 END) > 0 
              AND SUM(CASE WHEN order_sequence > 1 THEN 1 ELSE 0 END) > 0 
         THEN (SUM(CASE WHEN order_sequence > 1 THEN t2.item_amt ELSE 0 END) / 
               SUM(CASE WHEN order_sequence > 1 THEN order_cnt ELSE 0 END)) * 
              (SUM(CASE WHEN order_sequence > 1 THEN TIMESTAMPDIFF(DAY,first_user_shop,t1.pay_date) ELSE 0 END) / 
               SUM(CASE WHEN order_sequence > 1 THEN 1 ELSE 0 END))
         ELSE 0 
     END AS old_customer_ltv, 
     -- 复购人数指标
     -- 新客复购率
		 COUNT(DISTINCT CASE WHEN repurchase_30d = 1 and order_sequence = 1 THEN t1.user_id END) AS repurchase_count_30d_new, 
     COUNT(DISTINCT CASE WHEN repurchase_60d = 1 and order_sequence = 1 THEN t1.user_id END) AS repurchase_count_60d_new, 
     COUNT(DISTINCT CASE WHEN repurchase_90d = 1 and order_sequence = 1 THEN t1.user_id END) AS repurchase_count_90d_new, 
     COUNT(DISTINCT CASE WHEN repurchase_180d = 1 and order_sequence = 1 THEN t1.user_id END) AS repurchase_count_180d_new, 
     COUNT(DISTINCT CASE WHEN repurchase_365d = 1 and order_sequence = 1 THEN t1.user_id END) AS repurchase_count_365d_new, 
     -- 复购率（安全处理分母为0的情况）
     CASE 
         WHEN SUM(CASE WHEN order_sequence = 1  THEN 1 ELSE 0 END) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_30d = 1 and order_sequence = 1 THEN t1.user_id END) / 
              SUM(CASE WHEN order_sequence = 1 THEN 1 ELSE 0 END)
         ELSE 0 
     END AS repurchase_rate_30d_new,
     CASE 
         WHEN SUM(CASE WHEN order_sequence = 1 THEN 1 ELSE 0 END) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_60d = 1 and order_sequence = 1 THEN t1.user_id END) / 
              SUM(CASE WHEN order_sequence = 1 THEN 1 ELSE 0 END)
         ELSE 0 
     END AS repurchase_rate_60d_new,
     CASE 
         WHEN SUM(CASE WHEN order_sequence = 1 THEN 1 ELSE 0 END) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_90d = 1 and order_sequence = 1 THEN t1.user_id END) / 
              SUM(CASE WHEN order_sequence = 1 THEN 1 ELSE 0 END)
         ELSE 0 
     END AS repurchase_rate_90d_new,
     CASE 
         WHEN SUM(CASE WHEN order_sequence = 1 THEN 1 ELSE 0 END) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_180d = 1 and order_sequence = 1 THEN t1.user_id END) / 
              SUM(CASE WHEN order_sequence = 1 THEN 1 ELSE 0 END)
         ELSE 0 
     END AS repurchase_rate_180d_new,
     CASE 
         WHEN SUM(CASE WHEN order_sequence = 1 THEN 1 ELSE 0 END) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_365d = 1 and order_sequence = 1 THEN t1.user_id END) / 
              SUM(CASE WHEN order_sequence = 1 THEN 1 ELSE 0 END)
         ELSE 0 
     END AS repurchase_rate_365d_new,
		 
     -- 复购人数指标
     COUNT(DISTINCT CASE WHEN repurchase_30d = 1 THEN t1.user_id END) AS repurchase_count_30d, 
     COUNT(DISTINCT CASE WHEN repurchase_60d = 1 THEN t1.user_id END) AS repurchase_count_60d, 
     COUNT(DISTINCT CASE WHEN repurchase_90d = 1 THEN t1.user_id END) AS repurchase_count_90d, 
     COUNT(DISTINCT CASE WHEN repurchase_180d = 1 THEN t1.user_id END) AS repurchase_count_180d, 
     COUNT(DISTINCT CASE WHEN repurchase_365d = 1 THEN t1.user_id END) AS repurchase_count_365d, 
     -- 复购率（安全处理分母为0的情况）
     CASE 
         WHEN count(distinct t1.user_id) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_30d = 1 THEN t1.user_id END) / 
              count(distinct t1.user_id)
         ELSE 0 
     END AS repurchase_rate_30d,
     CASE 
         WHEN count(distinct t1.user_id) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_60d = 1 THEN t1.user_id END) / 
             count(distinct t1.user_id)
         ELSE 0 
     END AS repurchase_rate_60d,
     CASE 
         WHEN count(distinct t1.user_id) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_90d = 1 THEN t1.user_id END) / 
              count(distinct t1.user_id) 
         ELSE 0 
     END AS repurchase_rate_90d,
     CASE 
         WHEN count(distinct t1.user_id) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_180d = 1 THEN t1.user_id END) / 
              count(distinct t1.user_id) 
         ELSE 0 
     END AS repurchase_rate_180d,
     CASE 
         WHEN count(distinct t1.user_id) > 0  
         THEN COUNT(DISTINCT CASE WHEN repurchase_365d = 1 THEN t1.user_id END) / 
              count(distinct t1.user_id) 
         ELSE 0 
     END AS repurchase_rate_365d
FROM ads.tmp_order_user t1 
join ads.tmp_order_user_cate t2 on t1.pay_date=t2.pay_date and t1.user_id=t2.user_id and t1.shop_id=t2.shop_id
GROUP BY t1.pay_date, t1.shop_id,t2.first_cate

union all
SELECT 
    t1.pay_week,
    '周' AS date_type,
    t1.shop_id,
    t1.shop_name,
		t2.first_cate,
    -- 新客指标（统计当周首次下单的用户,订单序号是首次下单，并且下单周相同）
    COUNT(DISTINCT CASE WHEN pay_week =first_user_shop_week THEN t1.user_id END) AS new_customer_count, -- 新客成交人数
    SUM(CASE WHEN pay_week =first_user_shop_week THEN item_amt ELSE 0 END) AS new_customer_amount,-- 成交金额
    CASE  WHEN COUNT(DISTINCT CASE WHEN pay_week =first_user_shop_week THEN t1.user_id END) > 0 
        THEN SUM(CASE WHEN pay_week =first_user_shop_week THEN item_amt ELSE 0 END) / 
             COUNT(DISTINCT CASE WHEN pay_week =first_user_shop_week  THEN t1.user_id END)
             ELSE 0 END AS new_customer_unit_price, -- 成交金额
    -- 老客指标（统计当周非首次下单的用户）
    COUNT(DISTINCT CASE WHEN pay_week !=first_user_shop_week THEN t1.user_id END) AS old_customer_count,
    SUM(CASE WHEN pay_week !=first_user_shop_week THEN item_amt ELSE 0 END) AS old_customer_amount,
    CASE WHEN COUNT(DISTINCT CASE WHEN pay_week !=first_user_shop_week THEN t1.user_id END) > 0 
        THEN SUM(CASE WHEN pay_week !=first_user_shop_week THEN item_amt ELSE 0 END) / 
             COUNT(DISTINCT CASE WHEN pay_week !=first_user_shop_week THEN t1.user_id END)
        ELSE 0 END AS old_customer_unit_price,-- 老客客单价
    -- 老客购买频次（当周老客的平均下单次数）
    CASE WHEN COUNT(DISTINCT CASE WHEN pay_week !=first_user_shop_week THEN t1.user_id END) > 0 
        THEN SUM(CASE WHEN pay_week !=first_user_shop_week THEN order_cnt ELSE 0 END) / 
             COUNT(DISTINCT CASE WHEN pay_week !=first_user_shop_week THEN t1.user_id END)
        ELSE 0 END AS old_customer_purchase_frequency,

    -- 老客购买间隔（当周老客的平均下单间隔天数）
    CASE WHEN COUNT(DISTINCT CASE WHEN pay_week !=first_user_shop_week THEN t1.user_id END) > 0 
        THEN SUM(CASE WHEN pay_week !=first_user_shop_week THEN TIMESTAMPDIFF(day,first_user_shop,t1.pay_date) ELSE 0 END) / 
             COUNT(DISTINCT CASE WHEN pay_week !=first_user_shop_week THEN t1.user_id END)
        ELSE 0 END AS old_customer_purchase_interval,
    -- 老客LTV（当周老客的客户生命周期价值）
	-- 老客LTV（当周老客的客户生命周期价值）- 修正版
	CASE 
	    WHEN SUM(CASE WHEN pay_week != first_user_shop_week THEN order_cnt ELSE 0 END) > 0 
	         AND COUNT(DISTINCT CASE WHEN pay_week != first_user_shop_week THEN t1.user_id END) > 0 
	    THEN (SUM(CASE WHEN pay_week != first_user_shop_week THEN item_amt ELSE 0 END) / 
	          SUM(CASE WHEN pay_week != first_user_shop_week THEN order_cnt ELSE 0 END)) * 
	         (SUM(CASE WHEN pay_week != first_user_shop_week THEN TIMESTAMPDIFF(DAY,first_user_shop,t1.pay_date) ELSE 0 END) / 
	          COUNT(DISTINCT CASE WHEN pay_week != first_user_shop_week THEN t1.user_id END))
	    ELSE 0 
	END AS old_customer_ltv,
    -- 新客复购
    COUNT(DISTINCT CASE WHEN repurchase_30d_w = 1 and pay_week =first_user_shop_week THEN t1.user_id END) AS repurchase_count_30d_new,
    COUNT(DISTINCT CASE WHEN repurchase_60d_w = 1  and pay_week =first_user_shop_week THEN t1.user_id END) AS repurchase_count_60d_new,
    COUNT(DISTINCT CASE WHEN repurchase_90d_w = 1  and pay_week =first_user_shop_week THEN t1.user_id END) AS repurchase_count_90d_new,
    COUNT(DISTINCT CASE WHEN repurchase_180d_w = 1  and pay_week =first_user_shop_week THEN t1.user_id END) AS repurchase_count_180d_new,
    COUNT(DISTINCT CASE WHEN repurchase_365d_w = 1  and pay_week =first_user_shop_week THEN t1.user_id END) AS repurchase_count_365d_new,
    -- 复购率（安全处理分母为0的情况）
    CASE WHEN COUNT(DISTINCT CASE WHEN pay_week =first_user_shop_week THEN t1.user_id END) > 0 
        THEN COUNT(DISTINCT CASE WHEN repurchase_30d_w = 1  and pay_week =first_user_shop_week THEN t1.user_id END) / 
             COUNT(DISTINCT CASE WHEN pay_week =first_user_shop_week THEN t1.user_id END)
             ELSE 0 END AS repurchase_rate_30d_new,
    CASE WHEN COUNT(DISTINCT CASE WHEN pay_week =first_user_shop_week THEN t1.user_id END) > 0 
        THEN COUNT(DISTINCT CASE WHEN repurchase_60d_w = 1  and pay_week =first_user_shop_week THEN t1.user_id END) / 
             COUNT(DISTINCT CASE WHEN pay_week =first_user_shop_week THEN t1.user_id END)
        ELSE 0 END AS repurchase_rate_60d_new,
    CASE WHEN COUNT(DISTINCT CASE WHEN pay_week =first_user_shop_week THEN t1.user_id END) > 0 
        THEN COUNT(DISTINCT CASE WHEN repurchase_90d_w = 1 and pay_week =first_user_shop_week  THEN t1.user_id END) / 
             COUNT(DISTINCT CASE WHEN pay_week =first_user_shop_week THEN t1.user_id END)
        ELSE 0 END AS repurchase_rate_90d_new,
    CASE 
        WHEN COUNT(DISTINCT CASE WHEN pay_week =first_user_shop_week THEN t1.user_id END) > 0 
        THEN COUNT(DISTINCT CASE WHEN repurchase_180d_w = 1  and pay_week =first_user_shop_week THEN t1.user_id END) / 
             COUNT(DISTINCT CASE WHEN pay_week =first_user_shop_week THEN t1.user_id END)
        ELSE 0 END AS repurchase_rate_180d_new,
    CASE 
        WHEN COUNT(DISTINCT CASE WHEN pay_week =first_user_shop_week THEN t1.user_id END) > 0 
        THEN COUNT(DISTINCT CASE WHEN repurchase_365d_w = 1 and pay_week =first_user_shop_week  THEN t1.user_id END) / 
             COUNT(DISTINCT CASE WHEN pay_week =first_user_shop_week THEN t1.user_id END)
        ELSE 0 END AS repurchase_rate_365d_new,
    -- 复购人数指标,全部
    COUNT(DISTINCT CASE WHEN repurchase_30d_w = 1 THEN t1.user_id END) AS repurchase_count_30d,
    COUNT(DISTINCT CASE WHEN repurchase_60d_w = 1 THEN t1.user_id END) AS repurchase_count_60d,
    COUNT(DISTINCT CASE WHEN repurchase_90d_w = 1 THEN t1.user_id END) AS repurchase_count_90d,
    COUNT(DISTINCT CASE WHEN repurchase_180d_w = 1 THEN t1.user_id END) AS repurchase_count_180d,
    COUNT(DISTINCT CASE WHEN repurchase_365d_w = 1 THEN t1.user_id END) AS repurchase_count_365d,
    -- 复购率（安全处理分母为0的情况）
    CASE WHEN COUNT(DISTINCT t1.user_id) > 0 
        THEN COUNT(DISTINCT CASE WHEN repurchase_30d_w = 1 THEN t1.user_id END) / 
              COUNT(DISTINCT t1.user_id)
             ELSE 0 END AS repurchase_rate_30d,
    CASE WHEN COUNT(DISTINCT t1.user_id) > 0 
        THEN COUNT(DISTINCT CASE WHEN repurchase_60d_w = 1 THEN t1.user_id END) / 
             COUNT(DISTINCT t1.user_id)
        ELSE 0 END AS repurchase_rate_60d,
    CASE WHEN  COUNT(DISTINCT t1.user_id) > 0 
        THEN COUNT(DISTINCT CASE WHEN repurchase_90d_w = 1 THEN t1.user_id END) / 
             COUNT(DISTINCT t1.user_id)
        ELSE 0 END AS repurchase_rate_90d,
    CASE 
        WHEN  COUNT(DISTINCT t1.user_id) > 0 
        THEN COUNT(DISTINCT CASE WHEN repurchase_180d_w = 1 THEN t1.user_id END) / 
              COUNT(DISTINCT t1.user_id)
        ELSE 0 END AS repurchase_rate_180d,
    CASE 
        WHEN  COUNT(DISTINCT t1.user_id) > 0 
        THEN COUNT(DISTINCT CASE WHEN repurchase_365d_w = 1 THEN t1.user_id END) / 
              COUNT(DISTINCT t1.user_id)
        ELSE 0 END AS repurchase_rate_365d
FROM ads.tmp_order_user t1
join ads.tmp_order_user_cate t2 on t1.pay_date=t2.pay_date and t1.user_id=t2.user_id and t1.shop_id=t2.shop_id
GROUP BY t1.pay_week, t1.shop_id,t2.first_cate

union all
SELECT 
    t1.pay_month,
    '月' AS date_type,
    t1.shop_id,
    t1.shop_name,
		t2.first_cate,
    -- 新客指标（只统计当月首次下单的用户）
    COUNT(DISTINCT CASE WHEN pay_month = first_user_shop_month THEN t1.user_id END) AS new_customer_count,
    SUM(CASE WHEN pay_month = first_user_shop_month THEN item_amt ELSE 0 END) AS new_customer_amount,
    CASE 
        WHEN COUNT(DISTINCT CASE WHEN pay_month = first_user_shop_month THEN t1.user_id END) > 0 
        THEN SUM(CASE WHEN pay_month = first_user_shop_month THEN item_amt ELSE 0 END) / 
             COUNT(DISTINCT CASE WHEN pay_month = first_user_shop_month THEN t1.user_id END)
        ELSE 0 
    END AS new_customer_unit_price,
    -- 老客指标（只统计当月非首次下单的用户）
    COUNT(DISTINCT CASE WHEN pay_month != first_user_shop_month THEN t1.user_id END) AS old_customer_count,
    SUM(CASE WHEN pay_month != first_user_shop_month THEN item_amt ELSE 0 END) AS old_customer_amount,
    CASE 
        WHEN COUNT(DISTINCT CASE WHEN pay_month != first_user_shop_month THEN t1.user_id END) > 0 
        THEN SUM(CASE WHEN pay_month != first_user_shop_month THEN item_amt ELSE 0 END) / 
             COUNT(DISTINCT CASE WHEN pay_month != first_user_shop_month THEN t1.user_id END)
        ELSE 0 
    END AS old_customer_unit_price,
    -- 老客购买频次（当月老客的平均下单次数）
    CASE 
        WHEN COUNT(DISTINCT CASE WHEN pay_month != first_user_shop_month THEN t1.user_id END) > 0 
        THEN SUM(CASE WHEN pay_month != first_user_shop_month THEN order_cnt ELSE 0 END) / 
             COUNT(DISTINCT CASE WHEN pay_month != first_user_shop_month THEN t1.user_id END)
        ELSE 0 
    END AS old_customer_purchase_frequency,

    -- 老客购买间隔（当月老客的平均下单间隔天数）
    CASE 
        WHEN COUNT(DISTINCT CASE WHEN pay_month != first_user_shop_month THEN t1.user_id END) > 0 
        THEN SUM(CASE WHEN pay_month != first_user_shop_month THEN TIMESTAMPDIFF(DAY,first_user_shop,t1.pay_date) ELSE 0 END) / 
             COUNT(DISTINCT CASE WHEN pay_month != first_user_shop_month THEN t1.user_id END)
        ELSE 0 
    END AS old_customer_purchase_interval,

    -- 老客LTV（当月老客的客户生命周期价值）
    CASE 
        WHEN SUM(CASE WHEN pay_month != first_user_shop_month THEN order_cnt ELSE 0 END) > 0 
             AND COUNT(DISTINCT CASE WHEN pay_month != first_user_shop_month THEN t1.user_id END) > 0 
        THEN (SUM(CASE WHEN pay_month != first_user_shop_month THEN item_amt ELSE 0 END) / 
              SUM(CASE WHEN pay_month != first_user_shop_month THEN order_cnt ELSE 0 END)) * 
             (SUM(CASE WHEN pay_month != first_user_shop_month THEN TIMESTAMPDIFF(DAY,first_user_shop,t1.pay_date) ELSE 0 END) / 
              COUNT(DISTINCT CASE WHEN pay_month != first_user_shop_month THEN t1.user_id END))
        ELSE 0 
    END AS old_customer_ltv,
   	-- 新客复购
		COUNT(DISTINCT CASE WHEN repurchase_30d_m = 1 and pay_month = first_user_shop_month THEN t1.user_id END) AS repurchase_count_30d_new, 
     COUNT(DISTINCT CASE WHEN repurchase_60d_m = 1 and pay_month = first_user_shop_month THEN t1.user_id END) AS repurchase_count_60d_new, 
     COUNT(DISTINCT CASE WHEN repurchase_90d_m = 1 and pay_month = first_user_shop_month THEN t1.user_id END) AS repurchase_count_90d_new, 
     COUNT(DISTINCT CASE WHEN repurchase_180d_m = 1 and pay_month = first_user_shop_month THEN t1.user_id END) AS repurchase_count_180d_new, 
     COUNT(DISTINCT CASE WHEN repurchase_365d_m = 1 and pay_month = first_user_shop_month THEN t1.user_id END) AS repurchase_count_365d_new, 
     -- 复购率（安全处理分母为0的情况）
     CASE 
         WHEN COUNT(DISTINCT CASE WHEN pay_month = first_user_shop_month THEN t1.user_id END) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_30d_m = 1 and  pay_month = first_user_shop_month THEN t1.user_id END) / 
              COUNT(DISTINCT CASE WHEN pay_month = first_user_shop_month THEN t1.user_id END)
         ELSE 0 
     END AS repurchase_rate_30d_new,
     CASE 
         WHEN COUNT(DISTINCT CASE WHEN pay_month = first_user_shop_month THEN t1.user_id END) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_60d_m = 1 and  pay_month = first_user_shop_month THEN t1.user_id END) / 
              COUNT(DISTINCT CASE WHEN pay_month = first_user_shop_month THEN t1.user_id END)
         ELSE 0 
     END AS repurchase_rate_60d_new,
     CASE 
         WHEN COUNT(DISTINCT CASE WHEN pay_month = first_user_shop_month THEN t1.user_id END) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_90d_m = 1 and  pay_month = first_user_shop_month THEN t1.user_id END) / 
              COUNT(DISTINCT CASE WHEN pay_month = first_user_shop_month THEN t1.user_id END)
         ELSE 0 
     END AS repurchase_rate_90d_new,
     CASE 
         WHEN COUNT(DISTINCT CASE WHEN pay_month = first_user_shop_month THEN t1.user_id END) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_180d_m = 1 and  pay_month = first_user_shop_month THEN t1.user_id END) / 
              COUNT(DISTINCT CASE WHEN pay_month = first_user_shop_month THEN t1.user_id END)
         ELSE 0 
     END AS repurchase_rate_180d_new,
     CASE 
         WHEN COUNT(DISTINCT CASE WHEN pay_month = first_user_shop_month THEN t1.user_id END) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_365d_m = 1 and  pay_month = first_user_shop_month THEN t1.user_id END) / 
              COUNT(DISTINCT CASE WHEN pay_month = first_user_shop_month THEN t1.user_id END)
         ELSE 0 
     END AS repurchase_rate_365d_new,
         -- 复购人数指标
     COUNT(DISTINCT CASE WHEN repurchase_30d_m = 1 THEN t1.user_id END) AS repurchase_count_30d, 
     COUNT(DISTINCT CASE WHEN repurchase_60d_m = 1 THEN t1.user_id END) AS repurchase_count_60d, 
     COUNT(DISTINCT CASE WHEN repurchase_90d_m = 1 THEN t1.user_id END) AS repurchase_count_90d, 
     COUNT(DISTINCT CASE WHEN repurchase_180d_m = 1 THEN t1.user_id END) AS repurchase_count_180d, 
     COUNT(DISTINCT CASE WHEN repurchase_365d_m = 1 THEN t1.user_id END) AS repurchase_count_365d, 
     -- 复购率（安全处理分母为0的情况）
     CASE 
         WHEN COUNT(DISTINCT  t1.user_id ) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_30d_m = 1 THEN t1.user_id END) / 
             COUNT(DISTINCT  t1.user_id ) 
         ELSE 0 
     END AS repurchase_rate_30d,
     CASE 
         WHEN COUNT(DISTINCT  t1.user_id ) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_60d_m = 1 THEN t1.user_id END) / 
             COUNT(DISTINCT  t1.user_id ) 
         ELSE 0 
     END AS repurchase_rate_60d,
     CASE 
         WHEN COUNT(DISTINCT  t1.user_id ) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_90d_m = 1 THEN t1.user_id END) / 
              COUNT(DISTINCT  t1.user_id )
         ELSE 0 
     END AS repurchase_rate_90d,
     CASE 
         WHEN COUNT(DISTINCT  t1.user_id ) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_180d_m = 1 THEN t1.user_id END) / 
              COUNT(DISTINCT  t1.user_id )
         ELSE 0 
     END AS repurchase_rate_180d,
     CASE 
         WHEN COUNT(DISTINCT  t1.user_id ) > 0 
         THEN COUNT(DISTINCT CASE WHEN repurchase_365d_m = 1 THEN t1.user_id END) / 
              COUNT(DISTINCT  t1.user_id )
         ELSE 0 
     END AS repurchase_rate_365d
FROM ads.tmp_order_user t1 
join ads.tmp_order_user_cate t2 on t1.pay_date=t2.pay_date and t1.user_id=t2.user_id and t1.shop_id=t2.shop_id
GROUP BY t1.pay_month, t1.shop_id,t2.first_cate
;

