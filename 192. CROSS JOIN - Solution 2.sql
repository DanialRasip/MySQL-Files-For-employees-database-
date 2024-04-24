# Return a list with the first 10 employees with all the departments they can be assigned to
# Hint: Don’t use LIMIT; use a WHERE clause:

SELECT 
    t1.*, t2.*
FROM
    employees.employees t1
        CROSS JOIN
    employees.departments t2
WHERE
    t1.emp_no < '10011'
ORDER BY t1.emp_no , t2.dept_no;

# Jawapan dari Solution:

SELECT 
    e.*, d.*
FROM
    employees.employees e
        CROSS JOIN
    employees.departments d
WHERE
    e.emp_no < 10011
ORDER BY e.emp_no , d.dept_name;
