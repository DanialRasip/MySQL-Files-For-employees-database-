# Guna query ni untuk CROSS JOIN tables dept_manager & departments:

SELECT 
    t1.*, t2.*
FROM
    employees.dept_manager t1
        CROSS JOIN
    employees.departments t2
ORDER BY t1.emp_no , t2.dept_no;

# Guna query ni untuk CROSS JOIN tables dept_manager & departments
# & ada condition(s) sekali iaitu t1.dept_no IS NOT EQUAL to t2.dept_no:

SELECT 
    t1.*, t2.*
FROM
    employees.dept_manager t1
        CROSS JOIN
    employees.departments t2
WHERE
t1.dept_no <> t2.dept_no
ORDER BY t1.emp_no , t2.dept_no;

# Guna query ni untuk CROSS JOIN & INNER JOIN tables dept_manager, departments & employees
# & ada condition(s) sekali iaitu t1.dept_no IS NOT EQUAL to t2.dept_no:

SELECT 
    t3.*, t1.*
FROM
    employees.departments t1
        CROSS JOIN
    employees.dept_manager t2
    JOIN
    employees.employees t3 ON t2.emp_no = t3.emp_no
WHERE
t1.dept_no != t2.dept_no
ORDER BY t2.emp_no , t1.dept_no;

SELECT 
    e.*, d.*
FROM
    employees.departments d
        CROSS JOIN
    employees.dept_manager dm
        JOIN
    employees.employees e ON dm.emp_no = e.emp_no
WHERE
    d.dept_no <> dm.dept_no
ORDER BY dm.dept_no , d.dept_no;