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

CREATE TABLE departments (
	department_id INT,
	department_name VARCHAR(3) NULL,
    manager_id INT NULL,
    location_id INT NULL,
    PRIMARY KEY (department_id)
); 

CREATE TABLE locations (
	location_id INT,
    street_address VARCHAR(40) NULL,
    postal_code VARCHAR(12) NULL,
    city VARCHAR(30) NULL,
    state_province VARCHAR(25) NULL,
    country_id INT NULL,
    PRIMARY KEY (location_id)
);

CREATE TABLE jobs (
	job_id VARCHAR(10),
    job_title VARCHAR(35) NULL,
    min_salary INT NULL,
    max_salary INT NULL,
    PRIMARY KEY (job_id)
);


SELECT *
FROM employees;