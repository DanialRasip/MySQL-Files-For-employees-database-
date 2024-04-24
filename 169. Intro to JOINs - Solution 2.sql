# Create and fill in the ‘dept_manager_dup’ table, using the following code:

DROP TABLE IF EXISTS employees.dept_manager_dup;

CREATE TABLE employees.dept_manager_dup (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    from_date DATE NOT NULL,
    to_date DATE NULL
);

INSERT INTO employees.dept_manager_dup
SELECT * FROM employees.dept_manager;

INSERT INTO employees.dept_manager_dup (emp_no, from_date)
VALUES (999904, '2017-01-01'),
                                (999905, '2017-01-01'),
                               (999906, '2017-01-01'),
                               (999907, '2017-01-01');
 
DELETE FROM employees.dept_manager_dup 
WHERE
    dept_no = 'd001';

SELECT * FROM employees.dept_manager_dup;