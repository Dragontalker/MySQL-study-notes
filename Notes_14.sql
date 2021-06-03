#1. 显示所有员工的姓名, 部门号和部门名称
SELECT last_name, d.department_id, department_name
FROM employees AS e, departments AS d
WHERE e.department_id = d.department_id;

#2. 查询90号部门员工的job_id和90号部门的location_id
SELECT job_id, location_id, d.department_id
FROM employees AS e, departments AS d
WHERE e.department_id = d.department_id
AND e.department_id = 90;