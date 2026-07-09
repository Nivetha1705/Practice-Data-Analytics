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