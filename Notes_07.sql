#1. 显示系统时间(注: 日期+时间)
select now();

#2. 查询员工号、姓名、工资, 以及工资提高百分之20%之后的结果(new salary)
select employee_id, last_name, salary, salary*1.2 as 'new salary'
from employees;

#3. 将员工的姓名按首字母排序, 并写出姓名的长度 (length)
select length(last_name) as name_length, substr(last_name, 1, 1) as first_letter, last_name
from employees
order by first_letter;

#4. 做一个查询, 产生下面的结果
#<last_name> earsn <salary> monthly but wants <salary*3>
#Dream salary
#King earns 24000 monthly but wants 72000

#5. 使用case-when, 按照下面的条件:
#	job		grade
#	AD_PRES	  A
#	ST_MAN	  B
#	IT_PROG	  C