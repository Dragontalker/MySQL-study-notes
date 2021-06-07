#视图

/*
含义: 虚拟表, 和普通表一样使用
mysql5.1版本出现的新特性, 是通过表动态生成的数据

比如: 舞蹈班和普通班的对比
*/

#案例: 查询姓张的学生名和专业名
SELECT stuname, major_name
FROM stuinfo AS s
INNER JOIN major AS m 
ON s.major_id = m.id
WHERE s.stuname LIKE '%张';