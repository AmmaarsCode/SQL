/* Ammaar Anjum Lab 14*/

--1.
SET SERVEROUTPUT ON;

DECLARE
CURSOR invoices_cursor IS
SELECT vendor_name, invoice_number, invoice_total - payment_total - credit_total AS balance_due
FROM ap.vendors v JOIN ap.invoices i
ON v.vendor_id = i.vendor_id
WHERE invoice_total - payment_total - credit_total >= 5000
ORDER BY balance_due DESC;
invoice_row ap.invoices%ROWTYPE;
BEGIN
FOR invoice_row IN invoices_cursor LOOP   
DBMS_OUTPUT.PUT_LINE(TO_CHAR(invoice_row.balance_due, '$99,999.99') || ' ' || invoice_row.invoice_number || ' ' ||
invoice_row.vendor_name);
END LOOP;
END;
/

--2.
SET SERVEROUTPUT ON;

VARIABLE min_balance_due NUMBER;
BEGIN
:min_balance_due := &min_balance_due;
END;

DECLARE
CURSOR invoices_cursor IS
SELECT vendor_name, invoice_number, invoice_total - payment_total - credit_total AS balance_due
FROM ap.vendors v JOIN ap.invoices i
ON v.vendor_id = i.vendor_id
WHERE invoice_total - payment_total - credit_total >= :min_balance_due
ORDER BY balance_due DESC;
invoice_row ap.invoices%ROWTYPE;
BEGIN
DBMS_OUTPUT.PUT_LINE('Invoice amounts greater than or equal to' || ' ' || (TO_CHAR(:min_balance_due, '$99,999.99')));
DBMS_OUTPUT.PUT_LINE('===========================');
FOR invoice_row IN invoices_cursor LOOP   
DBMS_OUTPUT.PUT_LINE(TO_CHAR(invoice_row.balance_due, '$99,999.99') || ' ' || invoice_row.invoice_number || ' ' ||
invoice_row.vendor_name);
END LOOP;
END;
/

