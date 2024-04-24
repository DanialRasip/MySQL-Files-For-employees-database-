# DS1:

SELECT
*
FROM
employees.employees 
WHERE gender = 'F';

# DS2:

SELECT
emp_no, MAX(salary)
FROM
employees.salaries 
GROUP BY emp_no;

# Gabungkan DS1 & DS2 dalam JOIN:

USE employees;
SELECT 
e.emp_no, MAX(s.salary)
FROM 
salaries s
JOIN
employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
GROUP BY e.emp_no
ORDER BY e.emp_no; 

# Contoh TT dalam SQL:

CREATE TEMPORARY TABLE female_highest_salary
SELECT 
e.emp_no, MAX(s.salary)
FROM 
employees.salaries s
JOIN
employees.employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
GROUP BY e.emp_no
ORDER BY e.emp_no; 

# Untuk buktikan yang kita dah CREATE a TT:

SELECT * FROM female_highest_salary;

# Menggunakan condition(s) (WHERE) dalam TT:

SELECT * FROM female_highest_salary 
WHERE emp_no <= 10010;

# Cara untuk DROP TT:

DROP TABLE IF EXISTS female_highest_salary;