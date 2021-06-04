#进阶9： 联合查询
/*
union联合 合并： 将多条查询语句的结果合并成一个结果
*/

#引入的案例: 查询部门编号>90或邮箱包含a的员工信息
SELECT *
FROM employees
WHERE email LIKE '%a%'
OR department_id > 90;
