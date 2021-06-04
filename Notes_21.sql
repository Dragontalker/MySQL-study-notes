#1. 查询工资最低的员工信息: last_name, salary

#(1)查询最低的工资
SELECT MIN(salary)
FROM employees;

#(2)查询last_name, salary, 要求salary=(1)
SELECT last_name, salary
FROM employees
WHERE salary = (
	SELECT MIN(salary)
	FROM employees
);

#2. 查询平均工资最低的部门信息

#(1)各部门的平均工资
SELECT AVG(salary), department_id
FROM employees
GROUP BY department_id;

#(2)查询(1)结果上的最低平均工资
SELECT MIN(ag)
FROM (
	SELECT AVG(salary) AS ag, department_id
	FROM employees
	GROUP BY department_id
) ag_dep;

#(3)查询哪个部门的平均工资=(2)
SELECT AVG(salary), department_id
FROM employees
GROUP BY department_id
HAVING AVG(salary) = (
	SELECT MIN(ag)
	FROM (
		SELECT AVG(salary) AS ag, department_id
		FROM employees
		GROUP BY department_id
	) ag_dep
);