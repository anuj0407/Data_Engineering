CREATE TABLE students(
student_id serial PRIMARY KEY,
name varchar(100),
age bigint
);

INSERT INTO students(name,age)
VALUES('Akarsh',24),
('Anjali',22);

SELECT * FROM students;

ALTER TABLE students
ADD COLUMN email varchar(100);

ALTER TABLE students
DROP COLUMN email ;

ALTER TABLE students
ADD COLUMN email varchar(100) DEFAULT 'not provided';

ALTER TABLE students
RENAME COLUMN name TO full_name ;

ALTER TABLE students
ALTER COLUMN age TYPE smallint;

ALTER TABLE students
ALTER COLUMN age SET DEFAULT 18;

ALTER TABLE students
ALTER COLUMN age  DROP DEFAULT;

ALTER TABLE students
RENAME TO school_students;

ALTER TABLE school_students
ADD CONSTRAINT age_check check (age>=0);

ALTER TABLE school_students
DROP CONSTRAINT students_pkey;

SELECT * FROM school_students;