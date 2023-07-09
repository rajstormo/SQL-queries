# shows all the existing databases
SHOW DATABASES;

# create a new database(db)
CREATE DATABASE studentData;

# delete a database
DROP DATABASE studentData;

# which database to use and work on
USE studentdata;

# view all existing tables
SHOW TABLES;

# ------------------------------------------------- CREATE TABLE (DDL) -----------------------------------------------------------------
CREATE TABLE students(
	id INT,
    name VARCHAR(20),
    marks INT
);

# to view structure of the table
DESC students;

# ------------------------------------------------- INSERT INTO, UPDATE, DELETE (DML -> data manipulation lang.) -----------------------------------------------------------------
# insert data into the table: INSERT INTO
INSERT INTO students VALUES(2, "rajkumar", 90);

# insert multiple values at once
INSERT INTO students VALUES(1,"naveen",85), (2,"rajkumar",90), (3,"abhinav",95);

# insert data into specific columns
INSERT INTO students(name,marks) VALUES("chilla",90);

# update 'chilla' marks to 95
UPDATE students set marks = 95 where name = 'chilla';

# delete a record
DELETE from students;

# ------------------------------------------------- SELECT (DQL -> data query lang.) -----------------------------------------------------------------
# to see data of student table
SELECT * FROM students;

# to show only specified columns of a table
SELECT name, marks FROM students;

# ------------------------------------------------- TRUNCATE, DROP (DDL) -----------------------------------------------------------------
# TRUNCATE: delete all the values but the structure of table remains intact
TRUNCATE TABLE students;

# deletes the table (table values + structure -> both deleted)
DROP TABLE students;

# ------------------------------------------------- ALTER (DDL) -----------------------------------------------------------------
# ALTER: to change the structure of table i.e modifying, deleting or adding columns
# alter also used to add or drop constraints defined on the tables

# 1. add new column to table 
ALTER TABLE students add gender char(1);

# 2. delete a column
ALTER TABLE students drop gender;

# 3. change data type of a column/ also modify the constraints
ALTER TABLE students modify name char(20) not null;

# 4. rename table 
ALTER TABLE std rename to students;

# 5. rename column of a table
ALTER TABLE students rename column firstname to name;

# 6. adding constraints to a column

	# set "id column" as primary key
	ALTER TABLE students add primary key(id); 
    
    # drop constraints
    ALTER TABLE studentts drop primary key;


# DIFFERENCE B/W TRUNCATE AND DELETE
	# TRUNCATE: deletes complete data from table keep the structure intact, ddl command, where clause cannot be used, fast, data can be restored using commit or rollback
    # DELETE: used to delete particular records, dml command, where clause can be used, slow, data cannot be restored 












