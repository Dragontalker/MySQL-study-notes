USE myemployess;

#进阶2: 条件查询
/*
语法: 
SELECT
	查询列表
FROM
	表名
WHERE
	筛选条件;
    
分类：
	一、按条件表达式筛选
		条件运算符: > < = != (or <>) >= <=
	二、按逻辑表达式筛选
		逻辑运算符: && || ! and or not (推荐使用)
        作用: 用于连接条件表达式
        &&和and: 两个条件都有true, 结果为true, 反之为false
        ||和or: 只要有一个条件都有true, 结果为true, 反之为false
        !和not: 如果连接的条件为false, 返回true
	三、模糊查询
		like
        between and
        in 
        is null
*/

#1. 按条件表达式筛选

#案例1: 查询员工工资>12000的员工信息
SELECT *
FROM employees
WHERE salary > 12000;

#案例2: 查询部门编号不等于90号的员工名和部门编号
SELECT first_name, last_name, department_id
FROM employees
WHERE department_id <> 90;

#2. 按逻辑表达式筛选

#案例1： 查询工资在10000到20000之间的员工名、工资以及奖金
SELECT last_name, salary, commission_pct
FROM employees
WHERE salary >= 10000 AND salary <= 20000;

#案例2: 查询部门编号不是在90到110之间, 或者工资高于15000的员工信息
SELECT *
FROM employees
WHERE department_id < 90 OR department_id > 110 OR salary > 15000;

#3. 模糊查询

/*
like
特点:
1. 一般和通配符搭配使用
	通配符：
	% 任意多个字符, 包含0个字符
    _ 任意单个字符, 只有一个
between and
in
is null | is not null
*/

#1. like

#案例1： 查询员工名中包含字符a的员工信息
SELECT *
FROM employees
WHERE (first_name LIKE '%a%') OR (last_Name LIKE '%a%');