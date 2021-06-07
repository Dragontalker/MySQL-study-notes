#存储过程和函数

/*
存储过程和函数: 类似于Java中的方法

好处: 
1. 提高代码的重用性
2. 简化操作
3. 减少了编译次数并且减少了和数据库服务器的连接次数, 提高了效率
*/

#存储过程

/*
含义: 一组预先编译好的SQL语句的集合, 理解成批处理语句

*/

#一、创建语法
/*
CREATE PROCEDURE 存储过程名(参数列表)
BEGIN
	存储过程体(一组合法的SQL语句)
END
*/

/*
注意:
1. 参数列表包含三部分
	- 参数模式
    - 参数名
    - 参数类型
    - 举例: IN stuname VARCHAR(20)
    
参数模式:
IN: 该参数可以作为输入, 也就是该参数需要调用方法传入值
OUT: 该参数可以作为输出, 也就是该参数可以作为返回值
INOUT: 该参数既可以作为输入又可以作为输出, 也就是该参数即需要传入值, 又可以返回值  

2. 如果存储过程体仅仅只有一句话, begin end可以省略
	- 存储过程体中的每条SQL语句的结尾要求必须加分号
    - 存储过程的结果可以使用DELIMITER 重新设置
    - 语法:
		DELIMITER 结束标记
        
        DELIMITER $
*/

#二、调用语法
/*
CALL 存储过程名(实参列表);
*/

#1. 空参列表
#案例: 插入到admin表中五条记录
/*
DELIMITER $
CREATE PRECEDURE myp1()
BEGIN
	INSERT INTO admin(username, password)
    VALUES('jack', '0000');
END $
*/

#调用
#CALL myp1()$

#2. 创建带in模式参数的存储过程

#案例1: 创建存储过程实现, 根据女神名, 查询对应的男神信息
DELIMITER $
CREATE PROCEDURE myp2(IN beautyName VARCHAR(20))
BEGIN
	SELECT bo.*
    FROM boys AS bo
    RIGHT JOIN beaty AS b
    ON bo.id = b.boyfriend_id
    WHERE b.name = beautyName;
END $

#调用
CALL myp2('柳岩')$

#案例2: 创建存储过程实现, 用户是否登录成功
CREATE PROCEDURE myp3(IN username VARCHAR(20), IN PASSWORD VARCHAR(20))
BEGIN
	#声明并初始化
	DECLARE result INT DEFAULT '';
    #赋值
	SELECT COUNT(*) INTO result
    FROM admin
    WHERE admin.username = username
    AND admin.PASSWORD = PASSWORD;
    #使用
    SELECT IF(result > 0, '成功', '失败');
END $

#调用
CALL myp3('张飞', '8888')

#3. 创建带out模式的存储过程

#案例1: 根据女神名, 返回对应的男神名
CREATE PROCEDURE myp5(IN beautyName VARCHAR(20) OUT boyName VARCHAR(20))
BEGIN
	SELECT bo.boyName INTO boyName
    FROM boys AS bo
    INNER JOIN beauty AS b
    ON bo.id = b.boyfriend_id
    WHERE b.name = beautyName;
END $

#调用
CALL myp5('小昭', @bName);
SELECT @bName;

#案例2: 根据女神名, 返回对应的男神名和男神魅力值
CREATE PROCEDURE myp7(IN beautyName VARCHAR(20), OUT boyName VARCHAR(20), OUT userCP INT)
BEGIN
	SELECT bo.boyName, bo.userCP INTO boyName, userCP
    FROM boys AS bo
    INNER JOIN beauty AS b
    ON bo.id = b.boyfriend_id
    WHERE b.name = beautyName;
END $

#调用
CALL myp7('小昭', @bName, @usercp);
SELECT @bName;
SELECT @usercp;

#4. 创建带inout模式参数的存储过程
#案例1: 传入a和b两个值, 最终a和b都翻倍并返回
CREATE PROCEDURE myp8(INOUT a INT, INOUT b INT)
BEGIN
	SET a = a * 2;
    SET b = b * 2;
END $

#调用
SET @m = 10$
SET @n = 20$
CALL myp8(@m, @n)$
SELECT @m, @n;