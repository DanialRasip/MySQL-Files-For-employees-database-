# Contoh RNRWF in a query:

SELECT
emp_no,
salary,
ROW_NUMBER() OVER w AS row_num
FROM 
employees.salaries
WHERE emp_no = 10001
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

# Untuk confirmkan tiada record dengan nilai salary yang sama bagi emp_no = 10001:

SELECT DISTINCT
emp_no,
salary,
ROW_NUMBER() OVER w AS row_num
FROM 
employees.salaries
WHERE emp_no = 10001
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

# Cara untuk melihat sekiranya ada records yang mempunyai value yang sama dalam certain fields:

SELECT
emp_no,
COUNT(salary) - COUNT(DISTINCT salary) AS differences
FROM 
employees.salaries
GROUP BY emp_no
HAVING differences > 0
ORDER BY emp_no;

# emp_no yang menjadi reference kita untuk RWF & DRWF:

SELECT
*
FROM 
employees.salaries
WHERE 
emp_no = 11839;

# Perbandingan menggunakan RNRWF, RWF & DRWF untuk emp_no = 11839:

SELECT 
emp_no,
salary,
ROW_NUMBER() OVER w AS row_num
FROM 
employees.salaries
WHERE emp_no = 11839
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

# Perbandingan menggunakan RNRWF, RWF & DRWF untuk emp_no = 11839:

SELECT 
emp_no,
salary,
ROW_NUMBER() OVER w AS row_num
FROM 
employees.salaries
WHERE emp_no = 11839
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

# Perbandingan menggunakan RWF & DRWF untuk emp_no = 11839:

SELECT 
emp_no,
salary,
RANK() OVER w AS rank_num
FROM 
employees.salaries
WHERE emp_no = 11839
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);

# Perbandingan menggunakan DRWF untuk emp_no = 11839:

SELECT 
emp_no,
salary,
DENSE_RANK() OVER w AS dense_rank_num
FROM 
employees.salaries
WHERE emp_no = 11839
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC);