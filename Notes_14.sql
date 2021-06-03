#1. 显示所有员工的姓名, 部门号和部门名称
SELECT last_name, d.department_id, department_name
FROM employees AS e, departments AS d
WHERE e.department_id = d.department_id;