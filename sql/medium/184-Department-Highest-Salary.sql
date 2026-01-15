"""
LeetCode 184 - Department Highest Salary
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

Approach:
1) Compute the maximum salary for each department using GROUP BY.
2) Join the result back to Employee to keep employees whose salary equals the department maximum.
3) Join Department to get the department name.

Key Points:
- ORDER BY salary DESC finds global max, not per-department max.
- Joining on salary = max_salary keeps ties (multiple employees with same top salary).
  
"""

SELECT
  d.name AS Department,
  e.name AS Employee,
  e.salary AS Salary
FROM Employee e
JOIN Department d
  ON e.departmentId = d.id
JOIN (
  SELECT departmentId, MAX(salary) AS max_salary
  FROM Employee
  GROUP BY departmentId
) t
  ON e.departmentId = t.departmentId
 AND e.salary = t.max_salary;


"""
