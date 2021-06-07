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