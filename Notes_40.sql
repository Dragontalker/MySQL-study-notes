#经典案例

/*
已知表stringcontent
其中字段:
id 自增长
content VARCHAR(20)

向该表插入指定个数的, 随机的字符串
*/

DROP TABLE IF EXISTS stringcontent;
CREATE TABLE stringcontent(
	id INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(20)
);

DELIMITER $
CREATE PROCEDURE test_ranstr_insert(IN insertCount INT)
BEGIN

END $