# Guna query ni untuk dapatkan values dari field dept_no, emp_no & dept_name 
# dalam RIGHT JOIN table dept_manager_dup & departments_dup:

SELECT 
    t1.dept_no, t1.emp_no, t2.dept_name
FROM
    employees.dept_manager_dup t1
        RIGHT JOIN
    employees.departments_dup t2 ON t1.dept_no = t2.dept_no
GROUP BY t1.dept_no, t1.emp_no, t2.dept_name
ORDER BY t1.dept_no ASC;

# Guna query ni untuk dapatkan values dari field dept_no, emp_no & dept_name 
# dalam RIGHT JOIN table dept_manager_dup & departments_dup & tanpa guna GROUP BY:

SELECT 
    t1.dept_no, t1.emp_no, t2.dept_name
FROM
    employees.dept_manager_dup t1
        RIGHT JOIN
    employees.departments_dup t2 ON t1.dept_no = t2.dept_no
ORDER BY t1.dept_no ASC;

# Guna query ni untuk dapatkan values dari field dept_no, emp_no & dept_name 
# dalam RIGHT JOIN table dept_manager_dup & departments_dup
# tapi nak yang Non-Matching Values (NMV) sahaja:

SELECT 
    t1.dept_no, t1.emp_no, t2.dept_name
FROM
    employees.dept_manager_dup t1
        RIGHT JOIN
    employees.departments_dup t2 ON t1.dept_no = t2.dept_no
WHERE dept_name IS NULL
GROUP BY t1.dept_no, t1.emp_no, t2.dept_name
ORDER BY t1.dept_no ASC;