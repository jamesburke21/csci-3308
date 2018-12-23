/*Kara Wallace
Priyanka Karki*/

1. select * from store ORDER BY sname;
2. select * from store ORDER BY sname limit 3;
3. select * from store ORDER BY sname desc limit 3;
4. select * from store where price>1;
5. select id,sname, qty*price from store order by qty*price;
6. select sum(qty*price) from store;
7. select * course.cname from course join department on department_id = department.id where department.name = "CSC";
8. select sum(count) as totenrollment from enrollment;
9. select count(id) as numdept from department;
10. UPDATE course set department_id = 3 where cname = '112';
11. a) ALTER TABLE enrollment add drop_count TEXT;
	b) ALTER TABLE enrollment ALTER COLUMN drop_count TYPE varchar(40);
	c) ALTER TABLE enrollment ALTER COLUMN drop_count TYPE integer USING(drop_count::integer);
12. UPDATE enrollment set drop_count=(count*.2);
	lab6=# select * from enrollment
	lab6-# ;
	 id | count | drop_count 
	----+-------+------------
	  1 |    40 |          8
	  2 |    15 |          3
	  3 |    10 |          2
	  4 |    12 |          2
	  5 |    60 |         12
	  6 |    14 |          3
	  7 |   200 |         40
	(7 rows)
13. select name || cname from course inner join department ON course.department_id= department.id where name = 'CSC' ORDER BY cname;
14. select course.id,course.cname,department.name,enrollment.count,enrollment.drop_count from course INNER JOIN department ON 
	course.department_id = department.id INNER JOIN enrollment on course.id = enrollment.id
	 id | cname | name | count | drop_count 
	----+-------+------+-------+------------
	  1 | 111   | CSC  |    40 |          8
	  2 | 112   | EGR  |    15 |          3
	  3 | 250   | CSC  |    10 |          2
	  4 | 231   | CSC  |    60 |         12
	  5 | 111   | MTH  |    14 |          3
	  6 | 250   | EGR  |   200 |         40
15. a) ALTER TABLE enrollment DROP COLUMN drop_count;
	b) DELETE FROM enrollment;
	c) DROP TABLE enrollment;
	d) CREATE TABLE new_enrollment(id serial, department_name varchar(40) not null, count integer not null, drop_count integer, primary key(id));
		
		INSERT INTO new_enrollment (department_name,count,drop_count) values ('CSC', 100, 20), ('CHM', 120, 5), ('MTH', 90, 3), 
		('EGR', 122, 12), ('MTH', 68, 6), ('CSC', 100, 3), ('CHM', 30, 1);


