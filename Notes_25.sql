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