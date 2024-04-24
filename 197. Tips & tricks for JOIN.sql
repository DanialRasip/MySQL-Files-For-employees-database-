# Guna query ni untuk dapat field dept_no, dept_name, average salary (untuk manager daripada setiap departments)
# daripada table dept_manager, departments & salaries:

SELECT 
    t1.dept_no, t2.dept_name, AVG(t3.salary) AS average_salary
FROM
    employees.dept_manager t1
        INNER JOIN
    employees.departments t2 ON t1.dept_no = t2.dept_no
        INNER JOIN
    employees.salaries t3 ON t1.emp_no = t3.emp_no
GROUP BY t2.dept_name
ORDER BY t2.dept_no;

# Guna query ni untuk dapat field dept_no, dept_name, average salary (untuk manager daripada setiap departments)
# daripada table dept_manager, departments & salaries
# tapi nak disusun ikut jumlah salary:

SELECT 
    t1.dept_no, t2.dept_name, AVG(t3.salary) AS average_salary
FROM
    employees.dept_manager t1
        INNER JOIN
    employees.departments t2 ON t1.dept_no = t2.dept_no
        INNER JOIN
    employees.salaries t3 ON t1.emp_no = t3.emp_no
GROUP BY t2.dept_name
ORDER BY average_salary;

# Guna query ni untuk dapat field dept_no, dept_name, average salary (untuk manager daripada setiap departments)
# daripada table dept_manager, departments & salaries
# tapi nak disusun ikut jumlah salary & nak yang jumlah salary lebih daripada 60,000 sahaja:

SELECT 
    t1.dept_no, t2.dept_name, AVG(t3.salary) AS average_salary
FROM
    employees.dept_manager t1
        INNER JOIN
    employees.departments t2 ON t1.dept_no = t2.dept_no
        INNER JOIN
    employees.salaries t3 ON t1.emp_no = t3.emp_no
GROUP BY t2.dept_name
HAVING average_salary > 60000
ORDER BY average_salary;