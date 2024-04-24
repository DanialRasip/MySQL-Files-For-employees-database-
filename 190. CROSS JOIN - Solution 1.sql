# Use a CROSS JOIN to return a list with all possible combinations 
# between managers from the dept_manager table and department number 9.

SELECT 
    t1.*, t2.*
FROM
    employees.dept_manager t1
        CROSS JOIN
    employees.departments t2
WHERE
    t2.dept_no = 'd009'
ORDER BY t1.emp_no , t2.dept_no;

# Jawapan dari Solution:

SELECT 
    dm.*, d.*
FROM
    employees.departments d
        CROSS JOIN
    employees.dept_manager dm
WHERE
    d.dept_no = 'd009'
ORDER BY d.dept_no;