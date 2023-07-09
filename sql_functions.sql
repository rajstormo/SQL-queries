
USE db1;
CREATE TABLE employee2(ecode INT PRIMARY KEY,ename VARCHAR(20) NOT NULL, esal INT, dname VARCHAR(10));

INSERT INTO employee2 VALUES (1,"stormo",90000,"cse"), (2,"rajkumar",80000,"cse"), 
(3,"person3",70000,"ece"), (4,"person4",75000,"mec"), (5,"person5",85000,"ece");

INSERT INTO employee2(ename,esal,dname) VALUES("person6",60000,"hr");
INSERT INTO employee2 VALUES(7,"person7",70000,"cse");

SELECT * FROM employee2;
ALTER TABLE employee2 DROP PRIMARY KEY;
ALTER TABLE employee2 ADD PRIMARY KEY(ecode);
ALTER TABLE employee2 MODIFY ecode INT NULL;
DESC employee2;

# ORDER BY : sorts data acc to ascending(default) or desc (DESC)
SELECT * FROM employee2 ORDER BY esal;
SELECT * FROM employee2 ORDER BY esal DESC;

# GROUP BY: groups similar data together, used commonly with the aggregate functions
# outputs max salary of employee in each department
SELECT ename, dname, MAX(esal) FROM employee2 GROUP BY dname;

# HAVING CLAUSE: can be used with aggregate function as 'where' cannot be used with aggregate func
# outputs max salary of employees in each department except that of 'ece'
SELECT ename, dname, MAX(esal) FROM employee2 GROUP BY dname HAVING dname != 'ece';


# AGGREGATE FUNCTIONS
# 1. COUNT
SELECT COUNT(*) FROM employee2;
SELECT COUNT(ecode) FROM employee2;

# 2. SUM
SELECT SUM(esal) FROM employee2;
SELECT SUM(esal) FROM employee2 WHERE esal > 70000;
SELECT SUM(esal) FROM employee2 WHERE dname = 'cse';

# 3. AVG
SELECT AVG(esal) FROM employee2;

# 4. MAX
SELECT MAX(esal) FROM employee2;

# 5. MIN
SELECT MIN(esal) FROM employee2;
SELECT MIN(esal) FROM employee2 WHERE dname = 'cse';

# Find total salary department wise 
SELECT dname, SUM(esal) FROM employee2 GROUP BY dname;

# Find those dept in which more than two emp are working
SELECT dname FROM employee2 GROUP BY dname HAVING COUNT(dname) > 2;

# Find all the employees having sal greater than avg sal
SELECT ename, esal FROM employee2 WHERE esal > (SELECT AVG(esal) FROM employee2);

# Find all the employees getting the max salary 
SELECT ename,esal FROM employee2 WHERE esal = (SELECT MAX(esal) FROM employee2); 

# Find second highest salary	
SELECT ename, MAX(esal) FROM employee2 WHERE esal != (SELECT MAX(esal) FROM employee2);

SELECT * FROM employee2;

SELECT MIN(esal) FROM (SELECT DISTINCT esal FROM employee2 ORDER BY esal DESC) WHERE rownum < 3;	
