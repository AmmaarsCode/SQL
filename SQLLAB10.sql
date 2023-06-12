/* LAB 10 Ammaar Anjum*/



--1.
INSERT INTO invoices_Copy (
    invoice_id,
	vendor_id,
	invoice_number,
	invoice_date,
	invoice_total,
	payment_total,
	credit_total,
	terms_id,
    invoice_due_date,
    payment_date
)
VALUES (
    115,
	32,
	'AX-014-027',
	'1-May-2018',
	434.58,
	0.00,
	0.00,
	2,
	'31-May-2018',
    null
);


INSERT INTO invoices_copy (
    invoice_id,
	vendor_id,
	invoice_number,
	invoice_date,
	invoice_total,
	payment_total,
	credit_total,
	terms_id,
    invoice_due_date,
    payment_date
)
VALUES (
    116,
    32,
    'AX-014-031',
    '1-May-2018',
    555.58,
    0.00,
    0.00,
    1,
    '31-May-2018',
    null
);

--2.
SELECT *
FROM INVOICES_COPY
where invoice_id in (115, 116);


--3.
UPDATE vendors_copy
set default_account_number=403 
where default_account_number=400;

--4.
SELECT * 
FROM vendors_copy
WHERE default_account_number = 403;


--5.
UPDATE invoices_copy 
set terms_id = 3 
where terms_id = 2;

--6.
SELECT invoice_number, terms_id
FROM invoices_copy
WHERE terms_id = 3;

--7.

DELETE FROM invoices_copy 
WHERE INVOICE_ID= 112 or INVOICE_ID = 114;

--8.
SELECT invoice_id, invoice_number
FROM invoices_copy
WHERE invoice_id BETWEEN 100 AND 115; 

