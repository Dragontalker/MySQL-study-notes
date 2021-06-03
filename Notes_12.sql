#进阶6： 连接查询
/*
含义： 又称多表查询, 当查询

笛卡尔乘积现象: 表1： 有m行, 表2: 有n行, 结果=m*n行

发生原因: 没有有效的连接条件
如何避免: 添加有效的连接条件

分类:
	按年代分类：
    sql92标准:
    sql99标准: 推荐使用
    
    按功能分类:
		内连接:
			等值连接
            非等值连接
            自连接
        外连接
        交叉连接
*/

SELECT NAME, boyName FROM boys, beauty
WHERE beauty.boyfriend_id = boys.id;
