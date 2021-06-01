#二、分组函数
/*
功能: 用做统计使用, 又称为聚合函数或统计函数或组函数

分类:
sum求和, avg平均值, max最大值, min最小值, count计算个数

特点:
1. sum, avg一般用于处理数值型
   max, min, count可以处理任何类型
2. 是否忽略null值
3. 可以和distinct搭配实现去重的运算
4. count函数的单独介绍
*/

#1. 简单的使用
SELECT SUM(salary) FROM employees;
SELECT MAX(salary) FROM employees;
SELECT MIN(salary) FROM employees;
SELECT COUNT(salary) FROM employees;

SELECT 
	SUM(salary) AS sum, 
    AVG(salary) AS average, 
    MAX(salary) AS maximum,
    MIN(salary) AS minimum,
    COUNT(salary) AS count
FROM employees;

#2. 参数支持哪些类型
SELECT SUM(last_name), AVG(last_name) FROM employees;
SELECT SUM(hiredate), AVG(hiredate) FROM employees;

SELECT MAX(last_name), MIN(last_name) FROM employees;
SELECT MAX(hiredate), MIN(hiredate) FROM employees;

SELECT COUNT(last_name), COUNT(hiredate), COUNT(commission_pct) 
FROM employees;

#3. 忽略null
SELECT 
	SUM(commission_pct) AS sum, 
    AVG(commission_pct), 
    SUM(commission_pct)/35, 
    SUM(commission_pct)/107 
FROM employees;

SELECT MAX(commission_pct), MIN(commission_pct)
FROM employees;

SELECT COUNT(commission_pct) FROM employees;

#4. 和distinct搭配
SELECT SUM(DISTINCT salary), SUM(salary) FROM employees;
SELECT COUNT(DISTINCT salary), COUNT(salary) FROM employees;

#5. count函数的详细介绍
SELECT COUNT(salary) FROM employees;

#用来统计表格的行数
SELECT COUNT(*) FROM employees;
SELECT COUNT(1) FROM employees;
SELECT COUNT(2) FROM employees;
SELECT COUNT('大侠') FROM employees;

#效率:
#5.0之前, MYISAM存储引擎下, COUNT(*)的效率高
#5.0之后, INNODB存储引擎下, COUNT(*)和COUNT(1)的效率差不多, 比COUNT(字段)要高一些