#进阶5. 分组查询

#引入: 查询每个部门的平均工资
SELECT department_id, ROUND(AVG(salary), 2)
FROM employees
GROUP BY department_id;