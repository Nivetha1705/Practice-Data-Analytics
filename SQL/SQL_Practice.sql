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
