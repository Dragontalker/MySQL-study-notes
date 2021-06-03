#进阶7： 子查询

/*
含义:
	- 出现在其他语句中的select语句, 称为子查询或内查询
    - 外部的查询语句, 称为主查询或外查询
    
分类:
按子查询出现的位置:
	- select后面：
		仅仅支持标量子查询
    - from后面：
		支持表子查询
    - where或having后面(*)：
		标量子查询 - 单行(*)
        列子查询 - 多行(*)
        行子查询
    - exists后面(相关子查询)：
		表子查询
    
按结果集的行列数不同:
	- 标量子查询(结果集只有一行一列)
    - 列子查询(结果集只有一列多行)
    - 行子查询(结果集有一行多列)
    - 表子查询(结果集一般为多行多列)
*/


#一、where或having后面
#1. 标量子查询(单行子查询)
#2. 列子查询(多行子查询)
#3. 行子查询(多列多行)

#特点:
#(1)子查询放在小括号内
#(2)子查询一般放在条件的右侧
#(3)标量子查询, 一般搭配着单行操作符使用 > < >= <= <>

#列子查询, 一般搭配着多行操作符使用
#in, any/some, all

#(4)子查询的执行优先于主查询执行, 主查询的条件用到了子查询的结果

#1. 标量子查询
#案例1： 谁的工资比Abel高?

#(1)查询Abel的工资
SELECT salary
FROM employees
WHERE last_name = 'Abel';

#(2)查询员工的信息, 满足salary > (1)的结果
SELECT *
FROM employees
WHERE salary > (
	SELECT salary
	FROM employees
	WHERE last_name = 'Abel'
);

#案例2: 返回job_id与141号员工相同, salary比143号员工多的员工姓名, job_id和工资
#(1)查询141号员工的job_id
SELECT job_id
FROM employees
WHERE employee_id = 141;

#(2)查询143号员工的salary
SELECT salary
FROM employees
WHERE employee_id = 143;

#(3)查询员工的姓名, job_id和工资, 要求job_id=(1)并且salary>(2)
SELECT last_name, job_id, salary
FROM employees
WHERE job_id = (
	SELECT job_id
	FROM employees
	WHERE employee_id = 141
) AND salary > (
	SELECT salary
	FROM employees
	WHERE employee_id = 143
);

#案例3： 返回公司工资最少的员工的last_name, job_id和salary

#(1)查询公司的最低工资
SELECT MIN(salary)
FROM employees;

#(2)查询last_name, job_id和salary, 要求salary=(1)
SELECT last_name, job_id, salary
FROM employees
WHERE salary = (
	SELECT MIN(salary)
	FROM employees
);

#案例4: 查询最低工资大于50号部门最低工资的部门id和其最低工资

#(1)查询50号部门的最低工资
SELECT MIN(salary)
FROM employees
WHERE department_id = 50;

#(2)查询每个部门的最低工资
SELECT MIN(salary), department_id
FROM employees
GROUP BY department_id;

#(3) 在(2)基础啊上筛选, 满足min(salary)>(1)
SELECT MIN(salary), department_id
FROM employees
GROUP BY department_id
HAVING MIN(salary) > (
	SELECT MIN(salary)
	FROM employees
	WHERE department_id = 50
);

#非法使用标量子查询
/*
SELECT MIN(salary), department_id
FROM employees
GROUP BY department_id
HAVING MIN(salary) > (
	SELECT salary //多行子查询
	FROM employees
	WHERE department_id = 50
);
*/

#2. 列子查询(多行子查询)

#案例1： 返回location_id是1400或1700的部门中的所有员工姓名

#(1)查询location_id是1400或1700的部门编号
SELECT DISTINCT department_id
FROM departments
WHERE location_id IN(1400, 1700);

#(2)查询员工姓名, 要求部门号是(1)列表中的某一个
SELECT last_name
FROM employees
WHERE department_id IN (
	SELECT DISTINCT department_id
	FROM departments
	WHERE location_id IN(1400, 1700)
);

#案例2: 返回其他部门中比job_id为'IT_PROG'工种任一工资低的员工的员工号, 姓名, job_id, 以及salary

#(1)查询job_id为'IT_PROG'部门任一工资
SELECT DISTINCT salary
FROM employees
WHERE job_id = 'IT_PROG';

#(2)查询员工号, 姓名, job_id以及salary, salary < (1)的任意一个
SELECT last_name, employee_id, job_id, salary
FROM employees
WHERE salary < ANY (
	SELECT DISTINCT salary
	FROM employees
	WHERE job_id = 'IT_PROG'
) AND job_id <> 'IT_PROG';

#案例3: 返回其他部门中比job_id为'IT_PROG'部门虽有工资都低的员工的员工号, 姓名, job_id, 以及salary
SELECT last_name, employee_id, job_id, salary
FROM employees
WHERE salary < ALL (
	SELECT DISTINCT salary
	FROM employees
	WHERE job_id = 'IT_PROG'
) AND job_id <> 'IT_PROG';

#3. 行子查询(结果集一行多列或多行多列)

#案例: 查询员工编号最小并且工资最高的员工信息

#(1)查询最小的员工编号
SELECT MIN(employee_id)
FROM employees;

#(2)查询最高工资
SELECT MAX(salary)
FROM employees;

#(3)查询员工信息
SELECT *
FROM employees
WHERE employee_id = (
	SELECT MIN(employee_id)
	FROM employees
) AND salary = (
	SELECT MAX(salary)
	FROM employees
);

