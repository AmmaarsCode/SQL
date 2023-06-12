--1.
CREATE TABLE departments_copy AS
SELECT *
FROM EX.departments;

CREATE TABLE employees_copy AS
SELECT *
FROM EX.employees;


SELECT * FROM departments_copy;

SELECT * FROM employees_copy;



--2.  
    CREATE TABLE LOCATIONS (
    LOCATION_ID NUMBER NOT NULL,
    STREET_ADDRESS VARCHAR(50) NOT NULL, 
    CITY VARCHAR(50) NOT NULL, 
    STATE VARCHAR(50) NOT NULL, 
    ZIPCODE VARCHAR(50) NOT NULL,
    CONSTRAINT LOCATIONS_PK PRIMARY KEY (LOCATION_ID)
);






--3.
ALTER TABLE departments_copy
add location_id number(20) constraint location_id_fk REFERENCES locations(location_id);




--4.
INSERT INTO locations (
location_id, 
street_address, 
city, 
state, 
zipcode
)
VALUES (
12,
'15989 Josh St',
'Overland Park',
'Kansas',
66225
);

Insert into departments_copy (
department_number,
department_name,
location_id
)
values (
5,
'IT',
12
);



SELECT *
FROM DEPARTMENTS_COPY d
JOIN LOCATIONS l
ON d.LOCATION_ID = l.LOCATION_ID;

--5.
UPDATE employees_copy
SET FIRST_NAME = 'Ammaar',
    LAST_NAME = 'Anjum',
    DEPARTMENT_NUMBER = 5
WHERE employee_id = 8;

--6.
SELECT * 
FROM EMPLOYEES_COPY
WHERE EMPLOYEE_ID = 8;
    
  