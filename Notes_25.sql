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