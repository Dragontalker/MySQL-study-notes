#进阶7： 子查询

/*
含义:
	- 出现在其他语句中的select语句, 称为子查询或内查询
    - 外部的查询语句, 称为主查询或外查询
    
分类:
按子查询出现的位置:
	- select后面：
		仅仅支持标量子查询
    - from后面：
		支持表子查询
    - where或having后面(*)：
		标量子查询 - 单行(*)
        列子查询 - 多行(*)
        行子查询
    - exists后面(相关子查询)：
		表子查询
    
按结果集的行列数不同:
	- 标量子查询(结果集只有一行一列)
    - 列子查询(结果集只有一列多行)
    - 行子查询(结果集有一行多列)
    - 表子查询(结果集一般为多行多列)
*/


#一、where或having后面
#1. 标量子查询(单行子查询)
#2. 列子查询(多行子查询)
#3. 行子查询(多列多行)

#特点:
#(1)子查询放在小括号内
#(2)子查询一般放在条件的右侧
#(3)标量子查询, 一般搭配着单行操作符使用 > < >= <= <>

#列子查询, 一般搭配着多行操作符使用
#in, any/some, all

#1. 标量子查询
#案例1： 谁的工资比Abel高?

#(1)查询Abel的工资
SELECT salary
FROM employees
WHERE last_name = 'Abel';

#(2)查询员工的信息, 满足salary > (1)的结果
SELECT *
FROM employees
WHERE salary > (
	SELECT salary
	FROM employees
	WHERE last_name = 'Abel'
);

#案例2: 返回job_id与141号员工相同, salary比143号员工多的员工姓名, job_id和工资
#(1)查询141号员工的job_id
SELECT job_id
FROM employees
WHERE employee_id = 141;

