#一、创建存储过程实现传入用户名和密码, 插入到admin表中
DELIMITER $
CREATE PROCEDURE test_pro1(IN userName VARCHAR(20), IN loginPwd VARCHAR(20))
BEGIN
	INSERT INTO admin(admin.username, PASSWORD)
    VALUES (userName, loginPwd);
END $

#二、创建存储过程实现传入女生编号, 返回女神名称和女神电话
CREATE PROCEDURE test_pro2(IN id INT, OUT NAME VARCHAR(20), OUT phone VARCHAR(20))
BEGIN
	SELECT b.NAME, b.phone INTO NAME, phone
    FROM beauty AS b
    WHERE b.id = id;
END $