-- Gender-wise attrition ratio per education level
SELECT Gender, Education,
  COUNT(*) FILTER (WHERE LeaveOrNot = 1) * 100.0 / COUNT(*) AS attrition_rate
FROM employees
GROUP BY Gender, Education;

-- Experience distribution for each payment tier
SELECT PaymentTier, MIN(ExperienceInCurrentDomain), MAX(ExperienceInCurrentDomain),
       AVG(ExperienceInCurrentDomain)
FROM employees
GROUP BY PaymentTier;

-- Cities with highest retention rate
SELECT City,
  COUNT(*) FILTER (WHERE LeaveOrNot = 0) * 100.0 / COUNT(*) AS retention_rate
FROM employees
GROUP BY City
ORDER BY retention_rate DESC

-- Highest average age by gender and education
SELECT Gender, Education, AVG(Age) AS avg_age
FROM employees
GROUP BY Gender, Education
ORDER BY avg_age DESC
LIMIT 5;
