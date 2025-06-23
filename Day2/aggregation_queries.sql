-- To get average age of employees by city arranged in descending order
SELECT City, AVG(Age) AS average_age GROUP BY City ORDER BY average_age DESC;

-- To get the number pf employees by education level
SELECT Education, COUNT(*) AS employee_count FROM employees GROUP BY Education;

-- To find the average experience per city
SELECT City, AVG(ExperienceInCurrentDomain) AS average_experience FROM employees GROUP BY City;

-- To get how many employees were benched vs not benched
SELECT EverBenched, COUNT(*) AS COUNT FROM employees GROUP BY EverBenched;

-- To count # of employees grouped by gender and city arranged in descending order
SELECT Gender, City COUNT(*) AS total from employees GROUP BY Gender, City ORDER BY total DESC;

-- To get cities with more than 50 employees
SELECT City, COUNT(*) AS employee_count FROM employees GROUP BY City HAVING COUNT(*) > 50;

-- To get the average payment tier by city
SELECT City, AVG(PaymentTier) AS average_payment_tier FROM employees GROUP BY City;

-- To find the average age of employees by gender
SELECT Gender, AVG(Age) AS average_age FROM employees GROUP BY Gender;

-- To find which education level has the highest average experience
SELECT Education, AVG(ExperienceInCurrentDomain) AS average_experience FROM employees GROUP BY Education ORDER BY average_experience DESC LIMIT 1;

