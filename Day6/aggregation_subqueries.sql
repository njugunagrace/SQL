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
SELECT City, Education FROM (
  SELECT City, Education, COUNT(*) AS edu_count,
         RANK() OVER (PARTITION BY City ORDER BY COUNT(*) DESC) AS rnk
  FROM employees
  GROUP BY City, Education
) sub WHERE rnk = 1;

-- Cities with the more than 10 female employees who left
SELECT City, COUNT(*) AS female_left
FROM employees
WHERE Gender = 'Female' AND LeaveOrNot = 1
GROUP BY City
HAVING COUNT(*) > 10;

-- Average experience of employees who stayed, per education level
SELECT Education, AVG(ExperienceInCurrentDomain) AS avg_exp
FROM employees
WHERE LeaveOrNot = 0
GROUP BY Education;

-- Highest experienced employee per city
SELECT * FROM employees e
WHERE ExperienceInCurrentDomain = (
  SELECT MAX(ExperienceInCurrentDomain) FROM employees e2 WHERE e2.City = e.City
);

-- No. of distinct education levels per city
SELECT City, COUNT(DISTINCT Education) AS distinct_education_levels
FROM employees
GROUP BY City;
