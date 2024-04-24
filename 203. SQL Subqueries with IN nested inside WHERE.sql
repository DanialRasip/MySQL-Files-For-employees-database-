# Guna query ni untuk dapatkan field emp_no, first_name & last_name daripada table employees
# Tapi nak set condition yang emp_no diambil daripada employees, mesti yang ada sekali dalam dept_manager sahaja
# Menggunakan SQ:

SELECT 
    t1.emp_no, t1.first_name, t1.last_name
FROM
    employees.employees t1
WHERE
    t1.emp_no IN (SELECT 
            t2.emp_no
        FROM
            employees.dept_manager t2);

# Query yang sama macam dengan Output dekat atas
# Cuma guna INNER JOIN:

SELECT 
    t2.emp_no, t1.first_name, t1.last_name
FROM
    employees.employees t1
        INNER JOIN
    employees.dept_manager t2 ON t1.emp_no = t2.emp_no
ORDER BY t2.emp_no;
