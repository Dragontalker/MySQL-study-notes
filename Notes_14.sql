#1. 显示所有员工的姓名, 部门号和部门名称
SELECT last_name, d.department_id, department_name
FROM employees AS e, departments AS d
WHERE e.department_id = d.department_id;

#2. 查询90号部门员工的job_id和90号部门的location_id
SELECT job_id, location_id, d.department_id
FROM employees AS e, departments AS d
WHERE e.department_id = d.department_id
AND e.department_id = 90;

#3. 选择所有有奖金的员工的last_name, department_name, location_id, city
SELECT last_name, department_name, l.location_id, city
FROM employees AS e, departments AS d, locations AS l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND e.commission_pct IS NOT NULL;

#4. 选择city在Toronto工作的员工的last_name, job_id, department_id, department_name
SELECT last_name, job_id, d.department_id, department_name
FROM employees AS e, departments AS d, locations AS l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND city = 'Toronto';