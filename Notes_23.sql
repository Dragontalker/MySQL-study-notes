#DML语言

/*
数据操作语言:
插入: insert
修改: update
删除: delete
*/

#一、插入语句
#方式一: 经典实现
/*
语法:
INSERT INTO 表名 (列名1, ...)
VALUES (值1, ...)
*/

#1. 插入的值的类型要与列的类型一致或兼容
INSERT INTO beauty(id, NAME, sex, borndate, phone, photo, boyfriend_id)
VALUES (13, '唐艺昕', '女', '1990-4-23', '1898888888', null, 2);

#2. 不可以为null的列必须插入值, 可以为null的列是如何插入值? 
INSERT INTO beauty(id, NAME, sex, borndate, phone, boyfriend_id)
VALUES (14, '金星', '女', '1990-4-23', '1388888888', 9);

#3. 列的顺序是否可以调换
INSERT INTO beauty(NAME, sex, id, phone)
VALUES('蒋欣', '女', 110, 16);

#4. 列数和值的个数必须一致
INSERT INTO beauty(NAME, sex, id, phone, boyfriend_id)
VALUES('关晓彤', '女', 120, 17);

#5. 可以省略列名, 默认所有列, 而且列的顺序和表中的顺序一致
INSERT INTO beauty
VALUES (18, '张飞', '男', NULL, '119', NULL, NULL);

#方式二:

/*
语法:
INSERT INTO 表名
SET 列名=值, 列名=值, ...
*/

INSERT INTO beauty
SET id = 19, NAME = '刘涛', phone = '999';

#两种方式大pk

/*
1. 方式一支持插入多行, 但是方式二不支持
INSERT INTO 
	beauty(id, NAME, sex, borndate, phone, boyfriend_id)
VALUES 
	(14, '金星', '女', '1990-4-23', '1388888888', 9),
    (15, '金星', '女', '1990-4-23', '1388888888', 9),
    (16, '金星', '女', '1990-4-23', '1388888888', 9);
    
2. 方式一支持子查询, 方式二不支持
INSERT INTO beauty (id, NAME, phone)
SELECT 26, '宋茜', '1188892312';

INSERT INTO beauty (id, NAME, phone)
SELECT id, boyname, phone
FROM boys
WHERE id < 3;
*/

#二、修改语句

/*

1. 修改单表中的记录[*]

语法:
UPDATE 表
SET 列1=新值, 列2=新值, ...
WHERE 筛选条件;

2. 修改多表的记录[补充]

语法: 

sql92语法:
UPDATE 表1 别名, 表2 别名
SET 列=值, ...
WHERE 连接条件
AND 筛选条件;

sql99语法:
UPDATE 表1 别名
INNTER|LEFT|RIGHT JOIN 表2 别名
ON 连接条件
SET 列=值;

*/

#1. 修改单表的记录

#案例1: 修改beauty表中姓唐的女神的电话为138999999
UPDATE beauty
SET phone = '138999999'
WHERE NAME LIKE '唐%';

#案例2: 修改boys中的2号男神为张飞, 魅力值10
UPDATE boys
SET boyname = '张飞', usercp = 10
WHERE id = 2;

#2. 修改多表的记录

#案例1: 修改张无忌的女朋友的手机号为114
UPDATE boys AS b
INNER JOIN beauty AS b
ON bo.id = b.boyfriend_id
SET b.phone = '114'
WHERE bo.boyName = '张无忌';

#案例2: 修改没有男朋友的女神的男朋友编号都为2
UPDATE boys AS bo
RIGHT JOIN beauty AS b
ON bo.id = b.boyfriend_id
SET b.boyfriend_id = 2
WHERE bo.id IS NULL;

#三、删除语句

/*
方式一: delete

语法:

1. 单表的删除[*]
delete from 表名 where 筛选条件

2. 多表的删除[补充]

方式二: truncate
语法: truncate table 表名;
*/

#方式一: delete

#1. 单表的删除

#案例1: 删除手机号以9结尾的女生信息
DELETE FROM beauty
WHERE phone LIKE '%9';