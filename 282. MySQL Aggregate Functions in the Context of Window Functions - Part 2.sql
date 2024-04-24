# Sambungan daripada Task dalam video no.279:
# Untuk dapatkan data CURRENT employees sahaja daripada table salaries:

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

# Untuk check data:

SELECT * FROM employees.dept_emp LIMIT 1000;
SELECT * FROM employees.dept_emp WHERE emp_no = 10010 ORDER BY from_date;
SELECT * FROM employees.dept_emp WHERE emp_no = 10018 ORDER BY from_date;
SELECT * FROM employees.salaries WHERE emp_no = 10010 ORDER BY from_date;
SELECT * FROM employees.salaries WHERE emp_no = 10018 ORDER BY from_date;

# Untuk dapatkan data CURRENT employees sahaja daripada table dept_emp:

SELECT 
de.emp_no, de.dept_no, de.from_date, de.to_date
FROM
employees.dept_emp de
JOIN
(SELECT
emp_no, MAX(from_date) AS from_date
FROM
employees.dept_emp
GROUP BY emp_no) de1 ON de.emp_no = de1.emp_no
WHERE
de.to_date > SYSDATE() AND de.from_date = de1.from_date;

# Final Solution:

SELECT
de2.emp_no, d.dept_name, s2.salary, AVG(s2.salary) OVER w AS average_salary_per_department
FROM
(SELECT 
de.emp_no, de.dept_no, de.from_date, de.to_date
FROM
employees.dept_emp de
JOIN
(SELECT
emp_no, MAX(from_date) AS from_date
FROM
employees.dept_emp
GROUP BY emp_no) de1 ON de.emp_no = de1.emp_no
WHERE
de.to_date > SYSDATE() AND de.from_date = de1.from_date) de2
JOIN
(SELECT 
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
s.to_date > SYSDATE() AND s.from_date = s1.from_date) s2 ON s2.emp_no = de2.emp_no
JOIN
employees.departments d ON d.dept_no = de2.dept_no
GROUP BY de2.emp_no, d.dept_name
WINDOW w AS (PARTITION BY de2.dept_no)
ORDER BY de2.emp_no;
