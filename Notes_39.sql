#流程控制结构
/*
顺序结构: 程序从上往下依次执行
分支结构: 程序从两条或多条路径中选择一条去执行
循环结构: 程序在满足一定条件的基础上, 重复执行一段代码
*/

#一、分支结构
#1. if函数
/*
功能: 实现仙丹的双分支

语法:
IF(表达式1, 表达式2, 表达式3)

应用: 任何地方
*/

#3. if结构

/*
功能: 实现多重分支

语法: 
if 条件1 then 语句1
elseif 条件2 then 语句2
...
[else 语句n]
end if;

只能应用在begin end中
*/

#案例1: 根据传入的成绩, 来返回等级
DELIMITER $
CREATE FUNCTION test_if(score INT) RETURNS CHAR
BEGIN
	IF score >= 90 AND score <= 100 THEN RETURN 'A';
    ELSEIF score >= 80 THEN RETURN 'B';
    ELSEIF score >= 60 THEN RETURN 'C';
    ELSE RETURN 'D';
    END IF;
END $

#二、循环结构

/*
分类: 
while, loop, repeat

循环控制:
iterate类似于continue, 继续, 结束本次循环, 继续下一次
leave类似于于break, 跳出, 结束当前所在的循环
*/

#1. while
/*
语法:
[标签:] while 循环条件 do
	循环体;
end while [标签];
*/

#2. loop
/*
语法:
[标签:] loop
	循环体;
end loop [标签];

可以用来模拟简单的死循环
*/

#3. repeat
/*
[标签:] repeat
	循环体;
until 结束循环的条件
end reapt [标签];
*/

#没有添加循环控制语句
#案例: 批量插入, 根据次数插入到admin表中多条记录
DROP PROCEDURE pro_while1;
CREATE PROCEDURE pro_while1(IN insertCount INT)
BEGIN
	DECLARE i INT DEFAULT 1;
    WHILE i <= insertCount DO
		INSERT INTO admin(username, PASSWORD)
        VALUES (CONCAT('rose', i),'666');
        SET i = i + 1;
	END WHILE;
END $

CALL pro_while1(100)$

#2. 添加leave语句
#案例: 批量插入, 根据次数插入到admin表中多条记录, 如果次数>20则停止
TRUNCATE TABLE admin$
DROP PROCEDURE test_while1$
CREATE PROCEDURE test_while1(IN insertCount INT)
BEGIN
	DECLARE i INT DEFAULT 1;
    a: WHILE i <= insertCOunt DO
		INSERT INTO admin(username, password)
        VALUES (CONCAT('xiaohua', i), '1000');
        IF i >= 20 THEN LEAVE a;
        END IF;
        SET i = i + 1;
	END WHILE a;
END $

#3. 添加iterate语句
#案例: 批量插入, 根据次数插入到admin表中多条记录, 只插入偶数次
TRUNCATE TABLE admin$
DROP PROCEDURE test_while1$
CREATE PROCEDURE test_while1(IN insertCount INT)
BEGIN
	DECLARE i INT DEFAULT 1;
    a: WHILE i <= insertCOunt DO
		INSERT INTO admin(username, password)
        VALUES (CONCAT('xiaohua', i), '1000');
        IF i >= 20 THEN LEAVE a;
        END IF;
        SET i = i + 1;
	END WHILE a;
END $

/*
java中:
int i = 0;
while(i <= insertCount) {
	i++;
	if (i % 2 == 0)
		continue;
	插入;
};
*/