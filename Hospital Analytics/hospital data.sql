create database mydatabase;
show databases;
use mydatabase;
create table hospital(Patient_ID int, Age int, Gender varchar(50), Condition_ varchar(50), Procedure_ varchar(50),
Cost int,Length_of_Stay int,Readmission varchar(20),Outcome varchar(50),Satisfaction int );
select * from hospital;

-- Total Patients
select count(distinct Patient_ID ) as Total_Patients from hospital;

-- duplicate ids check table
select Patient_ID,count(*) from hospital group by Patient_ID having count(*)>1;

-- null ids check table
select * from hospital where Patient_ID is null;

-- rows count
select count(*) from hospital;

-- Gender distribution
SELECT Gender, COUNT(*) AS Patient_Count FROM hospital GROUP BY Gender;

-- disease / condition-wise patient count
SELECT Condition_, COUNT(*) AS Patient_Count FROM hospital GROUP BY Condition_
ORDER BY Patient_Count DESC;

-- Average cost by procedure
SELECT Procedure_, AVG(Cost) AS Avg_Cost FROM hospital GROUP BY Procedure_;

-- Readmission rate
SELECT (SUM(CASE WHEN Readmission = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS Readmission_Rate
FROM hospital;

-- Average length of stay by condition
SELECT Condition_, AVG(Length_of_Stay) AS Avg_Stay FROM hospital GROUP BY Condition_;

-- Patient satisfaction analysis
SELECT Satisfaction, COUNT(*) AS Count FROM hospital GROUP BY Satisfaction ORDER BY Satisfaction DESC;












