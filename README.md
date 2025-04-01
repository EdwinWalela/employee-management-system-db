# Employee Management System Database

## Local setup

The database requires Postgres 13 and above



Load the schema (`schema.sql`) to a Postgres database

```bash
psql -f schemadump.sql -p port -U username dbname
```

Load the data using `queries.sql`

```bash
psql -f schemadump.sql -p port -U username dbname
```

Load stored functions using `funtions.sql`

```bash
psql -f schemadump.sql -p port -U username dbname
```

Alternatively, a live database can be accesed through a hosted DB (URL on request)


## Performance Optimization

Below are analyisis and optimization of sample queries

```sql
SELECT 
    e.name AS employee_name, 
    d.name AS department_name, 
    r.name AS role_name, 
    e.start_date
FROM employees e
INNER JOIN departments d ON e.department_id = d.id
INNER JOIN roles r ON e.role_id = r.id
WHERE e.start_date <= CURRENT_DATE - INTERVAL '5 years';
```

Addition of an index on the `start_date` column ensures look ups based on start date are performed efficiently

The following indexes improve joining efficiency. 


```sql
CREATE INDEX idx_employees_department ON employees(department_id);
```

To speed up lookups based on an employee's name

```sql
CREATE INDEX idx_employees_name ON employees(name);
```

To speed up lookups based on salary. Indexing the salary column ensures efficient look up when filtering based on salary.

```sql
CREATE INDEX idx_employees_salary ON employees(salary DESC);
```


Using ```EXPLAIN <SQL-query>``` shows the use of index-scans which are more efficient compared to sequential scans which go through the entire table while searching.