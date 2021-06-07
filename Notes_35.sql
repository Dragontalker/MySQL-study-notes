#变量
/*
系统变量：
	- 全局变量(针对服务器)
    - 会话变量(针对某一次连接)

自定义变量：
	- 用户变量
    - 局部变量
*/

#一、系统变量
#说明: 变量由系统提供, 不是用户定义, 属于服务器层面

#使用的语法
#1. 查看所有的系统变量
SHOW GLOBAL VARIABLES;
SHOW SESSION VARIABLES; #SHOW VARIABLES;

#2. 查看满足条件的部分系统变量
SHOW GLOBAL VARIABLES LIKE '%admin%';

#3. 查看指定的某个系统变量的值
SELECT @@admin_port;
SELECT @@global.admin_port;

#4. 为某个系统变量赋值
#方式一:
#SET [global. | session.]系统变量名 = 值;