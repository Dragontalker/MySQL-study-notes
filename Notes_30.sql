#标识列

/*
又称为自增长列

含义: 可以不用手动的插入值, 系统提供默认的序列值
*/

#一、创建表时设置标识列
CREATE TABLE tab_identity(
	id INT PRIMARY KEY,
    NAME VARCHAR(20)
);

INSERT INTO tab_identity
VALUES(1, 'john');
