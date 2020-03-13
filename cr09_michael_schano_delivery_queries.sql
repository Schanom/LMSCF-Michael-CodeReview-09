1.
SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = 'cr09_michael_schano_delivery';

2.
SELECT AVG(mail.weight) FROM mail;

3.
SELECT COUNT(*) date_id FROM dates WHERE dates.send_date >= '2020-03-01';

4.
SELECT first_name FROM employees WHERE last_name LIKE 'Schano';

5.
SELECT employees.employee_id, employees.first_name, employees.last_name, employees_info.salary, employees_info.department
FROM employees
LEFT JOIN employees_info on employees_info.fk_employee_id = employees.employee_id;

6.
SELECT customers.customer_id, customers.first_name, customers.last_name, payments.amount, payments.pay_date, locations.street, locations.street_number, locations.zip_code, locations.city, getter.getter_id, transportations.transportation_id
FROM customers
INNER JOIN payments ON customers.customer_id = payments.fk_customer_id
INNER JOIN locations ON customers.customer_id = locations.fk_customer_id
INNER JOIN getter ON customers.customer_id = getter.fk_customer_id
INNER JOIN transportations ON customers.customer_id = transportations.fk_customer_id;