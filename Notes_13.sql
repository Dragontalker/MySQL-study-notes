#1. 显示员工表的最大工资, 工资平均值
SELECT MAX(salary), AVG(salary)
FROM employees;

#2. 查询员工表中的employee_id, job_id, last_name, 按department_id降序, salary升序
SELECT employee_id, job_id, last_name
FROM employees
ORDER BY department_id DESC, salary ASC;