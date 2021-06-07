#函数
/*
和存储过程的区别:
存储过程: 适合做批量插入, 批量更新
函数: 只能有一个返回, 适合做处理数据后返回一个结果
*/

#一、创建语法
/*
CREATE FUNCTION 函数名(参数列表 RETURNS 返回类型)
BEGIN
	函数体
END

注意:
1. 参数列表: 包含两部分:
	1. 参数名
    2. 参数类型
    
2. 如果return语句没有放在函数体的最后也不会报错, 但不建议

return 值;
3. 函数体中仅有一句话, 则可以忽略begin end
4. 使用DELIMITER语句设置结束标记
*/

#二、调用语法
#SELECT 函数名(参数列表)

#案例演示
#1. 无参有返回
#案例: 返回工资的员工个数
DELIMITER $
CREATE FUNCTION myf1() RETURNS INT
BEGIN
	DECLARE result INT DEFAULT 0;
	SELECT COUNT(*) INTO result
    FROM employees;
    RETURN result;
END $

SELECT myf1()$

#2. 有参有返回
#案例1: 根据员工名返回它的工资
CREATE FUNCTION myf1(empName VARCHAR(20)) RETURNS DOUBLE
BEGIN
	DECLARE result DOUBLE DEFAULT 0;
    SELECT salary INTO result
    FROM employees
    WHERE last_name = empName
    LIMIT 1;
    RETURN result;
END $

#案例2: 根据部门名, 返回该部门的平均工资
CREATE FUNCTION myf3(deptName VARCHAR(20)) RETURNS DOUBLE
BEGIN
	DECLARE result DOUBLE DEFAULT 0;
    SELECT AVG(salary) INTO result
    FROM employees AS e
    INNER JOIN departments AS d
    ON e.department_id = d.department_id
    WHERE d.department_name = deptName;
END $

#三、查看函数
DELIMITER ;
SHOW CREATE FUNCTION myf1;