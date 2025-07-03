-- TO get a list of unique cities without duplicates
SELECT DISTINCT City FROM employees;

-- To get the number of employees in each city
SELECT City, COUNT(*) FROM employees GROUP BY City;

-- To count how many times each unique city and education occurs
SELECT City, Education, COUNT(*) AS total FROM employees GROUP BY City, Education ORDER BY total DESC;

-- List all distinct ages of benched employees
SELECT DISTINCT Age FROM employees WHERE EverBenched = 'Yes' ORDER BY Age;

-- Comparing average age of benched vs not benched
SELECT EverBenched, AVG(Age) AS avg_age FROM employees GROUP BY EverBenched;

-- Distinct education levels of people who left
SELECT DISTINCT Education WHERE FROM employees LeaveOrNot = 1;

-- Count how many people of each gender were benched
SELECT Gender, COUNT(*) AS total_benched FROM employees WHERE EverBenched = 'Yes' GROUP BY Gender;

-- To find combinations of Gender and Education where attrition is high
SELECT Gender, Education,
  COUNT(*) FILTER (WHERE LeaveOrNot = 1) * 100.0 / COUNT(*) AS attrition_rate
FROM employees
GROUP BY Gender, Education
HAVING COUNT(*) > 10
ORDER BY attrition_rate DESC;

-- Cities with atleast 5 benched employees
SELECT City, COUNT(*) AS benched_count
FROM employees
WHERE EverBenched = 'Yes'
GROUP BY City
HAVING COUNT(*) >= 5;

