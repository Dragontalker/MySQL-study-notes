DROP DATABASE IF EXISTS test;
CREATE DATABASE test;
USE test;
#1. 创建表dept1
DROP TABLE IF EXISTS dept1;
CREATE TABLE dept1(
	id INT(7),
    NAME VARCHAR(25)
);

#2. 将表departments中的数据插入新表dept2中
CREATE TABLE dept2
SELECT department_id, department_name
FROM myemployees.departments;

SELECT * FROM dept2;

#3. 创建一个表emp5
CREATE TABLE emp5(
	id INT(7),
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    dept_id INT(7)
);

#4. 将列last_name的长度增加到50
ALTER TABLE emp5
MODIFY COLUMN last_name VARCHAR(50);

#5. 根据表employees创建employees2
CREATE TABLE employees2
LIKE myemployees.employees;

#6. 删除表emp5
DROP TABLE IF EXISTS emp5;