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

#2. ceil 向上取整 返回>=该参数的最小整数
SELECT CEIL(1.52);

#3. floor 向下取整 返回<=该参数的最大整数
SELECT FLOOR(-9.99);

#4. truncate 截断
SELECT TRUNCATE(1.65, 1);

#5. mod 取余
/*
MOD(a, b): a-a/b*b

MOD(-10, 3) = -10 - (-10)/(-3) * (-3) = -1
*/
SELECT MOD(10, 3);
SELECT 10%3;

#三、日期函数

#1. now 返回当前系统日期+时间
SELECT NOW();

#2. curdate 返回当前系统日期, 不包含时间
SELECT CURDATE();

#3. curtime 返回当前时间, 不包含日期
SELECT CURTIME();

#4. year 可以获取指定的部分, 年、月、日、小时、分钟、秒
SELECT YEAR(NOW());
SELECT YEAR('1998-1-1');

SELECT YEAR(hiredate) AS hire_year
FROM employees;

#5. month, monthname
select month(now());
select monthname(now());

#6. str_to_date 将字符通过指定的格式转换成日期
select str_to_date('1998-3-2', '%Y-%c-%d') as out_put;

#查询入职日期为1992-04-03的员工信息
select *
from employees
where hiredate = str_to_date('4-3 1992', '%c-%d %Y');

#7. date_format 将日期转换成字符
select date_format(now(), '%Y年%m月%d日') as out_put;

#查询有奖金的员工名和入职日期(xx月/xx日 xx年)
select last_name, date_format(hiredate, '%m月/%d日 %y年') as format_date
from employees
where commission_pct is not null;

#四、其他函数
select version();
select datebase();
select user();

#五、流程控制函数

#1. if函数: if else的效果
select if(10>5, 'big', 'small') as out_put;

select last_name, commission_pct, if(commission_pct is null, '没奖金, 呵呵', '有奖金, 嘻嘻') as out_put
from employees;

#2. case函数的使用一: switch case的效果

/*
Java中：
	switch(变量或表达式) {
		case 常量1： 
			语句1： 
			break;
		...
		default:
			语句n:
			break;
	}
    
MySQL中:
	case 要判断的字段或表达式
    when 常量1 then 要显示的值1或语句1;
    when 常量2 then 要显示的值2或语句2;
    ...
    else 要显示的值n或语句n;
    end
*/

/*
案例： 查询员工的工资, 要求

部门号=30, 显示的工资为1.1倍
部门号=40, 显示的工资为1.2倍
部门号=50, 显示的工资为1.3倍
*/

select salary as original_salary, department_id,

case department_id
when 30 then salary*1.1
when 40 then salary*1.2
when 50 then salary*1.3
else salary
end as new_salary

from employees;