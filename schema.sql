CREATE TABLE departments(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE roles(
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE employees(
  id SERIAL PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  department_id INTEGER,
  role_id INTEGER,
  manager_id INTEGER,
  salary DECIMAL(10, 2) NOT NULL,
  start_date DATE DEFAULT CURRENT_DATE,

  FOREIGN KEY (department_id) REFERENCES departments(id) ON DELETE SET NULL, 
  FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE SET NULL,
  FOREIGN KEY (manager_id) REFERENCES employees(id) ON DELETE SET NULL
);

CREATE INDEX idx_employees_start_date ON employees(start_date);
CREATE INDEX idx_employees_department ON employees(department_id);
CREATE INDEX idx_employees_name ON employees(name);
CREATE INDEX idx_employees_salary ON employees(salary DESC);


INSERT INTO departments (name)
VALUES ('engineering'),('marketing'),('hr'),('sales'),('finance');

INSERT INTO roles (name)
VALUES ('analyst'),('engineer'),('manager'),('specialist'),('coordinator');

-- Insert employees without manager_id
INSERT INTO employees (name, department_id, role_id, salary, start_date) VALUES
  ('Amanda Hughes', 1, 1, 92273.81, '2023-03-17'),  
  ('Alexa Livingston', 2, 2, 84993.13, '2021-02-13'), 
  ('David Parks', 3, 1, 92073.05, '2020-07-11'),      
  ('Douglas Gonzales', 3, 2, 110067.02, '2017-01-16'),
  ('Jack Smith', 4, 2, 87016.08, '2022-04-03'),        
  ('Marie Taylor', 2, 2, 60763.41, '2022-12-26'),      
  ('Scott Chavez', 4, 2, 71349.22, '2021-04-30'),      
  ('Chase Myers', 2, 2, 98958.76, '2023-11-09'),       
  ('Vincent Henderson', 3, 3, 53886.59, '2017-10-21'), 
  ('Richard Taylor', 2, 4, 89678.20, '2022-02-06'),    
  ('Hannah Rodgers', 5, 2, 94025.49, '2022-03-04'),    
  ('Anthony Duke', 3, 4, 71759.69, '2015-03-28'),      
  ('Lisa Harris', 4, 4, 56459.14, '2021-04-04'),       
  ('Hannah Stevens', 3, 2, 64883.88, '2017-12-19'),    
  ('Luis Hopkins', 5, 5, 56527.20, '2019-05-17'),      
  ('Arthur Murphy', 1, 3, 99242.22, '2016-12-25'),     
  ('Sharon Ford', 5, 1, 54675.42, '2023-10-29'),       
  ('Kristina Leblanc', 1, 2, 77169.46, '2015-05-26'),   
  ('Rebecca Floyd', 1, 5, 117010.95, '2016-07-16'),    
  ('Steven Jones', 2, 2, 111583.03, '2018-04-13'),     
  ('Kristine Wilson', 1, 3, 102958.00, '2018-02-07'),  
  ('Dylan Robinson', 3, 3, 58278.81, '2019-02-14'),    
  ('Matthew Carlson', 5, 5, 96571.99, '2017-04-19'),   
  ('Jesse Kennedy', 3, 5, 64976.05, '2023-02-08'),     
  ('Phillip Johnson', 1, 2, 66778.17, '2018-01-23'),   
  ('David Pugh', 1, 1, 56968.57, '2020-07-24'),      
  ('Tammy Johnson', 5, 2, 63109.79, '2022-12-14'),     
  ('Derek Trujillo', 5, 1, 72242.68, '2020-11-02'),    
  ('Renee Chan', 3, 4, 68429.08, '2021-10-25'),       
  ('Nicolas Willis', 5, 3, 59259.04, '2018-10-18'),    
  ('Brandon Hodges', 1, 1, 72549.15, '2015-07-16'),    
  ('Scott Curtis', 2, 1, 98900.59, '2015-04-24'),      
  ('Steven Valencia', 5, 3, 98523.14, '2017-03-19'),   
  ('Charles Carney', 5, 4, 75400.26, '2020-12-05'),    
  ('Jesse Jackson', 2, 3, 111750.01, '2023-08-23'),    
  ('Alicia Atkinson', 1, 2, 101409.00, '2018-09-09'),  
  ('David Nixon', 4, 3, 81440.61, '2020-06-25'),       
  ('Anthony Jenkins', 1, 4, 100366.08, '2022-09-09'),  
  ('Jessica Walker', 2, 1, 58311.79, '2019-06-08'),    
  ('Melissa Williams', 5, 1, 50851.82, '2017-05-06'),  
  ('Micheal Lee', 1, 3, 102325.22, '2017-01-22'),      
  ('Stephanie Martinez DVM', 3, 3, 88810.18, '2018-07-05'), 
  ('Jason Kramer', 4, 2, 79069.59, '2023-02-14'),      
  ('Daniel Mays', 1, 5, 118336.30, '2019-11-23'),      
  ('Andrew Gomez', 2, 3, 75555.78, '2015-05-25'),      
  ('Michael Cooke', 1, 2, 65109.44, '2016-04-15'),     
  ('Miranda Hayes', 3, 3, 97148.61, '2015-08-07'),     
  ('Nicholas Wagner', 4, 5, 109957.08, '2020-11-29'),  
  ('Kyle Patel', 3, 3, 80898.81, '2024-03-03'),       
  ('William Warren', 3, 4, 75269.55, '2023-09-18');   


-- Update manager_id for each employee
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'David Pugh') WHERE name = 'Amanda Hughes'; 
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Luis Hopkins') WHERE name = 'Alexa Livingston';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'David Pugh') WHERE name = 'David Parks';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Dylan Robinson') WHERE name = 'Douglas Gonzales';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'David Pugh') WHERE name = 'Jack Smith';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Luis Hopkins') WHERE name = 'Marie Taylor';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Kristine Wilson') WHERE name = 'Scott Chavez';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Dylan Robinson') WHERE name = 'Chase Myers';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'William Warren') WHERE name = 'Vincent Henderson';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Kristine Wilson') WHERE name = 'Richard Taylor';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'David Pugh') WHERE name = 'Hannah Rodgers';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Kristine Wilson') WHERE name = 'Anthony Duke';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Kristine Wilson') WHERE name = 'Lisa Harris';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Dylan Robinson') WHERE name = 'Hannah Stevens';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Luis Hopkins') WHERE name = 'Luis Hopkins';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Kristine Wilson') WHERE name = 'Arthur Murphy';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Kristine Wilson') WHERE name = 'Sharon Ford';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'David Pugh') WHERE name = 'Kristina Leblanc';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Dylan Robinson') WHERE name = 'Rebecca Floyd';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'William Warren') WHERE name = 'Steven Jones';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Kristine Wilson') WHERE name = 'Kristine Wilson';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Dylan Robinson') WHERE name = 'Dylan Robinson';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'David Pugh') WHERE name = 'Matthew Carlson';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Kristine Wilson') WHERE name = 'Jesse Kennedy';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'David Pugh') WHERE name = 'Phillip Johnson';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Dylan Robinson') WHERE name = 'David Pugh';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Dylan Robinson') WHERE name = 'Tammy Johnson';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Dylan Robinson') WHERE name = 'Derek Trujillo';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Dylan Robinson') WHERE name = 'Renee Chan';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'William Warren') WHERE name = 'Nicolas Willis';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'David Pugh') WHERE name = 'Brandon Hodges';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Kristine Wilson') WHERE name = 'Scott Curtis';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Dylan Robinson') WHERE name = 'Steven Valencia';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Kristine Wilson') WHERE name = 'Charles Carney';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Kristine Wilson') WHERE name = 'Jesse Jackson';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'William Warren') WHERE name = 'Alicia Atkinson';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Kristine Wilson') WHERE name = 'David Nixon';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Dylan Robinson') WHERE name = 'Anthony Jenkins';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Luis Hopkins') WHERE name = 'Jessica Walker';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Luis Hopkins') WHERE name = 'Melissa Williams';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'David Pugh') WHERE name = 'Micheal Lee';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'David Pugh') WHERE name = 'Stephanie Martinez DVM';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Luis Hopkins') WHERE name = 'Jason Kramer';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Dylan Robinson') WHERE name = 'Daniel Mays';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'William Warren') WHERE name = 'Andrew Gomez';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Dylan Robinson') WHERE name = 'Michael Cooke';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Dylan Robinson') WHERE name = 'Miranda Hayes';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Kristine Wilson') WHERE name = 'Nicholas Wagner';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'Dylan Robinson') WHERE name = 'Kyle Patel';
UPDATE employees SET manager_id = (SELECT id FROM employees WHERE name = 'David Pugh') WHERE name = 'William Warren';
