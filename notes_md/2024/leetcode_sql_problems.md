# Learn - SQL - Problems

 Practicing leetcode... Practicing leetcode...

## Average Time of Process per Machine

 There is a factory website that has several machines each running the same number of processes. Write a solution to find the average time each machine takes to complete a process.

 The time to complete a process is the 'end' timestamp minus the 'start' timestamp. The average time is calculated by the total time to complete every process on the machine divided by the number of processes that were run.

 The resulting table should have the machine_id along with the average time as processing_time, which should be rounded to 3 decimal places.

 Return the result table in any order.

	Input: 
	
		Activity table:
		+------------+------------+---------------+-----------+
		| machine_id | process_id | activity_type | timestamp |
		+------------+------------+---------------+-----------+
		| 0          | 0          | start         | 0.712     |
		| 0          | 0          | end           | 1.520     |
		| 0          | 1          | start         | 3.140     |
		| 0          | 1          | end           | 4.120     |
		| 1          | 0          | start         | 0.550     |
		| 1          | 0          | end           | 1.550     |
		| 1          | 1          | start         | 0.430     |
		| 1          | 1          | end           | 1.420     |
		| 2          | 0          | start         | 4.100     |
		| 2          | 0          | end           | 4.512     |
		| 2          | 1          | start         | 2.500     |
		| 2          | 1          | end           | 5.000     |
		+------------+------------+---------------+-----------+
		
	Output: 
	
		+------------+-----------------+
		| machine_id | processing_time |
		+------------+-----------------+
		| 0          | 0.894           |
		| 1          | 0.995           |
		| 2          | 1.456           |
		+------------+-----------------+
		
		Explanation: 
		There are 3 machines running 2 processes each.
		Machine 0's average time is ((1.520 - 0.712) + (4.120 - 3.140)) / 2 = 0.894
		Machine 1's average time is ((1.550 - 0.550) + (1.420 - 0.430)) / 2 = 0.995
		Machine 2's average time is ((4.512 - 4.100) + (5.000 - 2.500)) / 2 = 1.456

	# MySQL query statement below

		select a1.machine_id, round(avg(a2.timestamp-a1.timestamp), 3) as processing_time 
		from Activity a1
		join Activity a2 
		on a1.machine_id=a2.machine_id and a1.process_id=a2.process_id
		and a1.activity_type='start' and a2.activity_type='end'
		group by a1.machine_id
		
## Students and Examinations

		Table: Students

		+---------------+---------+
		| Column Name   | Type    |
		+---------------+---------+
		| student_id    | int     |
		| student_name  | varchar |
		+---------------+---------+
		
		student_id is the primary key (column with unique values) for this table.
		Each row of this table contains the ID and the name of one student in the school.
		 

		Table: Subjects

		+--------------+---------+
		| Column Name  | Type    |
		+--------------+---------+
		| subject_name | varchar |
		+--------------+---------+
		
		subject_name is the primary key (column with unique values) for this table.
		Each row of this table contains the name of one subject in the school.
		 

		Table: Examinations

		+--------------+---------+
		| Column Name  | Type    |
		+--------------+---------+
		| student_id   | int     |
		| subject_name | varchar |
		+--------------+---------+
		
		There is no primary key (column with unique values) for this table. It may contain duplicates.
		Each student from the Students table takes every course from the Subjects table.
		Each row of this table indicates that a student with ID student_id attended the exam of subject_name.
		 

		Write a solution to find the number of times each student attended each exam.

		Return the result table ordered by student_id and subject_name.
		
		Example 1:

		Input: 
		Students table:
		+------------+--------------+
		| student_id | student_name |
		+------------+--------------+
		| 1          | Alice        |
		| 2          | Bob          |
		| 13         | John         |
		| 6          | Alex         |
		+------------+--------------+
		Subjects table:
		+--------------+
		| subject_name |
		+--------------+
		| Math         |
		| Physics      |
		| Programming  |
		+--------------+
		Examinations table:
		+------------+--------------+
		| student_id | subject_name |
		+------------+--------------+
		| 1          | Math         |
		| 1          | Physics      |
		| 1          | Programming  |
		| 2          | Programming  |
		| 1          | Physics      |
		| 1          | Math         |
		| 13         | Math         |
		| 13         | Programming  |
		| 13         | Physics      |
		| 2          | Math         |
		| 1          | Math         |
		+------------+--------------+
		Output: 
		+------------+--------------+--------------+----------------+
		| student_id | student_name | subject_name | attended_exams |
		+------------+--------------+--------------+----------------+
		| 1          | Alice        | Math         | 3              |
		| 1          | Alice        | Physics      | 2              |
		| 1          | Alice        | Programming  | 1              |
		| 2          | Bob          | Math         | 1              |
		| 2          | Bob          | Physics      | 0              |
		| 2          | Bob          | Programming  | 1              |
		| 6          | Alex         | Math         | 0              |
		| 6          | Alex         | Physics      | 0              |
		| 6          | Alex         | Programming  | 0              |
		| 13         | John         | Math         | 1              |
		| 13         | John         | Physics      | 1              |
		| 13         | John         | Programming  | 1              |
		+------------+--------------+--------------+----------------+
		
		Explanation: 
		
		The result table should contain all students and all subjects.
		Alice attended the Math exam 3 times, the Physics exam 2 times, and the Programming exam 1 time.
		Bob attended the Math exam 1 time, the Programming exam 1 time, and did not attend the Physics exam.
		Alex did not attend any exams.
		John attended the Math exam 1 time, the Physics exam 1 time, and the Programming exam 1 time.
		
		
		# MySQL query statement below
		
		select s.student_id, s.student_name, sub.subject_name,
		count(e.student_id) as attended_exams
		from Students s
		cross join Subjects sub
		left join Examinations e on s.student_id = e.student_id and 
		sub.subject_name = e.subject_name
		GROUP BY s.student_id, s.student_name, sub.subject_name
		ORDER BY s.student_id, sub.subject_name;
		
					(OR)
					
		SELECT s.student_id, s.student_name, sub.subject_name, COALESCE(e.attended_exams, 0) AS attended_exams
		FROM Students s
		CROSS JOIN Subjects sub
		LEFT JOIN (
			SELECT student_id, subject_name, COUNT(*) AS attended_exams
			FROM Examinations
			GROUP BY student_id, subject_name
		) e USING (student_id, subject_name)
		ORDER BY s.student_id, sub.subject_name;
		
## Managers with at Least 5 Direct Reports

	Table: Employee

	+-------------+---------+
	| Column Name | Type    |
	+-------------+---------+
	| id          | int     |
	| name        | varchar |
	| department  | varchar |
	| managerId   | int     |
	+-------------+---------+
	
	id is the primary key (column with unique values) for this table.
	Each row of this table indicates the name of an employee, their department, and the id of their manager.
	If managerId is null, then the employee does not have a manager.
	No employee will be the manager of themself.
	
	Example 1:

	Input: 
	Employee table:
	+-----+-------+------------+-----------+
	| id  | name  | department | managerId |
	+-----+-------+------------+-----------+
	| 101 | John  | A          | null      |
	| 102 | Dan   | A          | 101       |
	| 103 | James | A          | 101       |
	| 104 | Amy   | A          | 101       |
	| 105 | Anne  | A          | 101       |
	| 106 | Ron   | B          | 101       |
	+-----+-------+------------+-----------+
	Output: 
	+------+
	| name |
	+------+
	| John |
	+------+
	
	
	# MySQL query statement below
	
	select name from employee where id in (select managerId from employee group by managerId having count(managerId)>4);
	
## Confirmation Rate

	Table: Signups

	+----------------+----------+
	| Column Name    | Type     |
	+----------------+----------+
	| user_id        | int      |
	| time_stamp     | datetime |
	+----------------+----------+
	
	user_id is the column of unique values for this table.
	Each row contains information about the signup time for the user with ID user_id.
	
	Table: Confirmations

	+----------------+----------+
	| Column Name    | Type     |
	+----------------+----------+
	| user_id        | int      |
	| time_stamp     | datetime |
	| action         | ENUM     |
	+----------------+----------+
	
	(user_id, time_stamp) is the primary key (combination of columns with unique values) for this table.
	user_id is a foreign key (reference column) to the Signups table.
	action is an ENUM (category) of the type ('confirmed', 'timeout')
	Each row of this table indicates that the user with ID user_id requested a confirmation message at time_stamp and that confirmation message was either confirmed ('confirmed') or expired without confirming ('timeout').
	
	Example 1:

	Input: 
	Signups table:
	+---------+---------------------+
	| user_id | time_stamp          |
	+---------+---------------------+
	| 3       | 2020-03-21 10:16:13 |
	| 7       | 2020-01-04 13:57:59 |
	| 2       | 2020-07-29 23:09:44 |
	| 6       | 2020-12-09 10:39:37 |
	+---------+---------------------+
	
	Confirmations table:
	+---------+---------------------+-----------+
	| user_id | time_stamp          | action    |
	+---------+---------------------+-----------+
	| 3       | 2021-01-06 03:30:46 | timeout   |
	| 3       | 2021-07-14 14:00:00 | timeout   |
	| 7       | 2021-06-12 11:57:29 | confirmed |
	| 7       | 2021-06-13 12:58:28 | confirmed |
	| 7       | 2021-06-14 13:59:27 | confirmed |
	| 2       | 2021-01-22 00:00:00 | confirmed |
	| 2       | 2021-02-28 23:59:59 | timeout   |
	+---------+---------------------+-----------+
	
	Output: 
	+---------+-------------------+
	| user_id | confirmation_rate |
	+---------+-------------------+
	| 6       | 0.00              |
	| 3       | 0.00              |
	| 7       | 1.00              |
	| 2       | 0.50              |
	+---------+-------------------+
	
	Explanation: 
	User 6 did not request any confirmation messages. The confirmation rate is 0.
	User 3 made 2 requests and both timed out. The confirmation rate is 0.
	User 7 made 3 requests and all were confirmed. The confirmation rate is 1.
	User 2 made 2 requests where one was confirmed and the other timed out. The confirmation rate is 1 / 2 = 0.5.
	
	# MySQL query statement below
	
	select s.user_id, round(avg(if(c.action="confirmed",1,0)),2) as confirmation_rate
	from Signups as s left join Confirmations as c on s.user_id= c.user_id group by user_id;
	
## Not Boring Movies
	
	
 Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".

 Return the result table ordered by rating in descending order.

 The result format is in the following example.

 

	Example 1:

	Input: 
	Cinema table:
	+----+------------+-------------+--------+
	| id | movie      | description | rating |
	+----+------------+-------------+--------+
	| 1  | War        | great 3D    | 8.9    |
	| 2  | Science    | fiction     | 8.5    |
	| 3  | irish      | boring      | 6.2    |
	| 4  | Ice song   | Fantacy     | 8.6    |
	| 5  | House card | Interesting | 9.1    |
	+----+------------+-------------+--------+
	
	Output: 
	+----+------------+-------------+--------+
	| id | movie      | description | rating |
	+----+------------+-------------+--------+
	| 5  | House card | Interesting | 9.1    |
	| 1  | War        | great 3D    | 8.9    |
	+----+------------+-------------+--------+
	

 Explanation: 
 
 We have three movies with odd-numbered IDs: 1, 3, and 5. The movie with ID = 3 is boring so we do not include it in the answer.
	
	
	# MySQL query statement below
	
		select * from Cinema where id % 2 != 0 and description != 'boring' order by rating desc;
		
								OR
								
		select * from Cinema where id % 2 = 1 and description != "boring" order by rating desc;
		
								OR
								
		select * from Cinema where mod(id,2) and description<>'boring' order by rating desc;
		
## Average Selling Price

	 Table: Prices

	+---------------+---------+
	| Column Name   | Type    |
	+---------------+---------+
	| product_id    | int     |
	| start_date    | date    |
	| end_date      | date    |
	| price         | int     |
	+---------------+---------+

 product_id, start_date, end_date) is the primary key (combination of columns with unique values) for this table.
 Each row of this table indicates the price of the product_id in the period from start_date to end_date.
 For each product_id there will be no two overlapping periods. That means there will be no two intersecting periods for the same product_id.
	
	Table: UnitsSold

	+---------------+---------+
	| Column Name   | Type    |
	+---------------+---------+
	| product_id    | int     |
	| purchase_date | date    |
	| units         | int     |
	+---------------+---------+

 This table may contain duplicate rows. Each row of this table indicates the date, units, and product_id of each product sold.
 Write a solution to find the average selling price for each product. average_price should be rounded to 2 decimal places. Return the result table in any order.
 
 Example 1:
 
	Input: 
	
	Prices table:
	
	+------------+------------+------------+--------+
	| product_id | start_date | end_date   | price  |
	+------------+------------+------------+--------+
	| 1          | 2019-02-17 | 2019-02-28 | 5      |
	| 1          | 2019-03-01 | 2019-03-22 | 20     |
	| 2          | 2019-02-01 | 2019-02-20 | 15     |
	| 2          | 2019-02-21 | 2019-03-31 | 30     |
	+------------+------------+------------+--------+
	
	UnitsSold table:
	
	+------------+---------------+-------+
	| product_id | purchase_date | units |
	+------------+---------------+-------+
	| 1          | 2019-02-25    | 100   |
	| 1          | 2019-03-01    | 15    |
	| 2          | 2019-02-10    | 200   |
	| 2          | 2019-03-22    | 30    |
	+------------+---------------+-------+
	
	Output: 
	+------------+---------------+
	| product_id | average_price |
	+------------+---------------+
	| 1          | 6.96          |
	| 2          | 16.96         |
	+------------+---------------+
	
 Explanation: 
 
	Average selling price = Total Price of Product / Number of products sold.
	Average selling price for product 1 = ((100 * 5) + (15 * 20)) / 115 = 6.96
	Average selling price for product 2 = ((200 * 15) + (30 * 30)) / 230 = 16.96
	
 MySQL query statement below
	
	SELECT p.product_id, IFNULL(ROUND(SUM(units*price)/SUM(units),2),0) AS average_price
    FROM Prices p LEFT JOIN UnitsSold u ON p.product_id = u.product_id AND u.purchase_date BETWEEN start_date AND end_date
	group by product_id
