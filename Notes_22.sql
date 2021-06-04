#进阶9： 联合查询
/*
union联合 合并： 将多条查询语句的结果合并成一个结果

语法:
查询语句1
UNION
查询语句2
...

应用场景：

*/

#引入的案例: 查询部门编号>90或邮箱包含a的员工信息
SELECT *
FROM employees
WHERE email LIKE '%a%'
OR department_id > 90;

#union
SELECT * FROM employees WHERE email LIKE '%a%'
UNION
SELECT * FROM employees WHERE department_id > 90;

#案例: 查询中国用户中性别为男的信息以及外国用户中性别为男的用户信息

