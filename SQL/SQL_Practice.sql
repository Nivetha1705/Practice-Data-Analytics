-- SQL Practice Questions
-- This file contains all my SQL practice problems and solutions

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
