# Guna query ni untuk dapat semua field dari table dept_emp:

SELECT 
    *
FROM
    employees.dept_emp;
    
# Guna query ni untuk dapat field emp_no, from_date, to_date & COUNT(emp_no) daripada table dept_emp:

SELECT 
    emp_no, from_date, to_date, COUNT(emp_no) AS Numbers
FROM
    employees.dept_emp
GROUP BY emp_no
HAVING Numbers > 1
ORDER BY emp_no;

# Guna query ni untuk dapatkan field emp_no, MAX(from_date), MAX(to_date), COUNT(emp_no)
# Daripada table dept_emp:

SELECT 
    emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date, COUNT(emp_no) AS Numbers
FROM
    employees.dept_emp
GROUP BY emp_no
ORDER BY emp_no;

# Guna query ni supaya kita dapat View
# Untuk dapatkan field emp_no, MAX(from_date), MAX(to_date), COUNT(emp_no)
# Daripada table dept_emp:

CREATE OR REPLACE VIEW v_dept_emp_latest_date AS
SELECT 
    emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date, COUNT(emp_no) AS Numbers
FROM
    employees.dept_emp
GROUP BY emp_no
ORDER BY emp_no;

# Query ni adalah untuk View dept_emp_latest_date tapi dari bahagian Views punya:

SELECT * FROM employees.dept_emp_latest_date;