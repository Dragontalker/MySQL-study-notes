USE myemployees;

#进阶1： 基础查询
/*
语法: select 查询列表 from 表名；

类似于: System.out.println(打印输出);

特点：
1. 查询列表可以是： 表中的字段、常量值、表达式、函数
2. 查询的结果是一个虚拟的表格
*/

#1. 查询表中的单个字段
SELECT last_name FROM employees;

#2. 查询表中的多个字段
SELECT last_name, salary, email FROM employees;

#3. 查询表中的所有字段
SELECT * FROM employees;

#4. 查询常量值
SELECT 100;
SELECT 'john';

#5. 查询表达式
SELECT 100%98;

#6. 查询函数
SELECT VERSION();