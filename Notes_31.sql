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
*/

SHOW ENGINES;