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
        作用: 用于连接条件表达式
        &&和and: 两个条件都有true, 结果为true, 反之为false
        ||和or: 只要有一个条件都有true, 结果为true, 反之为false
        !和not: 如果连接的条件为false, 返回true
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

#案例2: 查询部门编号不等于90号的员工名和部门编号
SELECT first_name, last_name, department_id
FROM employees
WHERE department_id <> 90;

#2. 按逻辑表达式筛选

#案例1： 查询工资在10000到20000之间的员工名、工资以及奖金
SELECT last_name, salary, commission_pct
FROM employees
WHERE salary >= 10000 AND salary <= 20000;

#案例2: 查询部门编号不是在90到110之间, 或者工资高于15000的员工信息
SELECT *
FROM employees
WHERE department_id < 90 OR department_id > 110 OR salary > 15000;

#3. 模糊查询

/*
like
特点:
1. 一般和通配符搭配使用
	通配符：
	% 任意多个字符, 包含0个字符
    _ 任意单个字符, 只有一个
between and
in
is null | is not null
*/

#1. like

#案例1： 查询员工名中包含字符a的员工信息
SELECT *
FROM employees
WHERE (first_name LIKE '%a%') OR (last_Name LIKE '%a%');

#案例2： 查询员工名中第三个字符为n, 第五个字符为l的员工名和工资
SELECT last_name, salary
FROM employees
WHERE last_name LIKE '__n_l%';

#案例3: 查询员工名中第二个字符为_的员工名
SELECT last_name
FROM employees
WHERE last_name LIKE '_$_%' ESCAPE '$';

#2. between and

/*
1. 使用between and可以提高语句的简洁度
2. 包含临界值
3. 两个临界值不能调换顺序
*/

#案例1: 查询员工编号100到120之间的员工信息
SELECT *
FROM employees
WHERE employee_id BETWEEN 100 AND 120;

#3. in
/*
含义: 判断某字段的值是否属于in列表中的某一项
特点: 
	1. 使用in提高语言简洁度
    2. in列表的值类型必须统一或兼容
*/
#案例: 查询员工的公众编号是 IT_PROG, AD_VP, AD_PRES的一个员工名和公众编号

SELECT last_name, job_id
FROM employees
WHERE job_id IN ('IT_PROG', 'AD_', 'AD_PRES');

#4. is null
/*
=或<>不能用于判断null值
NULL必须和IS搭配使用
*/

#案例1： 查询没有奖金的员工名和奖金率
SELECT last_name, commission_pct
FROM employees
WHERE commission_pct IS NULL;

#安全等于<=>

#案例1： 查询没有奖金的员工名和奖金率
SELECT last_name, commission_pct
FROM employees
WHERE commission_pct <=> NULL;

#案例2： 查询工资为12000的员工信息
SELECT last_name, salary
FROM employees
WHERE salary <=> 12000;

#is null vs. <=>
/*
IS NULL: 只能判断null值, 可读性较高
<=>: 即可以判断null值, 也可以判断其他数据类型, 但可读性较低
*/
