#1. 运行以下脚本创建表my_employees
USE myemployees;

CREATE TABLE my_employees(
	id INT(10),
    first_name VARCHAR(10),
    last_name VARCHAR(10),
    userId VARCHAR(10),
    salary DOUBLE(10, 2)
);

CREATE TABLE users(
	id INT,
    userId VARCHAR(10),
    department_id INT
);

#2. 显示表my_employees的结构
DESC my_employees;