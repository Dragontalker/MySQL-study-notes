#1. 向表emp2的id列中添加PRIMARY KEY约束(my_emp_id_pk)
ALTER TABLE emp2
ADD CONSTRAINT my_emp_id_ok PRIMARY KEY(id);

#2. 向表emp2中添加列dept_id, 并在其中定义FOREIGN KEY约束, 与之相关联的列是dept2表中的id列
ALTER TABLE emp2
ADD COLUMN dept_id INT;

ALTER TABLE emp2
ADD CONSTRAINT fk_emp2_dept2 FOREIGN KEY(dept_id) REFERENCES dept2(id);

