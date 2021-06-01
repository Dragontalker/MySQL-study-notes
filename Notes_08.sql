#二、分组函数
/*
功能: 用做统计使用, 又称为聚合函数或统计函数或组函数

分类:
sum求和, avg平均值, max最大值, min最小值, count计算个数
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

SELECT COUNT(last_name), COUNT(hiredate) FROM employees;
