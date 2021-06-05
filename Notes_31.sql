#TCL

/*
Transactional Control Lanaguage 事务控制语言

事务:
一个或一组sql语句组成一个执行单元, 这个执行单元要么全部执行, 要么全部不执行

案例:
张三丰 1000
郭襄   1000

update 表 set 张三丰的余额=500 where name='张三丰';
update 表 set 郭襄的余额=1500 where name='郭襄';

事务的特性:
ACID
	1. 原子性: 一个事务不可再分割, 要么都执行要么都不执行
    2. 一致性: 一个事务执行会是数据从一个一致状态切换到另一个一致状态
    3. 隔离性: 一个事务的执行不受其他事务的干扰
    4. 持久性: 一个事务一旦提交, 则会永久的改变数据库的数据
    
事务的创建：
	1. 隐式事务: 事务没有明显的开启和技术的标记
		- 比如insert, update, delete语句
        
	2. 显式事务: 事务具有明显的开启和结束的标记
		- 前提: 必须先设置自动提交功能为禁用
			set autocommit=0;
        
        开启事务的语句;
        update 表 set 张三丰的余额=500 where name='张三丰';
		update 表 set 郭襄的余额=1500 where name='郭襄';
        结束事务的语句;
        
步骤1: 开启事务
set autocommit = 0;
start tranction; 可选的


*/

SHOW ENGINES;

