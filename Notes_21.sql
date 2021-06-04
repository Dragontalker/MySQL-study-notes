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
SELECT department_id
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

#(4)查询部门信息
SELECT d.*
FROM departments AS d
WHERE d.department_id = (
	SELECT department_id
	FROM employees
	GROUP BY department_id
	HAVING AVG(salary) = (
		SELECT MIN(ag)
		FROM (
			SELECT AVG(salary) AS ag, department_id
			FROM employees
			GROUP BY department_id
		) ag_dep
	)
);

#更简单的方式: limit
SELECT d.*
FROM departments AS d
WHERE d.department_id = (
	SELECT department_id
	FROM employees
	GROUP BY department_id
	ORDER BY AVG(salary)
    LIMIT 1
);

#3. 查询平均工资最低的部门信息和该部门的平均工资

#(1)查询平均工资最低的部门
SELECT department_id
FROM employees
GROUP BY department_id
ORDER BY AVG(salary)
LIMIT 1;

#(2)查询部门信息
SELECT d.*, department_id
FROM departments AS d
WHERE department_id = (
	SELECT department_id
	FROM employees
	GROUP BY department_id
	ORDER BY AVG(salary)
	LIMIT 1
);

#4. 查询平均工资最高的job信息

#(1)查询每个job的平均工资
SELECT AVG(salary), job_id
FROM employees
GROUP BY job_id
ORDER BY AVG(salary) DESC
LIMIT 1;

#(2)查询job信息
SELECT *
FROM jobs
WHERE job_id = (
	SELECT job_id
	FROM employees
	GROUP BY job_id
	ORDER BY AVG(salary) DESC
	LIMIT 1
);

#5.查询平均工资高于公司平均工资的部门有哪些?

#(1)查询平均工资
SELECT AVG(salary)
FROM employees;