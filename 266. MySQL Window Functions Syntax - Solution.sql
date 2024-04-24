# Write a query that provides row numbers for all workers from the "employees" table, 
# partitioning the data by their first names and ordering each partition by their employee number in ascending order.
# NB! While writing the desired query, do *not* use an ORDER BY clause in the relevant SELECT statement. 
# At the same time, do use a WINDOW clause to provide the required window specification.

USE employees;
SELECT 
emp_no, 
first_name,
ROW_NUMBER() OVER(w) as row_number_1
FROM
employees
WINDOW w AS (PARTITION BY first_name ORDER BY emp_no);

# Jawapan daripada Solution:

# Solution #1:

USE employees;
SELECT
emp_no,
first_name,
ROW_NUMBER() OVER w AS row_num
FROM
employees
WINDOW w AS (PARTITION BY first_name ORDER BY emp_no);