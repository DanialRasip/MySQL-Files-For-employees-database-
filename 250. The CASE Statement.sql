# Contoh CS Cara Pertama:

SELECT 
    emp_no first_name,
    last_name,
    CASE
        WHEN gender = 'M' THEN 'Male'
        ELSE 'Female'
    END AS gender
FROM
    employees.employees;

# Contoh CS Cara Kedua:

SELECT 
    emp_no first_name,
    last_name,
    CASE gender
        WHEN 'M' THEN 'Male'
        ELSE 'Female'
    END AS gender
FROM
    employees.employees;
    
# Contoh 2 CS Cara Kedua:

SELECT 
    t1.emp_no,
    t1.first_name,
    t1.last_name,
    CASE 
    WHEN t2.emp_no IS NOT NULL THEN 'Manager'
        ELSE 'Employees'
    END AS is_manager_or_employees
FROM
    employees.employees t1
    LEFT JOIN
    employees.dept_manager t2 ON t1.emp_no = t2.emp_no
WHERE
    t1.emp_no > 109990;

# Cara ketiga CS (IF):

SELECT 
    emp_no,
    first_name,
    last_name,
    IF(gender = 'M', 'Male', 'Female') AS gender
FROM
    employees.employees;
    
# Contoh CS Cara Kedua yang melibatkan multiple conditions:

SELECT 
    t2.emp_no,
    t1.first_name,
    t1.last_name,
    MAX(t3.salary) - MIN(t3.salary) AS salary_differences,
    CASE 
    WHEN MAX(t3.salary) - MIN(t3.salary) > 30000 THEN 'Salary was raised by more than $30000'
    WHEN MAX(t3.salary) - MIN(t3.salary) BETWEEN 20000 AND 30000 THEN 'Salary was raised by more than $20000 but less than $30000'
        ELSE 'Salary was raised by less than $20000'
    END AS salary_increase
FROM
    employees.employees t1
    INNER JOIN
    employees.dept_manager t2 ON t1.emp_no = t2.emp_no
    INNER JOIN
    employees.salaries t3 ON t3.emp_no = t2.emp_no
GROUP BY t2.emp_no;

SELECT 
    t1.emp_no,
    t1.first_name,
    t1.last_name,
    MAX(t3.salary) - MIN(t3.salary) AS salary_differences,
    CASE 
    WHEN MAX(t3.salary) - MIN(t3.salary) > 30000 THEN 'Salary was raised by more than $30000'
    WHEN MAX(t3.salary) - MIN(t3.salary) BETWEEN 20000 AND 30000 THEN 'Salary was raised by more than $20000 but less than $30000'
        ELSE 'Salary was raised by less than $20000'
    END AS salary_increase
FROM
    employees.employees t1
    LEFT JOIN
    employees.salaries t3 ON t3.emp_no = t1.emp_no
GROUP BY t1.emp_no;