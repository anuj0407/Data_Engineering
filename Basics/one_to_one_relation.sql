CREATE TABLE students(
student_id SERIAL PRIMARY KEY,
name VARCHAR(100) NOT NULL
);

INSERT INTO students (name) 
VALUES
('Adarsh'),
('Simran'),
('rohan');

SELECT * FROM students;

CREATE TABLE student_profiles (
student_id INT PRIMARY KEY,
address TEXT,
age INT,
phone VARCHAR(15)
);

INSERT INTO student_profiles(student_id,address,age,phone)
VALUES(1,'delhi,India',22,'9999999999'),
(2,'mumbai,India',21,'44544222145421'),
(3,'bangalore,India',23,'445448888888');

SELECT * FROM student_profiles;

ALTER TABLE student_profiles
ADD CONSTRAINT fk_student_id
FOREIGN KEY (student_id) 
REFERENCES students(student_id);

SELECT 
s.student_id,
s.name,
sp.address,
sp.age,
sp.phone
FROM students s
JOIN student_profiles sp
ON s.student_id=sp.student_id;