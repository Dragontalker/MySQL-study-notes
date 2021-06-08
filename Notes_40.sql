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
	DECLARE i INT DEFAULT 1; #定义一个循环变量i, 表示插入次数
    DECLARE str VARCHAR(26) DEFAULT 'abcdefghijklmnopqrtsuvwxyz';
    DECLARE startIndex INT DEFAULT 1; #代表起始索引
    DECLARE len INT DEFAULT 1; #代表截取的字符的长度
    WHILE i <= insertCount DO
        SET startIndex = FLOOR(RAND()*26 + 1);
        SET len = FLOOR(RAND()*(20 - startIndex + 1));
        INSERT INTO stringcontent
        VALUES (SUBSTR(str, startIndex, len));
		SET i = i + 1;
	END WHILE;
END $