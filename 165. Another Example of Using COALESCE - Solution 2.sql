# Modify the code obtained from the previous exercise in the following way. 
# Apply the IFNULL() function to the values from the first and second column, so that ‘N/A’ is displayed whenever a department number 
# has no value, and ‘Department name not provided’ is shown if there is no value for ‘dept_name’.

SELECT 
    *
FROM
    employees.departments_dup2
ORDER BY dept_no;

SELECT
    IFNULL(dept_no, 'N/A') as dept_no,
    IFNULL(dept_name,
            'Department name not provided') AS dept_name,
    IFNULL(dept_no, dept_name) AS dept_info
FROM
    employees.departments_dup2
ORDER BY dept_no ASC;