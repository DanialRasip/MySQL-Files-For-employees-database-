# Extract a list containing information about 
# all managers’ employee number, first and last name, department number, and hire date. 

SELECT 
    t1.emp_no,
    t2.first_name,
    t2.last_name,
    t1.dept_no,
    t2.hire_date
FROM
    employees.dept_manager t1
        INNER JOIN
    employees.employees t2 ON t1.emp_no = t2.emp_no;
    
# Jawapan dari solution:

SELECT 
    e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
FROM
    employees.employees e
        JOIN
    employees.dept_manager dm ON e.emp_no = dm.emp_no;
