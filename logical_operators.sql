
USE studentdata;

# creating table
CREATE TABLE employee(id INT, name VARCHAR(20), salary INT, job VARCHAR(20), state VARCHAR(20));

# inserting values 
INSERT INTO employee(id,name,salary,job,state) VALUES (1,"rajkumar", 80000,	"web developer","gujarat"),(2,"stormo",70000,"gamer","gujarat");
INSERT INTO employee VALUES(5,"unknown",65000,"manager","mumbai");

# WHERE CLAUSE: used to filter records
SELECT* FROM employee;
SELECT * FROM employee WHERE salary > 70000;

# AND & OR operators
SELECT * FROM employee WHERE salary >= 70000 AND state = "gujarat";
SELECT * FROM employee WHERE salary > 70000 OR state = "gujarat";

# BETWEEN: select those employees whose salary is b/w [65000, 70000] (both inclusive)
SELECT * FROM employee WHERE salary BETWEEN 65000 AND 70000;

# in place of using multiple OR's,  use IN operator
SELECT * FROM employee WHERE job = "web developer" OR job = "software engineer";
SELECT * FROM employee WHERE job IN("web developer","software engineer");
SELECT * FROM employee WHERE state NOT IN ("gujarat");
	
# name starting with "ra"
SELECT * FROM employee WHERE name LIKE"ra%";

# Name ending with "ar"	
SELECT * FROM employee WHERE name LIKE "%ar";

# states with substring as "jar"
SELECT * FROM employee WHERE state LIKE '%jar%';

# names whose second last character is 'a'
SELECT * FROM employee WHERE name LIKE "%a_";

# states having 7 characters
SELECT * FROM employee WHERE state LIKE "_______";

# states having 7 characters but is starting from 'g'
SELECT * FROM employee WHERE state LIKE "g______";

