-- TO get a list of unique cities without duplicates
SELECT DISTINCT City FROM employees;

-- To get the number of employees in each city
SELECT City, COUNT(*) FROM employees GROUP BY City;

-- To count how many times each unique city and education occurs
SELECT City, Education, COUNT(*) AS total FROM employees GROUP BY City, Education ORDER BY total DESC;
