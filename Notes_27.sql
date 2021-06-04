#常见的数据类型

/*
数值型:
	- 整型
    - 小数: 定点数, 浮点数
    
字符型:
	- 较短的文本: char, varchar
    - 较长的文本: textm, blob(较长的二进制数据)

日期型:
*/

#一、整型
/*
分类:
tinyint (1 byte), 
smallint (2 bytes), 
mediumint (3 bytes), 
int/integer (4 bytes), 
bigint (5 bytes)

特点:
(1)如果不设置无符号还是有符号, 默认是有符号, 如果想设置无符号, 需要添加unsigned
(2)如果插入的数值超出了整型的范围, 会报异常Out of Range, 并设置临界值
(3)如果不设置长度, 会有默认的长度
*/

#1. 如何设置无符号和有符号
DROP TABLE IF EXISTS tab_int;
CREATE TABLE tab_int(
	t1 INT(7),
    t2 INT(7) UNSIGNED
);

DESC tab_int;

INSERT INTO tab_int
VALUES (-123456, -123456);

SELECT * FROM tab_int;