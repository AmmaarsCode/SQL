/* LAB 8
Ammaar Anjum*/

--1.
SELECT DISTINCT COST
FROM STUDENT.COURSE
WHERE COST = 
             (SELECT  MIN(COST)
               FROM STUDENT.COURSE);
               
--2.            
SELECT DISTINCT COST
               FROM STUDENT.COURSE
               WHERE COST NOT IN 
                          ((SELECT DISTINCT MIN(COST)
                              FROM STUDENT.COURSE),
                              (SELECT DISTINCT MAX(COST)
                              FROM STUDENT.COURSE));
                              
--3.
SELECT DISTINCT COST
FROM STUDENT.COURSE
WHERE COST = 
             (SELECT  MAX(COST)
               FROM STUDENT.COURSE);
               
--4.
SELECT MIN(ENROLL_DATE) AS "Earliest Enrollment Date"
FROM STUDENT.ENROLLMENT;

--5.
SELECT MIN(ENROLL_DATE+30) AS "Earliest Date plus 30"
FROM STUDENT.ENROLLMENT;

--6.

SELECT V.VENDOR_NAME, I.INVOICE_NUMBER, I.INVOICE_TOTAL
FROM AP.INVOICES I
INNER JOIN AP.VENDORS V
ON I.VENDOR_ID = V.VENDOR_ID
WHERE I.INVOICE_TOTAL < (SELECT MAX(INVOICE_TOTAL) FROM AP.INVOICES WHERE VENDOR_ID = '123')
ORDER BY V.VENDOR_NAME, I.INVOICE_TOTAL DESC
FETCH FIRST 10 ROWS ONLY;


--7.
SELECT VENDOR_ID, VENDOR_NAME, VENDOR_STATE
FROM AP.VENDORS
WHERE VENDOR_ID NOT IN
    (SELECT DISTINCT VENDOR_ID
    FROM AP.INVOICES)
ORDER BY VENDOR_ID
FETCH FIRST 10 ROWS ONLY;

--8.
SELECT COST
FROM STUDENT.COURSE
WHERE COST > (SELECT MIN(COST) FROM STUDENT.COURSE);
                     
--9.
SELECT VENDOR_ID, INVOICE_NUMBER, INVOICE_TOTAL
FROM AP.INVOICES i
WHERE INVOICE_TOTAL  >  (
    SELECT AVG(INVOICE_TOTAL) 
    FROM AP.INVOICES v
    WHERE v.vendor_id = i.vendor_id
)
ORDER BY VENDOR_ID;

--10.
SELECT v.vendor_id, vendor_name, i.invoice_id
FROM ap.vendors v INNER JOIN ap.invoices i
    ON v.vendor_id = i.vendor_id 
ORDER BY vendor_name ASC;

--11.
SELECT vendor_name, COUNT(i.invoice_id) 
FROM ap.vendors v INNER JOIN ap.invoices i
ON i.vendor_id = v.vendor_id
GROUP BY vendor_name
ORDER BY vendor_name ASC;

--12.
SELECT VENDOR_CONTACT_LAST_NAME, VENDOR_CONTACT_FIRST_NAME, VENDOR_STATE
FROM AP.VENDORS
WHERE (LENGTH(VENDOR_CONTACT_LAST_NAME) > LENGTH(VENDOR_CONTACT_FIRST_NAME)) AND (VENDOR_STATE = 'CA' or VENDOR_STATE = 'NJ')
ORDER BY VENDOR_CONTACT_LAST_NAME ASC;

--13.
SELECT VENDOR_ID, VENDOR_NAME 
FROM AP.VENDORS
WHERE INSTR(VENDOR_NAME, '''') > 0
ORDER BY VENDOR_NAME ASC;

--14.
Select e.last_name, d.department_name
From hr.departments d
Full Outer Join hr.employees e
  ON e.department_id = d.department_id
Order By d.department_name, e.last_name
FETCH FIRST 10 ROWS ONLY;

--15.
Select e.last_name, d.department_name
From hr.departments d
Full Outer Join hr.employees e
  ON e.department_id = d.department_id
Where d.department_name is null
Order By e.last_name;

