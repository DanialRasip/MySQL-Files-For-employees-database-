# Exercise #1:
# Create a query that upon execution returns a result set containing the employee numbers, contract salary values, 
# start, and end dates of the first ever contracts that each employee signed for the company.
# To obtain the desired output, refer to the data stored in the "salaries" table.

SELECT 
emp_no, MIN(salary), MIN(from_date), MIN(to_date) 
FROM 
employees.salaries
GROUP BY 
emp_no;

# Solution #1:

SELECT
    s1.emp_no, s.salary, s.from_date, s.to_date
FROM
    employees.salaries s
        JOIN
    (SELECT
        emp_no, MIN(from_date) AS from_date
    FROM
        employees.salaries
    GROUP BY emp_no) s1 ON s.emp_no = s1.emp_no
WHERE
    s.from_date = s1.from_date;
    
SELECT
        emp_no, MIN(from_date) AS from_date, salary, to_date
    FROM
        employees.salaries
    GROUP BY emp_no