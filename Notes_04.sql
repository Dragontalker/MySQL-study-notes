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
    3. order by字句中可以支持单个字段, 多个字段, 表达式, 函数, 别名
    4. order by字句一般是放在查询语句的最后面, limit字句除外
*/

#案例1: 查询员工信息, 要求工资从高到低排序
SELECT *
FROM employees
ORDER BY salary;

#案例2: 查询员工信息, 要求工资从低到高排序
SELECT *
FROM employees
ORDER BY salary DESC;

#案例3: 查询部门编号>=90的员工信息, 按入职时间的先后进行排序[添加筛选条件]
SELECT *
FROM employees
WHERE department_id >= 90
ORDER BY hiredate;

#案例4: 按年薪的高低显示员工的信息和年薪[按表达式排序]
SELECT *, salary*12*(1+ifnull(commission_pct, 0)) AS annual_salary
FROM employees
ORDER BY annual_salary;

#案例5: 按姓名的长度显示员工的姓名和工资[按函数排序]
SELECT LENGTH(last_name) name_length, last_name, salary
FROM employees
ORDER BY name_length;

#案例6: 查询员工信息, 要求先按工资排序, 再按员工编号排序[按多个字段排序]
SELECT *
FROM employees
ORDER BY salary ASC, employee_id DESC;