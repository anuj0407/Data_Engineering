CREATE TABLE Students(
student_id INT,
name char(50),
age INT,
grade char(1)
);

INSERT INTO Students (student_id,name,age,grade)
values (01,'Rahul',25,'A'),
(02,'Shivam',22,'B'),
(03,'Anjali',23,'A');

SELECT * FROM Students;