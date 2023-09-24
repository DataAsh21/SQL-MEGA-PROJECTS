CREATE DATABASE MEGA_PROJECT
USE MEGA_PROJECT
CREATE TABLE EmployeeDetails (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2),
    JoiningDate DATETIME,
    Department VARCHAR(50),
    Gender VARCHAR(10)
);

INSERT INTO EmployeeDetails(EmployeeID, FirstName, LastName, Salary, JoiningDate, Department, Gender)
VALUES(1,'Vikas','Ahlawat',600000.00,'2013-02-12 11:16:00', 'IT', 'Male'),
      (2,'nikita','Jain',530000.00,'2013-02-14 11:16:00', 'HR', 'Female'),
	  (3, 'Ashish', 'Kumar',1000000.00,'2013-02-14 11:16:00', 'IT', 'Male'),
	  (4, 'Nikhil', 'Sharma',480000.00,'2013-02-15 11:16:00', 'HR', 'Male'),
	  (5, 'anish', 'kadian',500000.00,'2013-02-16 11:16:00', 'Paroll','Male');
--1) Write a query to get all employee detail from "EmployeeDetail" table
SELECT*FROM EmployeeDetails

--2) Write a query to get only "FirstName" column from "EmployeeDetail" table
SELECT FirstName
FROM EmployeeDetails;

--3) Write a query to get FirstName in upper case as "First Name".
SELECT UPPER(FirstName) As "FirstName"
FROM EmployeeDetails;

--4)Write a query for combine FirstName and LastName and display it as "Name" (also include white space between first name & last name)
SELECT CONCAT(FirstName, ' ', LastName) AS "Name"
FROM EmployeeDetails;

--5)Select employee detail whose name is "Vikas
SELECT*
FROM EmployeeDetails
WHERE FirstName='Vikas';

--6) Get all employee detail from EmployeeDetail table whose "FirstName" start with latter 'a'.
SELECT*
FROM EmployeeDetails
WHERE FirstName Like 'a%';

--7) Get all employee details from EmployeeDetail table whose "FirstName" end with 'h'
SELECT*
FROM EmployeeDetails
WHERE FirstName Like '%h';


--8) Get all employee detail from EmployeeDetail table whose "FirstName" start with any single character between 'a-p'
SELECT*
FROM EmployeeDetails
WHERE FirstName BETWEEN 'a' and 'p';

--9)Get all employee detail from EmployeeDetail table whose "Gender" end with 'le' and contain 4 letters. The Underscore(_) Wildcard Character represents any single character
SELECT*
FROM EmployeeDetails
WHERE Gender LIKE '__le';

--10)Get all employee detail from EmployeeDetail table whose "FirstName" start with 'A' and contain 5 letters
SELECT*
FROM EmployeeDetails
WHERE FirstName Like 'a_____';

--11)Get all employee detail from EmployeeDetail table whose "FirstName" containing '%'. ex:-"Vik%as".
SELECT *
FROM EmployeeDetails
WHERE FirstName LIKE '%\%%';

--12)Get all unique "Department" from EmployeeDetail table
SELECT DISTINCT Department
FROM EmployeeDetails;

--13)Get the highest "Salary" from EmployeeDetail table.
SELECT MAX(Salary)
FROM EmployeeDetails;

--14)Get the lowest "Salary" from EmployeeDetail table
SELECT MIN(Salary)
FROM EmployeeDetails;

--15)Show "JoiningDate" in "dd mmm yyyy" format, ex- "15 Feb 2013
SELECT 
    CONCAT(
        DAY(JoiningDate), 
        ' ', 
        CASE MONTH(JoiningDate)
            WHEN 1 THEN 'Jan'
            WHEN 2 THEN 'Feb'
            WHEN 3 THEN 'Mar'
            WHEN 4 THEN 'Apr'
            WHEN 5 THEN 'May'
            WHEN 6 THEN 'Jun'
            WHEN 7 THEN 'Jul'
            WHEN 8 THEN 'Aug'
            WHEN 9 THEN 'Sep'
            WHEN 10 THEN 'Oct'
            WHEN 11 THEN 'Nov'
            WHEN 12 THEN 'Dec'
        END,
        ' ', 
        YEAR(JoiningDate)
    ) AS "FormattedJoiningDate"
FROM EmployeeDetails;

--16)Show "JoiningDate" in "yyyy/mm/dd" format, ex- "2013/02/15"
SELECT FORMAT(JoiningDate, 'yyyy/MM/dd') AS "FormattedJoiningDate"
FROM EmployeeDetails;

SELECT CONCAT(YEAR(JoiningDate), ' ', UPPER(MONTH(JoiningDate)), ' ', DAY(JoiningDate)) AS "FormattedJoiningDate"
FROM EmployeeDetails;

--17)Show only time part of the "JoiningDate"
SELECT CONVERT(VARCHAR, JoiningDate, 108) AS "JoiningTime"
FROM EmployeeDetails;

--18)Get only Year part of "JoiningDate"
SELECT year(JoiningDate) AS "JoiningYear"
FROM EmployeeDetails;

--19)Get only Month part of "JoiningDate”
SELECT MONTH(JoiningDate) AS "JoiningMonth"
FROM EmployeeDetails;

--20)Get system date
SELECT GETDATE() AS "SystemDate";

--21)Get UTC date.
SELECT GETUTCDATE() AS "UTCDate";

--22)a)	Get the first name, current date, joiningdate and diff between current date and joining date in months.
SELECT 
    FirstName,
    GETDATE() AS CurrentDate,
    JoiningDate,
    DATEDIFF(MONTH, JoiningDate, GETDATE()) AS MonthsDifference
FROM EmployeeDetails;


--23)Get the first name, current date, joiningdate and diff between current date and joining date in days.
SELECT
    FirstName,
	GETDATE() AS CurrentDate,
	JoiningDate,
	DATEDIFF(DAY,JoiningDate, GETDATE()) AS DayDifference
FROM EmployeeDetails;

--24) Get all employee details from EmployeeDetail table whose joining year is 2013
SELECT*
FROM EmployeeDetails
WHERE YEAR(JoiningDate)=2013;

--25)Get all employee details from EmployeeDetail table whose joining month is Jan(1)
SELECT*
FROM EmployeeDetails
WHERE MONTH(JoiningDate)=1;

--26)Get how many employee exist in "EmployeeDetail" table
SELECT COUNT(*) AS "NumberofEmployee"
FROM EmployeeDetails;

--27)Select only one/top 1 record from "EmployeeDetail" table
SELECT TOP 1*
FROM EmployeeDetails

--28)Select all employee detail with First name "Vikas","Ashish", and "Nikhil".
SELECT*
FROM EmployeeDetails
WHERE FirstName IN ('Vikas','Ashish','Nikhil')

--29)Select all employee detail with First name not in "Vikas","Ashish", and "Nikhil"
SELECT*
FROM EmployeeDetails
WHERE FirstName NOT IN ('Vikas','Ashish','Nikhil')

--30)Select first name from "EmployeeDetail" table after removing white spaces from right side
SELECT TRIM(FirstName) AS FirstNameWithoutRightSpaces
FROM EmployeeDetails;

--31)Select first name from "EmployeeDetail" table after removing white spaces from left side
SELECT TRIM(FirstName) AS FirstNameWitoutRightSpaces
FROM EmployeeDetails;

--32)Display first name and Gender as M/F.(if male then M, if Female then F)
SELECT
    FirstName,
    CASE Gender
	    WHEN 'Male' THEN 'M'
		WHEN 'Female' THEN 'F'
	END AS Gender
FROM EmployeeDetails;

--33)Select first name from "EmployeeDetail" table prifixed with "Hello
SELECT CONCAT('Hello ', FirstName) AS Greeting
FROM EmployeeDetails

--34)Get employee details from "EmployeeDetail" table whose Salary greater than 600000
SELECT*
FROM EmployeeDetails
WHERE Salary > 600000;

--35) Get employee details from "EmployeeDetail" table whose Salary less than 700000
SELECT*
FROM EmployeeDetails
WHERE Salary < 700000;

--36)Get employee details from "EmployeeDetail" table whose Salary between 500000 than 600000
SELECT*
FROM EmployeeDetails
WHERE Salary BETWEEN 500000 AND 600000;


-- CREATE TABLE PROJECT DETAIL TABLE
CREATE TABLE Project_Detail_Table(
       Project_Details_ID int primary key,
	   Employee_details_ID int,
	   ProjectName varchar(50)
);
select*from[dbo].[ProjectDetail]

INSERT INTO Project_Detail_Table(Project_Details_ID,Employee_details_ID,ProjectName)
VALUES
      (1,1,'Task Track'),
	  (2,1,'CLP'),
      (3,1,'Survey Management'),
      (4,2,'HR Management'),
      (5,3,'Task Track'),
      (6,3,'GRS'),
      (7,3,'DDS'),
      (8,4,'HR Managment'),
      (9,6,'GL Managment');

DROP TABLE [dbo].[ProjectDetail]

UPDATE [dbo].[Project_Detail_Table]
SET [ProjectName] = 'HR Management'
WHERE [Project_Details_ID] = 8;

--41. Give records of ProjectDetail table
SELECT*FROM [dbo].[Project_Detail_Table]

--42. Write the query to get the department and department wise total(sum) salary from "EmployeeDetail" table.
SELECT DEPARTMENT,SUM([Salary]) AS DEPARTMENT_SALARY
FROM [dbo].[EmployeeDetails]
GROUP BY [Department];

--43. Write the query to get the department and department wise total(sum) salary, display it in ascending order according to salary.
SELECT DEPARTMENT,SUM([Salary]) AS DEPARTMENT_SALARY
FROM [dbo].[EmployeeDetails]
GROUP BY [Department]
ORDER BY DEPARTMENT_SALARY ASC;

--44. Write the query to get the department and department wise total(sum) salary, display it in descending order according to salary
SELECT DEPARTMENT,SUM([Salary]) AS DEPARTMENT_SALARY
FROM [dbo].[EmployeeDetails]
GROUP BY [Department]
ORDER BY DEPARTMENT_SALARY DESC;

--45. Write the query to get the department, total no. of departments, total(sum) salary with respect to department from "EmployeeDetail" table.
SELECT [Department], COUNT([Department]) AS DEPARTMENT_COUNT, SUM([Salary]) AS SALARY_DEPARTMENT
FROM [dbo].[EmployeeDetails]
GROUP BY [Department];

--46. Get department wise average salary from "EmployeeDetail" table order by salary ascending
SELECT [Department], AVG([Salary]) AS AVG_SALARY
FROM [dbo].[EmployeeDetails]
GROUP BY [Department]


--47 . Get department wise maximum salary from "EmployeeDetail" table order by salary ascending
SELECT [Department], MAX([Salary]) AS MAX_SALARY
FROM [dbo].[EmployeeDetails]
GROUP BY [Department]

--48.Get department wise minimum salary from "EmployeeDetail" table order by salary ascending.
SELECT [Department],MIN([Salary]) AS MIN_SALARY
FROM [dbo].[EmployeeDetails]
GROUP BY [Department]

--49. Get department wise minimum salary from "EmployeeDetail" table order by salary ascending
SELECT [Department],MIN([Salary]) AS MIN_SALARY
FROM [dbo].[EmployeeDetails]
GROUP BY [Department]

--50. Join both the table that is Employee and ProjectDetail based on some common paramter
SELECT *
FROM [dbo].[EmployeeDetails]
INNER JOIN [dbo].[Project_Detail_Table] ON [dbo].[EmployeeDetails].EmployeeID = [dbo].[Project_Detail_Table].[Employee_details_ID]


--51. Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for those employee which have assigned project already.

SELECT CONCAT(E.FirstName, ' ', E.LastName) AS FULLNAME, P.ProjectName
FROM [dbo].[EmployeeDetails] AS E
INNER JOIN [dbo].[Project_Detail_Table] AS P ON E.EmployeeID = P.[Employee_details_ID]
ORDER BY E.FirstName ASC;

--52. Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee even they have not assigned project.
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS FULLNAME, P.ProjectName
FROM [dbo].[EmployeeDetails] AS E
LEFT JOIN [dbo].[Project_Detail_Table] AS P ON E.EmployeeID = P.[Employee_details_ID]
ORDER BY E.FirstName ASC;

--53) Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee if project is not assigned then display "-No Project Assigned"
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS FULLNAME, COALESCE(P.ProjectName,'-No Project Assigned') AS PROJECT_NAME
FROM [dbo].[EmployeeDetails] AS E
LEFT JOIN [dbo].[Project_Detail_Table] AS P ON E.EmployeeID = P.[Employee_details_ID]
ORDER BY E.FirstName ASC;
--2ND METHOD
SELECT 
   [dbo].[EmployeeDetails].FirstName AS EmployeeName,
    CASE 
        WHEN [dbo].[Project_Detail_Table].ProjectName IS NOT NULL THEN ProjectName
        ELSE '-No Project Assigned'
    END AS ProjectStatus
FROM [dbo].[EmployeeDetails]
LEFT JOIN [dbo].[Project_Detail_Table] ON [dbo].[EmployeeDetails].EmployeeID = [dbo].[Project_Detail_Table].[Employee_details_ID]
ORDER BY[dbo].[EmployeeDetails].[FirstName] ;



--54.Get all project name even they have not matching any employeeid, in left table, order by firstname from "EmployeeDetail" and "ProjectDetail
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS FULLNAME, P.ProjectName
FROM [dbo].[EmployeeDetails] AS E
LEFT JOIN [dbo].[Project_Detail_Table] AS P ON E.EmployeeID = P.[Employee_details_ID]
ORDER BY E.FirstName ASC;

--55. Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS FULLNAME, P.ProjectName
FROM [dbo].[EmployeeDetails] AS E
FULL OUTER  JOIN [dbo].[Project_Detail_Table] AS P ON E.EmployeeID = P.[Employee_details_ID]

--56. Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS FULLNAME, P.ProjectName
FROM [dbo].[EmployeeDetails] AS E
FULL OUTER  JOIN [dbo].[Project_Detail_Table] AS P ON E.EmployeeID = P.[Employee_details_ID]

--57.Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS FULLNAME, P.ProjectName
FROM [dbo].[EmployeeDetails] AS E
FULL OUTER  JOIN [dbo].[Project_Detail_Table] AS P ON E.EmployeeID = P.[Employee_details_ID]

--58.Write down the query to fetch EmployeeName & Project who has assign more than one project
SELECT  CONCAT(E.FirstName, ' ', E.LastName) AS EmployeeName, P.ProjectName, E.EmployeeID
FROM [dbo].[EmployeeDetails] AS E
LEFT JOIN [dbo].[Project_Detail_Table] AS P ON E.EmployeeID = P.[Employee_details_ID]
WHERE E.EmployeeID IN (
    SELECT [dbo].[Project_Detail_Table].Employee_details_ID
    FROM [dbo].[Project_Detail_Table]
    GROUP BY [dbo].[Project_Detail_Table].Employee_details_ID
    HAVING COUNT(*) > 1
)

SELECT*FROM [dbo].[Project_Detail_Table]
SELECT *FROM [dbo].[EmployeeDetails]

--59. Write down the query to fetch ProjectName on which more than one employee are working along with EmployeeName
SELECT CONCAT(E.FirstName, ' ', E.LastName) AS EmployeeName, P.ProjectName
FROM [dbo].[EmployeeDetails] AS E
LEFT JOIN [dbo].[Project_Detail_Table] AS P ON E.EmployeeID = P.[Employee_details_ID]
WHERE E.EmployeeID IN (
                   SELECT [dbo].[Project_Detail_Table].Employee_details_ID
				   FROM [dbo].[Project_Detail_Table]
				   GROUP BY [dbo].[Project_Detail_Table].Employee_details_ID
				   HAVING COUNT(*)>1
);

--60. Apply Cross Join in Both the tables
SELECT *
FROM [dbo].[EmployeeDetails]
CROSS JOIN [dbo].[Project_Detail_Table] 

SELECT *
FROM [dbo].[Project_Detail_Table]
CROSS JOIN [dbo].[EmployeeDetails]

-- CREATE TABLE FUEL DETAIL TABLE
CREATE TABLE FUEL_DETAIL_TABLE(
          ID INT PRIMARY KEY,
		  FUEL INT ,
		  DATE DATETIME
);

INSERT INTO FUEL_DETAIL_TABLE(ID,FUEL,DATE)
VALUES
     (1,10,'2014-04-05 10:00:00.000'),
     (2,9,'2014-04-05 11:00:00.000'),
     (3,8,'2014-04-05 12:00:00.000'),
     (4,6,'2014-04-05 13:00:00.000'),
     (5,12,'2014-04-05 14:00:00.000'),
     (6,11,'2014-04-05 15:00:00.000'),
     (7,10,'2014-04-05 16:00:00.000'),
     (8,9,'2014-04-05 17:00:00.000'),
     (9,10,'2014-04-05 18:00:00.000'),
     (10,11,'2014-04-05 19:00:00.000'),
     (11,12,'2014-04-05 20:00:00.000'),
     (12,13,'2014-04-05 21:00:00.000'),
     (13,14,'2014-04-05 22:00:00.000'),
     (14,15,'2014-04-05 23:00:00.000');

DROP TABLE [dbo].[FuelDetailTable]
SELECT*FROM [dbo].[Employee]

--1.	Write down the query to print first letter of a Name in Upper Case and all other letter in Lower Case.(EmployDetail table)
SELECT 
    CONCAT(
        UPPER(SUBSTRING(FirstName, 1, 1)), 
        LOWER(SUBSTRING(FirstName, 2, LEN(FirstName)))
    ) AS FormattedFirstName
FROM [dbo].[EmployeeDetails]
 
SELECT CONCAT(UPPER(SUBSTRING(FirstName, 1, 1))+  
       LOWER(SUBSTRING(FirstName, 2, LEN(FirstName) + 1)),
	   '_',
	     (UPPER(SUBSTRING(LastName, 1, 1))+  
       LOWER(SUBSTRING(LastName, 2, LEN(LastName) + 1)))) AS FORMATED_NAME
FROM [dbo].[EmployeeDetails];



--22.	1. Write down the query to display all employee name in one cell seprated by ',' ex:-"Vikas, nikita, Ashish, Nikhil , anish"(EmployDetail table)
SELECT STRING_AGG(FirstName, ', ') AS EmployeeNames
FROM[dbo].[EmployeeDetails] ;

--33.	Write down the query to get ProjectName and respective EmployeeName(firstname) which are working on the project, --if more then one employee working on same project, then it should be in same cell seprated by comma 
--for example :- Task Tracker : Vikas, Ashish
SELECT P.ProjectName, STRING_AGG(E.FirstName, ',') AS EmployeeNames
FROM [dbo].[Project_Detail_Table] AS P
INNER JOIN [dbo].[EmployeeDetails] AS E
 ON P.Employee_details_ID = E.EmployeeID
GROUP BY P.ProjectName;

SELECT P.ProjectName,
STRING_AGG(E.FirstName, ', ') AS EmployeeNames
FROM [dbo].[EmployeeDetails] AS E
INNER JOIN [dbo].[Project_Detail_Table] AS P
 ON E.EmployeeID = P.Employee_details_ID
GROUP BY P.ProjectName;


SELECT STRING_AGG([FirstName],','),[ProjectName]
FROM [dbo].[EmployeeDetails]
INNER JOIN  [dbo].[Project_Detail_Table]
ON [dbo].[EmployeeDetails].EmployeeID = [dbo].[Project_Detail_Table].Employee_details_ID
WHERE [EmployeeID] IN (SELECT [Employee_details_ID] FROM [dbo].[Project_Detail_Table])
GROUP BY [ProjectName]


















