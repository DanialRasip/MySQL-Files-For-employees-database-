# Guna query ni untuk masukkan record baru yang Duplicate dalam table dept_manager_dup:

INSERT INTO employees.dept_manager_dup
VALUES ('110228', 'd003', '1992-03-21', '9999-01-01');

# Guna query ni untuk masukkan record baru yang Duplicate dalam table departmemts_dup:

INSERT INTO employees.departments_dup
VALUES ('d009', 'Customer Service');

# Guna query ni untuk check semua values (Duplicate + Non-Duplicate) yang ada dalam table dept_manager_dup:

SELECT 
    *
FROM
    employees.dept_manager_dup
ORDER BY emp_no;

# Guna query ni untuk check semua values (Duplicate + Non-Duplicate) yang ada dalam table departments_dup:

SELECT 
    *
FROM
    employees.departments_dup
ORDER BY dept_no;

# Guna query ni untuk check semua values Non-Duplicate) yang ada dalam table dept_manager_dup:

SELECT DISTINCT
    *
FROM
    employees.dept_manager_dup
ORDER BY emp_no;

# Guna query ni untuk check semua values Non-Duplicate) yang ada dalam table departments_dup:

SELECT DISTINCT
    *
FROM
    employees.departments_dup
ORDER BY dept_no;

# Guna query ni untuk dapatkan values dari field dept_no, emp_no & dept_name 
# dalam JOIN table dept_manager_dup & departments_dup & value dari t1 & t2 dah ada DR:

SELECT 
    t1.dept_no, t1.emp_no, t2.dept_name
FROM
    employees.dept_manager_dup t1
        INNER JOIN
    employees.departments_dup t2 ON t1.dept_no = t2.dept_no
ORDER BY t1.dept_no ASC;

# Guna query ni untuk dapatkan values dari field dept_no, emp_no & dept_name 
# dalam JOIN table dept_manager_dup & departments_dup & value dari t1 & t2 dah ada DR:

SELECT 
    t1.dept_no, t1.emp_no, t2.dept_name
FROM
    employees.dept_manager_dup t1
        INNER JOIN
    employees.departments_dup t2 ON t1.dept_no = t2.dept_no
GROUP BY t1.dept_no, t1.emp_no, t2.dept_name
ORDER BY t1.dept_no ASC;