/* Lab 9
Ammaar Anjum*/

--1.
SELECT FIRST_NAME, LAST_NAME, COMMISSION_PCT, HIRE_DATE
FROM HR.EMPLOYEES
WHERE 
FIRST_NAME LIKE 'J%' AND COMMISSION_PCT >= 0.1 
ORDER BY FIRST_NAME;

--2.
SELECT FIRST_NAME, LAST_NAME, COMMISSION_PCT, HIRE_DATE
FROM HR.EMPLOYEES
WHERE FIRST_NAME LIKE 'J%'
  AND COMMISSION_PCT > 0.1
  AND LAST_NAME LIKE '%o%'
  AND HIRE_DATE > '01-JAN-2006';

--3.
SELECT REGION_ID, REGION_NAME, SUBSTR(region_name,-1) AS "Last Letter in Region Name"
FROM HR.REGIONS
WHERE LENGTH(REGION_NAME) > 4
ORDER BY REGION_NAME DESC;

--4.
SELECT FIRST_NAME, LAST_NAME, EMPLOYEE_ID, 
       mod(employee_id, 4) + 1 as "Team#"
FROM HR.EMPLOYEES
ORDER BY EMPLOYEE_ID
FETCH FIRST 20 ROWS ONLY;

--5.
SELECT mod(employee_id, 4) + 1 as "Team#", count(*) as "Employees on each Team"
FROM HR.EMPLOYEES
Group By mod(employee_id, 4) + 1
ORDER BY 1;

--6.
SELECT to_char(START_DATE, 'yyyy') as "Year",
       count(*) as "Number of Employees"
FROM HR.JOB_HISTORY
Group by to_char(START_DATE, 'yyyy')
ORDER BY to_char(START_DATE, 'yyyy');

--7.
SELECT JOB_ID, to_char(avg(salary), '$99,999.99') as "Average Salary", count(*) as "Total"
FROM HR.EMPLOYEES
GROUP BY JOB_ID
Having avg(salary) > 10000 and
       count(*) > 1
ORDER BY JOB_ID;

--8.
SELECT REGION_NAME
FROM HR.REGIONS
Natural Join HR.COUNTRIES
WHERE country_name = 'Canada';

--9.
Select MANAGER_ID 
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID = 20
UNION
SELECT MANAGER_ID 
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID = 30
MINUS
SELECT MANAGER_ID 
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID = 50;

--10.
SELECT 'Advertising Team Member: ' || substr(FIRST_NAME, 1, 1) || '. ' ||
       LAST_NAME as "Initial and Last Name"
FROM HR.EMPLOYEES
WHERE substr(JOB_ID,1,2) = 'AD'
ORDER BY 1;

--11.
SELECT to_char(365.25 * 24 * 60 * 60, '999,999,999') as "Seconds in a year"
FROM DUAL;

--12.
SELECT to_char(to_date('20-JUL-2001 10:40:12', 'dd-MON-yy hh24:mi:ss') - 2, 'dd-Mon-yy hh24:mi:ss') as "Subtract 2 Days",
       to_char(to_date('20-JUL-2001 10:40:12', 'dd-MON-yy hh24:mi:ss') + .5, 'dd-Mon-yy hh24:mi:ss') as "Add Half a Day",
       to_char(to_date('20-JUL-2001 10:40:12', 'dd-MON-yy hh24:mi:ss') + 4.5/24, 'dd-Mon-yy hh24:mi:ss') as "Add 4 and a Half Hours"
FROM DUAL;

--13.
SELECT to_char(to_date('13-May-2015', 'dd-mon-yyyy'), 'Day') || ', ' || trim(to_char(to_date('13-May-2015', 'dd-mon-yyyy'), 'Month')) || ' ' || to_char(to_date('13-May-2015', 'dd-mon-yyyy'), 'YYYY') as "Formatted Current Date"
FROM DUAL;

--14.
SELECT ROUND(9.58348) AS "Answer 1",
       ROUND (9.58348,1) AS "Answer 1",
       ROUND (9.58348,4) AS "Answer 3",
       ROUND (9.58348,5) AS "Answer 2"
FROM DUAL;

--15.
SELECT FLOOR((to_date('2011-08-04', 'yyyy-MM-dd') - to_date('1865-12-04', 'yyyy-MM-dd')) /365) AS "Number of Years"
FROM dual;

--16.
SELECT LAST_DAY(SYSDATE) AS "Last Day of Month"
FROM DUAL;

--17.
SELECT COURSE_NO,
       DESCRIPTION,
       CASE cost
           WHEN 1095 THEN 'Low'
           WHEN 1595 THEN 'High'
           ELSE 'Medium'
       END AS "Category for Costs"
FROM student.course
ORDER BY "Category for Costs" ASC;

--18.

SELECT LAST_NAME, FIRST_NAME
FROM STUDENT.STUDENT
WHERE FIRST_NAME LIKE 'M%'
AND LAST_NAME LIKE 'M%'
ORDER BY LAST_NAME ASC;
