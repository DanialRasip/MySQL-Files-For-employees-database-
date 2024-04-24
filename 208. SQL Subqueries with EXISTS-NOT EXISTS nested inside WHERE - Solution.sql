# "Select the entire information for all employees whose job title is “Assistant Engineer”. 
# Hint: To solve this exercise, use the 'employees' table.":

SELECT 
    t1.*
FROM
    employees.employees t1
WHERE
    t1.emp_no IN (SELECT 
            t2.emp_no
        FROM
            employees.titles t2
        WHERE
            t2.title = 'Assistant Engineer');
            
# Jawapan daripada Solution:

SELECT 
    *
FROM
    employees.employees e
WHERE
    EXISTS( SELECT 
            *
        FROM
            employees.titles t
        WHERE
            t.emp_no = e.emp_no
                AND title = 'Assistant Engineer');
                
# Untuk check accuracy output:

SELECT 
    title, COUNT(title)
FROM
    employees.titles
GROUP BY title
ORDER BY title DESC;


