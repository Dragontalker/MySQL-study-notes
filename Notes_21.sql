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

#(2)查询每个部门的平均工资
SELECT AVG(salary), department_id
FROM employees
GROUP BY department_id;

#(3)筛选(2)结果集, 满足平均工资>(1)
SELECT AVG(salary), department_id
FROM employees
GROUP BY department_id
HAVING AVG(salary) > (
	SELECT AVG(salary)
	FROM employees
);

#6. 查询出公司中所有manger的详细信息

#(1)查询出所有manager的员工编号
SELECT DISTINCT manager_id
FROM employees;

#(2)查询详细信息, 满足employee_id = (1)
SELECT *
FROM employees
WHERE employee_id = ANY(
	SELECT DISTINCT manager_id
	FROM employees
);

#7. 各个部门中, 最高工资中最低的那个部门的最低的工资是多少

#(1)查询各部门的最高工资
SELECT department_id
FROM employees
GROUP BY department_id
ORDER BY MAX(salary)
LIMIT 1;

#(2)查询那个部门的最高工资=(1)
SELECT MIN(SALARY), department_id
FROM employees
WHERE department_id = (
	SELECT department_id
	FROM employees
	GROUP BY department_id
	ORDER BY MAX(salary)
	LIMIT 1
);

#8. 查询平均工资最高的部门的manager的详细信息: last_name, department_id, email, salary

#(1)查询平均工资最高的部门编号
SELECT department_id
FROM employees
GROUP BY department_id
ORDER BY AVG(salary) DESC
LIMIT 1;