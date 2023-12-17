CREATE DATABASE Student;

USE Student;

CREATE TABLE StudentBasicInformation(
studentName VARCHAR(30),
studentSurname VARCHAR(30),
studentRollNo INT PRIMARY KEY,
studentAddress VARCHAR(100),
studentFatherName VARCHAR(50),
studentMobileNo VARCHAR(12) NOT NULL UNIQUE,
studentAadhar VARCHAR(15) NOT NULL UNIQUE
);

INSERT INTO StudentBasicInformation
VALUES
("Ramu","Sharma",2125600,"Siwan","Rakesh Sharma",9876543210,123451254556),
("Sanket","Singh",2125620,"Siwan","Sanjay Singh",9876543211,123451284556),
("Vivek","Raj",2125631,"Chapra","Sandeep Raj",9876543212,123451234556),
("Surbhi","Joyti",2125642,"Patna","Raj Joyti",9876543213,123451254566),
("Pawan","Kumar",2125633,"Siwan","Nirahua Kumar",9876543214,123451274556),
("Dinesh","Sharma",2125624,"Siwan","Ram Sharma",9876543215,123451294556),
("Raj","Kumar",2125627,"Chapra","Bhushan Kumar",9876543216,123451204556),
("Ritika","Raj",2125677,"Chapra","Vijay Raj",9876543217,123451231556),
("Soni","Kumari",2125648,"Chapra","Manish Kumar",9876543218,123451232556),
("Sneha","Singh",2125611,"Munger","Rajesh Singh",9876543219,123451233556),
("Raju","Sharma",2125610,"Bhagalpur","Ramayan Sharma",9876543312,123454234556),
("Virat","Kumar",2125688,"Gopalganj","Virendra Kumar",9876543310,123455234556);

CREATE TABLE StudentAdmissionPaymentDetails(
studentRollNo INT PRIMARY KEY,
amountPaid INT,
amountBalance INT,
studentName VARCHAR(30),
studentSurname VARCHAR(30),
studentMobileNo VARCHAR(12) NOT NULL UNIQUE,
studentAadhar VARCHAR(15) NOT NULL UNIQUE
);

INSERT INTO StudentAdmissionPaymentDetails
VALUES
(2125600,20000,30000,"Ramu","Sharma",9876543210,123451254556),
(2125620,25000,25000,"Sanket","Singh",9876543211,123451284556),
(2125631,12000,38000,"Vivek","Raj",9876543212,123451234556),
(2125642,25000,25000,"Surbhi","Joyti",9876543213,123451254566),
(2125633,25000,25000,"Pawan","Kumar",9876543214,123451274556),
(2125624,32000,18000,"Dinesh","Sharma",9876543215,123451294556),
(2125627,12000,38000,"Raj","Kumar",9876543216,123451204556),
(2125677,12000,38000,"Ritika","Raj",9876543217,123451231556),
(2125648,23000,27000,"Soni","Kumari",9876543218,123451232556),
(2125611,23000,27000,"Sneha","Singh",9876543219,123451233556),
(2125610,21000,29000,"Raju","Sharma",9876543312,123454234556),
(2125688,25000,25000,"Virat","Kumar",9876543310,123455234556);


CREATE TABLE studentSubjectInformation(
subjectOpted VARCHAR(20),
studentRollNo INT PRIMARY KEY,
subjectTotalMarks INT,
subjectObtainedMarks FLOAT,
studentMarksPercentage FLOAT,
studentMobileNo VARCHAR(12) NOT NULL UNIQUE
);

INSERT INTO studentSubjectInformation
VALUES
("English",2125600,100,80.0,80.0,9876543210),
("English",2125620,100,75.5,75.5,9876543211),
("English",2125631,100,63.5,63.5,9876543212),
("Maths",2125642,100,45.0,45.0,9876543213),
("Maths",2125633,100,75.0,75.0,9876543214),
("Physics",2125624,100,98.0,98.0,9876543215),
("Chemistry",2125627,100,95.0,95.0,9876543216),
("Soccial Science",2125677,100,60.0,60.0,9876543217),
("Chemistry",2125648,100,55.5,55.5,9876543218),
("Maths",2125611,100,89.0,89.0,9876543219),
("Chemistry",2125610,100,75.0,75.0,9876543312),
("Maths",2125688,100,45.0,45.0,9876543310);

CREATE TABLE subjectScholarshipInformation(
studentRollNo INT PRIMARY KEY,
scholarshipName VARCHAR(30),
scholarshipDescription VARCHAR(100),
scholarshipAmount INT DEFAULT 0,
scholarshipCategory VARCHAR(20),
studentMarksPercentage FLOAT,
studentMobileNo VARCHAR(12) NOT NULL UNIQUE
);

INSERT INTO subjectScholarshipInformation
VALUES
(2125600,"Pre-Matric","Government",30000,"MoM",80.0,9876543210),
(2125620,"Pre-Matric","Government",30000,"MoM",75.5,9876543211),
(2125631,"Pre-Matric","Government",30000,"Mom",63.5,9876543212),
(2125642,"Pre-Matric","Government",30000,"MoM",45.0,9876543213),
(2125633,"Pre-Matric","Government",30000,"MoM",75.0,9876543214),
(2125624,"Pre-Matric","Government",30000,"MoM",98.0,9876543215),
(2125627,"Saksham","Government",0,"MHRD",95.0,9876543216),
(2125677,"Pragati","Government",0,"MHRD",60.0,9876543217),
(2125648,"Pragati","Government",0,"MHRD",55.5,9876543218),
(2125611,"Pragati","Government",30000,"MHRD",89.0,9876543219),
(2125610,"Saksham","Government",30000,"MHRD",75.0,9876543312),
(2125688,"Saksham","Government",0,"MHRD",54.0,9876543310);


UPDATE subjectScholarshipInformation
SET scholarshipAmount=25000
WHERE scholarshipAmount=30000;

UPDATE studentSubjectInformation
SET subjectObtainedMarks = 55
WHERE subjectObtainedMarks < 50;

/*Select the student details records who has received the scholarship more than 5000Rs/- */
SELECT * 
FROM StudentBasicInformation AS a
INNER JOIN subjectScholarshipInformation AS b
ON a.studentRollNo = b.studentRollNo
WHERE b.scholarshipAmount > 5000;

/*Select the students who opted for scholarship but has not got the scholarship*/
SELECT * 
FROM StudentBasicInformation AS a
INNER JOIN subjectScholarshipInformation AS b
ON a.studentRollNo = b.studentRollNo
WHERE b.scholarshipAmount = 0;

/*Create the View which shows balance amount to be paid by the student along with the student detailed information (use join)*/
CREATE VIEW view1 as
SELECT studentRollNo, amountBalance
from StudentAdmissionPaymentDetails;

SELECT * FROM view1;

/*Get the details of the students who haven’t got any scholarship (use joins/subqueries)*/
SELECT * FROM studentBasicInformation AS A
INNER JOIN subjectScholarshipInformation AS B
ON A.studentRollNo = B.studentRollNo
WHERE B.studentRollNo IN (SELECT studentRollNo FROM subjectScholarshipInformation AS C
                               WHERE C.scholarshipAmount=0);  

/*Create Stored Procedure which will be return the amount balance to be paid by the
 student as per the student roll number passed through the stored procedure as the input*/
CALL getAmountBalance(2125688,@balance);
SELECT @balance AS AmountBalance;

/*Retrieve the top five student details as per the StudentMarksPercentage values (use subqueries)*/
SELECT * FROM studentBasicInformation AS A
INNER JOIN studentSubjectInformation AS B
ON A.studentRollNo = B.studentRollNo
ORDER BY B.studentMarksPercentage DESC
LIMIT 5;                                  


/*Get the count of the Scholarship category which is highly been availed by the students,
 i.e. get the count of the total number of students corresponding to the each scholarships category*/
SELECT scholarshipName, COUNT(studentRollNo)
FROM subjectScholarshipInformation
GROUP BY scholarshipName;

/*Along with the assignment no. 17 try to retrieve the maximum used scholarship category*/
SELECT scholarshipName, COUNT(studentRollNo)
FROM subjectScholarshipInformation
GROUP BY scholarshipName
LIMIT 1;

/*Retrieve the percentage of the students along with students detailed information who has scored the highest 
percentage along with availing the maximum scholarship amount*/
SELECT * FROM StudentBasicInformation AS A
INNER JOIN subjectScholarshipInformation AS B 
ON A.studentRollNo = B.studentRollNo
WHERE B.studentMarksPercentage = (SELECT max(studentMarksPercentage) 
                                   FROM subjectScholarshipInformation AS C
                                   WHERE C.scholarshipAmount= (SELECT max(scholarshipAmount) 
                                   FROM subjectScholarshipInformation ) );




