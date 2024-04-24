# Contoh menggunakan WF yang biasa:

USE employees;
SELECT 
emp_no, 
salary,
ROW_NUMBER() OVER(PARTITION BY emp_no ORDER BY salary DESC) as row_number_1
FROM
salaries;

# Contoh menggunakan ALIAS untuk Window:

USE employees;
SELECT 
emp_no, 
salary,
ROW_NUMBER() OVER(w) as row_number_1
FROM
salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);