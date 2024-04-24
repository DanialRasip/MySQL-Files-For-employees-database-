# Contoh penggunaan AWF in a query:

SELECT * FROM employees.dept_emp
WHERE to_date > SYSDATE();

SELECT sysdate();

SELECT * from employees.salaries
WHERE to_date > SYSDATE();

# Query di bawah ni akan menyebabkan kita dapat Error Code: 1055

SELECT 
emp_no, salary, MAX(from_date), to_date 
FROM 
employees.salaries
GROUP BY emp_no
HAVING to_date > SYSDATE();

# Cara 1 Untuk atasi Error Code: 1055

SELECT 
    emp_no, 
    MAX(salary) AS max_salary,
    MAX(from_date) AS max_from_date, 
    MAX(to_date) AS max_to_date
FROM 
    employees.salaries
WHERE 
    to_date > SYSDATE()
GROUP BY 
    emp_no;

# Cara 2 Untuk atasi Error Code: 1055

SELECT 
    emp_no, 
    salary AS max_salary,
    MAX(from_date) AS max_from_date, 
    to_date AS max_to_date
FROM 
    employees.salaries
WHERE 
    to_date > SYSDATE()
GROUP BY 
    emp_no, salary, MAX(from_date), to_date;

# Cara 3 Untuk atasi Error Code: 1055, masukkan dalam SQ & gunakan SELF-JOIN

SELECT 
s1.emp_no, s.salary, s.from_date, s.to_date
FROM
employees.salaries s
JOIN
(SELECT
emp_no, MAX(from_date) AS from_date
FROM
employees.salaries
GROUP BY emp_no) s1 ON s.emp_no = s1.emp_no
WHERE
s.to_date > SYSDATE() AND s.from_date = s1.from_date;