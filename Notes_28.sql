#常见约束

/*
含义: 一种限制, 用于限制表中的数据, 为了保证表中的数据的准确和可靠性

分类: 六大约束
	1. NOT NULL: 非空, 用于保证该字段的值不能为空
		- 比如姓名, 学号等
	2. DEFAULT: 默认, 用于保证该字段有默认值
		- 比如性别
	3. PRIMARY KEY: 主键, 用于保证该字段的值具有唯一性, 并且非空
		- 比如学号, 员工编号等
	4. UNIQUE: 唯一, 用于保证该字段的值具有唯一性, 可以为空
		- 比如座位号
	5. CHECK: 检查约束[mysql不支持]
		- 比如年龄, 性别
	6. FOREIGN KEY: 外键, 用于限制两个表的关系, 用于保证该字段的值必须来自于主表的关联列的值
		- 在从表添加外键约束, 用于引用主表中某列的值
        - 比如学生表的专业编号, 员工表的部门编号, 员工表的工种编号
        
添加约束的时机:
	1. 创建表时
    2. 修改表时
    
约束的添加分类:
	1. 列级约束:
		- 六大约束语法上都支持, 但外键约束没有效果
    2. 表级约束: 
		- 除了非空, 默认, 其他都支持
    
CREATE TABLE 表名(
	字段名 字段类型 列级约束,
    表级约束
);
*/

#一、创建表时添加约束

#1. 添加列级约束
CREATE DATABASE students;
USE students;

CREATE TABLE stuinfo(
	id INT PRIMARY KEY, #主键
    stuName VARCHAR(20) NOT NULL, #非空
    gender CHAR(1), #CHECK(gender IN ('男','女'), 检查约束
    seat INT UNIQUE, #唯一
    age INT DEFAULT 18, #默认约束
    majorId INT REFERENCES major(id) #外键
);

CREATE TABLE major(
	id INT PRIMARY KEY,
    majorName VARCHAR(20) NOT NULL
);