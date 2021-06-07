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

#三、创建存储过程或函数实现传入两个女生生日, 返回大小
CREATE PROCEDURE test_pro3(IN birth1 DATETIME, IN birth2 DATETIME, OUT result INT)
BEGIN
	SELECT DATEDIFF(birth1, birth2) INTO result;
END $

#四、创建存储过程或函数实现传入一个日期, 格式化成xx年xx月xx日并返回
CREATE PROCEDURE test_pro4(IN mydate DATETIME, OUT strDate VARCHAR(50))
BEGIN
	SELECT DATE_FORMAT(mydate, '%y年%m月%d日') INTO strDate;
END $