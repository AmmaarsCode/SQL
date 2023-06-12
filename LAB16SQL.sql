/* Ammaar Anjum Lab 16*/

--1.
CREATE OR REPLACE FUNCTION get_balance_due
(
    invoice_id_param NUMBER
)
RETURN NUMBER 
AS 
    balance_due_var NUMBER;
BEGIN 
    SELECT invoice_total - payment_total - credit_total AS balance_due 
    INTO balance_due_var 
    FROM ap.invoices
    where invoice_id = invoice_id_param;
    return balance_due_var;  
end;
/

--2.
SELECT get_balance_due(30)
FROM ap.invoices;


--3.
CREATE OR REPLACE PROCEDURE update_employee
(
    employee_id_param VARCHAR2,
    salary_param NUMBER
)
AS
BEGIN 
    if (salary_param < 0) THEN 
    raise_application_error(-20555, 'sorry, salary is not valid');
END if; 

    UPDATE employee_copy
    set salary = salary_param
    where employee_id = employee_id_param;
    
END;
/

--4.
EXECUTE update_employee(3, 7000);    

EXECUTE update_employee(3, -10000);    