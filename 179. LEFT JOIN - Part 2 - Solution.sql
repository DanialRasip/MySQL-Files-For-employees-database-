# Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose 
# last name is Markovitch. See if the output contains a manager with that name.  
# Hint: Create an output containing information corresponding to the following fields: 
# ‘emp_no’, ‘first_name’, ‘last_name’, ‘dept_no’, ‘from_date’. Order by 'dept_no' descending, and then by 'emp_no'.

SELECT 
    t1.emp_no, t1.first_name, t1.last_name, t2.dept_no, t2.from_date
FROM
    employees.employees t1
        LEFT JOIN
    employees.dept_manager t2 ON t1.emp_no = t2.emp_no
WHERE last_name = 'Markovitch'
GROUP BY t1.emp_no, t1.first_name, t1.last_name, t2.dept_no, t2.from_date
ORDER BY t2.emp_no, t1.emp_no DESC;

# Jawapan dari Solution:

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    dm.dept_no,
    dm.from_date
FROM
    employees.employees e
        LEFT JOIN
    employees.dept_manager dm ON e.emp_no = dm.emp_no
WHERE
    e.last_name = 'Markovitch'
ORDER BY dm.dept_no DESC , e.emp_no;