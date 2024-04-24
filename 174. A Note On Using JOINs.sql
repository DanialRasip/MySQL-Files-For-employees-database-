# Guna query ni untuk dapatkan values dari field dept_no, emp_no, from_date, to_date & dept_name 
# dalam JOIN table dept_manager_dup & departments_dup:

SELECT 
    t1.dept_no, t1.emp_no, t1.from_date, t1.to_date, t2.dept_name
FROM
    employees.dept_manager_dup t1
        INNER JOIN
    employees.departments_dup t2 ON t1.dept_no = t2.dept_no
ORDER BY t1.dept_no ASC;
