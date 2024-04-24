# Guna query ni untuk dapatkan field emp_no, first_name & last_name daripada table employees
# Tapi nak set condition yang emp_no diambil daripada employees, mesti yang ada sekali dalam dept_manager sahaja
# Menggunakan SQ (EXISTS in SQ):

SELECT 
    t1.emp_no, t1.first_name, t1.last_name
FROM
    employees.employees t1
WHERE
    EXISTS( SELECT 
            t2.emp_no
        FROM
            employees.dept_manager t2
        WHERE
            t1.emp_no = t2.emp_no);
            
# Guna query ni untuk dapatkan field emp_no, first_name & last_name daripada table employees
# Tapi nak set condition yang emp_no diambil daripada employees, mesti yang ada sekali dalam dept_manager sahaja
# Menggunakan SQ (EXISTS in SQ) & masukkan ORDER BY dalam SQ:

SELECT 
    t1.emp_no, t1.first_name, t1.last_name
FROM
    employees.employees t1
WHERE
    EXISTS( SELECT 
            t2.emp_no
        FROM
            employees.dept_manager t2
        WHERE
            t1.emp_no = t2.emp_no)
ORDER BY emp_no DESC;