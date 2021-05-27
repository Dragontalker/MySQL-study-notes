#DROP DATABASE IF EXISTS myemployees;
#CREATE DATABASE myemployees;

USE myemployees;

DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
	department_id INT AUTO_INCREMENT,
	department_name VARCHAR(3) NULL,
    manager_id INT NULL,
    location_id INT NULL,
    PRIMARY KEY (department_id)
); 

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
	employee_id INT AUTO_INCREMENT,
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

INSERT INTO
`departments`(`department_id`,`department_name`,`manager_id`,`location_id`) 
VALUES
(10,'Adm',200,1700),
(20,'Mar',201,1800),
(30,'Pur',114,1700),
(40,'Hum',203,2400),
(50,'Shi',121,1500),
(60,'IT',103,1400),
(70,'Pub',204,2700),
(80,'Sal',145,2500),
(90,'Exe',100,1700),
(100,'Fin',108,1700),
(110,'Acc',205,1700),
(120,'Tre',NULL,1700),
(130,'Cor',NULL,1700),
(140,'Con',NULL,1700),
(150,'Sha',NULL,1700),
(160,'Ben',NULL,1700),
(170,'Man',NULL,1700),
(180,'Con',NULL,1700),
(190,'Con',NULL,1700),
(200,'Ope',NULL,1700),
(210,'IT ',NULL,1700),
(220,'NOC',NULL,1700),
(230,'IT ',NULL,1700),
(240,'Gov',NULL,1700),
(250,'Ret',NULL,1700),
(260,'Rec',NULL,1700),
(270,'Pay',NULL,1700);

DROP TABLE IF EXISTS jobs;

CREATE TABLE jobs (
	job_id INT AUTO_INCREMENT,
    job_title VARCHAR(35) NULL,
    min_salary INT NULL,
    max_salary INT NULL,
    PRIMARY KEY (job_id)
);  

DROP TABLE IF EXISTS locations;

CREATE TABLE locations (
	location_id INT AUTO_INCREMENT,
    street_address VARCHAR(40) NULL,
    postal_code VARCHAR(12) NULL,
    city VARCHAR(30) NULL,
    state_province VARCHAR(25) NULL,
    country_id INT NULL,
    PRIMARY KEY (location_id)
);