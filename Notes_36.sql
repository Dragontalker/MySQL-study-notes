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

#二、调用语法