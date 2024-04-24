# Contoh menggunakan multiple WF dalam a single query:

SELECT
emp_no,
salary,
ROW_NUMBER() OVER() AS row_number_1,
ROW_NUMBER() OVER(PARTITION BY emp_no) AS row_number_2,
ROW_NUMBER() OVER(PARTITION BY emp_no ORDER BY salary DESC) AS row_number_3,
ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_number_4
FROM 
employees.salaries
ORDER BY emp_no, salary;

# Contoh menggunakan multiple WF dalam a single query:

SELECT
emp_no,
salary,
ROW_NUMBER() OVER() AS row_number_1
# ROW_NUMBER() OVER(PARTITION BY emp_no) AS row_number_2,
# ROW_NUMBER() OVER(PARTITION BY emp_no ORDER BY salary DESC) AS row_number_3,
# ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_number_4
FROM 
employees.salaries
ORDER BY emp_no;

SELECT
emp_no,
salary,
# ROW_NUMBER() OVER() AS row_number_1
ROW_NUMBER() OVER(PARTITION BY emp_no) AS row_number_2
# ROW_NUMBER() OVER(PARTITION BY emp_no ORDER BY salary DESC) AS row_number_3,
# ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_number_4
FROM 
employees.salaries
ORDER BY emp_no;

SELECT
emp_no,
salary,
# ROW_NUMBER() OVER() AS row_number_1
# ROW_NUMBER() OVER(PARTITION BY emp_no) AS row_number_2
ROW_NUMBER() OVER(PARTITION BY emp_no ORDER BY salary DESC) AS row_number_3
# ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_number_4
FROM 
employees.salaries
ORDER BY emp_no;

SELECT
emp_no,
salary,
# ROW_NUMBER() OVER() AS row_number_1
# ROW_NUMBER() OVER(PARTITION BY emp_no) AS row_number_2
# ROW_NUMBER() OVER(PARTITION BY emp_no ORDER BY salary DESC) AS row_number_3
ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_number_4
FROM 
employees.salaries
ORDER BY emp_no, salary;

SELECT
emp_no,
salary,
# ROW_NUMBER() OVER() AS row_number_1
ROW_NUMBER() OVER(PARTITION BY emp_no) AS row_number_2,
ROW_NUMBER() OVER(PARTITION BY emp_no ORDER BY salary DESC) AS row_number_3
# ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_number_4
FROM 
employees.salaries;