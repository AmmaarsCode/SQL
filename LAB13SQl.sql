/* Ammaar Anjum Lab 13 */

--1.
declare
num number;
begin
num := 10;
dbms_output.put_line('The value is: ' || num);
end;
/

--2.
declare
total number;
begin
select count(*) into total 
from student.student;
dbms_output.put_line('Total number of students in student table: ' || total);
end;
/

--3.

SET SERVEROUTPUT ON
DECLARE 
salary_stella NUMBER; 
title_stella VARCHAR2(10);

BEGIN

SELECT salary, title INTO salary_stella, title_stella
FROM student.employee
WHERE NAME = 'Stella';
DBMS_OUTPUT.put_line('Stella is ' || title_stella || ' and has a salary of ' || salary_stella ||' .');
end;
/

--4.
SET SERVEROUTPUT ON
declare
  min_invoice_total ap.invoices.invoice_total%TYPE;
  max_invoice_total ap.invoices.invoice_total%TYPE;
begin
   SELECT MIN(invoice_total), MAX(invoice_total)  INTO min_invoice_total,max_invoice_total
   FROM ap.invoices;
   DBMS_OUTPUT.put_line(REGEXP_REPLACE('The lowest invoice total is' || to_char(min_invoice_total, '$999,999.00') || ' and the highest invoice total is ' || to_char(max_invoice_total, '$999,999.00')  || '.', ' +', ' ')); 
end;
/

--5.
SET SERVEROUTPUT ON;
declare
  first_due DATE;
  latest_date DATE;
  datevar DATE;
begin
   datevar := '19-July-2014';
   SELECT MIN(invoice_due_date), MAX(invoice_due_date)
   INTO first_due, latest_date
   FROM ap.invoices
   WHERE invoice_total - payment_total - credit_total > 0;
   IF latest_date >= datevar THEN
   DBMS_OUTPUT.put_line('The latest due date is overdue! ' || latest_date);
   ELSE
     DBMS_OUTPUT.put_line('Ok');
   end if;
end;
/

--6.
SET SERVEROUTPUT ON;

DECLARE
  terms_id_var NUMBER;
  states_id_var VARCHAR2(10);
  
BEGIN
  SELECT customer_id, customer_state 
  INTO terms_id_var, states_id_var
  FROM om.customers
  WHERE customer_id = 15;

CASE states_id_var

  WHEN 'WI' THEN
    DBMS_OUTPUT.put_line('Cold Winters');
  WHEN 'CA' THEN
    DBMS_OUTPUT.put_line('Moderate Winters');
  ELSE
  DBMS_OUTPUT.put_line('No');
  END CASE;
END;
/


--7.
SET SERVEROUTPUT ON;
DECLARE
i INTEGER;
BEGIN
  FOR i IN 1..3 LOOP
     DBMS_OUTPUT.put_line('i: ' || i);
  END LOOP;
END;
/

SET SERVEROUTPUT ON;
DECLARE
i INTEGER := 1;

BEGIN
  While i < 4 LOOP
     DBMS_OUTPUT.put_line('i: ' || i);
     i := i + 1;
  END LOOP;
END;
/

SET SERVEROUTPUT ON;
 DECLARE
 i INTEGER := 3;
BEGIN
LOOP
   DBMS_OUTPUT.put_line('i: ' || i);
   i := i - 1;
   EXIT WHEN i = 0;
END LOOP;
END;
/

--8.
SET SERVEROUTPUT ON
DECLARE 
salary_sally NUMBER; 
title_sally VARCHAR2(10);

BEGIN

SELECT salary, title
INTO salary_sally, title_sally
FROM student.employee
WHERE NAME = 'Sally';
DBMS_OUTPUT.put_line('Sally is ' || title_sally || ' and has a salary of ' || salary_sally ||' .');
exception
  WHEN NO_DATA_FOUND THEN
 DBMS_OUTPUT.put_line('NO EMPLOYEE FOUND WITH THE NAME SALLY');
end;
/


