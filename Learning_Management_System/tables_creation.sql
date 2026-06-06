CREATE TABLE users(
user_id VARCHAR(10) NOT NULL PRIMARY KEY CHECK (user_id ~ '^USR-[0-9]{4}$'),
user_name VARCHAR(100) NOT NULL,
user_role VARCHAR(30) NOT NULL,
user_email VARCHAR(50) NOT NULL,
user_phone BIGINT NOT NULL
);

CREATE TABLE courses(
course_id VARCHAR(10) NOT NULL PRIMARY KEY CHECK(course_id ~ '^CORS-[0-9]{4}$'),
title VARCHAR(100) NOT NULL,
description TEXT NOT NULL
);

CREATE TABLE lessons(
lesson_id VARCHAR(10) NOT NULL PRIMARY KEY CHECK(lesson_id ~ '^LES-[0-9]{4}$'),
course_id VARCHAR(10) NOT NULL REFERENCES courses(course_id),
title VARCHAR(100) NOT NULL,
"content" TEXT NOT NULL
);

CREATE TABLE enrollments(
enrollment_id VARCHAR(10) NOT NULL PRIMARY KEY CHECK(enrollment_id ~ '^ERL-[0-9]{4}$'),
user_id VARCHAR(10) NOT NULL REFERENCES users(user_id),
course_id VARCHAR(10) NOT NULL REFERENCES courses(course_id),
enrollment_date TIMESTAMP NOT NULL
);

CREATE TABLE user_activity(
activity_id VARCHAR(10) NOT NULL PRIMARY KEY CHECK(activity_id ~ '^ACT-[0-9]{4}$'),
user_id VARCHAR(10) NOT NULL REFERENCES users(user_id),
lesson_id VARCHAR(10) NOT NULL REFERENCES lessons(lesson_id),
activity_status VARCHAR(30) NOT NULL
);

CREATE TABLE assessments(
assessment_id VARCHAR(10) NOT NULL PRIMARY KEY CHECK(assessment_id ~ '^ASS-[0-9]{4}$'),
course_id VARCHAR(10) NOT NULL REFERENCES courses(course_id),
max_score INT NOT NULL
);

CREATE TABLE assessment_submissions(
submission_id VARCHAR(10) NOT NULL PRIMARY KEY CHECK(submission_id ~ '^SUB-[0-9]{4}$'),
assessment_id VARCHAR(10) NOT NULL REFERENCES assessments(assessment_id),
user_id VARCHAR(10) NOT NULL REFERENCES users(user_id),
submission_date DATE NOT NULL
);

