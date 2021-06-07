#视图

/*
含义: 虚拟表, 和普通表一样使用
mysql5.1版本出现的新特性, 是通过表动态生成的数据

比如: 舞蹈班和普通班的对比

		创建语法的关键字	是否实际占用物理空间
视图		create table		没有
表		create view			占用
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

#三、删除视图

/*
语法: drop view 视图名1, 视图名2, ...;
*/

DROP VIEW myv1, myv2, myv3;

#四、查看视图
DESC myv1;

SHOW CREATE VIEW myv1;

#五、视图的更新
CREATE OR REPLACE VIEW myv1
AS
SELECT last_name, email, salary*12*(1+IFNULL(commission_pct, 0)) AS "annual salary"
FROM employees;

CREATE OR REPLACE VIEW myv1
AS
SELECT last_name, email
FROM employees;

SELECT * FROM myv1;

#1. 插入
INSERT INTO myv1
VALUES ('张飞', 'zf@qq.com');

#2. 修改
UPDATE myv1
SET last_name = '张无忌'
WHERE last_name = '张飞';

#3. 删除
DELETE FROM myv1
WHERE last_name = '张无忌';

#具备以下特点的视图不允许更新
/*
(1)包含以下关键字的slq语句
	- 分组函数
    - distinct
    - group by
    - having
    - union
    - union all
*/

CREATE OR REPLACE VIEW myv1
AS
SELECT MAX(salary) as m, department_id
FROM employees
GROUP BY department_id;

SELECT * FROM myv1;

#更新
UPDATE myv1 
SET m = 9000
WHERE department_id = 10;

#(2)常量视图
CREATE OR REPLACE VIEW myv2
AS
SELECT 'john' NAME;

UPDATE myv2
SET NAME = 'lucy';