# Contoh penggunaan AF, SQ, WF, WINDOW & GROUP BY dalam query yang sama (Cara 1):

SELECT
a.emp_no,
MAX(salary) AS max_salary FROM
(SELECT emp_no, salary,
ROW_NUMBER() OVER w AS row_num
FROM employees.salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC)) AS a
GROUP BY emp_no;

# Contoh penggunaan AF, SQ, WF, WINDOW & GROUP BY dalam query yang sama (Cara 2):

SELECT
a.emp_no,
MAX(salary) AS max_salary FROM
(SELECT emp_no, salary,
ROW_NUMBER() OVER (PARTITION BY emp_no ORDER BY salary DESC) AS row_num
FROM employees.salaries) a
GROUP BY emp_no;

# Contoh penggunaan AF, SQ, WF, WINDOW & GROUP BY dalam query yang sama (Cara 3):

SELECT 
    a.emp_no, MAX(salary) AS max_salary
FROM
    (SELECT 
        emp_no, salary
    FROM
        employees.salaries) a
GROUP BY emp_no;

# Contoh penggunaan AF, SQ, WF, WINDOW & GROUP BY dalam query yang sama (Cara 4):

SELECT
a.emp_no,
a.salary AS max_salary FROM
(SELECT emp_no, salary,
ROW_NUMBER() OVER w AS row_num
FROM employees.salaries
WINDOW w AS (PARTITION BY emp_no ORDER BY salary DESC)) AS a
WHERE a.ROW_NUM = 1;