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

21.Return all customers with their order status, replacing missing order status values with a readable label.

SELECT c.first_name,c.last_name,c.COUNTry,
COALESCE(o.status, 'No Orders') AS ORDER_status,
o.total_amount
FROM customers AS c
left JOIN ORDERs AS o
on c.customer_id=o.customer_id
ORDER BY last_name;

22.Combine fulfilled and pending orders into one labeled result set.

SELECT order_id,customer_id,status,total_amount,'Fulfilled' AS urgency 
from orders
WHERE status IN ('shipped','delivered')
UNION ALL
SELECT ORDER_id,customer_id,status,total_amount,'Action Required' AS urgency
FROM orders
WHERE status='pending'
ORDER BY urgency,ORDER_id;

23.Rank all products by price across the entire catalog.

SELECT product_name,price, 
ROW_NUMBER() OVER(ORDER BY price DESC) AS price_rank
FROM products
ORDER BY price DESC;

24.Return the top customer by total spending using a subquery.

SELECT c.first_name,c.last_name,o.total_spent
FROM customers AS c
JOIN(SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id) AS o
on c.customer_id=o.customer_id
WHERE o.total_spent=(
  SELECT MAX(total_spent)
  FROM(
    SELECT customer_id,SUM(total_amount) AS total_spent
    FROM orders
    GROUP BY customer_id
  ) AS spending
);


25.For every customer, calculate order count, total spend, delivered spend, and assign a customer tier.

SELECT
    c.first_name,
    c.last_name,
    c.country,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent,
    CASE
        WHEN SUM(o.total_amount) > 1000 THEN 'VIP'
        WHEN SUM(o.total_amount) > 500 THEN 'Premium'
        ELSE 'Regular'
    END AS customer_tier,
    CASE
        WHEN COUNT(o.order_id) = 0 THEN 0
        ELSE SUM(
            CASE
                WHEN o.status = 'delivered' THEN o.total_amount
                ELSE 0
            END
        )
    END AS delivered_value
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name,
    c.country
ORDER BY total_spent DESC;

26.Rank customers by total spending and assign percentile-style tiers.

WITH customer_spending AS
(
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        c.country,
        SUM(o.total_amount) AS total_spent
    FROM customers c
    LEFT JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY
        c.customer_id,
        c.first_name,
        c.last_name,
        c.country
)

SELECT
    first_name,
    last_name,
    country,
    total_spent,
    NTILE(3) OVER (ORDER BY total_spent DESC NULLS LAST) AS spending_tier,
    PERCENT_RANK() OVER (ORDER BY total_spent ) AS percentile_rank
FROM customer_spending
ORDER BY total_spent DESC;

27.Use a CTE to find the highest-priced product in each category.

WITH highest_priced AS(
  SELECT category_id,
  MAX(price) AS MAX_price
  FROM products
  GROUP BY category_id
)
SELECT p.product_name,c.category_name,p.price
FROM products p
JOIN highest_priced h on p.category_id = h.category_id AND p.price=h.MAX_price
JOIN categories c on c.category_id=p.category_id
ORDER BY p.price DESC;

28.Rank products by price within their own category.

SELECT p.product_name,c.category_name,p.price AS price,
RANK() OVER(PARTITION BY c.category_id ORDER BY p.price DESC)AS price_rank
FROM products AS p
JOIN categories AS c
on c.category_id=p.category_id
ORDER BY category_name;

29.Return products priced above the average price of their own category.

SELECT p.product_name, c.category_name, p.price AS price
FROM products AS p
JOIN categories AS c
on c.category_id=p.category_id
WHERE price >(SELECT AVG(p2.price)
FROM products AS p2
WHERE p2.category_id=p.category_id)
ORDER BY c.category_name DESC,p.price DESC ;

30.Return the top 5 products by total revenue.

SELECT
  p.product_name,
  c.category_name,
  SUM(o.quantity) AS total_qty_sold,
  SUM(o.quantity * o.unit_price) AS total_revenue
FROM
ORDER_items AS o
JOIN products p on o.product_id=p.product_id
JOIN categories c on c.category_id=p.category_id
GROUP BY p.product_name, c.category_name,p.product_id
ORDER BY total_revenue DESC
LIMIT 5;


--SCHEMA - SCHOOL

1.Return the complete student roster from the students table.

SELECT * FROM students;

2.Return students who are majoring in Computer Science.

SELECT first_name,last_name,graduation_year
FROM students
WHERE major='Computer Science';

3.Return all courses ordered by credit hours from highest to lowest.

SELECT course_name, credits
FROM courses
ORDER BY credits DESC;

4.Return students who are expected to graduate in 2026.

SELECT first_name,last_name,major 
FROM students
WHERE graduation_year ='2026';

5.Count the total number of courses available.

SELECT COUNT(course_id) AS total_courses
FROM courses;

6.Calculate the average number of credits per course.

SELECT AVG(credits) AS average_credits
FROM courses;

7.Return students who enrolled after December 31, 2022.

SELECT first_name,last_name, enrollment_date
FROM students
WHERE enrollment_date > '2022-12-31'
ORDER BY last_name;

8.Return professors who work in the Computer Science department.

SELECT first_name,last_name,hire_date
FROM professors 
WHERE department='Computer Science';

9.Return students whose email addresses contain the university.edu domain.

SELECT first_name,last_name,email,major
FROM students
WHERE email LIKE '%university.edu'
ORDER BY last_name;

10.A department administrator wants to see which professors are teaching which courses. Show each professor name, department, and the courses they are responsible for. Order by professor last name, then course name.

SELECT p.first_name,p.last_name,p.department,c.course_name,c.credits
FROM professors AS p
JOIN courses AS c
on c.professor_id=p.professor_id
ORDER BY last_name;

11.The curriculum office wants to know how many different academic majors are represented in the student body. Write a query that lists each unique major offered — no duplicates. Exclude students who have not yet declared a major. Order alphabetically.

SELECT distinct major
FROM students
WHERE major IS NOT NULL
ORDER BY major;

12.The admissions department needs to identify students who enrolled during the 2022–2023 academic period for a program evaluation. Find all students whose enrollment_date falls within that range (inclusive). Show first name, last name, enrollment_date, and major. Order by enrollment_date, then last name.

SELECT first_name,last_name,enrollment_date,major
FROM students
WHERE enrollment_date BETWEEN '2022-01-01' AND '2023-12-31'
ORDER BY enrollment_date, last_name;

13.Academic advisors need to contact students who have not yet chosen a major so they can schedule advising sessions. Find all students whose major has not been declared (stored as NULL). Show first name, last name, and email.

SELECT first_name,last_name,email
FROM students
WHERE major IS NULL;

14.Return student names together with their enrolled courses and grades.

SELECT s.first_name, s.last_name, c.course_name, e.grade
FROM students AS s
JOIN enrollments AS e
on s.student_id=e.student_id
JOIN courses AS c
on c.course_id=e.course_id;

15.Count the number of students enrolled in each course.

SELECT c.course_name,COUNT(e.student_id) AS enrollment_count
FROM courses AS c
left JOIN enrollments AS e
on c.course_id=e.course_id
GROUP BY c.course_name
ORDER BY course_name;

16.Return courses with more than one student enrolled.

SELECT c.course_name,count(e.student_id) as enrollment_count
FROM courses AS c
JOIN enrollments AS e
on c.course_id=e.course_id
GROUP BY course_name
HAVING enrollment_count>1
ORDER BY course_name;

17.Return pairs of students who share the same graduation year.

SELECT
  s1.first_name AS student1_first,
  s1.last_name AS student1_last,
  s2.first_name AS student2_first,
  s2.last_name AS student2_last,
  s1.graduation_year AS graduation_year,
  s1.major AS major1,
  s2.major AS major2
FROM
  students s1
  JOIN students s2 ON s1.graduation_year = s2.graduation_year
  AND s1.student_id < s2.student_id
ORDER BY
  s1.graduation_year,
  s1.student_id;

 18.Return course count, total credits, and average credits per department.

SELECT department,
COUNT(course_id)as course_count,
SUM(credits)as total_credits, 
avg(credits) as avg_credits
FROM courses 
GROUP BY department
ORDER BY course_count DESC;

19.The student services team needs to identify students who have not yet registered for any courses — they may need outreach or academic advising. Find these students and show their first name, last name, and major.

SELECT s.first_name,s.last_name,s.major
FROM students AS s
left JOIN enrollments AS e
on s.student_id=e.student_id
WHERE e.enrollment_id IS NULL;

20.The admissions office wants to track enrollment trends over the years. Count how many students enrolled each year, extracted from their enrollment_date. Show enrollment_year and student_count ordered by year.

SELECT DATE_FORMAT(enrollment_date, '%Y') AS enrollment_year, 
COUNT(student_id) as student_count 
FROM students 
GROUP BY enrollment_year 
ORDER BY enrollment_year;