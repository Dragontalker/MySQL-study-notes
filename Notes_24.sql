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

#3. 向my_employees表插入下列数据
#方式1:
INSERT INTO my_employees
VALUES
	(1, 'Petel', 'Ralph', 'Rpatel', 895),
    (2, 'Dancs', 'Betty', 'Bdancs', 860),
    (3, 'Biri', 'Ben', 'Bbiri', 1100),
    (4, 'Newman', 'Chad', 'Cnewman', 750),
    (5, 'Ropeburn', 'Andrey', 'Aropebur', 1550);
    
#方式2:
INSERT INTO my_employees
SELECT 1, 'Petel', 'Ralph', 'Rpatel', 895 UNION
SELECT 2, 'Dancs', 'Betty', 'Bdancs', 860 UNION
SELECT 3, 'Biri', 'Ben', 'Bbiri', 1100 UNION
SELECT 4, 'Newman', 'Chad', 'Cnewman', 750 UNION
SELECT 5, 'Ropeburn', 'Andrey', 'Aropebur', 1550;     