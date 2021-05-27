#1. 查询没有奖金, 且工资小于18000的salary, last_name
SELECT salary, last_name
FROM employees
WHERE commission_pct IS NULL AND salary < 18000;