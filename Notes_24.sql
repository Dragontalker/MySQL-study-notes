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

#4. 向users表中插入数据
INSERT INTO users
VALUES
	(1, 'Raptel', 10),
    (2, 'Bdancs', 10),
    (3, 'Bbiri', 20),
    (4, 'Cnewman', 30),
    (5, 'Aropebur', 40);
    
#5. 将3号员工的last_name修改为"drelxer"
UPDATE my_employees
SET last_name = 'drelxer'
WHERE id = 3;

#6. 将所有工资少于900的员工的工资修改为1000
UPDATE my_employees
SET salary = 1000
WHERE salary < 900;

#7. 将userid为Bbiri的user表和my_employee表删除
DELETE u, e
FROM users AS u
INNER JOIN my_employees AS e
ON u.userId = e.userId
WHERE u.userId = 'Bbiri';

#8. 删除所有数据
DELETE FROM my_employees;
DELETE FROM users;

#9. 检查所作的修正
SELECT * FROM my_employees;
SELECT * FROM users;

#10. 清空my_employees
TRUNCATE my_employees;