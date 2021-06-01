#进阶5. 分组查询
/*
语法：
	select 分组函数, 列(要求出现在group by的后面)
    from 表
    [where 筛选条件]
    group by 分组的列表
    [order by 字句]
    
注意：
	查询列表必须特殊, 要求是分组函数和group by后出现的字段
*/

#引入: 查询每个部门的平均工资
SELECT department_id, ROUND(AVG(salary), 2)
FROM employees
GROUP BY department_id;

#案例1: 查询每个工种的最高工资
SELECT job_id, MAX(salary) AS max_salary
FROM employees
GROUP BY job_id
ORDER BY max_salary DESC;

#案例2: 查询每个位置上的部门个数
SELECT department_id, COUNT(*)
FROM departments
GROUP BY location_id; 

#添加筛选条件
#案例1: 查询邮箱中包含a字符的, 每个部门的平均工资
SELECT department_id, AVG(salary)
FROM employees
WHERE email like '%a%'
GROUP BY department_id; 

#案例2: 查询有奖金的每个领导手下员工的最高工资
SELECT MAX(salary), manager_id
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY manager_id;

#添加复杂的筛选条件

#案例1: 查询哪个部门的员工个数大于2
#1. 查询每个员工的员工个数
SELECT COUNT(*), department_id
FROM employees
GROUP BY department_id;

#2. 根据1.的结果进行筛选, 查询哪个员工的个数>2
SELECT COUNT(*), department_id
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 2;

