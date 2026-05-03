-- ============================================
-- PASO 3: LEFT JOIN
-- Devuelve TODOS los empleados
-- Si no tienen departamento, las columnas de departments son NULL
-- ============================================

SELECT  e.employee_id, e.first_name, e.last_name, d.department_name, d.location
FROM rrhh_employees e
LEFT JOIN rrhh_departments d 
    ON e.department_id = d.department_id;

-- Encontrar empleados SIN departamento asignado
-- LEFT "JOIN" + WHERE IS NULL
-- ============================================

SELECT e.employee_id, e.first_name, e.last_name, e.employment_type
FROM rrhh_employees e
LEFT JOIN rrhh_departments d 
    ON e.department_id = d.department_id 
WHERE d.department_id IS NULL;

-- ============================================
-- PASO 4: SELF-JOIN
-- Empleados con el nombre de su manager
-- usamos la misma tabla DOS veces
-- e = empleado / m = manager
-- ============================================

SELECT e.employee_id, 
e.first_name        AS empleado_nombre,
e.last_name         AS empleado_apellido,
m.first_name        AS manager_nombre,
m.last_name         AS manager_apellido
FROM rrhh_employees e
LEFT JOIN rrhh_employees m
    ON e.manager_id = m.employee_id;

-- ============================================
-- PASO 5: JOIN DE 3 TABLAS
-- Empleado + su departamento + su salario actual
-- encadenamos un JOIN tras otro
-- ============================================

SELECT e.employee_id, e.first_name, e.last_name, d.department_name, d.location, s.base_salary, s.currency
FROM rrhh_employees e
INNER JOIN rrhh_departments d
    ON e.department_id = d.department_id
INNER JOIN rrhh_salaries s
    ON e.employee_id = s.employee_id
ORDER BY s.base_salary DESC;