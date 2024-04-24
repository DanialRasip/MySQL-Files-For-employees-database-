# From the emp_manager table, extract the record data only of those employees who are managers as well:

SELECT 
    e1.*
FROM
    employees.emp_manager e1
        JOIN
    employees.emp_manager e2 ON e1.emp_no = e2.manager_no;

# Improvement dari query di atas (Solution 1):
    
SELECT DISTINCT
    e1.*
FROM
    employees.emp_manager e1
        JOIN
    employees.emp_manager e2 ON e1.emp_no = e2.manager_no;

# Improvement dari query di atas (Solution 2):
    
SELECT 
    e1.*
FROM
    employees.emp_manager e1
        JOIN
    employees.emp_manager e2 ON e1.emp_no = e2.manager_no
WHERE
    e2.emp_no IN (SELECT 
            manager_no
        FROM
            employees.emp_manager);

# How SQ works:

SELECT 
    *
FROM
    employees.emp_manager
WHERE
    emp_no IN (SELECT 
            manager_no
        FROM
            employees.emp_manager);
    
    
SELECT 
    *
FROM
    employees.emp_manager;