c-- SQL Practice Questions
-- This file contains all my SQL practice problems and solutions


--SCHEMEA - HR

1.Return the complete employee roster from the employees table.

SELECT * FROM employees;

2.Return each unique department name from the departments table.

SELECT department_name 
FROM departments;

3.Return employees earning more than $80,000.

SELECT first_name,last_name,salary
FROM employees
WHERE salary>80000;

4.List employees from highest salary to lowest salary.

SELECT first_name,last_name,salary
FROM employees
ORDER BY salary DESC;

5.Return employees assigned to the IT or Marketing departments.

SELECT first_name, last_name, department_id
FROM employees
WHERE department_id = 10 OR department_id=40;

6.Return employees who are not assigned to the IT department.

SELECT first_name, last_name, department_id
FROM employees
WHERE department_id != 10;

7.Return employees whose manager_id is NULL

SELECT first_name, last_name, manager_id
FROM employees
WHERE manager_id IS NULL;

8.Return the top 3 highest-paid employees.

SELECT first_name,last_name,salary FROM employees
ORDER BY salary DESC
LIMIT 3;

9.Count the total number of employees

SELECT COUNT(employee_id) AS total_employees
FROM employees;

10.Return the minimum and maximum salary values across all employees.

SELECT MIN(salary) AS MIN_salary, MAX(salary) AS max_salary
FROM employees;

11.Calculate the total salary expenditure across all employees.

SELECT SUM(salary) AS total_salary
FROM employees;

12.Calculate the average salary across all employees.

SELECT AVG(salary) AS average_salary
FROM employees;

13.Return employees whose first name starts with the letter A.

SELECT first_name, last_name FROM employees
WHERE first_name LIKE 'A%';

14.Return employees who work in the IT or HR department using the IN operator.

SELECT first_name,last_name,department_id
FROM employees
WHERE department_id IN(10,20);

15.Return employees with salaries between $60,000 and $90,000.

SELECT first_name,last_name,salary
FROM employees
WHERE salary BETWEEN 60000 AND 90000;

16.Build an employee summary report with readable alias names.

SELECT employee_id AS `Employee Number`,
  concat(first_name,' ',last_name) AS `Full Name`,
  salary AS `Annual Salary`,
  hire_date AS `Start Date`
FROM employees
ORDER BY salary DESC;

17.Create a single combined result set of employees and managers.

SELECT first_name, last_name, 'Employee' AS role
FROM employees
UNION
SELECT distinct m.first_name, m.last_name,'Manager' AS role
FROM employees e
JOIN employees m
on e.manager_id=m.employee_id
ORDER BY last_name ;

18.Return each employee with the name of their department.

SELECT e.first_name, e.last_name, d.department_name
FROM employees e
INNER JOIN departments d
on e.department_id=d.department_id;

19.Count employees in each department.

SELECT d.department_name,COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e
on e.department_id = d.department_id
GROUP BY department_name;

20.Return departments that currently have more than 1 employee.

SELECT d.department_name , COUNT(e.employee_id) AS employee_count
FROM employees e
JOIN departments d
on d.department_id = e.department_id
GROUP BY department_name
HAVING COUNT(e.employee_id)>1
ORDER BY department_name;

21.Return all departments and any employees currently assigned to them.

SELECT d.department_name,d.location,e.first_name,e.last_name
FROM employees AS e
RIGHT JOIN departments AS d
on d.department_id=e.department_id
ORDER BY department_name, first_name;

22.Return employees earning more than the average salary in their department.

SELECT e1.first_name, e1.last_name, e1.salary,d.department_name
FROM employees e1
JOIN departments d 
on e1.department_id = d.department_id
WHERE e1.salary > (SELECT AVG(e2.salary)
FROM employees e2
WHERE e2.department_id=e1.department_id)
ORDER BY salary DESC;

23.Return each employee with their full name, job title, and department name.

SELECT e.first_name,e.last_name,j.job_title,d.department_name
FROM employees e
JOIN jobs j
on e.job_id = j.job_id
JOIN departments d
on e.department_id=d.department_id
ORDER BY e.last_name;

24.Return each employee with their manager first name, using a readable fallback for employees without a manager.

SELECT
    e1.first_name,
    e1.last_name,
    COALESCE(e2.first_name, 'No Manager') AS manager_name
FROM employees e1
LEFT JOIN employees e2
ON e1.manager_id = e2.employee_id
ORDER BY e1.last_name;

25.Return employees hired on or after January 1, 2021 with their hire year.

SELECT first_name,last_name,hire_date, DATE_FORMAT(hire_date, '%Y') as hire_year
FROM employees
WHERE hire_date >= '2021-01-01'
ORDER BY hire_year;

26.Rank every employee by salary across the entire company.

SELECT first_name,last_name,salary, 
RANK() OVER(ORDER BY salary DESC) AS salary_rank
FROM employees
ORDER BY salary_rank;

27.Return the employee with the highest salary using a subquery with EXISTS.

SELECT e1.first_name, e1.last_name, e1.salary 
FROM employees e1
WHERE not EXISTS(
  SELECT 1 
  FROM employees e2
  WHERE e2.salary>e1.salary
)

28.Classify each employee as Senior, Mid-Level, or Junior based on salary and show their manager’s first name.

SELECT e.first_name,e.last_name, e.salary,
CASE 
WHEN e.salary >100000 THEN 'Senior'
WHEN e.salary >=70000 THEN 'Mid-Level'
ELSE 'Junior'
END AS level,
m.first_name as manager_name
FROM employees e
left JOIN employees m
on e.manager_id=m.employee_id
ORDER BY e.salary DESC;

29.Rank employees by salary within each department and show both rank and row position.

SELECT e.first_name, e.last_name, d.department_name, e.salary,
RANK() OVER(PARTITION BY e.department_id ORDER BY e.salary DESC) AS salary_Rank,
ROW_NUMBER() OVER(PARTITION BY e.department_id ORDER BY e.salary DESC)AS row_num
FROM employees AS e
JOIN departments AS d
on e.department_id=d.department_id
ORDER BY d.department_name,salary_rank;

30.Use a CTE to return the top earner in every department.

WITH employee_Rank AS(
SELECT e.first_name,e.last_name,d.department_name,e.salary,
RANK() OVER(PARTITION BY d.department_id ORDER BY salary DESC) AS salary_RANK
FROM employees AS e
JOIN departments AS d
on e.department_id = d.department_id)
SELECT first_name, last_name, department_name, salary
FROM employee_rank
WHERE salary_rank = 1;


--SCHEMEA - E-COMMERCE

1.Return the complete customer roster from the customers table.

SELECT customer_id,first_name,last_name,email,registration_date,city,Country
FROM customers;

2.Return products that cost more than $100.

SELECT product_name,price
FROM products
WHERE price>100;

3.Return all products ordered by price descending.

SELECT product_name, price
FROM products
ORDER BY price DESC;

4.Return customers from the USA.

SELECT first_name,last_name,city
FROM customers
WHERE Country = 'USA';

5.Count the total number of products.

SELECT COUNT(product_id) AS total_products
FROM products;

6.Calculate the average price across all products.

SELECT AVG(price) AS average_price
FROM products;

7.Return products that belong to the Electronics category.

SELECT product_name,price
FROM products
WHERE category_id=1;

8.Return orders with a delivered status.

SELECT ORDER_id,customer_id,total_amount
FROM orders
WHERE status='delivered'
ORDER BY total_amount DESC;

9.Return products with stock quantities greater than 50.

SELECT product_name, stock_quantity
FROM products
WHERE stock_quantity > 50;

10.Return June 2023 orders and calculate how many days ago each order was placed as of 2023-07-01.

SELECT order_id,customer_id,order_date,total_amount,status,
datediff('2023-07-01',order_date) AS days_ago
FROM orders
WHERE order_date>='2023-06-01' AND order_date<'2023-07-01'
ORDER BY order_date;

11.Return each unique country with at least one registered customer.

SELECT DISTINCT country FROM customers
ORDER BY country;

12.Return customers who registered between January 1 and March 31, 2023.

SELECT first_name,last_name,registration_date,country
FROM customers
WHERE registration_date BETWEEN '2023-01-01' AND '2023-03-31'
ORDER BY registration_date;

13.Return customers who have not provided their city.

SELECT first_name,last_name,email,registration_date 
FROM customers
WHERE city IS NULL;

14.Return customer names together with their order information.

SELECT c.first_name,c.last_name,o.ORDER_id,o.total_amount,o.status
FROM customers c
inner JOIN ORDERs o
on c.customer_id=o.customer_id
ORDER BY total_amount;

15.Count the number of orders per customer.

SELECT c.first_name,c.last_name, COUNT(o.ORDER_id) AS ORDER_count
FROM customers AS c
LEFT JOIN orders AS o
on c.customer_id = o.customer_id
GROUP BY c.customer_id
ORDER BY ORDER_count DESC;

16.Return products together with their category names.

SELECT p.product_name,c.category_name,p.price
FROM products AS p
JOIN categories AS c
on c.category_id=p.category_id;

17.Return categories with more than $200 in revenue.

SELECT c.category_name, 
SUM(o.quantity * o.unit_price) AS total_revenue
FROM categories AS c
JOIN products AS p
on c.category_id = p.category_id
JOIN ORDER_items AS o
on p.product_id=o.product_id
GROUP BY category_name
HAVING total_revenue>200
ORDER BY category_name;

18.Return products that have never appeared in any order.

SELECT p.product_name,p.price,p.stock_quantity
FROM products AS p
left JOIN ORDER_items AS o
on p.product_id=o.product_id
WHERE o.product_id IS NULL
ORDER BY p.price DESC;

19.Return non-Electronics products priced below the most expensive Electronics item.

SELECT p.product_name,p.price,c.category_name
FROM categories AS c
JOIN products AS p
on c.category_id = p.category_id
WHERE c.category_name <> 'Electronics' AND 
p.price < (SELECT 
AVG(p2.price)
FROM products AS p2
JOIN categories AS c2
on c2.category_id = p2.category_id
WHERE c2.category_name='Electronics')
ORDER BY p.price;

20.Return every order item with the customer name, category name, product name, quantity, and unit price.

SELECT
  c.first_name,
  c.last_name,
  cat.category_name,
  p.product_name,
  oi.quantity,
  oi.unit_price
FROM
  customers c
  JOIN orders o ON c.customer_id = o.customer_id
  JOIN order_items oi ON o.order_id = oi.order_id
  JOIN products p ON oi.product_id = p.product_id
  JOIN categories cat ON p.category_id = cat.category_id
ORDER BY
  c.last_name,
  cat.category_name;