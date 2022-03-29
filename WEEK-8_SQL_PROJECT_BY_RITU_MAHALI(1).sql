PROJECT PART 1(SOLVING QUERIES)

--1.How can you retrieve all the information from the cd.facilities table?
--Ans. Retrive all the information that is required using SELECT statement
select * FROM  cd.facilities;

--2.You want to print out a list of all of the facilities and their cost to members. 
--How would you retrieve a list of only facility names and costs?
--ANS.Retrieve a list of only facility names and costs using SELECT statement
select name , membercost 
FROM cd.facilities;

--3.How can you produce a list of facilities that charge a fee to members?
--Expected Results should have just 5 rows:
--Ans.Produce a list of facilities that charge a fee to members using WHERE condition
SELECT name, membercost
FROM cd.facilities
WHERE membercost > 0;

--4.How can you produce a list of facilities that charge a fee to members, and 
--that fee is less than 1/50th of the monthly maintenance cost? Return the facid, 
--facility name, member cost, and monthly maintenance of the facilities in question.
--Result is just two rows:
--Ans.Produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of 
--the monthly maintenance cost.Return the facid, facility name, member cost, and monthly maintenance 
--of the facilities in question by the following condition.
SELECT facid,name,membercost,monthlymaintenance
FROM cd.facilities 
WHERE membercost > 0 AND membercost < monthlymaintenance/50;

--5.How can you produce a list of all facilities with the word 'Tennis' in their name?
--Expected Result is 3 rows
--Ans. We solve the above query using WHERE and LIKE '% %'.
SELECT name
FROM cd.facilities
WHERE name LIKE '%Tennis%';

--6.How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.
--Expected Result is 2 rows
--Ans. Retrieve the details of facilities with ID 1 and 5 without using the OR operator in the following way:
SELECT facid, name
FROM cd.facilities
WHERE facid IN (1,5);

--7.How can you produce a list of members who joined after the start of September 2012? Return the memid, surname, firstname, and joindate of the members in question.
--Expected Result is 10 rows
--Ans.Produce a list of members who joined after the start of September 2012. 
--Return the memid, surname, firstname, and joindate of the members by putting the following WHERE condition:
SELECT *
FROM cd.members
WHERE joindate >= '2012-09-01';

--8.How can you produce an ordered list of the first 10 surnames in the members table? 
--The list must not contain duplicates.
--Ans. We can produce an ordered list of 10 surnames in the members table using DISTINCT to select different surname.
--Then we arrange them to make it ordered and specify the limit of 10 using limit.
SELECT DISTINCT surname
FROM cd.members
ORDER BY surname ASC
LIMIT 10;

--9.You'd like to get the signup date of your last member. How can you retrieve this information?
--Expected Result - 2012-09-26 18:08:45
--Ans. There are 2 ways of solving this query.
-- METHOD 1 : To arrange joindate in the descending order and limit it to 1 to find the last member.
SELECT joindate FROM cd.members
ORDER BY joindate DESC
LIMIT 1;
-- METHOD 2 : Find the max of joindate from cd.members
SELECT max(joindate)
FROM cd.members;

--10.Produce a count of the number of facilities that have a cost to guests of 10 or more.
--Expected Result : 6
--Ans. Produce a count of the number of facilities that have a cost to guests of 10 or more using aggregate
-- function COUNT and WHERE condition.
SELECT COUNT(*)
FROM cd.facilities
WHERE guestcost >= 10;

--11.Produce a list of the total number of slots booked per facility in the month of September 2012. 
--Produce an output table consisting of facility id and slots, sorted by the number of slots.
--Expected Result is 9 rows
--Ans. As the question asks , we will select facility id and slots. We will use an aggregate function SUM
-- for the total slots acquired by a particular facility id. We will give it the alias total_slots.
--Then we will specify the duration for which we need the data.Group them by facid and arrange them by SUM(slots).
SELECT facid, SUM(slots) AS "total slots"
FROM cd.bookings
WHERE cd.bookings.starttime BETWEEN '2012-09-01' AND '2012-09-30'
GROUP by facid
ORDER BY SUM(slots) ;

--12.Produce a list of facilities with more than 1000 slots booked. 
--Produce an output table consisting of facility id and total slots, sorted by facility id.
--Expected Result is 5 rows
--Ans. Produce a list of facilities with more than 1000 slots booked. And an output table consisting of 
--facility id and total slots, sorted by facility id. We will solve this in a similar as we did in the previous
--question.
SELECT facid, SUM(slots) AS total_slots
FROM cd.bookings
GROUP BY facid
HAVING SUM(slots) > 1000
ORDER BY facid;

--13.How can you produce a list of the start times for bookings for tennis courts, 
--for the date '2012-09-21'? Return a list of start time and facility name pairings, ordered by the time.
--Expected Result is 12 rows
-- Ans. Produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'.
--Return a list of start time and facility name pairings, ordered by the time.
-- For this we will simply join facilities and bookings tables together on the facid. This produces a table where, 
--for each row in bookings, we've attached detailed information about the facility being booked.
--On to the WHERE component of the query,we're making sure that all the bookings start between the specified dates
--and since we are only interested in Tennis courts we will also sepcify that using LIKe for the name.
SELECT starttime, name
FROM cd.bookings
INNER JOIN cd.facilities ON cd.facilities.facid = cd.bookings.facid
WHERE name LIKE '%Tennis Court%' AND starttime BETWEEN '2012-09-21 00:00:00' AND '2012-09-21 23:59:59' 
ORDER BY starttime;

--14.How can you produce a list of the start times for bookings by members named 'David Farrell'?
--Expected result is 34 rows of timestamps
--Ans. In order to produce a list of the start times for bookings by members named 'David Farrell' , we simple select
--start time from cd.bookings. Then we perform inner join on memid to join members and booking table.And specify
--the member name for which we want the list using LIKE.
SELECT starttime
FROM cd.bookings
INNER JOIN cd.members ON cd.members.memid = cd.bookings.memid
WHERE surname LIKE '%Farrell%' AND firstname LIKE '%David%'  
ORDER BY starttime;


PROJECT PART-2(CREATING SQL DATABASE)

--Problem: Create a new database called “School” this database should have two tables: teachers and students.
--The students table should have columns for student_id, first_name,last_name, homeroom_number, phone,email, 
--and graduation year.
--The teachers table should have columns for teacher_id, first_name, last_name, homeroom_number, department, 
--email, and phone.
--The constraints are mostly up to you, but your table constraints do have to consider the following:
--We must have a phone number to contact students in case of an emergency.
--We must have ids as the primary key of the tables
--Phone numbers and emails must be unique to the individual.
--Once you’ve made the tables, insert a student named Mark Watney (student_id=1) who has a phone 
--number of 777-555-1234 and doesn’t have an email. He graduates in 2035 and has 5 as a homeroom number.
--Then insert a teacher names Jonas Salk (teacher_id = 1) who as a homeroom number of 5 and is from 
--.the Biology department. His contact info is: jsalk@school.org and a phone number of 777-555-4321.

--ANSWER:
-- Generate Table teachers
CREATE TABLE teachers(
teacher_id serial PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
homeroom_number integer,
department VARCHAR(50),
phone VARCHAR(255) UNIQUE,
email VARCHAR(50) UNIQUE
);
-- Generate Table students
CREATE TABLE students(
student_id serial PRIMARY KEY,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
homeroom_number integer,
phone VARCHAR(255) NOT NULL UNIQUE,
email VARCHAR(50) UNIQUE,
grad_year integer
);
-- INSERT student
INSERT INTO students (student_id, first_name, last_name, homeroom_number, phone, grad_year)
VALUES (1, 'Mark', 'Watney', 5, '777-555-1234', 2035);
-- INSERT teacher
INSERT INTO teachers (teacher_id, first_name, last_name, homeroom_number, department, phone,  email)
VALUES (1, 'Jonas', 'Salk', 5, 'Biology',  '777-555-4321', 'jsalk@school.org');