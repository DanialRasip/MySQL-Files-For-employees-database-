# "Extract a dataset containing the following information about the managers: 
# employee number, first name, and last name. 
# Add two columns at the end – one showing the difference between the maximum and minimum salary of that employee, 
# and another one saying whether this salary raise was higher than $30,000 or NOT.
# If possible, provide more than one solution."

SELECT 
    t2.emp_no,
    t1.first_name,
    t1.last_name,
    MAX(t3.salary) - MIN(t3.salary) AS salary_differences,
    CASE 
    WHEN MAX(t3.salary) - MIN(t3.salary) > 30000 THEN 'Salary was raised by more than $30000'
        ELSE 'NOT'
    END AS salary_increase
FROM
    employees.employees t1
    INNER JOIN
    employees.dept_manager t2 ON t1.emp_no = t2.emp_no
    INNER JOIN
    employees.salaries t3 ON t3.emp_no = t2.emp_no
GROUP BY t2.emp_no;

SELECT 
    t2.emp_no,
    t1.first_name,
    t1.last_name,
    MAX(t3.salary) - MIN(t3.salary) AS salary_differences,
    IF (MAX(t3.salary) - MIN(t3.salary) > 30000,'Salary was raised by more than $30000', 'NOT') AS extra_notes
FROM
    employees.employees t1
    INNER JOIN
    employees.dept_manager t2 ON t1.emp_no = t2.emp_no
    INNER JOIN
    employees.salaries t3 ON t3.emp_no = t2.emp_no
GROUP BY t2.emp_no;
    
# Jawapan daripada Solution:

SELECT 
    dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
    CASE
        WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN 'Salary was raised by more then $30,000'
        ELSE 'Salary was NOT raised by more then $30,000'
    END AS salary_raise
FROM
    dept_manager dm
        JOIN
    employees e ON e.emp_no = dm.emp_no
        JOIN
    salaries s ON s.emp_no = dm.emp_no
GROUP BY s.emp_no;  

SELECT  
    dm.emp_no,  
    e.first_name,  
    e.last_name,  
    MAX(s.salary) - MIN(s.salary) AS salary_difference,  
    IF(MAX(s.salary) - MIN(s.salary) > 30000, 'Salary was raised by more then $30,000', 'Salary was NOT raised by more then $30,000') AS salary_increase  
FROM  
    dept_manager dm  
        JOIN  
    employees e ON e.emp_no = dm.emp_no  
        JOIN  
    salaries s ON s.emp_no = dm.emp_no  
GROUP BY s.emp_no;