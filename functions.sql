-- total number of employees in a specific department.
CREATE OR REPLACE FUNCTION get_employee_count_by_department(department_name VARCHAR)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
DECLARE
    employee_count INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO employee_count
    FROM employees e
    JOIN departments d ON e.department_id = d.id
    WHERE d.name = department_name
    RETURN employee_count;
END;
$$;

-- example usage
SELECT get_employee_count_by_department('engineering');

