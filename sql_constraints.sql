# SQL CONSTRAINTS

# 1. Primary Key: no duplicate entry(unique), null value not allowed, applied on only 1 column per table
create table demo(id int primary key, name varchar(20));
insert into demo values(1,"rajkumar");
insert into demo values(1,"stormo"); #not allowed(no duplicate entries in id column)
insert into demo(name) values('raj'); # not allowed (id cannot be null);

# dropping the primary key
alter table demo drop primary key;
# adding primary key on column id;
alter table demo add primary key(id);

# creating table with a constraint_name
create table demo(id int, name varchar(20), constraint constraint_name primary key(id));
alter table demo drop constraint constraint_name;
alter table demo add constraint constraint_name primary key(id);

# 2. UNIQUE KEY: no duplicate entries, null value allowed, can be applied on multiple columns
create table demo2(id int unique not null primary key, name varchar(20));
insert into demo2 values(10,"geeta"),(11,"ravi");
insert into demo2 values(10,'raj'); # not allowed (duplicate id)

# adding and dropping unique key using 	"alter" command
alter table demo2 add unique(id);
alter table demo2 add unique(id,name);  #adding on multiple columns

alter table demo2 drop constraint id; # for mySQL
alter table demo2 drop unique(id); # oracle

# giving name to the constraint so that it can be later dropped using constraint_name
create table demo2(id int, name varchar(20), constraint unique_id unique(id));
alter table demo2 drop constraint unique_id; #dropping constraint using constraint_name


# 3. NOT NULL : no null values allowed for that particular column, can be applied on multiple columns
create table demo3(regNo int not null);
insert into demo3 values(1);
insert into demo3 values(null);

# adding & removing "not null" using alter command
alter table demo3 modify regNo int not null;
alter table demo3 modify regNo int null;


# 4. CHECK : applying condition for particular column
CREATE TABLE demo4 (name VARCHAR(20),age INT CHECK (age >= 18));

insert into demo4 values('Rajkumar',18);
insert into demo4 values('stormo',17); # row not inserted due to 'check' constraint

# adding CHECK constraint on a predefined table
alter table demo4 add check(age >= 18);

select constraint_type, constraint_name from user_constraint where table_name = 'TABLE_NAME'; # oracle
# removing CHECK constraint
alter table demo4 drop constraint constraint_name;

# Giving name to the check constraint so that it can be dropped later
alter table demo4 add constraint check_age check(age >= 18);

#removing check constraint
alter table demo4 drop constraint check_age;

# 5. DEFAULT CONSTRAINT :
create table t1(name varchar(20), state varchar(20) default 'bihar');
insert into t1(name) values('rajkumar'); # default state value -> bihar
insert into t1 values('stormo','gujarat');

# deleting 1 row out of 2 duplicate rows
delete from t1 where name = 'rajkumar' limit 1;

# DROPPING the default constraint
alter table t1 alter column state drop default;

# ADDING the default constraint using ALTER command
alter table t1 modify state default 'bihar'; # oracle
alter table t1 alter state set default 'bihar'; # sql


# 6. FOREIGN KEY: defines relation b/w 2 tables, foreign key columns can have duplicate values
# foreign key is a field in one table , which refers to the primary key in another table

create table person(id int primary key, name varchar(20));
create table orders(order_id int, id int, constraint f_key foreign key(id) references person(id));

# adding foreign key on already existing table
ALTER TABLE orders ADD FOREIGN KEY(id) REFERENCES person(id);
ALTER TABLE orders ADD CONSTRAINT f_key FOREIGN KEY(id) REFERENCES person(id);

# dropping foreign key 
ALTER TABLE orders DROP CONSTRAINT constraint_name;
