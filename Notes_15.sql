#进阶6： sql99语法
/*
语法:
	SELECT 查询列表
    FROM 表1 别名 [连接类型]
    JOIN 表2 别名 ON 连接条件
    [WHERE 筛选条件]
    [GROUP BY 分组]
    [HAVING 筛选条件]
    [ORDER BY 排序列表]
    
分类:
内连接(*): inner
外连接
	左外(*): left [outer]
    右外(*): right [outer]
    全外: full [outer]
交叉连接: cross
*/

#一、 内连接
/*
语法：、
SELECT 查询列表
FROM 表1 别名
INNER JOIN 表2 别名
ON 连接条件
*/

#1. 等值连接

#案例1： 查询员工名, 部门名
SELECT last_name, department_name
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id;