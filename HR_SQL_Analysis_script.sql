USE hr_analytics_db;

-- Q1. What is the total number of employees currently registered in the organization?
SELECT COUNT(*) as total_employees
FROM employees;

-- Q2. How many employees currently have an "Active" employment status?
SELECT COUNT(*)
FROM employees
WHERE employment_status = 'Active';

-- Q3. What percentage of employees have left the company (resigned or terminated)?
SELECT ROUND(SUM(CASE
			WHEN employment_status IN ('Resigned', 'Terminated')
            THEN 1
            ELSE 0
            END
)/ COUNT(*) * 100.0,2) as attrition_rate
FROM employees;

-- Q4. What is the average salary across all employees?
SELECT ROUND(AVG(salary)) as avg_salary
FROM employees;

-- Q5. What is the average salary in each department, and which department pays the most?
SELECT d.department_name, ROUND(AVG(e.salary)) as avg_salary
FROM employees e
JOIN departments d
ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY avg_salary DESC;

-- Q6. What is the average salary across different job designations/roles?
SELECT designation, ROUND(AVG(salary)) as avg_salary
FROM employees
GROUP BY designation;

-- Q7. Average Performance Rating
SELECT ROUND(AVG(performance_rating),2) as avg_performance_rating
FROM performance;

-- Q8. Who are the employees with the highest performance ratings (top performers)?
SELECT e.employee_id, e.employee_name, p.performance_rating
FROM employees e
JOIN performance p
ON e.employee_id = p.employee_id
ORDER BY p.performance_rating DESC
LIMIT 10;

-- Q9. How is bonus amount distributed across employees?
SELECT CASE
		WHEN bonus <=10000 THEN '0-10000'
        WHEN bonus <=20000 THEN '10001-20000'
        WHEN bonus <=30000 THEN '20001-30000'
        WHEN bonus <=40000 THEN '30001-40000'
	ELSE'40001-50000'
    END as bonus_range,
COUNT(*) as employee_count
FROM performance
GROUP BY bonus_range
ORDER BY bonus_range;

-- Q10. How many employees work in each department?
SELECT d.department_name, COUNT(e.employee_id) as number_of_employees
FROM departments d
LEFT JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY number_of_employees DESC;

-- Q11. What is the distribution of male to female employees in the company?
SELECT gender, COUNT(*) as total_employees, ROUND((COUNT(*)/(SELECT COUNT(*) FROM employees)) *100,2) as percentage
FROM employees
GROUP BY gender;

-- Q12. Which age group has the highest concentration of employees?
SELECT CASE
		WHEN age BETWEEN 20 AND 29 THEN '20-29'
        WHEN age BETWEEN 30 AND 39 THEN '30-39'
        WHEN age BETWEEN 40 AND 49 THEN '40-49'
        ELSE '50-59'
        END as age_group,
        COUNT(*) as num_of_employees
FROM employees
GROUP BY age_group
ORDER BY age_group DESC;

-- Q13. On average, how long have employees been working at the company (based on hire date)?
SELECT ROUND(AVG(DATEDIFF(CURDATE(), hire_date))/ 365,2) as avg_tenure_years
FROM employees;

-- Q14. How many new employees were hired each month (hiring trend)?
SELECT DATE_FORMAT(hire_date, '%Y-%m') as hire_month, COUNT(*) as new_hires
FROM employees
GROUP BY hire_month
ORDER BY hire_month;

-- Q15. Which department offers the highest average salary?
SELECT d.department_name, ROUND(AVG(e.salary)) as avg_salary
FROM employees e
JOIN departments d
ON d.department_id = e.department_id
GROUP BY department_name
ORDER BY avg_salary DESC
LIMIT 1;

-- Q16. Which designation/job role earns the highest average salary?
SELECT designation, ROUND(AVG(salary)) as avg_salary
FROM employees
GROUP BY designation
ORDER BY avg_salary DESC
LIMIT 1;

-- Q17. Which employees are eligible for promotion based on high performance ratings?
SELECT e.employee_id, e.employee_name, p.performance_rating
FROM employees e
JOIN performance p
ON e.employee_id = p.employee_id
WHERE p.performance_rating > 4.5
ORDER BY p.performance_rating DESC;

-- Q18. How are performance ratings distributed across the company (how many employees fall in each rating range)?
SELECT CASE
		WHEN performance_rating <=1 THEN '0.0-1.0'
        WHEN performance_rating <=2 THEN '1.1-2.0'
        WHEN performance_rating <=3 THEN '2.1-3.0'
        WHEN performance_rating <=4 THEN '3.1-4.0'
        ELSE '4.1-5.0'
	END as perfomance_rating_range,
    COUNT(*) as num_of_employees
FROM performance
GROUP BY perfomance_rating_range
ORDER BY perfomance_rating_range;

-- Q19. How has the employee headcount grown over time (year/month-wise)?
SELECT YEAR(hire_date) as hire_year , COUNT(*) as employees_hired
FROM employees
GROUP BY hire_year
ORDER BY hire_year;

-- Q20. How many employees are based in each city?
SELECT city, COUNT(*) as num_of_employees
FROM employees
GROUP BY city
ORDER BY num_of_employees DESC;

-- Q21. Which department has the highest attrition rate?
SELECT d.department_name, 
ROUND(SUM((CASE
	WHEN employment_status IN ('Resigned', 'Terminated')
    THEN 1 ELSE 0 END))/ COUNT(*) * 100,2) as attrition_rate
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY attrition_rate DESC;

-- Q22. What does the overall workforce summary look like (total headcount, active employees, attrition rate,
-- average salary, average rating — all in, one view)?
SELECT 
		(SELECT COUNT(*) FROM employees) as total_headcount,
        (SELECT COUNT(*) FROM employees WHERE employment_status = 'Active') as active_employees,
        (SELECT ROUND(SUM(CASE WHEN employment_status IN ('Terminated', 'Resigned') THEN 1 ELSE 0 END)/COUNT(*) *100,2) FROM employees) as attrition_rate,
        (SELECT ROUND(AVG(salary)) FROM employees) as average_salary,
        (SELECT ROUND(AVG(performance_rating),2) FROM performance) as average_rating;