/* LAB 12Z Ammaar Anjum*/

--1.
CREATE SEQUENCE primary_key_sequence
start with 1
increment by 1
minvalue 0
maxvalue 9999999
cycle;

--2.
CREATE TABLE BOAT (
ID NUMBER default primary_key_sequence.nextval PRIMARY KEY,
REGISTRATION_NUMBER VARCHAR2(50) NOT NULL UNIQUE,
NAME VARCHAR2(30) NOT NULL
);

CREATE TABLE CAPTAIN (
ID NUMBER default primary_key_sequence.nextval PRIMARY KEY,
FIRST_NAME VARCHAR2(20) NOT NULL,
LAST_NAME VARCHAR2(20) NOT NULL,
MOBILE_PHONE_NUMBER NUMBER NOT NULL
);

CREATE TABLE DESTINATION (
ID NUMBER default primary_key_sequence.nextval PRIMARY KEY,
NAME VARCHAR2(50) NOT NULL
);

CREATE TABLE TRIP (
ID NUMBER default primary_key_sequence.nextval PRIMARY KEY,
BOAT_ID NUMBER, CAPTAIN_ID NUMBER, DESTINATION_ID NUMBER, NUMBER_OF_GUESTS NUMBER NOT NULL,
FOREIGN KEY (BOAT_ID) REFERENCES BOAT(ID),
FOREIGN KEY (CAPTAIN_ID) REFERENCES CAPTAIN(ID),
FOREIGN KEY (DESTINATION_ID) REFERENCES DESTINATION(ID)
);

--3.
ALTER TABLE BOAT ADD CAPACITY NUMBER NOT NULL ADD REGISTRATION_EXP_DATE DATE NOT NULL;

ALTER TABLE CAPTAIN RENAME COLUMN mobile_phone_number TO phone_number;

ALTER TABLE trip ADD number_of_crew NUMBER NOT NULL ADD start_date DATE NOT NULL
ADD CONSTRAINT number_of_crew_check 
CHECK (number_of_crew >=0);

RENAME TRIP to trip_details;




--4.
INSERT INTO BOAT 
VALUES (DEFAULT, 'FL-12345', 'PRANCING SEA HORSE', 6, '31-DEC-19');
INSERT INTO BOAT
VALUES (DEFAULT, 'FL-54321', 'SLOW AND STADY', 11, '31-DEC-20');
INSERT INTO BOAT 
VALUES (DEFAULT, 'FL-10101', 'EAT MY BUBBLES', 3, '31-DEC-21');

INSERT INTO CAPTAIN 
VALUES (1, 'Becka', 'Swifterson', 1112221234); 
INSERT INTO CAPTAIN 
VALUES (DEFAULT, 'Birdy', 'Bold', 2223331234); 

INSERT INTO DESTINATION 
VALUES (DEFAULT, 'FANCY KEY');
INSERT INTO DESTINATION
VALUES (DEFAULT, 'FUN CAY');



insert into trip_details (boat_id,captain_id,destination_id,number_of_guests,number_of_crew,start_date)
select
(select id from boat where name = 'EAT MY BUBBLES'),
(select id from captain where first_name = 'Becka'),
(select id from destination where name = 'FUN CAY'),
2,
1,
sysdate+14
from dual;
commit;

--5. 
create view v_available_trips AS
SELECT d.name AS "DESTINATION", t.start_date AS "TRIP_LEAVES_ON", b.name AS "ON_BOAT", CONCAT(CONCAT(c.first_name, ' '),
      c.last_name) AS "WITH_CAPTAIN", b.capacity AS "max_number_of_guests" 
FROM trip_details t 
    join destination d 
        on t.destination_id = d.id
    join boat b
        on t.boat_id = b.id
    join captain c
        on t.captain_id = c.id;
        
--select *
--from  v_available_trips;


-6.
SELECT *
FROM boat
WHERE id NOT IN (
  SELECT boat_id
  FROM trip_details
);

SELECT *
FROM captain
WHERE id NOT IN (
  SELECT captain_id
  FROM trip_details
);                   
                    
                    
--7.
CREATE INDEX fk_boat_id_ix
ON trip_details(boat_id);

--8.
GRANT SELECT ON v_available_trips to public;

-9.
CREATE PUBLIC SYNONYM available_trips FOR v_available_trips;


--EXTRA


DROP TABLE trip_details;

DROP Table boat;

DROP TABLE captain;

DROP TABLE destination;

DROP VIEW v_available_trips;

DROP sequence primary_key_sequence;

DROP PUBLIC SYNONYM available_trips;

