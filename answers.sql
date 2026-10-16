
*Q1: Retrieve Payment Information*
SELECT checkNumber, paymentDate, amount
FROM payments;
*Q2: Find Orders in Process*
SELECT orderDate, requiredDate, status
FROM orders
WHERE status = 'In Process'
ORDER BY orderDate DESC;
*Q3: Find Sales Representatives*
SELECT firstName, lastName, email
FROM employees
WHERE jobTitle = 'Sales Rep'
ORDER BY employeeNumber DESC;
*Q4: Retrieve Office Information*
SELECT *
FROM offices;
*Q5: Retrieve the Five Cheapest Products*
SELECT productName, quantityInStock, MSRP
FROM products
ORDER BY MSRP ASC
LIMIT 5;
_If your Q5 says `buyPrice` instead of `MSRP`, just change that one word:_
SELECT productName, quantityInStock, buyPrice
FROM products
ORDER BY buyPrice ASC
LIMIT 5;
