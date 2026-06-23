-- String functions
-- change to uppercase
SELECT UPPER(title) FROM courses;

-- change to lowercase
SELECT LOWER(title) FROM courses;

-- return the length of the string(characters in a string)
SELECT LENGTH(title) FROM courses;

--To extract the substring 
SELECT SUBSTRING('Brother in arms',7,4);

--To Extract the the end 4 values of course id 
SELECT title,SUBSTRING(course_id,6,4) FROM courses;

--To get the values from the left
SELECT LEFT('Hello world',5);

--To get the values from the right
SELECT RIGHT('Hello world',5);

--To concat the name with the category
SELECT CONCAT(title,' ',course_id) AS title_with_course_id FROM courses;

--To give the with separator so that we can give one time how to seperate the coloumn values
SELECT CONCAT_WS(' ',title,course_id) FROM courses;

--To remove spaces use trim
SELECT TRIM('    HELLO WORLD   ');

--To replace the sku_code first 2 character
SELECT title, REPLACE(course_id,LEFT(course_id,4),'CURS') FROM courses;
