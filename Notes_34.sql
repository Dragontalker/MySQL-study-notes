#1. 创建一个Book表, 字段如下:
/*
bid 整形, 要求主键
bname 字符型, 要求设置唯一键, 并非空
price 浮点型, 要求有默认值 10
btypeId 类型编号, 要求引用bookType表的 id字段

已知bookType表(不用创建), 字段如下:
id
name
*/

DROP TABLE IF EXISTS books;
CREATE TABLE books(
	bid INT PRIMARY KEY,
    bname VARCHAR(20) UNIQUE NOT NULL,
    price FLOAT DEFAULT 10,
    btypeId INT,
    FOREIGN KEY(btypeId) REFERENCES bookType(id)
);