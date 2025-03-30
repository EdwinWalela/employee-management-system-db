-- Retrieve a list of all employees, including their department and job role
SELECT 
e.name, d.name, r.name
FROM employees e
INNER JOIN departments d ON e.department_id = d.id
INNER JOIN roles r ON e.role_id = r.id;

-- Find employees who have been with the company for more than 5 years
SELECT 
    e.name AS employee_name, 
    d.name AS department_name, 
    r.name AS role_name, 
    e.start_date
FROM employees e
INNER JOIN departments d ON e.department_id = d.id
INNER JOIN roles r ON e.role_id = r.id
WHERE e.start_date <= CURRENT_DATE - INTERVAL '5 years';

-- Average salary for each department
SELECT 
    d.name AS department_name, 
    ROUND(AVG(e.salary), 2) AS average_salary
FROM employees e
INNER JOIN departments d ON e.department_id = d.id
GROUP BY d.name;

-- List employees who report to a specific manager.
SELECT 
    e.name AS employee_name, 
    d.name AS department_name, 
    r.name AS role_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.id
INNER JOIN roles r ON e.role_id = r.id
WHERE e.manager_id = (SELECT id FROM employees WHERE name = 'David Pugh');


-- Top 5 paid employees
SELECT 
    e.name AS employee_name, 
    d.name AS department_name, 
    r.name AS role_name, 
    e.salary
FROM employees e
INNER JOIN departments d ON e.department_id = d.id
INNER JOIN roles r ON e.role_id = r.id
ORDER BY e.salary DESC
LIMIT 5;
