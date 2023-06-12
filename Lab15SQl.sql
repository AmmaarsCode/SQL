/*Ammaar Anjum Lab 15*/


--1.
CREATE OR REPLACE trigger Lab15Trigger1
AFTER delete on employee_copy

BEGIN 

Insert into employee_copy values
(
    5,
    'Jack', 
    2000,
    'Engineer'
);

end;
/

delete from employee_copy 
where employee_id = 2;


--2.
ALTER TRIGGER Lab15Trigger1 DISABLE;

--3.
Create or replace Trigger Lab15Trigger2
BEFORE DELETE 
ON employee_copy

DECLARE 
    counter NUMBER;
BEGIN
    select count(*) into counter
    FROM employee_copy;
    if (counter < 20) THEN
     raise_application_error(-20101, 'At least 20 rows in employee_copy table');
end if;
end;
/
 
