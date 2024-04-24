# "Select the department number and name from the ‘departments_dup’ table 
# add a third column where you name the department number (‘dept_no’) as ‘dept_info’. If ‘dept_no’ does not have a value, use ‘dept_name’."

SELECT 
    *
FROM
    employees.departments_dup2
ORDER BY dept_no;
    
SELECT 
    dept_no,
    dept_name,
    IFNULL(dept_no, dept_name) AS dept_info
FROM
    employees.departments_dup2
ORDER BY dept_no ASC;
