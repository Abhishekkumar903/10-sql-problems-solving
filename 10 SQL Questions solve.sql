CREATE DATABASE COMPANY1 
CREATE TABLE EMPLOYEE (
    Emp_id INT NOT NULL PRIMARY KEY,
    Emp_Name VARCHAR(20),
    Gender CHAR(10),
    Salary INT,
    City CHAR(20)
);
INSERT INTO EMPLOYEE (Emp_id, Emp_Name, Gender, Salary, City) VALUES
(2, 'Priya Singh', 'Female', 52000, 'Mumbai'),
(3, 'Aman Verma', 'Male', 47000, 'Chennai'),
(4, 'Nikita Jain', 'Female', 60000, 'Kolkata'),
(5, 'Suresh Kumar', 'Male', 39000, 'Delhi'),
(6, 'Anjali Mehta', 'Female', 58000, 'Bengaluru'),
(7, 'Ravi Patel', 'Male', 61000, 'Ahmedabad'),
(8, 'Kavita Joshi', 'Female', 47000, 'Jaipur'),
(9, 'Manish Tiwari', 'Male', 55000, 'Lucknow'),
(10, 'Meena Gupta', 'Female', 43000, 'Bhopal'),
(11, 'Vikas Dubey', 'Male', 49000, 'Patna'),
(12, 'Sneha Roy', 'Female', 51000, 'Kolkata'),
(13, 'Rajeev Ranjan', 'Male', 53000, 'Ranchi'),
(14, 'Pooja Agarwal', 'Female', 48000, 'Delhi'),
(15, 'Deepak Mishra', 'Male', 57000, 'Mumbai'),
(16, 'Ritu Sinha', 'Female', 62000, 'Noida'),
(17, 'Arjun Kapoor', 'Male', 50000, 'Hyderabad'),
(18, 'Nisha Pandey', 'Female', 46000, 'Nagpur'),
(19, 'Sanjay Sahu', 'Male', 44000, 'Kanpur'),
(20, 'Divya Thakur', 'Female', 63000, 'Chandigarh');

SELECT *FROM EMPLOYEE;
CREATE TABLE EMPLOYEE_DETAILS(
Emp_id int NOT NULL PRIMARY KEY,
Project varchar(20),
Emp_Postion char(10),
DOJ Date
);

INSERT INTO EMPLOYEE_DETAILS (Emp_id, Project, Emp_Postion, DOJ) VALUES
(1, 'Apollo', 'Manager', '2020-05-10'),
(2, 'Neptune', 'Tester', '2021-03-12'),
(3, 'Apollo', 'Analyst', '2019-11-01'),
(4, 'Zeus', 'Manager', '2018-08-20'),
(5, 'Neptune', 'Developer', '2022-01-15'),
(6, 'Apollo', 'Tester', '2020-12-05'),
(7, 'Titan', 'Lead', '2017-06-18'),
(8, 'Zeus', 'Analyst', '2019-02-25'),
(9, 'Apollo', 'Manager', '2021-09-09'),
(10, 'Neptune', 'Tester', '2020-04-22'),
(11, 'Titan', 'Developer', '2019-07-07'),
(12, 'Zeus', 'Lead', '2022-03-30'),
(13, 'Apollo', 'Tester', '2018-05-11'),
(14, 'Neptune', 'Analyst', '2021-01-19'),
(15, 'Zeus', 'Manager', '2023-02-01'),
(16, 'Apollo', 'Lead', '2020-06-17'),
(17, 'Titan', 'Tester', '2019-08-14'),
(18, 'Neptune', 'Developer', '2022-09-03'),
(19, 'Zeus', 'Analyst', '2023-06-12'),
(20, 'Titan', 'Manager', '2021-12-21');

SELECT * FROM EMPLOYEE_DETAILS;


--Q1 Find the list of employees where salary range between 20k to 30k 
Select * from Employee
Where salary between 20000 And 50000;

 SELECT * FROM Employee
WHERE Salary > 20000 And Salary < 50000;

--Q2 Write a query to retrieve the list of employee from the same city
SELECT E1.Emp_id, E1.Emp_Name, E1.City
FROM Employee E1, Employee E2
WHERE E1.City = E2.City AND E1.Emp_id != E2.Emp_id;

--Q3Query to find the null value in the Employee table 

SELECT * FROM Employee 
WHERE Emp_id IS NULL;

--Q4 Query to find the Cumulative Sum of Employee salary
SELECT Emp_id, Salary, 
       SUM(Salary) OVER (ORDER BY Emp_id) AS Cumulative_Sum
FROM Employee;

--Q5what is the Male And Female Employee Ratio 

SELECT 
(COUNT(*) FILTER (WHERE gender = 'Male') * 100.0/COUNT(*)),
(COUNT(*) FILTER (WHERE gender = 'Female') * 100.0/COUNT(*))
FROM EMPLOYEE;


--Q6 Write a query to fetch 50% records from the Employee table 

SELECT * FROM EMPLOYEE 
WHERE EmP_id <= (SELECT COUNT(EmP_id)/2 FROM EMPLOYEE);

--Q7 write a query to fatch the employee's salary but replace the last 2 digit with 'xx' i.e 12345 will be 123xx,
--Use two concept  1  CONCAT , 2  SUBSTRING
--CONCET Example
SELECT CONCAT (Emp_Name,' ',Salary)
from Employee

--SUBSTRING Example
SELECT Salary , Substring (Salary:: text,1,length(salary ::text)-2 )
from Employee


--Q7 

SELECT 
  salary,
  CONCAT(SUBSTRING(salary::text, 1, LENGTH(salary::text) - 2), 'XX') AS masked_number
FROM 
  Employee;


--Q8 Write a query to fatch even and odd rows froms Employee table

Select *from 
(Select * ,Row_number() Over(order by Emp_id) AS RowNumber from Employee )  AS Emp
where Emp.   Rownumber%2=0


--Q9  Write a query to find all the Employee names Whose name
--Begin with 'A'
--Contains 'A 'alphabet at Second place
--Contains'Y' alphabet at second last  place
--Ends with 'l'and contains 4 alphabet
--Begin with 'v' and 'a'ends
--Begin with 'A'

SELECT * FROM EMPLOYEE 
WHERE Emp_Name like 'P%';

--Contains 'A 'alphabet at Second place
SELECT * FROM EMPLOYEE
WHERE Emp_Name like '_a%';

--Contains'Y' alphabet at second last  place

SELECT * FROM EMPLOYEE 
WHERE Emp_Name like '%a_';

--Ends with 'l'and contains 4 alphabet

SELECT *FROM EMPLOYEE
WHERE Emp_Name like '---l%';

--Begin with 'v' and 'a'ends
SELECT * FROM EMPLOYEE
WHERE Emp_Name like 'A%a';

--Q10 Write a query to find the list of Employee name which is

--starting with vowels (a,e,i,o,u) without duplicate
--Ending with vowels (a,e,i,o,u) without duplicate
--Starting * ending with vowels (a,e,i,o,u) with duplicate

--starting with vowels (a,e,i,o,u) without duplicate
SELECT distinct Emp_Name FROM EMPLOYEE
WHERE LOWER(Emp_Name) similar to '[a,e,i,o,u]%';

--Ending with vowels (a,e,i,o,u) without duplicate
SELECT * FROM EMPLOYEE
WHERE LOWER (Emp_Name) similar to '[a,e,i,o,]%';

--Starting * ending with vowels (a,e,i,o,u) with duplicate
SELECT * FROM EMPLOYEE
WHERE LOWER(Emp_Name) SIMILAR TO '[aeiou]%[aeiou]';


--Q11 Find Nth highest salary from employee table with and without using the top /limit  keyword

SELECT *FROM EMPLOYEE 
ORDER BY SALARY DESC;

--Without using the top and limit 
SELECT salary 
FROM employee E1
WHERE 4- 1 = (
    SELECT COUNT(DISTINCT E2.salary)
    FROM employee E2
    WHERE E2.salary > E1.salary
);

SELECT salary 
FROM employee E1
WHERE 0= (
    SELECT COUNT(DISTINCT E2.salary)
    FROM employee E2
    WHERE E2.salary > E1.salary
);

--Q12 Write a query to find and remove duplicate records from a table 
-- test all row 
SELECT Emp_id, Emp_Name, Gender, Salary, City,
       COUNT(*) AS duplicate_count
FROM Employee
GROUP BY Emp_id, Emp_Name, Gender, Salary, City
HAVING COUNT(*) > 1;

--Short test based no Emp_id
SELECT Emp_id,Count(*)As duplicate_count
from Employee
Group by Emp_id
Having Count(*)>1;

--delete duplicate Value

DELETE FROM employee
WHERE emp_id IN (
    SELECT emp_id
    FROM employee
    GROUP BY emp_id
    HAVING COUNT(*) > 1
);

--Q13Witer a Query to retrieve the last of Employee workingin Same Project

WITH CTE AS

(SELECT e.Emp_ID, e.Emp_Name, ed.Project
FROM Employee AS e
INNER JOIN Employee_Details AS ed
ON e.Emp_ID = ed.Emp_ID)

SELECT c1.Emp_Name, c2.Emp_Name, c1.project
FROM CTE c1, CTE c2
WHERE c1.Project = c2.Project AND c1.Emp_ID != c2.Emp_ID AND c1.Emp_ID < c2.Emp_ID

--Q14 Show the employee with the highest salary for each project

SELECT ed.Project, MAX(e.Salary) AS ProjectMaxSal,sum(e.Salary)As ProjectSumsal
FROM Employee AS e
INNER JOIN Employee_Details AS ed
ON e.Emp_ID = ed.Emp_ID
GROUP BY Project
ORDER BY ProjectMaxSal DESC;
--Alternative, more dynamic solution: here you can fetch EmpName, 2nd/3rd highest value,
WITH CTE AS
(SELECT project, Emp_Name, salary,
ROW_NUMBER() OVER (PARTITION BY project ORDER BY salary DESC) AS row_rank
FROM Employee AS e
INNER JOIN Employee_Details AS ed
ON e.Emp_ID = ed.Emp_ID)
SELECT project, Emp_Name, salary
FROM CTE
WHERE row_rank = 1;

--Q15 Query to find the total count of employees joined each year
SELECT EXTRACT('year' FROM doj) AS JoinYear, COUNT(*) AS EmpCount
FROM Employee AS e
INNER JOIN Employee_Details AS ed ON e.Emp_ID = ed.Emp_ID
GROUP BY JoinYear
ORDER BY JoinYear ASC

--Q16Create 3 groups based on salary col, salary less than 30K is low, between 45K - 55K is medium and above 55K is High
SELECT Emp_Name, Salary,
CASE
WHEN Salary > 55000 THEN 'High'
WHEN Salary >= 45000 AND Salary <= 55000 THEN 'Medium'
ELSE 'Low'
END AS SalaryStatus
FROM Employee


SELECT city, COUNT(*) AS city_count
FROM employee
GROUP BY city
ORDER BY city_count DESC;
