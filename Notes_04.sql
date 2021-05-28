#进阶3: 排序查询
/*
引入:
	SELECT * FROM employees;
语法:
	SELECT 查询列表
    FROM 表
    WHERE 筛选条件
    ORDER BY 排序列表 [asc|desc]
    
特点:
	1. asc代表升序, desc代表的是降序
    2. 如果不写, 默认是升序
*/

#案例1: 查询员工信息, 要求工资从高到低排序
SELECT *
FROM employees
ORDER BY salary;

#案例2: 查询员工信息, 要求工资从低到高排序
SELECT *
FROM employees
ORDER BY salary DESC;

#案例3: 查询部门编号>=90的员工信息, 按入职时间的先后进行排序
SELECT *
FROM employees
WHERE department_id >= 90
ORDER BY hiredate;