DROP TEMPORARY TABLE IF EXISTS female_highest_salary;

# TT female_highest_salary_10_only:

USE employees;
CREATE TEMPORARY TABLE female_highest_salary
SELECT 
e.emp_no, MAX(s.salary)
FROM 
salaries s
JOIN
employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
GROUP BY e.emp_no
ORDER BY e.emp_no
LIMIT 10;

SELECT * FROM female_highest_salary;

# Cara untuk refer TT multiple times (Cara 1 - CTE):

WITH cte AS (SELECT 
e.emp_no, MAX(s.salary)
FROM 
salaries s
JOIN
employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
GROUP BY e.emp_no
ORDER BY e.emp_no
LIMIT 10)
SELECT * FROM female_highest_salary f1 JOIN cte c;

# Cara untuk refer TT multiple times (Cara 2 - CTE + UNION):

WITH cte AS (SELECT 
e.emp_no, MAX(s.salary)
FROM 
salaries s
JOIN
employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
GROUP BY e.emp_no
ORDER BY e.emp_no
LIMIT 10)
SELECT * FROM female_highest_salary UNION SELECT * FROM cte c;

# Untuk buktikan yang TT x boleh di-REFER multiple times jika gunakan SJ tanpa CTE:

SELECT * FROM female_highest_salary f1 JOIN female_highest_salary f2;

# Cara untuk refer TT multiple times (Cara 3 - CTE + UNION ALL):

WITH cte AS (SELECT 
e.emp_no, MAX(s.salary)
FROM 
salaries s
JOIN
employees e ON e.emp_no = s.emp_no AND e.gender = 'F'
GROUP BY e.emp_no
ORDER BY e.emp_no
LIMIT 10)
SELECT * FROM female_highest_salary UNION SELECT * FROM cte c;

# Task (Guna NOW()):

CREATE TEMPORARY TABLE dates_1
SELECT 
NOW() AS current_date_and_time,
DATE_SUB(NOW(), INTERVAL 1 MONTH) AS a_month_earlier,
DATE_SUB(NOW(), INTERVAL -1 YEAR) AS a_year_later;

# Untuk buktikan yang kita dah berjaya CREATE TT dates:

SELECT * FROM dates_1;

# Task (Guna SYSDATE()):

CREATE TEMPORARY TABLE dates_2
SELECT 
SYSDATE() AS current_date_and_time,
DATE_SUB(SYSDATE(), INTERVAL 1 MONTH) AS a_month_earlier,
DATE_SUB(SYSDATE(), INTERVAL -1 YEAR) AS a_year_later;

# Untuk buktikan yang kita dah berjaya CREATE TT dates_2:

SELECT * FROM dates_2;

# Gunakan CTE & JOIN untuk TT dates_1:

WITH cte AS (SELECT 
NOW() AS current_date_and_time,
DATE_SUB(NOW(), INTERVAL 1 MONTH) AS a_month_earlier,
DATE_SUB(NOW(), INTERVAL -1 YEAR) AS a_year_later)
SELECT * FROM dates JOIN cte c;

# Gunakan CTE & UNION untuk TT dates_1:

WITH cte AS (SELECT 
NOW() AS current_date_and_time,
DATE_SUB(NOW(), INTERVAL 1 MONTH) AS a_month_earlier,
DATE_SUB(NOW(), INTERVAL -1 YEAR) AS a_year_later)
SELECT * FROM dates UNION SELECT * FROM cte c;

# Gunakan CTE & UNION ALL untuk TT dates_1:

WITH cte AS (SELECT 
NOW() AS current_date_and_time,
DATE_SUB(NOW(), INTERVAL 1 MONTH) AS a_month_earlier,
DATE_SUB(NOW(), INTERVAL -1 YEAR) AS a_year_later)
SELECT * FROM dates UNION ALL SELECT * FROM cte c;

DROP TABLE IF EXISTS female_highest_salary;
DROP TABLE IF EXISTS dates_1;
DROP TABLE IF EXISTS dates_2;