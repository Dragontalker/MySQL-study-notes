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