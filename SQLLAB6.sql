/*
Ammaar Anjum
*Lab 6
*/

--1
SELECT e.first_name|| ' ' || e.last_name AS "Employee Name", d.department_name AS "Department"
FROM ex.employees e 
    INNER JOIN ex.departments d
    ON e.department_number = d.department_number;

--2
SELECT e.first_name|| ' ' || e.last_name AS "Employee Name", d.department_name AS "Departmnet"
FROM ex.employees e, ex.departments d
    WHERE e.department_number = d.department_number;

--3
SELECT e.first_name || ' ' || e.last_name AS "Employee Name", j.job_title AS "Job Title", e.salary - j.min_salary AS "Diff from Min Salary"
FROM HR.employees e
    INNER JOIN HR.jobs j
    ON e.job_id = j.job_id
ORDER BY e.last_name;

--4
SELECT e.first_name || ' ' || e.last_name AS "Employee Name", j.job_title AS "Job Title", e.salary - j.min_salary AS "Diff from Min Salary"
FROM HR.employees e, HR.jobs j
    WHERE e.job_id = j.job_id
ORDER BY e.last_name;

--5
SELECT e.first_name, e.last_name, j.job_title, TO_CHAR(e.salary,'$999,999') AS "SALARY", NVL2(TO_CHAR(e.commission_pct), e.commission_pct*100 || '%', 'No Commission') AS "COMMISSION"
FROM HR.employees e
    INNER JOIN HR.jobs j
    ON e.job_id = j.job_id
ORDER BY e.salary DESC;

--6
SELECT l.location_id,l.city, c.country_name, r.region_name
FROM HR.locations l
    INNER JOIN HR.countries c
    ON l.country_id = c.country_id
        INNER JOIN HR.regions r
        ON c.region_id = r.region_id
ORDER BY c.country_name;

--7
SELECT j.job_title, j.min_salary, j.max_salary, AVG(e.salary) AS "AVG_SALARY"
FROM hr.employees e 
    INNER JOIN hr.jobs j
    ON e.job_id = j.job_id
GROUP BY job_title, min_salary, max_salary
ORDER BY 3 DESC;

--8
SELECT c.country_name, TO_CHAR(AVG(e.salary), '$999,999') AS "AVG_SALARY"
FROM HR.countries c 
    INNER JOIN hr.locations l 
    ON c.country_id = l.country_id
        INNER JOIN HR.departments d 
        ON l.location_id = d.location_id
            INNER JOIN HR.employees e 
            ON d.department_id = e.department_id
GROUP BY country_name
ORDER BY 1;

--9
SELECT COUNT(o.order_qty) AS "Total Ordered", i.title
FROM om.items i 
    INNER JOIN OM.order_details o 
    ON i.item_id = o.item_id
GROUP BY title
ORDER BY 1 DESC;

--10
SELECT e.first_name || ' ' || e.last_name AS "EMPLOYEE", m.first_name || ' ' || m.last_name AS "MANAGER"
FROM hr.employees e 
    INNER JOIN hr.employees m 
    ON e.manager_id = m.employee_id
ORDER BY m.last_name, e.last_name;

--11
SELECT invoice_number, REPLACE(invoice_number, '-', '') AS "NEW_NUMBER"
FROM ap.invoices
WHERE invoice_number LIKE '%-%'
ORDER BY NEW_NUMBER;


--12
SELECT i.invoice_number, v.vendor_name
FROM ap.invoices i 
    INNER JOIN ap.vendors v 
    ON i.vendor_id = v.vendor_id
WHERE SUBSTR(vendor_name, 1, 1) BETWEEN 'D' AND 'G'
ORDER BY v.vendor_name;

--13

SELECT I.INVOICE_NUMBER, T.TERMS_DESCRIPTION
FROM AP.INVOICES I
JOIN AP.VENDORS V ON I.VENDOR_ID = V.VENDOR_ID
INNER JOIN AP.TERMS T ON I.TERMS_ID = T.TERMS_ID
WHERE V.DEFAULT_TERMS_ID <> I.TERMS_ID
ORDER BY V.DEFAULT_TERMS_ID;

    

--14
SELECT c.first_name, c.last_name, v.vendor_name
FROM ap.vendor_contacts c 
    INNER JOIN AP.vendors v ON (c.vendor_id = v.vendor_id)
WHERE vendor_state IN ('CA', 'NJ')
ORDER BY v.vendor_name;

--15

SELECT vendor_name, LTRIM(decode(vendor_address1, 'NULL', null, vendor_address1) || ', ' || decode(vendor_address2, 'NULL', null, vendor_address2), ' ,') || vendor_city || ', ' || vendor_state || ' ' || vendor_zip_code AS "Complete Address"
FROM ap.vendors
WHERE (vendor_address1 || vendor_address2 || vendor_city || vendor_state || vendor_zip_code) IS NOT NULL AND vendor_name LIKE 'P%';






