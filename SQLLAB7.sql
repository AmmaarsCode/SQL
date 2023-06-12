/*
Ammaar Anjum 
Lab 7
*/

--1
select x.name, x.employee_id, x.title as "NEW_TITLE", coalesce(y.title, 'N/A') as "OLD_TITLE"
from student.employee_change x
left outer join student.employee y
on x.employee_id = y.employee_id;


--2
select x.name, x.employee_id, x.title as "NEW_TITLE", coalesce(y.title, 'N/A') as "OLD_TITLE"
from student.employee y
right outer join student.employee_change x
on x.employee_id = y.employee_id;

--3
SELECT x.name, x.employee_id , x.title AS "NEW_TITLE" , NVL(y.title, 'N/A') AS "OLD_TITLE"
FROM student.employee_change x INNER JOIN student.employee y
ON y.employee_id = x.employee_id;

--4

SELECT NVL(EC.name, E.name), NVL(E.employee_id, E.employee_id) AS "EMPLOYEE_ID", E.title AS "NEW_TITLE" , NVL(EC.title, 'N/A') AS "OLD TITLE"
FROM student.employee_change E FULL OUTER JOIN student.employee EC
ON EC.employee_id = E.employee_id;



--5
SELECT instructor_id from student.instructor_summary where num_of_classes = 0
MINUS
SELECT instructor_id from student.instructor_summary where num_of_classes != 0;

--6
SELECT x.student_id
FROM student.student x FULL OUTER JOIN student.grade y
ON x.student_id = y.student_id
WHERE registration_date < '14-FEB-07' AND numeric_grade IS NULL
ORDER BY 1;

--7
SELECT state, COUNT(zip)
FROM student.zipcode
GROUP BY state;

--8
SELECT COUNT(student_id), y.state
FROM student.student x FULL OUTER JOIN student.zipcode y
ON x.zip = y.zip
GROUP BY state
HAVING COUNT(x.student_id) != 0
ORDER BY 
    CASE state 
        WHEN 'CT' THEN 0
        WHEN 'OH' THEN 1
        WHEN 'MA' THEN 2
        WHEN 'MI' THEN 3
        WHEN 'WV' THEN 4
        WHEN 'NY' THEN 5
        WHEN 'NJ' THEN 6
    END;
    

--9
SELECT last_name AS "Sounds like Archer"
FROM student.student
WHERE last_name LIKE 'Arch_r%'
ORDER BY LAST_NAME;

--10
SELECT employer, COUNT(student_id) AS "Number of Students Employed by"
FROM student.student
GROUP BY employer
ORDER BY 2 DESC;

--11
SELECT employer, COUNT(student_id) AS "Number of Students Employed by"
FROM student.student
HAVING COUNT(student_id) >= 7
GROUP BY employer
ORDER BY 2 DESC;

--12
SELECT student_id, concat(concat(last_name, ', '), first_name) AS " Last, First"
FROM student.student
ORDER BY student_id
FETCH NEXT 10 ROWS ONLY;

--13
SELECT midterm_grade, finalexam_grade, quiz_grade, NVL(COALESCE(midterm_grade, finalexam_grade, quiz_grade), '0') AS "Default of 0"
FROM student.grade_summary;

--14
SELECT TO_CHAR(CURRENT_DATE, 'MM/dd/yyyy') as "Formatted Today's Date" from dual;

--15
SELECT TO_CHAR(systimestamp,'DD-MON-YYYY HH24:MI:SS') as "Formatted Today's Date" from dual;

--16
SELECT TO_CHAR(AVG(unit_price), '$999.99') As "Average Item Price" from om.items;

--17
SELECT SUM(order_qty), title, artist
FROM om.order_details x FULL OUTER JOIN om.items y
ON x.item_id = y.item_id
GROUP BY title, artist;

--18
SELECT SUM(order_qty) AS "Total", TO_CHAR(AVG(order_qty), '9.99') AS "Average", MIN(order_qty) AS "Minimum", MAX(order_qty) AS "Maximum"
FROM om.order_details;

--19


SELECT x.customer_first_name, x.customer_last_name, b.title
FROM om.items b 
JOIN om.order_details a ON a.item_id = b.item_id 
JOIN om.orders y ON y.order_id = a.order_id 
JOIN om.customers x ON x.customer_id = y.customer_id 
WHERE b.item_id IN (1, 7, 10)
ORDER BY  b.title;




--20
SELECT title
FROM om.items
WHERE LENGTH(title) <= 20;