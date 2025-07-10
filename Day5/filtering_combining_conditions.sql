-- Employees ages between 30 and 40
SELECT * FROM employees WHERE Age BETWEEN 30 AND 40;

-- Employees in either Bangalore or pune
SELECT * FROM employees WHERE City IN ('Bangalore', 'Pune');

-- Employees who are benched and older than 35
SELECT * FROM employees WHERE EverBenched = 'Yes' AND Age > 35;

-- Employees not benched or younger than 30
SELECT * FROM employees WHERE EverBenched = 'No' OR Age < 30;

-- Employees with null experience in current domain
SELECT * FROM employees WHERE ExperienceInCurrentDomain IS NULL;

-- Employees who left, from cities with with names starting with M
SELECT * FROM employees WHERE LeaveOrNot = 1 AND City LIKE 'M%';

-- Employees who stayed and are in Tier 2 or 3
SELECT * FROM employees WHERE LeaveOrNot = 0 AND PaymentTier IN (2, 3);

-- Youngest employee 
SELECT * FROM employees WHERE Age = (SELECT MIN(Age) FROM employees);

-- Employees who are not male
SELECT * FROM employees WHERE Gender != 'Male';

-- Employees with non-null and more than 5 years of experience
SELECT * FROM employees WHERE ExperienceInCurrentDomain IS NOT NULL AND ExperienceInCurrentDomain > 5;