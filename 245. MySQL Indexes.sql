# Berapa banyak employees yang dah di-hire selepas 1 Januari 2000?
# Bandingkan guna Index & tanpa Index:

SELECT 
    *
FROM
    employees.employees
WHERE
    hire_date > '2000-01-01';
    
CREATE INDEX i_hire_date
ON employees.employees (hire_date);

# Nak maklumat tentang employees yang first_name = 'Georgi' & last_name = 'Facello'
# Bandingkan guna Index & tanpa Index:

SELECT 
    *
FROM
    employees.employees
WHERE
    first_name = 'Georgi'
        AND last_name = 'Facello';
    
CREATE INDEX i_first_name_and_last_name
ON employees.employees (first_name, last_name);

# Cara untuk lihat senarai Index yang dah di-CREATE dalam database & table:

SHOW INDEX FROM employees FROM employees;