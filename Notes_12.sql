#进阶6： 连接查询
/*
含义： 又称多表查询, 当查询

笛卡尔乘积现象: 表1： 有m行, 表2: 有n行, 结果=m*n行

发生原因: 没有有效的连接条件
如何避免: 添加有效的连接条件

分类:
	按年代分类：
    sql92标准: 仅仅支持内连接
    sql99标准: [推荐使用] 支持内连接+外连接+交叉连接
    
    按功能分类:
		内连接:
			等值连接
            非等值连接
            自连接
        外连接：
			左外连接
            右外连接
            全外连接
        交叉连接
*/

#一、sql92标准
#1. 等值连接

#案例1： 查询女神名和对应的男生名
SELECT NAME, boyName 
FROM boys, beauty
WHERE beauty.boyfriend_id = boys.id;

#案例2: 查询员工名和对应的部门名
SELECT last_name, department_name
FROM employees, departments
WHERE employees.department_id = departments.department_id;

#2. 为表其别名
/*
(1)提高语句的简洁度
(2)区分多个重名的字段

注意： 如果为表起了别名, 则查询的字段就不能使用原来的表名去限定
*/

#查询工种号、工种名、员工名
SELECT last_name, e.job_id, job_title
FROM employees AS e, jobs AS j
WHERE e.job_id = j.job_id;

#3. 两个表的顺序是否可以调换
SELECT last_name, e.job_id, job_title
FROM jobs AS j, employees AS e
WHERE j.job_id = e.job_id;

#4. 可以加筛选?
#案例1: 查询有奖金的员工名、部门名
SELECT last_name, department_name, commission_pct
FROM employees AS e, departments AS d
WHERE e.department_id = d.department_id AND e.commission_pct IS NOT NULL;

#案例2: 查询城市名中第二个字符为o的部门名和城市名
SELECT department_name, city
FROM departments AS d, locations AS l
WHERE d.location_id = l.location_id
AND city LIKE '_o%';

#5. 可以加分组?

#案例1: 查询每个城市的部门个数
SELECT COUNT(*) AS department_count, city
FROM departments AS d, locations AS l
WHERE d.location_id = l.location_id
GROUP BY city;

#案例2: 查询出有奖金的每个部门的部门名和部门的领导编号和该部门的最低工资
SELECT department_name, d.manager_id, MIN(salary) AS min_salary
FROM departments AS d, employees AS e
WHERE d.department_id = e.department_id
AND commission_pct IS NOT NULL
GROUP BY department_name, d.manager_id;

#6. 可以加排序
#案例: 查询每个工种的工种名和员工的个数, 并且按员工个数降序
SELECT job_title, COUNT(*)
FROM employees AS e, jobs AS j
WHERE e.job_id = j.job_id
GROUP BY job_title
ORDER BY COUNT(*) DESC;