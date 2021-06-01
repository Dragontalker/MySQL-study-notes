#1. 查询公司员工工资的最大值, 最小值, 平均值, 总和
SELECT 
	MAX(salary) AS max_salary,
    MIN(salary) AS min_salary,
    ROUND(AVG(salary), 2) AS avg_salary,
    SUM(salary) AS total_salary
FROM 
	employees;

#2. 查询员工表中的最大入职时间和最下入职时间的相差天数 (DIFFERENCE)
SELECT DATEDIFF(MAX(hiredate), MIN(hiredate)) AS difference
FROM employees;

#3. 查询部门编号为90的员工个数
SELECT COUNT(*)
FROM employees
WHERE department_id = 90;