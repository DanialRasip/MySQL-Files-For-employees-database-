# Exercise #1:

# -Create a temporary table called dates containing the following three columns:
# - one displaying the current date and time,
# - another one displaying two months earlier than the current date and time, and a
# - third column displaying two years later than the current date and time:

CREATE TEMPORARY TABLE dates
SELECT 
NOW() AS current_date_and_time,
DATE_SUB(NOW(), INTERVAL 2 MONTH) AS two_month_earlier,
DATE_SUB(NOW(), INTERVAL -2 YEAR) AS two_year_later;

# Exercise #2:
# Write a query that, upon execution, allows you to check the result set contained in the dates temporary table you 
# created in the previous exercise.

SELECT * FROM dates;

# Exercise #3:
# Create a query joining the result sets from the dates temporary table you created during the previous lecture with 
# a new Common Table Expression (CTE) containing the same columns. Let all columns in the result set appear on the 
# same row:

WITH cte AS (SELECT 
NOW() AS current_date_and_time,
DATE_SUB(NOW(), INTERVAL 2 MONTH) AS two_month_earlier,
DATE_SUB(NOW(), INTERVAL -2 YEAR) AS two_year_later)
SELECT * FROM dates JOIN cte;

# Solution #3:

WITH cte AS (SELECT
    NOW(),
    DATE_SUB(NOW(), INTERVAL 2 MONTH) AS cte_a_month_earlier,
    DATE_SUB(NOW(), INTERVAL -2 YEAR) AS cte_a_year_later)
SELECT * FROM dates d1 JOIN cte c;

# Exercise #4:
# Again, create a query joining the result sets from the dates temporary table you created during the previous 
# lecture with a new Common Table Expression (CTE) containing the same columns. 
# This time, combine the two sets vertically:

WITH cte AS (SELECT 
NOW() AS current_date_and_time,
DATE_SUB(NOW(), INTERVAL 2 MONTH) AS two_month_earlier,
DATE_SUB(NOW(), INTERVAL -2 YEAR) AS two_year_later)
SELECT * FROM dates UNION SELECT * FROM cte;

WITH cte AS (SELECT 
NOW() AS current_date_and_time,
DATE_SUB(NOW(), INTERVAL 2 MONTH) AS two_month_earlier,
DATE_SUB(NOW(), INTERVAL -2 YEAR) AS two_year_later)
SELECT * FROM dates UNION ALL SELECT * FROM cte;

# Exercise #5:
# Drop the male_max_salaries and dates temporary tables you recently created:

DROP TABLE IF EXISTS male_max_salary;
DROP TABLE IF EXISTS dates;
DROP TABLE IF EXISTS dates_2;