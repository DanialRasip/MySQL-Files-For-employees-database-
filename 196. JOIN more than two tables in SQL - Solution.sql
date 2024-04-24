# Select all managers’ first and last name, hire date, job title, start date, and department name:

SELECT 
    t1.first_name,
    t1.last_name,
    t1.hire_date,
    t3.title,
    t2.from_date,
    t2.dept_no,
    t4.dept_name
FROM
    employees.employees t1
        INNER JOIN
    employees.dept_manager t2 ON t1.emp_no = t2.emp_no
        INNER JOIN
    employees.titles t3 ON t2.emp_no = t3.emp_no
        INNER JOIN
    employees.departments t4 ON t2.dept_no = t4.dept_no
WHERE
    t3.title = 'Manager'
ORDER BY t1.emp_no;
