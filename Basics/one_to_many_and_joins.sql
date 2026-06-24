-- one to many relation
CREATE TABLE students (
  student_id SERIAL PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

CREATE TABLE marks (
  mark_id SERIAL PRIMARY KEY,
  student_id INT,
  subject VARCHAR(50),
  marks INT,
  FOREIGN KEY (student_id) REFERENCES students(student_id)
);

INSERT INTO students (name)
VALUES ('Adarsh'), ('Simran'), ('rohan');

SELECT * FROM students;

INSERT INTO marks (student_id, subject, marks)
VALUES
(1, 'English', 85), (1, 'Math', 89), (1, 'Science', 92),
(2, 'English', 80), (2, 'Math', 75), (2, 'Science', 78),
(3, 'English', 72), (3, 'Math', 70), (3, 'Science', 74);

SELECT * FROM marks;

-- joins usage
-- inner join
SELECT s.name,m.subject,m.marks 
FROM students s JOIN marks m 
ON s.student_id = m.student_id;

-- left join
INSERT INTO students(name) 
VALUES ('Harsh');

SELECT s.name,m.subject,m.marks 
FROM students s LEFT JOIN marks m 
ON s.student_id = m.student_id;

-- right join
SELECT s.name,m.subject,m.marks 
FROM students s RIGHT JOIN marks m 
ON s.student_id = m.student_id;

-- FULL JOIN
INSERT INTO students(name) 
VALUES ('Sarthak');

SELECT s.name,m.subject,m.marks 
FROM students s FULL JOIN marks m 
ON s.student_id = m.student_id;

-- CROSS JOIN(RETURN CARTESIAN PRODUCT)
SELECT s.name,m.subject,m.marks 
FROM students s CROSS JOIN marks m;

