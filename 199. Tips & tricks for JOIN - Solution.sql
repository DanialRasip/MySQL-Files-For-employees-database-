# How many male and how many female managers do we have in the ‘employees’ database?:

SELECT 
    t1.gender, COUNT(t2.emp_no)
FROM
    employees.employees t1
        INNER JOIN
    employees.dept_manager t2 ON t1.emp_no = t2.emp_no
GROUP BY t1.gender
ORDER BY t1.gender;

# Jawapan daripada Solution:

SELECT 
    e.gender, COUNT(dm.emp_no)
FROM
    employees.employees e
        JOIN
    employees.dept_manager dm ON e.emp_no = dm.emp_no
GROUP BY gender;
