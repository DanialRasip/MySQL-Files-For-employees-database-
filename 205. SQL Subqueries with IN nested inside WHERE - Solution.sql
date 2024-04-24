# Extract the information about all department managers 
# who were hired between the 1st of January 1990 and the 1st of January 1995:

SELECT 
    t1.*
FROM
    employees.dept_manager t1
WHERE
    t1.emp_no IN (SELECT 
            t2.emp_no
        FROM
            employees.employees t2
        WHERE
            hire_date >= '1990-01-01'
                AND hire_date <= '1995-01-01');
       
# Jawapan daripada Solution:

SELECT 
    *
FROM
    employees.dept_manager
WHERE
    emp_no IN (SELECT 
            emp_no
        FROM
            employees.employees
        WHERE
            hire_date BETWEEN '1990-01-01' AND '1995-01-01');
     
# Untuk check accuracy output:

SELECT 
    t1.emp_no, t1.first_name, t1.last_name, t1.hire_date
FROM
    employees.employees t1
WHERE
    t1.emp_no IN (SELECT 
            t2.emp_no
        FROM
            employees.dept_manager t2);