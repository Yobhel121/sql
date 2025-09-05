INSERT  OVERWRITE ads.bud_fin_import_items_middle_ft_last
SELECT
    biz_day, -- '日期',
    shop_id, -- 店铺ID（吉客云）',
    shop_name, -- '店铺名称（吉客云）',
    business_cate, -- '业务分类',
    department_1, --  '一级部门（组织架构）',
    department_2, -- '二级渠道（组织架构）',
    department_3, --  '三级渠道',
    department_4, -- '四级渠道（店铺名称+业务分类）',
    expense_center_code, -- 费用中心编码',
    expense_center, -- '费用中心',
    budget_subject_code, -- '预算科目编码',
    budget_subject, --  '预算科目',
    SUM(ft_value_center_get) AS ft_value_center_get, --  '被分摊到的总金额',
    allocation_logic, --  '分摊逻辑',
    dt,  --  '分区字段'
		'中台分摊' category
FROM `ads`.`bud_fin_import_items_middle_ft`
GROUP BY
    biz_day,
    shop_id,
    business_cate,
    department_1,
    department_2,
    department_3,
    department_4,
    expense_center_code,
    budget_subject_code

UNION ALL

SELECT
    biz_day, -- '日期',
    shop_id, -- 店铺ID（吉客云）',
    shop_name, -- '店铺名称（吉客云）',
    business_cate, -- '业务分类',
    department_1, --  '一级部门（组织架构）',
    department_2, -- '二级渠道（组织架构）',
    department_3, --  '三级渠道',
    department_4, -- '四级渠道（店铺名称+业务分类）',
    expense_center_code, -- 费用中心编码',
    expense_center, -- '费用中心',
    budget_subject_code, -- '预算科目编码',
    budget_subject, --  '预算科目',
    SUM(ft_value_center_get) AS ft_value_center_get, --  '被分摊到的总金额',
    CAST(category AS VARCHAR) AS allocation_logic, --  '分摊逻辑',
    NULL AS dt,  --  '分区字段'
		group_concat(distinct category)
FROM `ads`.`bud_fin_import_items_middle_ft_yuetan`  where expense_center not regexp '中台'
GROUP BY
    biz_day,
    shop_id,
    business_cate,
    department_1,
    department_2,
    department_3,
    department_4,
    expense_center_code,
    budget_subject_code

  UNION all
-- 录入比例

 SELECT
    c.date_id AS biz_day,
    c.shop_id AS shop_id,
    c.shop_name AS shop_name,
    ifnull(c.business_cate,'') AS business_cate,
    c.department_1 AS department_1,
    c.department_2 AS department_2,
    c.department_3 AS department_3,
    c.department_4 AS department_4,
    c.expense_center_code,
    c.expense_center,
    c.cost_code  as budget_subject_code,
    c.cost_name  as budget_subject,
    sum(c.value) AS ft_value_center_get,
    group_concat(distinct cast(c.proportion as char)) AS allocation_logic, -- 比例系数，可能有多个
    null as dt,
    "录入比例"  AS category
FROM
    (
         SELECT
            b.date_id,
            b.shop_id,
            b.shop_name,
            ifnull(b.business_cate,'') business_cate,
            a.department_1,
            a.department_2,
            a.department_3,
            a.department_4,
            a.expense_center_code,
            a.expense_center,
            b.cost_code,
            b.cost_name,
            a.sum_of_money,
            b.proportion,
            (b.proportion * a.sum_of_money)  as value
        FROM (
			    SELECT date_id, DATE_FORMAT(date_id, '%Y-%m') AS date_month,
			    b.shop_id,b.shop_name,business_cate,cost_code,cost_name,proportion
			    FROM dim.date_info  a
			    join  dim.dim_cost_ratio_of_each_platform b on DATE_FORMAT(date_id, '%Y-%m') =left(date,7)
			    AND b.dt ='2025-09-03'
			    WHERE date_id >= '2023-01-01' and upper(ifnull(version,''))<>'TOB'
) b
        left join     ads.tmp_gsv a
        ON
            upper(a.shop_id) = upper(b.shop_id)
            AND IFNULL(a.business_cate, '') = IFNULL(b.business_cate, '')
            AND  a.cal_date = b.date_id
    ) c  group by     biz_day,
    shop_id,
    business_cate,
    department_1,
    department_2,
    department_3,
    department_4,
    expense_center_code,
    budget_subject_code

  ;




