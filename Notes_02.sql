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