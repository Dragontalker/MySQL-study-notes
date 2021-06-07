#一、创建存储过程实现传入用户名和密码, 插入到admin表中
DELIMITER $
CREATE PROCEDURE test_pro1(IN userName VARCHAR(20), IN loginPwd VARCHAR(20))
BEGIN
	INSERT INTO admin(admin.username, PASSWORD)
    VALUES (userName, loginPwd);
END $