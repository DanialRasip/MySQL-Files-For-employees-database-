# Contoh ROW_NUMBER() RWF dalam query
# No (Single) Partition:

SELECT 
    emp_no, salary, ROW_NUMBER() OVER() AS row_num
FROM
    employees.salaries;

# Contoh ROW_NUMBER() RWF dalam query
# Multiple Partitions:

SELECT 
    emp_no, salary, ROW_NUMBER() OVER(PARTITION BY emp_no) AS row_num
FROM
    employees.salaries;
    
# Contoh ROW_NUMBER() RWF dalam query
# Multiple Partitions & ORDER BY:

SELECT 
    emp_no, salary, ROW_NUMBER() OVER(PARTITION BY emp_no ORDER BY salary) AS row_num
FROM
    employees.salaries;
    
# Contoh ROW_NUMBER() RWF dalam query
# No (Single) Partitions & ORDER BY:

SELECT 
    emp_no, salary, ROW_NUMBER() OVER(ORDER BY salary) AS row_num
FROM
    employees.salaries;
