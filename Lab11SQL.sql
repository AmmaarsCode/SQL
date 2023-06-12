
/* Lab 11 Ammaar Anjum */

--3.
CREATE TABLE members(
member_id int ,
first_name varchar(50),
last_name varchar(50),
address varchar(500),
city varchar(50),
state varchar(50),
phone char(12),
constraint members_pk primary key (member_id));

CREATE TABLE groups(
group_id int ,
group_name varchar(50),
constraint groups_pk primary key (group_id));

CREATE TABLE members_groups(
member_id int,
group_id int,
constraint members_groups_pk primary key (member_id,group_id),
constraint members_groups_fk1 foreign key (member_id) references members(member_id),
constraint members_groups_fk2 foreign key (group_id) references groups(group_id));

--4.
INSERT INTO members
VALUES (1, 'John', 'Smith', '334 Valencia St.', 'San Francisco',
'CA', '415-942-1901');
INSERT INTO members
VALUES (2, 'Jane', 'Doe', '872 Chetwood St.', 'Oakland', 'CA',
'510-123-4567');

INSERT INTO groups
VALUES (1, 'Book Club');
INSERT INTO groups
VALUES (2, 'Bicycle Coalition');

INSERT INTO members_groups
VALUES (1, 2);
INSERT INTO members_groups
VALUES (2, 1);
INSERT INTO members_groups
VALUES (2, 2);

SELECT M.last_Name, M.first_Name, G.group_name
From Members M
INNER JOIN members_groups MG on m.member_Id = mg.member_id
INNER JOIN Groups G on MG.Group_Id = G.group_Id;

--5.
CREATE SEQUENCE members_seq
START WITH 3
INCREMENT BY 1;

CREATE SEQUENCE groups_seq
START WITH 3
INCREMENT BY 1;

--6.
INSERT INTO Groups(group_id, group_name)
VALUES(groups_seq.NEXTVAL, 'SQL Club');

SELECT * 
FROM Groups;

--7.
ALTER TABLE Members 
ADD annual_dues number(5,2) default 52.50;
ALTER TABLE Members 
ADD payment_date date;


--8.
ALTER TABLE Groups
MODIFY group_name varchar2(50) NOT NULL UNIQUE;

