# Starting your code with “DROP TABLE”, 
# Create a table called “emp_manager” 
# (emp_no – integer of 11, not null; dept_no – CHAR of 4, null; manager_no – integer of 11, not null):

DROP TABLE IF EXISTS employees.emp_manager;
CREATE TABLE employees.emp_manager (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    manager_no INT(11) NOT NULL
);

SELECT 
    *
FROM
    employees.emp_manager;
