-- Top 3 cities with the highest number of employees
SELECT City, COUNT(*) AS EmployeeCount  FROM employees
GROUP BY City
ORDER BY EmployeeCount DESC
LIMIT 3;

--Cities with average experience above overall average
SELECT City FROM employees  GROUP BY City
HAVING AVG(ExperienceInCurrentDomain) > (SELECT AVG(ExperienceInCurrentDomain) FROM employees);

-- Count of employees in each payment tier who left
SELECT PaymentTier, COUNT(*) AS EmployeeCount FROM employees
WHERE LeaveOrNot = 1
GROUP BY PaymentTier;

-- Average age by gender for benched employees
SELECT Gender, AVG(Age) AS avg_age FROM employees WHERE EverBenched = 'Yes' GROUP BY Gender;

-- Gender with the highest attrition rate
SELECT Gender, COUNT(*) FILTER (WHERE LeaveOrNot = 1) * 100.0 / COUNT(*) AS attrition_rate
FROM employees
GROUP BY Gender
ORDER BY attrition_rate DESC
LIMIT 1;

-- Most common education level per city
SELECT City, Education, COUNT(*) AS total
FROM employees
GROUP BY City, Education
ORDER BY total DESC
LIMIT 1;