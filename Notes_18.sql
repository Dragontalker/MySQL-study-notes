#1. 查询和Zlotkey相同部门的员工姓名和工资

#(1)查询Zlotkey的部门
SELECT department_id
FROM employees
WHERE last_name = 'Zlotkey';