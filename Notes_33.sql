#一、创建视图emp_v1, 要求查询电话号码以'011'开头的员工姓名和工资, 邮箱
CREATE OR REPLACE VIEW emp_v1
AS
SELECT last_name, salary, email
FROM employees 
WHERE phone_number LIKE '011%';