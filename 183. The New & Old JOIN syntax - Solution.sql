# Extract a list containing information about 
# all managers’ employee number, first and last name, department number, and hire date. 
# Use the old type of join syntax to obtain the result.

SELECT 
    t1.emp_no, t1.first_name, t1.last_name, t2.dept_no, t1.hire_date
FROM
    employees.employees t1,
    employees.dept_manager t2
WHERE
    t1.emp_no = t2.emp_no;

# Jawapan dari Solution:

SELECT 
    e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
FROM
    employees.employees e,
    employees.dept_manager dm
WHERE
    e.emp_no = dm.emp_no;