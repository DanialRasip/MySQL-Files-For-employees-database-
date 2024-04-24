# Assign employee number 110022 as a manager to all employees from 10001 to 10020, 
# And employee number 110039 as manager to all employees from 10021 to 10040:

SELECT 
    A.*
FROM
    (SELECT 
        t1.emp_no AS employee_ID,
            MIN(t2.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    employees.dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees.employees t1
    INNER JOIN employees.dept_emp t2 ON t1.emp_no = t2.emp_no
    WHERE
        t1.emp_no <= 10020
    GROUP BY t1.emp_no
    ORDER BY t1.emp_no) AS A 
UNION SELECT 
    B.*
FROM
    (SELECT 
        t1.emp_no AS employee_ID,
            MIN(t2.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    employees.dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees.employees t1
    INNER JOIN employees.dept_emp t2 ON t1.emp_no = t2.emp_no
    WHERE
        t1.emp_no >= 10021
            AND t1.emp_no <= 10040
    GROUP BY t1.emp_no
    ORDER BY t1.emp_no) AS B;

SELECT 
    *
FROM
    employees.dept_emp;