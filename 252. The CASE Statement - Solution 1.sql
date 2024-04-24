# Similar to the exercises done in the lecture, 
# obtain a result set containing the employee number, first name, and last name of all employees 
# with a number higher than 109990. 
# Create a fourth column in the query, indicating whether this employee is also a manager, 
# according to the data provided in the dept_manager table, or a regular employee:

SELECT 
    t1.emp_no,
    t1.first_name,
    t1.last_name,
    CASE 
    WHEN t2.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employees'
    END AS is_manager_or_employees
FROM
    employees.employees t1
    LEFT JOIN
    employees.dept_manager t2 ON t1.emp_no = t2.emp_no
WHERE
    t1.emp_no > 109990;
    
# Jawapan daripada Solution:

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    CASE
        WHEN dm.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employee'
    END AS is_manager
FROM
    employees e
        LEFT JOIN
    dept_manager dm ON dm.emp_no = e.emp_no
WHERE
    e.emp_no > 109990;