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