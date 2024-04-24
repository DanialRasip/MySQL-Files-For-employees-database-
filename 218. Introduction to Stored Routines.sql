# Create a view that will extract the average salary of all managers registered in the database. 
# Round this value to the nearest cent.
# If you have worked correctly, after executing the view from the “Schemas” section in Workbench, 
# you should obtain the value of 66924.27.

SELECT 
    (SELECT 
            COUNT(emp_no)
        FROM
            employees.dept_manager) AS Number_Of_Manager,
    ROUND(AVG(t2.salary),2) AS Average_Manager_Salary
FROM
    employees.dept_manager t1
        JOIN
    employees.salaries t2 ON t1.emp_no = t2.emp_no
ORDER BY Number_Of_Manager;

CREATE OR REPLACE VIEW employees.v_manager_average_salary AS
    SELECT 
        (SELECT 
                COUNT(emp_no)
            FROM
                employees.dept_manager) AS Number_Of_Manager,
        ROUND(AVG(t2.salary), 2) AS Average_Manager_Salary
    FROM
        employees.dept_manager t1
            JOIN
        employees.salaries t2 ON t1.emp_no = t2.emp_no
    ORDER BY Number_Of_Manager;
    
    SELECT * FROM employees.manager_average_salary;
    
# Jawapan daripada Solution:

CREATE OR REPLACE VIEW v_manager_avg_salary AS
    SELECT 
        ROUND(AVG(salary), 2)
    FROM
        employees.salaries s
            JOIN
        employees.dept_manager m ON s.emp_no = m.emp_no;