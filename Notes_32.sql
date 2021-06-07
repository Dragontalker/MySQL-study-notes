#视图

/*
含义: 虚拟表, 和普通表一样使用
mysql5.1版本出现的新特性, 是通过表动态生成的数据

比如: 舞蹈班和普通班的对比
*/

#案例: 查询姓张的学生名和专业名
SELECT stuname, major_name
FROM stuinfo AS s
INNER JOIN major AS m 
ON s.major_id = m.id
WHERE s.stuname LIKE '%张';

#创建视图
CREATE VIEW v1
AS
SELECT stuname, major_name
FROM stuinfo AS s
INNER JOIN major AS m
ON s.major_id = m.id;

#使用视图
SELECT * FROM v1 WHERE s.stuname LIKE '%张';

#一、创建视图
/*
语法:
create view 视图名
as
查询语句;
*/

#1. 查询姓名中包含a字符的员工名、部门名和工种新消息
#(1)创建
CREATE VIEW myv1
AS
SELECT last_name, department_name, job_title
FROM employees AS e
JOIN departments AS d
ON e.department_id = d.department_id
JOIN jobs AS j
ON j.job_id = e.job_id;

#(2)使用
SELECT *
FROM myv1
WHERE last_name LIKE '%a%';

#2. 查询各部门的平均工资级别
#(1)创建视图查看每个部门的平均工资
CREATE VIEW myv2
AS
SELECT AVG(salary) AS ag, department_id
FROM employees
GROUP BY department_id;

#(2)使用
SELECT myv2.ag, g.grade_level 
FROM myv2
JOIN job_grades AS g
ON myv2.ag BETWEEN g.lowest_sal AND g.highest_sal;

#3. 查询平均工资最低的部门信息
SELECT * 
FROM myv2
ORDER BY ag
LIMIT 1;

#4. 查询平均工资最低的部门名和工资
CREATE VIEW myv3
AS
SELECT * 
FROM myv2
ORDER BY ag
LIMIT 1;

SELECT d.*, m.ag
FROM myv3 AS m
JOIN departments AS d
ON m.department_id = d.department_id;

#二、视图的修改
/*
方式一:
create or replace view 视图名
as
查询语句;
*/

SELECT * FROM myv3;

CREATE OR REPLACE VIEW myv3
AS
SELECT AVG(salary), job_id
FROM employees
GROUP BY job_id;

/*
方式二:
语法:
alter view 视图名
as
查询语句;
*/

ALTER VIEW myv3
AS
SELECT * FROM myv2;
