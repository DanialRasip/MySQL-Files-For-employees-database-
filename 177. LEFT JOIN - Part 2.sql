# Guna query ni untuk dapatkan values dari field dept_no, emp_no & dept_name 
# dalam LEFT JOIN table dept_manager_dup & departments_dup
# tapi tukar kedudukan t1 & t2 dalam bahagian FROM & LEFT JOIN:

SELECT 
    t2.dept_no, t2.emp_no, t1.dept_name
FROM
    employees.departments_dup t1
        LEFT JOIN
    employees.dept_manager_dup t2 ON t2.dept_no = t1.dept_no
ORDER BY t2.dept_no ASC;

# Guna query ni untuk dapatkan values dari field dept_no, emp_no & dept_name 
# dalam LEFT JOIN table dept_manager_dup & departments_dup
# tapi tukar kedudukan t1 & t2 dalam bahagian FROM & LEFT JOIN:

SELECT 
    t1.dept_no, t2.emp_no, t1.dept_name
FROM
    employees.departments_dup t1
        LEFT JOIN
    employees.dept_manager_dup t2 ON t2.dept_no = t1.dept_no
GROUP BY t1.dept_no, t2.emp_no, t1.dept_name
ORDER BY t1.dept_no ASC;

# Guna query ni untuk dapatkan values dari field dept_no, emp_no & dept_name 
# dalam LEFT JOIN table dept_manager_dup & departments_dup:

SELECT 
    t1.dept_no, t1.emp_no, t2.dept_name
FROM
    employees.dept_manager_dup t1
        LEFT JOIN
    employees.departments_dup t2 ON t1.dept_no = t2.dept_no
GROUP BY t1.dept_no, t1.emp_no, t2.dept_name
ORDER BY t1.dept_no ASC;

# Guna query ni untuk dapatkan values dari field dept_no, emp_no & dept_name 
# dalam LEFT JOIN table dept_manager_dup & departments_dup
# tapi nak yang Non-Matching Values (NMV) sahaja:

SELECT 
    t1.dept_no, t1.emp_no, t2.dept_name
FROM
    employees.dept_manager_dup t1
        LEFT JOIN
    employees.departments_dup t2 ON t1.dept_no = t2.dept_no
WHERE dept_name IS NULL
GROUP BY t1.dept_no, t1.emp_no, t2.dept_name
ORDER BY t1.dept_no ASC;

# Ni kedudukan yang asal:

employees.dept_manager_dup t1
employees.departments_dup t2