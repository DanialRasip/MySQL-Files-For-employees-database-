# Guna query ni untuk CREATE table employees_dup:

DROP TABLE IF EXISTS employees.employees_dup;
CREATE TABLE employees.employees_dup (
    emp_no INT(11),
    birth_date DATE,
    first_name VARCHAR(14),
    last_name VARCHAR(16),
    gender ENUM('M', 'F'),
    hire_date DATE
);

# Guna query ni untuk copy & paste value dari semua field dalam table employees
# Tapi untuk 20 employees yang paling atas:

INSERT INTO employees.employees_dup
SELECT * FROM employees.employees
LIMIT 20;

# Guna query ni untuk INSERT DUPLICATE record no.1 dari table employees ke dalam table employees_dup:

INSERT INTO employees.employees_dup
SELECT * FROM employees.employees
WHERE emp_no = '10001';

SELECT * FROM employees.employees_dup;
SELECT DISTINCT * FROM employees.employees_dup;

# Contoh UNION ALL untukt table employees_dup & dept_manager
# kena tambah All Missing Column:

SELECT
t1.emp_no,
t1.first_name,
t1.last_name,
NULL AS dept_no,
NULL AS from_date
FROM 
employees.employees_dup t1
WHERE
t1.emp_no = '10001'
UNION ALL SELECT
NULL AS emp_no,
NULL AS first_name,
NULL AS last_name,
t2.dept_no,
t2.from_date
FROM 
employees.dept_manager t2;

# Contoh UNION untuk table employees_dup & dept_manager
# kena tambah All Missing Column:

SELECT
t1.emp_no,
t1.first_name,
t1.last_name,
NULL AS dept_no,
NULL AS from_date
FROM 
employees.employees_dup t1
WHERE
t1.emp_no = '10001'
UNION SELECT
NULL AS emp_no,
NULL AS first_name,
NULL AS last_name,
t2.dept_no,
t2.from_date
FROM 
employees.dept_manager t2;