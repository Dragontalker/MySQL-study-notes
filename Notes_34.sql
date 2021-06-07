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

#2. 开启事务, 向表中插入1行数据, 并结束
SET autocommit=0;
INSERT INTO books(bid, bname, price, btypeId)
VALUES (1, '小李飞刀', 100, 1);
COMMIT;

#3. 创建视图, 实现查询价格大于100的书名和类型名
CREATE VIEW myv1
AS
SELECT bname, price, btyleID
FROM books AS b
JOIN bookType AS t
ON b.btypeId = t.id
WHERE price > 100;