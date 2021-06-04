#已知表 stuinfo
#id, name, email, gradeId, sex, age

#已知表 grade
#id, gradeName

#1. 查询所有学员的邮箱的用户名(注: 邮箱中@前面的字符)
SELECT SUBSTR(email, 1, INSTR(email, '@'-1)) AS user_name
FROM stuinfo;

#2. 查询男生和女生的个数
SELECT COUNT(*), sex
FROM stuinfo
GROUP BY sex;

#3. 查询年龄>18的所有学生的姓名和年级名称
SELECT name, gradeName
FROM stuinfo AS s
INNER JOIN grade AS g
On s.gradeId = g.id
WHERE age > 18;

#4. 查询哪个年级的最小年龄>20岁

#(1)查询每个年级的最小年龄
SELECT MIN(age), gradeId
FROM stuinfo
GROUP BY gradeId;

#(2)在(1)的结果上进行筛选
SELECT MIN(age), gradeId
FROM stuinfo
GROUP BY gradeId
HAVING MIN(age) > 20;

#5. 尝试说出查询语句中涉及到的所有的关键字, 以及执行先后顺序
SELECT 查询列表
FROM 表1
[JOIN type] JOIN 表2
ON 连接条件
WHERE 筛选条件
GROUP BY 分组条件
HAVING 分组后的筛选
ORDER BY 排序列表
LIMIT 偏移, 条目数;