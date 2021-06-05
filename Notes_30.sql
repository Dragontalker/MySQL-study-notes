#标识列

/*
又称为自增长列

含义: 可以不用手动的插入值, 系统提供默认的序列值
*/

#一、创建表时设置标识列
DROP TABLE IF EXISTS tab_identity;
CREATE TABLE tab_identity(
	id INT PRIMARY KEY AUTO_INCREMENT,
    NAME VARCHAR(20)
);

INSERT INTO tab_identity (NAME)
VALUES
	('john'),
    ('tom'),
    ('lily');
    
SELECT * FROM tab_identity;

SHOW VARIABLES LIKE '%auto_increment%';

SET auto_increment = 3;
