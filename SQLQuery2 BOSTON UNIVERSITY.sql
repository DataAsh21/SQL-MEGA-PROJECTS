--University Database Management System Capstone Project
--Task 1:-
--1.Create University Database give any University name you want
CREATE DATABASE BOSTON_University
USE BOSTON_University

--Create four tables with the specified columns:
--A. College_Table:
CREATE TABLE College_Table (
    College_ID INT PRIMARY KEY,
    College_Name VARCHAR(100),
    College_Area VARCHAR(100)
);

--B. Department_Table:
CREATE TABLE Department_Table (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(100),
    Dept_Facility VARCHAR(100),
    College_ID INT
);  

--C. Professor_Table:
CREATE TABLE Professor_Table (
    Professor_ID INT PRIMARY KEY,
    Professor_Name VARCHAR(100),
    Professor_Subject VARCHAR(100),
   
   
);

--D. Student_Table:
CREATE TABLE Student_Table (
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(100),
    Student_Stream VARCHAR(100),
    Professor_ID INT,
    
);
DROP TABLE [dbo].[Professor_Table]

----3 Apply foreign key on Department key from College_table
-- Now, add the foreign key constraint using ALTER TABLE
ALTER TABLE Department_Table
ADD FOREIGN KEY (COLLEGE_ID) REFERENCES College_Table (College_ID);

----4 Apply foreign Key on Student_Table from Professor_Table
ALTER TABLE Student_Table
ADD FOREIGN KEY (Professor_ID) REFERENCES Professor_table (Professor_ID);

--5 Insert atleast 10 Records in each table
--A. College_Table:

INSERT INTO College_Table (College_ID, College_Name, College_Area)
VALUES
    (1, 'College of Engineering', 'North Campus'),
    (2, 'College of Arts', 'South Campus'),
    (3, 'College of Business', 'West Campus'),
    (4, 'College of Science', 'East Campus'),
    (5, 'College of Medicine', 'Central Campus'),
    (6, 'College of Law', 'Downtown Area'),
    (7, 'College of Music', 'Performing Arts District'),
    (8, 'College of Social Sciences', 'Urban Studies'),
    (9, 'College of Education', 'Teacher Training Center'),
    (10, 'College of Languages', 'International Relations');
select*from [dbo].[College_Table]
--B. Department_Table:
INSERT INTO Department_Table (Dept_ID, Dept_Name, Dept_Facility,College_ID)
VALUES
    (101, 'Computer Science', 'Lab with Computers',1),
    (102, 'History', 'Research Library',2),
    (103, 'Economics', 'Financial Data Center',3),
    (104, 'Physics', 'Advanced Labs',4),
    (105, 'Biology', 'Genetics Lab',5),
    (106, 'Mathematics', 'Math Lab',6),
    (107, 'Fine Arts', 'Studio Spaces',7),
    (108, 'Psychology', 'Behavioral Research Center',8),
    (109, 'Chemistry', 'Chemical Analysis Lab',9),
    (110, 'Engineering', 'Prototype Workshop',10);

select*from[dbo].[Department_Table]

--C.Professor_Table:
INSERT INTO Professor_Table (Professor_ID, Professor_Name, Professor_Subject)
VALUES
    (201, 'John Smith', 'Computer Networks'),
    (202, 'Emily Johnson', 'Ancient Civilizations'),
    (203, 'Robert White', 'Macroeconomics'),
    (204, 'Maria Garcia', 'Quantum Physics'),
    (205, 'David Brown', 'Literature'),
    (206, 'Jennifer Lee', 'Psychology'),
    (207, 'Michael Davis', 'Chemistry'),
    (208, 'Sarah Miller', 'Computer Science'),
    (209, 'Daniel Clark', 'History'),
    (210, 'Sophia Wilson', 'Biology');

	select*from [dbo].[Professor_Table]


--D.Student_Table
INSERT INTO Student_Table (Student_ID, Student_Name, Student_Stream,Professor_ID)
VALUES
    (301, 'Sarah Miller', 'Computer Science',201),
    (302, 'Michael Brown', 'History',202),
    (303, 'Lisa Davis', 'Economics',203),
    (304, 'David Wilson', 'Physics',204),
    (305, 'Jennifer Smith', 'Psychology',205),
    (306, 'Daniel Johnson', 'Biology',206),
    (307, 'Emily Davis', 'English Literature',207),
    (308, 'Robert Garcia', 'Business Administration',208),
    (309, 'Sophia Miller', 'Mathematics',209),
    (310, 'John Clark', 'Chemistry',210);

select*from [dbo].[Student_Table]

/*Task 2:-
1.Give the information of College_ID and College_name from College_Table*/
SELECT [College_ID],[College_Name]
FROM [dbo].[College_Table]

--2.Show  Top 5 rows from Student table.
SELECT TOP 5*
FROM [dbo].[Student_Table]

--3.What is the name of  professor  whose ID  is 205
SELECT [Professor_Name]
FROM [dbo].[Professor_Table]
WHERE [Professor_ID] = 205;

--4.Convert the name of the Professor into Upper case 
SELECT UPPER([Professor_Name]) AS UPPER_NAME
FROM [dbo].[Professor_Table]

--5.Show me the names of those students whose name is start with a
SELECT [Student_Name]
FROM [dbo].[Student_Table]
WHERE [Student_Name] LIKE 'A%';

--6.	Give the name of those colleges whose end with a
SELECT [Student_Name]
FROM [dbo].[Student_Table]
WHERE [Student_Name] LIKE '%A';

--7.	 Add one Salary Column in Professor_Table
ALTER TABLE Professor_Table
ADD Salary DECIMAL(10, 2);

ALTER TABLE Professor_Table
ADD DEPT_ID INT;

--8.	Add one Contact Column in Student_table
ALTER TABLE Student_Table
ADD Contact VARCHAR(255);

--INSERT  10 RECORDS OF SALARY IN PROFFESOR_TABLE TO CALCULATE FURTHER REQUIREMENT
UPDATE Professor_Table
SET Salary=
CASE
WHEN Professor_ID = 201 THEN 60000.00
WHEN Professor_ID = 202 THEN 55000.00
WHEN Professor_ID = 203 THEN 70000.00
WHEN Professor_ID = 204 THEN 62000.00
WHEN Professor_ID = 205 THEN 58000.00
WHEN Professor_ID = 206 THEN 63000.00
WHEN Professor_ID = 207 THEN 56000.00
WHEN Professor_ID = 208 THEN 65000.00
WHEN Professor_ID = 209 THEN 59000.00
WHEN Professor_ID = 210 THEN 67000.00
END
WHERE Professor_ID  IN (201,202,203,204,205,206,207,208,209,210);


UPDATE Professor_Table
SET DEPT_ID= 
CASE
WHEN Professor_ID = 201 THEN 101
WHEN Professor_ID = 202 THEN 102
WHEN Professor_ID = 203 THEN 103
WHEN Professor_ID = 204 THEN 104
WHEN Professor_ID = 205 THEN 105
WHEN Professor_ID = 206 THEN 106
WHEN Professor_ID = 207 THEN 107
WHEN Professor_ID = 208 THEN 108
WHEN Professor_ID = 209 THEN 109
WHEN Professor_ID = 210 THEN 110
END
WHERE Professor_ID  IN (201,202,203,204,205,206,207,208,209,210);
SELECT*FROM [dbo].[Professor_Table]

--INSERT  10 RECORDS OF CONTACT  IN STUDENT_TABLE TO CALCULATE FURTHER REQUIREMENT
UPDATE Student_Table
SET CONTACT =
CASE
WHEN Student_ID = 301 THEN '9421877318'
WHEN Student_ID = 302 THEN '9826189773'
WHEN Student_ID = 303 THEN '9965847123'
WHEN Student_ID = 304 THEN '9654879215'
WHEN Student_ID = 305 THEN '8261982447'
WHEN Student_ID = 306 THEN '7896542136'
WHEN Student_ID = 307 THEN '8546791256'
WHEN Student_ID = 308 THEN '7548932169'
WHEN Student_ID = 309 THEN '6548712985'
WHEN Student_ID = 310 THEN '6584972156'
END
WHERE Student_ID IN (301,302,303,304,305,306,307,308,309,310);

SELECT*FROM [dbo].[Student_Table]

--9.	Find the total Salary of Professor 
SELECT SUM([Salary]) AS TOTAL_SALARY
FROM [dbo].[Professor_Table]

--10.	Change datatype of any one column of any one Table
ALTER  TABLE Professor_Table
ALTER COLUMN Salary INT;

SELECT*FROM [dbo].[Professor_Table]

/*Task 3:-
1.	Show first 5 records from Students table and Professor table Combine*/
SELECT TOP 5 *
FROM [dbo].[Professor_Table]
JOIN [dbo].[Student_Table] ON [dbo].[Professor_Table].[Professor_ID] = [dbo].[Student_Table].Professor_ID

--2.	Apply Inner join on all 4 tables together
SELECT*
FROM [dbo].[College_Table]
INNER JOIN [dbo].[Department_Table] ON [dbo].[College_Table].College_ID = [dbo].[Department_Table].College_ID
INNER JOIN [dbo].[Professor_Table] ON [dbo].[Department_Table].Dept_ID = [dbo].[Professor_Table].[DEPT_ID]
INNER JOIN [dbo].[Student_Table] ON [dbo].[Professor_Table].[Professor_ID] = [dbo].[Student_Table].Professor_ID

SELECT*
FROM [dbo].[College_Table]
INNER JOIN [dbo].[Department_Table] ON [dbo].[College_Table].College_ID = [dbo].[Department_Table].College_ID
INNER JOIN [dbo].[Professor_Table] ON [dbo].[Department_Table].Dept_ID = [dbo].[Professor_Table].[Professor_ID]
INNER JOIN [dbo].[Student_Table] ON [dbo].[Professor_Table].[Professor_ID] = [dbo].[Student_Table].Professor_ID


--3.	Show Some null values from Department table and Professor table.
SELECT*
FROM [dbo].[Department_Table]
JOIN [dbo].[Professor_Table] ON [dbo].[Department_Table].Dept_ID = [dbo].[Professor_Table].[DEPT_ID]
WHERE [dbo].[Department_Table].College_ID IS  NULL AND [dbo].[Professor_Table].[Professor_ID] IS   NULL;

--OR
SELECT*
FROM [dbo].[Department_Table]
WHERE [Dept_ID] IS NULL;
 
SELECT * FROM [dbo].[Professor_Table]
WHERE [Professor_ID] IS NULL

--4.	Create a View from College Table  and give those records whose college name starts with C
CREATE VIEW CollegeNameStartWithC as
select *
from [dbo].[College_Table]
where [College_Name] like 'C%'

CREATE VIEW CollegeareatartWithC as
select *
from [dbo].[College_Tables_Data]
where [College_Area] like 'C%'


SELECT*FROM [dbo].[CollegeareatartWithC]

--5.Create Stored Procedure  of Professor table whatever customer ID will be given by user it should show whole records of it.
CREATE PROCEDURE GET_PROFESSOR_RECORD
   @Professor_ID INT
AS 
BEGIN
   SELECT *
   FROM [dbo].[Professor_Table]
   WHERE [Professor_ID] = @Professor_ID;
END;
--calling the stored procedure
EXEC GET_PROFESSOR_RECORD @Professor_ID = 205;

--6.	Rename the College_Table to College_Tables_Data .
EXEC sp_rename '[dbo].[College_Table]' ,'College_Tables_Data'