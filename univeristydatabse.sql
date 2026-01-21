CREATE DATABASE UniversityDB;
CREATE TABLE UniversityDB.Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50)
);
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Gender VARCHAR(10),
    Age INT,
    DeptID INT,
    City VARCHAR(30),
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);
INSERT INTO Departments VALUES
(1, 'Computer Science'),
(2, 'Information Technology'),
(3, 'Software Engineering');
INSERT INTO Students VALUES
(101, 'Ali', 'Male', 20, 1, 'Lahore'),
(102, 'Ayesha', 'Female', 19, 2, 'Karachi'),
(103, 'Usman', 'Male', 21, 1, 'Islamabad'),
(104, 'Fatima', 'Female', 20, 3, 'Lahore');
INSERT INTO Courses VALUES
(1, 'Database Systems', 1),
(2, 'Web Development', 2),
(3, 'Software Testing', 3);
SELECT * FROM Students;
SELECT s.Name, d.DeptName
FROM Students s
JOIN Departments d ON s.DeptID = d.DeptID;
SELECT * FROM Students
WHERE Gender = 'Female';
SELECT * FROM Students
WHERE City = 'Lahore';
SELECT * FROM Students
WHERE Age > 19;
SELECT Name FROM Students
WHERE DeptID = 1;
SELECT COUNT(*) AS TotalStudents FROM Students;
SELECT DeptID, COUNT(*) AS Total
FROM Students
GROUP BY DeptID;









