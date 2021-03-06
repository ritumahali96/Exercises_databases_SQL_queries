RDBMS used: Postgresql

# SQL Queries
![schema-horizontal](https://user-images.githubusercontent.com/22495927/160691181-35763b00-43f3-40c9-bcaf-6c9d78382e61.svg)
The above is a schema of Exercises database.

I will be solving following queries based on that:

1.How can you retrieve all the information from the cd.facilities table?

2.You want to print out a list of all of the facilities and their cost to members. How would you retrieve a list of only facility names and costs?

3.How can you produce a list of facilities that charge a fee to members?

4.How can you produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost? Return the facid, facility name, member cost, and monthly maintenance of the facilities in question.

5.How can you produce a list of all facilities with the word 'Tennis' in their name?

6.How can you retrieve the details of facilities with ID 1 and 5? Try to do it without using the OR operator.

7.How can you produce a list of members who joined after the start of September 2012? Return the memid, surname, firstname, and joindate of the members in question.

8.How can you produce an ordered list of the first 10 surnames in the members table? The list must not contain duplicates.

9.You'd like to get the signup date of your last member. How can you retrieve this information?

10.Produce a count of the number of facilities that have a cost to guests of 10 or more.

11.Produce a list of the total number of slots booked per facility in the month of September 2012. Produce an output table consisting of facility id and slots, sorted by the number of slots.

12.Produce a list of facilities with more than 1000 slots booked. Produce an output table consisting of facility id and total slots, sorted by facility id.

13.How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'? Return a list of start time and facility name pairings, ordered by the time.

14.How can you produce a list of the start times for bookings by members named 'David Farrell'?


# SQL DATABASE

Complete the following task:

1.Create a new database called "School" this database should have two tables: teachers and students.

2.The students table should have columns for student_id, first_name,last_name, homeroom_number, phone,email, and graduation year.

3.The teachers table should have columns for teacher_id, first_name, last_name, homeroom_number, department, email, and phone.

4.The constraints are mostly up to you, but your table constraints do have to consider the following:

 *We must have a phone number to contact students in case of an emergency.
 
 *We must have ids as the primary key of the tables
 
 *Phone numbers and emails must be unique to the individual.
 
 *Once you've made the tables, insert a student named Mark Watney (student_id=1) who has a phone number of 777-555-1234 and doesn't have an email. He graduates in 2035 and has 5 as a homeroom number.

Then insert a teacher names Jonas Salk (teacher_id = 1) who as a homeroom number of 5 and is from the Biology department. His contact info is: jsalk@school.org and a phone number of 777-555-4321.

Keep in mind that these insert tasks may effect your constraints!
