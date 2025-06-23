-- To view all employees
SELECT * FROM employees;

-- To view just a few records
SELECT * FROM employees LIMIT 5;

-- Count the number of employees
SELECT COUNT(*) AS total_employees FROM employees;

-- Get unique values in the 'City' column
SELECT DISTINCT City FROM employees;

-- Find all employees who are from 'New York'
SELECT * FROM employees WHERE City = 'New York';

-- Find all employees who are older than 30
SELECT * FROM employees WHERE Age > 30;

-- Find employees who have benched before 
SELECT * FROM employees WHERE EverBenched = 'Yes';

-- To get the gender distribution of employees. This query groups all rows by the Gender column, counting how many employees are in each gender category
SELECT Gender, Count(*) AS COUNT FROM employees GROUP BY Gender;

-- To get how many employees stayed vs those who stayed
SELECT LeaveOrNot, COUNT(*) AS COUNT FROM employees GROUP BY LeaveOrNot;

-- To sort employees by their age oldest first
SELECT * FROM employees ORDER BY Age DESC;
