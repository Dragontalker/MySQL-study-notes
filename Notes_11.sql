#1. 查询各job_id的员工工资的最大值, 最小值, 平均值, 总和, 并按job_id升序
SELECT 
	MAX(salary), MIN(salary), AVG(salary), SUM(salary), job_id
FROM employees
GROUP BY job_id
ORDER BY job_id;

#2. 查询员工最高工资和最低工资的差距(DIFFERENCE)
SELECT MAX(salary) - MIN(salary) AS difference
FROM employees;