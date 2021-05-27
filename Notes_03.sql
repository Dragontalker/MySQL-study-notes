#1. 查询没有奖金, 且工资小于18000的salary, last_name
SELECT salary, last_name
FROM employees
WHERE commission_pct IS NULL AND salary < 18000;

#2. 查询employees表中, job_id不为'IT'或者 工资为12000的员工信息
SELECT *
FROM employees
WHERE job_id <> 'IT' OR salary = 12000;