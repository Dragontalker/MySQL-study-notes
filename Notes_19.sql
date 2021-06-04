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
*/

#案例1: 查询前五条员工的信息
SELECT *
FROM employees
LIMIT 0, 5;