#进阶4: 常见函数

/*
功能: 类似于java中的方法, 将一组逻辑语句封装在方法体中, 对外暴露方法名

好处: 
	1. 隐藏了实现细节
    2. 提高代码的重要性
    
调用:
	SELECT 函数名(实参列表) FROM 表;
    
特点:
	1. 叫什么(函数名)
    2. 干什么(函数功能)
    
分组: 
	1. 单行函数, 如 CONCAT(), LENGTH(), IFNULL()
    2. 分组函数, 
		功能: 做统计使用, 又称为统计函数、聚合函数、组函数
*/

#一、 字符函数

#1. length() 获取参数值的字节个数
SELECT LENGTH('张三分hahaha');

SHOW VARIABLES LIKE '%CHAR%';

#2. concat() 拼接字符串
SELECT CONCAT(last_name, '_', first_name) AS full_name
FROM employees;

#3. upper(), lower()
SELECT UPPER('john');
SELECT LOWER('JOHN');

#示例: 将姓大写, 将名小写, 然后拼接
SELECT CONCAT(UPPER(last_name), LOWER(first_name)) AS full_name
FROM employees;

#4. substr(), substring()
#注意: 索引从1开始
#截取指定处后面所有字符
SELECT SUBSTR('李莫愁爱上了陆展元', 7);
#截取从指定索引处指定字符长度的字符
SELECT SUBSTR('李莫愁爱上了陆展元', 1, 3);

#案例: 姓名中首字符大写, 其他字符小写然后用_拼接, 显示出来
SELECT CONCAT(UPPER(SUBSTR(last_name, 1, 1)), '_', LOWER(SUBSTR(last_name, 2))) AS output
FROM employees;

#5. instr: 返回字串第一次出现的索引, 如果找不到返回0

SELECT INSTR('杨不悔爱上了殷六侠', '殷八侠') AS out_put;

#6. trim

SELECT TRIM('   张翠山    ') AS out_put;
SELECT TRIM('aa' from 'aaaaaaaaaaa张aaaa翠aaaa山aaaaaaaaaa') AS out_out;

#7. lpad: 用指定的字符实现左填充指定长度
SELECT LPAD('殷素素', 10, '*') AS out_put;
SELECT LPAD('殷素素', 2, '*') AS out_put;

#8. rpad: 用指定的字符实现右填充指定长度
SELECT RPAD('殷素素', 10, '*') AS out_put;
SELECT RPAD('殷素素', 2, '*') AS out_put;

#9. replace 替换
SELECT REPLACE('张无忌爱上了周芷若', '周芷若', '赵敏') AS out_put;

#二、数学函数

#1. round 四舍五入
SELECT ROUND(1.45);
SELECT ROUND(1.567, 2);