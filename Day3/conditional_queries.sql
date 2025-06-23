-- Identify employees at risk of leaving based on ever benched status and leave status
SELECT *,
  CASE
    WHEN EverBenched = 'Yes' AND LeaveOrNot = 1 THEN 'High Risk'
    WHEN EverBenched = 'Yes' AND LeaveOrNot = 0 THEN 'Moderate Risk'
    WHEN EverBenched = 'No' AND LeaveOrNot = 1 THEN 'Low Risk'
    ELSE 'No Risk'
  END AS RiskLevel
FROM employees;

-- Assigning salary category based on PaymentTier
SELECT *,
  CASE
    WHEN PaymentTier = 1 THEN 'Low'
    WHEN PaymentTier = 2 THEN 'Medium'
    WHEN PaymentTier = 3 THEN 'High'
    ELSE 'Unknown'
  END AS salary_category
FROM employees;

-- Counting how many employees left in each city and arrange in descending order
SELECT City, COUNT(*) AS left_count FROM employees WHERE LeaveOrNot = 1 GROUP BY City ORDER BY left_count DESC;

-- Gender wise attrition analysis
SELECT Gender, COUNT(*) FILTER (WHERE LeaveOrNot = 1) * 100 / COUNT(*) AS attrition_rate FROM employees GROUP BY Gender;

-- Cities with highest average domain experience
SELECT City, AVG(ExperienceInCurrentDomain) AS average_experience FROM employees GROUP BY City ORDER BY average_experience DESC LIMIT 5;

-- This is a subquery to list employees from cities where average age is above 30
SELECT * FROM employees WHERE City IN (
  SELECT City FROM employees GROUP BY City HAVING AVG(Age) > 30
);

-- Listing employees over 35 who were benched and still stayed
SELECT * FROM employees WHERE Age > 35 AND EverBenched = 'Yes' AND LeaveOrNot = 0;

-- Finding employees with more than 5 years of experience in their current domain
SELECT * FROM employees WHERE ExperienceInCurrentDomain > 5;

-- Identifying employees who joined after 2015 and are in the high payment tier
SELECT * FROM employees WHERE JoiningYear > '2015' AND PaymentTier = 3;
