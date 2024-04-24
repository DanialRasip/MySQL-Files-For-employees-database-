# Exercise #1:
# Obtain a result set containing the salary values each manager has signed a contract for. 
# To obtain the data, refer to the "employees" database.
# Use window functions to add the following two columns to the final output:
# - a column containing the row number of each row from the obtained dataset, starting from 1.
# - a column containing the sequential row numbers associated to the rows for each manager, 
# where their highest salary has been given a number equal to the number of rows in the given partition, 
# and their lowest - the number 1.
# Finally, while presenting the output, make sure that the data has been ordered by the values in the 
# first of the row number columns, and then by the salary values for each partition in ascending order.

SELECT
t1.emp_no,
t2.salary,
ROW_NUMBER() OVER(ORDER BY t1.emp_no) AS row_number_1,
ROW_NUMBER() OVER(PARTITION BY t1.emp_no ORDER BY t2.salary) AS row_number_2
FROM
    employees.dept_manager t1
        INNER JOIN
    employees.salaries t2 ON t1.emp_no = t2.emp_no
ORDER BY emp_no, salary ASC;

SELECT
t1.emp_no,
t2.salary,
ROW_NUMBER() OVER(ORDER BY t1.emp_no) AS row_number_1
# ROW_NUMBER() OVER(PARTITION BY t1.emp_no ORDER BY t2.salary) AS row_number_2
FROM
    employees.dept_manager t1
        INNER JOIN
    employees.salaries t2 ON t1.emp_no = t2.emp_no
ORDER BY emp_no, salary ASC;

SELECT
t1.emp_no,
t2.salary,
# ROW_NUMBER() OVER(ORDER BY t1.emp_no) AS row_number_1
ROW_NUMBER() OVER(PARTITION BY t1.emp_no ORDER BY t2.salary) AS row_number_2
FROM
    employees.dept_manager t1
        INNER JOIN
    employees.salaries t2 ON t1.emp_no = t2.emp_no
ORDER BY emp_no, salary ASC;


SELECT 
    t1.emp_no, t2.salary
FROM
    employees.dept_manager t1
        INNER JOIN
    employees.salaries t2 ON t1.emp_no = t2.emp_no
ORDER BY emp_no, salary ASC;

# Jawapan daripada Solution:

USE employees;
SELECT
dm.emp_no,
    salary,
    ROW_NUMBER() OVER (ORDER BY dm.emp_no) AS row_num1,
    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num2
FROM
dept_manager dm
    JOIN 
    salaries s ON dm.emp_no = s.emp_no
ORDER BY row_num1, emp_no, salary ASC;

# Exercise #2:

# Obtain a result set containing the salary values each manager has signed a contract for. 
# To obtain the data, refer to the "employees" database.
# Use window functions to add the following two columns to the final output:
# - a column containing the row numbers associated to each manager, 
# where their highest salary has been given a number equal to the number of rows in the given partition, 
# and their lowest - the number 1.
# - a column containing the row numbers associated to each manager, 
# where their highest salary has been given the number of 1, 
# and the lowest - a value equal to the number of rows in the given partition.
# Let your output be ordered by the salary values associated to each manager in descending order.
# Hint: Please note that you don't need to use an ORDER BY clause in your SELECT statement 
# to retrieve the desired output.

SELECT
t1.emp_no,
t2.salary,
ROW_NUMBER() OVER(PARTITION BY t1.emp_no ORDER BY t2.salary ASC) AS row_number_1,
ROW_NUMBER() OVER(PARTITION BY t1.emp_no ORDER BY t2.salary DESC) AS row_number_2
FROM
    employees.dept_manager t1
        INNER JOIN
    employees.salaries t2 ON t1.emp_no = t2.emp_no
ORDER BY emp_no, salary ASC;

# Jawapan daripada Solution:

USE employees;
SELECT
dm.emp_no,
    salary,
    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary ASC) AS row_num1,
    ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num2   
FROM
dept_manager dm
    JOIN 
    salaries s ON dm.emp_no = s.emp_no;
