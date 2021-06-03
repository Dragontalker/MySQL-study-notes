#1. 查询编号>3的女神的男朋友的信息, 如果有则列出详细, 如果没有, 就用null填充
SELECT b.id, b.name, bo.*
FROM beauty AS b
LEFT OUTER JOIN boyds AS bo
ON b.boyfriend_id = bo.id
WHERE b.id > 3;

#2. 查询哪个城市没有部门
SELECT city, d.*
FROM locations AS l
LEFT OUTER JOIN departments AS d
ON l.location_id = d.department_id
WHERE department_id IS NULL;