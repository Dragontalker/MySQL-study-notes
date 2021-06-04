#DML语言

/*
数据操作语言:
插入: insert
修改: update
删除: delete
*/

#一、插入语句

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