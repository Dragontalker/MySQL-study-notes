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