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