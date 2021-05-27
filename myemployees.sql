#DROP DATABASE IF EXISTS myemployees;
#CREATE DATABASE myemployees;

USE myemployees;

CREATE TABLE employees (
	employee_id INT,
    first_name VARCHAR(20) NULL,
    last_name VARCHAR(25) NULL,
    email VARCHAR(25) NULL,
    phone_number VARCHAR(20) NULL,
    job_id INT(10) NULL,
    salary DECIMAL(10, 2) NULL,
    commission_pct DECIMAL(4, 2) NULL,
    manager_id INT NULL,
    department_id INT NULL,
    hirredate DATETIME NULL,
    PRIMARY KEY (employee_id)
);    

SELECT *
FROM employees;