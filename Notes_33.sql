#一、创建视图emp_v1, 要求查询电话号码以'011'开头的员工姓名和工资, 邮箱
CREATE OR REPLACE VIEW emp_v1
AS
SELECT last_name, salary, email
FROM employees 
WHERE phone_number LIKE '011%';

SELECT * FROM emp_v1;

#二、创建视图emp_v2, 要求查询部门的最高工资高于12000的部门信息
CREATE OR REPLACE VIEW emp_v2
AS
SELECT MAX(salary) AS mx_dep, department_id
FROM employees
GROUP BY department_id
HAVING mx_dep > 12000;

SELECT d.*, m.mx_dep
FROM departments AS d
JOIN emp_v2 AS m
ON m.department_id = d.department_id;