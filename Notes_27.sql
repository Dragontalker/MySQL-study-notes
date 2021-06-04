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
	-长度代表了显示的最大宽度, 如果不够会用0在左边填充, 但是必须搭配zerofill
*/

#1. 如何设置无符号和有符号
DROP TABLE IF EXISTS tab_int;
CREATE TABLE tab_int(
	t1 INT(7) ZEROFILL,
    t2 INT(7) UNSIGNED
);

DESC tab_int;

INSERT INTO tab_int
VALUES (23, 23);

SELECT * FROM tab_int;

#二、小数

/*
1. 浮点型
float(M, D)
double(M, D)

2. 定点型
dec(M, D)
decimal(M, D)

特点:
(1)M和D
	- M: 整数部位 + 小数部位
    - D: 小数部位
    - M和D都可以省略

(2)M和D都可以省略
	- 如果是decimal, 则M默认为10, D默认为0
    - 如果是float和double, 则会根据插入的数值的精度来决定精度
    
(3)定点型的精确度较高, 如果要求插入的数值的精度较高如货币运算等则考虑使用
*/

#测试M和D
DROP TABLE IF EXISTS tab_float;
CREATE TABLE tab_float(
	f1 FLOAT,
    f2 DOUBLE,
    f3 DECIMAL
);

SELECT * FROM tab_float;
DESC tab_float;

INSERT INTO tab_float VALUES(123.45, 123.45, 123.45);
INSERT INTO tab_float VALUES(1523.45, 1523.45, 1523.45);

#原则

/*
所选择的类型越简单越好, 而且能保存数值的类型越小越好
*/

#三、字符型

/*
较短的文本:
char
varchar

其他:
Enum
Set

较长的文本:
text
blob(较大的二进制)

特点:
			写法			M的意思			空间的耗费 	效率
char		char(M)		固定长度的字符		比较耗费		高
						(可以省略, 默认为1)
varchar		varchar(M)	可变长度的字符		比较节省		低
						(不可以省略)
*/

CREATE TABLE tab_char(
	c1 ENUM('a', 'b', 'c')
);

SELECT * FROM tab_char;

INSERT INTO tab_char VALUE ('a');
INSERT INTO tab_char VALUE ('b');
INSERT INTO tab_char VALUE ('c');
INSERT INTO tab_char VALUE ('A');
INSERT INTO tab_char VALUE ('m');

CREATE TABLE tab_set(
	s1 SET('a', 'b', 'c', 'd')
);

SELECT * FROM tab_set;

INSERT INTO tab_set VALUES ('a');
INSERT INTO tab_set VALUES ('a,b,c');