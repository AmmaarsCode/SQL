/* Lab 12 Ammaar Anjum*/

--1.
CREATE VIEW open_items
AS
SELECT v.vendor_name, i.invoice_number, i.invoice_total, (i.invoice_total - i.payment_total - i.credit_total) balance_due
FROM vendors_copy v, invoices_copy i
WHERE v.vendor_id = i.vendor_id
AND i.invoice_total - i.payment_total - i.credit_total > 0
ORDER BY v.vendor_name;

--select *
--from open_items;


--2.
SELECT DISTINCT * 
FROM OPEN_ITEMS 
WHERE BALANCE_DUE >=1000
ORDER BY vendor_name;

--3.
CREATE VIEW open_items_summary AS
SELECT *
FROM   (
SELECT i.vendor_name, COUNT(i.invoice_total) open_item_count, SUM(balance_due) open_item_total
FROM open_items i
GROUP BY i.vendor_name) a
ORDER BY a.open_item_total DESC;


--Select * 
--from open_items_summary;

--4.
SELECT * 
FROM open_items_summary 
WHERE rownum < 6;

--5.

CREATE OR REPLACE VIEW VENDOR_ADDRESS AS SELECT VENDOR_ID, VENDOR_ADDRESS1, VENDOR_ADDRESS2, VENDOR_CITY, VENDOR_STATE, VENDOR_ZIP_CODE
FROM vendors_copy;

select * 
from vendor_address;

--6.
SELECT *
FROM VENDOR_ADDRESS 
where VENDOR_ID = 4;

UPDATE VENDOR_ADDRESS 
set VENDOR_ADDRESS2 = 'Ste 260', VENDOR_ADDRESS1 = REPLACE(VENDOR_ADDRESS1,'Ste 260','')
where vendor_id = 4;

SELECT VENDOR_ADDRESS2 FROM VENDOR_ADDRESS;
