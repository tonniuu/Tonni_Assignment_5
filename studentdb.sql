-- Create the database
CREATE DATABASE IF NOT EXISTS StudentDB;

-- Use the database
USE StudentDB;

-- Create Tables
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Major VARCHAR(50)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    Credits INT
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Grade CHAR(1),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Insert Sample Data
INSERT INTO Students (StudentID, StudentName, Major)
VALUES
(1, 'Alice Johnson', 'Computer Science'),
(2, 'Bob Smith', 'Mathematics'),
(3, 'Carol White', 'Physics');

INSERT INTO Courses (CourseID, CourseName, Credits)
VALUES
(101, 'Algorithms', 3),
(102, 'Calculus', 4),
(103, 'Physics I', 4);

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, Grade)
VALUES
(1, 1, 101, 'A'),
(2, 1, 102, 'B'),
(3, 2, 103, 'A'),
(4, 3, 101, 'C'),
(5, 3, 103, 'B');

-- Perform Joins

-- Natural Join
SELECT *
FROM Students
NATURAL JOIN Enrollments;

-- Inner Join
SELECT Students.StudentID, Students.StudentName, Enrollments.CourseID, Enrollments.Grade
FROM Students
INNER JOIN Enrollments ON Students.StudentID = Enrollments.StudentID;

-- Left Join
SELECT Students.StudentID, Students.StudentName, Enrollments.CourseID, Enrollments.Grade
FROM Students
LEFT JOIN Enrollments ON Students.StudentID = Enrollments.StudentID;

-- Right Join
SELECT Students.StudentID, Students.StudentName, Enrollments.CourseID, Enrollments.Grade
FROM Students
RIGHT JOIN Enrollments ON Students.StudentID = Enrollments.StudentID;

-- Additional Join with Courses
-- Inner Join Enrollments with Courses
SELECT Enrollments.EnrollmentID, Students.StudentName, Courses.CourseName, Enrollments.Grade
FROM Enrollments
INNER JOIN Students ON Enrollments.StudentID = Students.StudentID
INNER JOIN Courses ON Enrollments.CourseID = Courses.CourseID;

-- Left Join Enrollments with Courses
SELECT Enrollments.EnrollmentID, Students.StudentName, Courses.CourseName, Enrollments.Grade
FROM Enrollments
LEFT JOIN Students ON Enrollments.StudentID = Students.StudentID
LEFT JOIN Courses ON Enrollments.CourseID = Courses.CourseID;

-- Right Join Enrollments with Courses
SELECT Enrollments.EnrollmentID, Students.StudentName, Courses.CourseName, Enrollments.Grade
FROM Enrollments
RIGHT JOIN Students ON Enrollments.StudentID = Students.StudentID
RIGHT JOIN Courses ON Enrollments.CourseID = Courses.CourseID;
