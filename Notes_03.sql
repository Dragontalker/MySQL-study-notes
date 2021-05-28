#1. 查询没有奖金, 且工资小于18000的salary, last_name
SELECT salary, last_name
FROM employees
WHERE commission_pct IS NULL AND salary < 18000;

#2. 查询employees表中, job_id不为'IT'或者 工资为12000的员工信息
SELECT *
FROM employees
WHERE job_id <> 'IT' OR salary = 12000;

#3. 查看部门departments表的结构, 查询结果如下
DESC departments;

#4. 查询部门departments表中涉及到了哪些位置编号
SELECT DISTINCT location_id
FROM departments;

#5. 经典面试题
#试问： SELECT * FROM employees; 和 
#SELECT * FROM employees WHERE commission_pct LIKE '%%' AND last_name like '%%';
#结果是否一样? 并说明原因

#答案: 不一样! 如果判断的字段有null值
#如果用OR并有足够多的变量就一样了