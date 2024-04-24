# Select the first and last name, the hire date, and the job title of all employees whose 
# first name is “Margareta” and have the last name “Markovitch”.

SELECT 
    t1.emp_no, t1.first_name, t1.last_name, t2.title
FROM
    employees.employees t1
        INNER JOIN
    employees.titles t2 ON t1.emp_no = t2.emp_no
WHERE t1.first_name = 'Margareta' AND last_name = 'Markovitch'
GROUP BY t1.emp_no, t1.first_name, t1.last_name, t2.title
ORDER BY t1.emp_no ASC;

# Jawapan dari Solution:

SELECT 
    e.first_name, e.last_name, e.hire_date, t.title
FROM
    employees.employees e
        JOIN
    employees.titles t ON e.emp_no = t.emp_no
WHERE
    first_name = 'Margareta'
        AND last_name = 'Markovitch'
ORDER BY e.emp_no;   