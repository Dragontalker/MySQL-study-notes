#进阶8: 分页查询
/*
应用场景: 当要显示的数据, 一页显示不全, 需要分页提交sql请求

语法:
	SELECT 查询列表
    FROM 表
	[JOIN type] JOIN 表2
    ON 连接条件
    WHERE ...
    GROUP BY ...
    HAVING ...
    ORDER BY ...
    LIMIT offset, size
		- offset: 要显示条目的起始索引(起始索引从0开始)
        - size: 要显示的条目个数
        
特点:
	(1)limit语句放在查询语句的最后
    (2)公式: 
		- 要显示的页数 page
        - 每页的条目数 size
        
        SELECT 查询列表
        FROM 表
        LIMIT (page - 1)*size, size
*/

#案例1: 查询前五条员工的信息
SELECT *
FROM employees
LIMIT 0, 5;

#从第一条开始也支持直接写size
SELECT *
FROM employees
LIMIT 5;

#案例2: 查询第11条到第25条
SELECT *
FROM employees
LIMIT 10, 15;

#案例3: 有奖金的员工信息, 并且工资较高的前10名显示出来
SELECT *
FROM employees
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC
LIMIT 10;