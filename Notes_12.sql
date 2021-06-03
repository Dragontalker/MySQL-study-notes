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
*/
#查询工种号、工种名、员工名
SELECT last_name, e.job_id, job_title
FROM employees AS e, jobs AS j
WHERE e.job_id = j.job_id;