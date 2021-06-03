#1. 查询编号>3的女神的男朋友的信息, 如果有则列出详细, 如果没有, 就用null填充
SELECT b.id, b.name, bo.*
FROM beauty AS b
LEFT OUTER JOIN boyds AS bo
ON b.boyfriend_id = bo.id
WHERE b.id > 3;