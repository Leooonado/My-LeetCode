"""
LeetCode 177 - Nth Highest Salary
Difficulty: Medium
Category: Database

Table: Employee

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key (column with unique values) for this table.
Each row of this table contains information about the salary of an employee.
 

Write a solution to find the nth highest distinct salary from the Employee table. If there are less than n distinct salaries, return null.

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
n = 2
Output: 
+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+
Example 2:

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
+----+--------+
n = 2
Output: 
+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| null                   |
+------------------------+


  ###
  Approach:
  The logic is similar to the second highest salary
  however it is Nth here

  First we need to set the number N
  Then we need to sort the distinct salaries in descending order. 
  Last we use SQL's LIMIT with OFFSET to skip the first (N-1) values and fetch the Nth one.

  Key Points:
  - Subtract 1 from N since SQL OFFSET is zero-based.
  - Use SELECT DISTINCT salary to remove duplicates.
  - Order salaries in descending order.
  - Apply LIMIT 1 OFFSET N-1 to fetch the Nth unique highest salary
"""

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    SET N = N - 1;
    RETURN (
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT 1 OFFSET N
    );
END
