#DDL

/*
数据定义语言

库和表的管理

一、库的管理: 创建、修改、删除
二、表的管理: 创建、修改、删除

创建: create
修改: alter
删除: drop
*/

#一、库的管理
#1. 库的创建

/*
create database [IF NOT EXISTS] 库名;
*/

#案例: 创建库Books
CREATE DATABASE IF NOT EXISTS books;

#2. 库的修改
#更改库的字符集
ALTER DATABASE books CHARACTER SET gbk;

#3. 库的删除
DROP DATABASE IF EXISTS books;

#二、表的管理
#1. 表的创建 [*]

/*
create table 表名(
	列名1 列1的类型[(长度) 列的约束],
    列名2 列2的类型[(长度) 列的约束],
    ...
);
*/

#案例: 创建表book
CREATE TABLE book (
	id INT, #编号
    bname VARCHAR(20), #图书名
    price DOUBLE, #价格
    authorId INT, #作者
    publishDate DATETIME #出版日期
);

#案例: 创建表author
CREATE TABLE author(
	id INT,
    au_name VARCHAR(20),
    nation VARCHAR(10)
);

DESC book;
DESC book_author;

#2. 表的修改

/*
alter table 表名
add|drop|modify|change column 列名 [列类型 约束]
*/

#(1)修改列名
ALTER TABLE book
CHANGE COLUMN publishDate pubDate DATETIME;

#(2)修改列的类型或约束
ALTER TABLE book
MODIFY COLUMN pubDate TIMESTAMP;

#(3)添加新的列
ALTER TABLE author
ADD COLUMN annual DOUBLE;

#(4)删除列
ALTER TABLE author
DROP COLUMN annual;

#(5)修改表名
ALTER TABLE author
RENAME TO book_author;

#3. 表的删除
DROP TABLE IF EXISTS book_author;
SHOW TABLES;

#通用的写法:
DROP DATABASE IF EXISTS my_database;
CREATE DATABASE my_database;

DROP TABLE IF EXISTS my_table;
CREATE TABLE my_table;

#4. 表的复制
INSERT INTO author
VALUES 
	(1, '村上春树', '日本'),
    (2, '莫言', '中国'),
    (3, '冯唐', '中国'),
    (4, '金庸', '中国');
    
#(1)仅仅复制表的结构
CREATE TABLE copy LIKE author;
SELECT * FROM author;
SELECT * FROM copy;
