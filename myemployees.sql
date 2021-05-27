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

DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS jobs;

  



CREATE TABLE locations (
	location_id INT AUTO_INCREMENT,
    street_address VARCHAR(40) NULL,
    postal_code VARCHAR(12) NULL,
    city VARCHAR(30) NULL,
    state_province VARCHAR(25) NULL,
    country_id INT NULL,
    PRIMARY KEY (location_id)
);

CREATE TABLE jobs (
	job_id INT AUTO_INCREMENT,
    job_title VARCHAR(35) NULL,
    min_salary INT NULL,
    max_salary INT NULL,
    PRIMARY KEY (job_id)
);

#进阶1： 基础查询
/*
语法: select 查询列表 from 表名；

类似于: System.out.println(打印输出);

特点：
1. 查询列表可以是： 表中的字段、常量值、表达式、函数
2. 查询的结果是一个虚拟的表格
*/

#1. 查询表中的单个字段
SELECT last_name FROM employees;

#2. 查询表中的多个字段
SELECT last_name, salary, email FROM employees;

#3. 查询表中的所有字段
SELECT * FROM employees;
