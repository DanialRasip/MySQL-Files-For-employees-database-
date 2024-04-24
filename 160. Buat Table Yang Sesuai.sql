# Guna query ni untuk dapatkan semua values dari semua field dalam table departments_dup:

SELECT 
    *
FROM
    employees.departments_dup2
ORDER BY dept_no;

CREATE TABLE IF NOT EXISTS employees.departments_dup2 (
    `dept_no` CHAR(4) NOT NULL,
    `dept_name` VARCHAR(40) NULL
);

INSERT INTO employees.departments_dup2
SELECT * FROM employees.departments_dup;

INSERT INTO employees.departments_dup2 (dept_no)
VALUES ('d010');

INSERT INTO employees.departments_dup2 (dept_no)
VALUES ('d011');

ALTER TABLE employees.departments_dup2
ADD COLUMN dept_manager VARCHAR(40) NULL;

