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

特点:
(1)添加排序、分组、筛选
(2)inner可以省略
(3)筛选条件放在where后面, 连接条件放在on后面, 提高分离性, 便于阅读
(4)
*/

#1. 等值连接

#案例1： 查询员工名, 部门名
SELECT last_name, department_name
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id;

#案例2： 查询名字中包含e的员工名和工种名(添加筛选)
SELECT last_name, job_title
FROM employees AS e
INNER JOIN jobs AS j
ON e.job_id = j.job_id
WHERE e.last_name LIKE '%e%';

#案例3: 查询部门个数>3的城市名和部门个数(添加分组+筛选)
#(1)查询每个城市的部门个数
#(2)在(1)的结果上进行筛选
SELECT city, COUNT(*) AS department_count
FROM departments AS d
INNER JOIN locations AS l
ON d.location_id = l.location_id
GROUP BY city
HAVING department_count > 3;

#案例4: 查询哪个部门的员工个数>3的部门名和员工个数, 并按个数降序(添加排序)

#(1)查询每个部门的员工个数
SELECT COUNT(*) as employee_count, department_name
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id
GROUP BY department_name;

#(2)在(1)的结果上筛选员工个数>3的纪律, 并排序
SELECT COUNT(*) as employee_count, department_name
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id
GROUP BY department_name
HAVING employee_count > 3
ORDER BY employee_count DESC;

#5. 查询员工名, 部门名, 工种名, 并按部门名降序(添加三表连接)
SELECT last_name, department_name, job_title
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id
INNER JOIN jobs AS j
ON e.job_id = j.job_id
ORDER BY department_name DESC;

#(二) 非等值连接

#查询员工的工资级别

SELECT salary, grade_level
FROM employees AS e
JOIN job_grades AS g
ON e.salary BETWEEN g.lowest_sal AND g.highest_sal;
    
#查询每个工资级别的个数>20, 并且按工资级别降序排序
SELECT COUNT(*) AS salary_count, grade_level
FROM employees AS e
JOIN job_grades AS g
ON e.salary BETWEEN g.lowest_sal AND g.highest_sal
GROUP BY grade_level
HAVING salary_count > 20
ORDER BY grade_level DESC;

#(三)自连接

#查询员工的名字、上级的名字
SELECT e.last_name, m.last_name
FROM employees AS e
JOIN employees AS m
ON e.manager_id = m.employee_id;

#查询姓名中包含字符的员工、上级的名字
SELECT e.last_name, m.last_name
FROM employees AS e
JOIN employees AS m
ON e.manager_id = m.employee_id
WHERE e.last_name LIKE '%k%';

#二、外连接

/*
应用场景: 用于查询一个表中有, 另一个表里没有的数据

特点:
1. 外连接的查询结果为主表中的所有记录
	- 如果从表中有和它匹配的, 则显示匹配的值
    - 如果从表中没有和它匹配的, 则显示null
    - 外连接查询结构=内连接结果+主表中有而从表中没有的记录
2. 左外连接, left左边的是主表
   右外连接, right右边的是主表
3. 左外和右外交换两个表的顺序,可以实现同样的效果
4. 全外连接=内连接的结果+表1中有但表2中没有的+表2中有但表1没有的
*/

#引入: 查询男朋友不再男神表的女神名
SELECT b.name, bo.*
FROM beauty AS b
LEFT OUTER JOIN boys AS bo
ON b.boyfriend_id = bo.id
WHERE bo.id IS NULL;

#案例1： 查询哪个部门没有员工

#左外:
SELECT d.*, e.employee_id
FROM departments AS d
LEFT OUTER JOIN employees AS e
ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;

#全外

/*
SELECT b.*, bo.*
FROM beauty AS b
FULL OUTER JOIN boys AS bo
ON b.boyfriend_id = bo.id;
*/