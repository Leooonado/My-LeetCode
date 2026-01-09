"""
LeetCode 176 - Second Highest Salary
Difficulty: Medium
Category: Database

Problem:
Table: Employee
+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key (column with unique values) for this table.
Each row of this table contains information about the salary of an employee.
 
Write a solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return null (return None in Pandas).

The result format is in the following example.

Example 1:

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+
Example 2:

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| null                |
+---------------------+
"""
"""
##
  METHOD 1:
  Approach:
  1. Get all unique (DISTINCT) salaries.
  2. Sort them from highest to lowest (DESC).
  3. Skip the first one (OFFSET 1).
  4. Take the next one (LIMIT 1).
"""

SELECT (
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1
) AS SecondHighestSalary;


"""
  ##
  METHOD:2
  Approach:
  1. First, find the absolute MAX(salary) in the table.
  2. Then, find the MAX(salary) again, but this time only for salaries that are less than the absolute max.
  The MAX() aggregate function is perfect here. 
  If the WHERE clause finds no rows (e.g., only one salary exists, so no salary is < MAX), MAX() automatically returns NULL. 
  This elegantly handles the edge case without extra tricks.
"""

SELECT MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);


