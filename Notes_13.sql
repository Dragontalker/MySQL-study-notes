#1. 显示员工表的最大工资, 工资平均值
SELECT MAX(salary), AVG(salary)
FROM employees;

#2. 查询员工表中的employee_id, job_id, last_name, 按department_id降序, salary升序
SELECT employee_id, job_id, last_name
FROM employees
ORDER BY department_id DESC, salary ASC;

#3. 查询员工表中的job_id中包含a和e的, 并且a在e的前面
SELECT job_id
FROM employees
WHERE job_id LIKE '%a%e%';

#4. 已知表, 里面有id(学号), name, gradeId(年级编号)
#已知表grade, 里面有id(年级编号), name(年纪名)
#已知表result, 里面有id, score, studentNo(学号)
#要求查询姓名、年级名、成绩
SELECT s.name, g.name, r.score
FROM student AS s, grade AS g, result as r
WHERE s.id = r.studentNO
AND g.id = s.gradeId;