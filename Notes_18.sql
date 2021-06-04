#1. 查询和Zlotkey相同部门的员工姓名和工资

#(1)查询Zlotkey的部门
SELECT department_id
FROM employees
WHERE last_name = 'Zlotkey';

#(2)查询部门号=(1)的姓名和工资
SELECT last_name, salary
FROM employees
WHERE department_id = (
	SELECT department_id
    FROM employees
    WHERE last_name = 'Zlotkey'
);

#2. 查询工资比公司平均工资高的员工的员工号, 姓名和工资

#(1)查询平均工资
SELECT AVG(salary)
FROM employees;

#(2)查询工资>(1)的员工号, 姓名和工资
SELECT last_name, employee_id, salary
FROM employees
WHERE salary > (
	SELECT AVG(salary)
	FROM employees
);

#3. 查询各部门中工资比本部门平均工资高的员工的员工号, 姓名和工资

#(1)查询各部门的平均工资
SELECT AVG(salary), department_id
FROM employees
GROUP BY department_id;

#(2)连接(1)结果集和employees表, 再进行筛选
SELECT employee_id, last_name, salary, e.department_id
FROM employees AS e
INNER JOIN (
	SELECT AVG(salary) AS ag, department_id
	FROM employees
	GROUP BY department_id
) AS ag_dep
ON e.department_id = ag_dep.department_id
WHERE salary > ag_dep.ag;

#4. 查询和姓名中包含字母u的员工在相同部门的员工的员工号和姓名

#(1)查询姓名中包含字母u的员工的部门
SELECT DISTINCT department_id
FROM employees
WHERE last_name LIKE '%u%';

#(2)查询部门号=(1)中的任意一个的员工号和姓名
SELECT last_name, employee_id
FROM employees
WHERE department_id IN(
	SELECT DISTINCT department_id
	FROM employees
	WHERE last_name LIKE '%u%'
);