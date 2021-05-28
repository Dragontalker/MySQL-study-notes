#1. 查询员工的新明和部门号和年薪, 按年薪排序, 按姓名升序
SELECT last_name, department_id, salary*12*(1+IFNULL(commission_pct, 0)) AS compensation
FROM employees
ORDER BY compensation DESC, last_name ASC;

#2. 选择工资不在8000到17000的员工的姓名和工资, 按工资降序
SELECT last_name, salary
FROM employees
WHERE salary NOT BETWEEN 8000 AND 17000
ORDER BY salary DESC;