"""
LeetCode 181 - Employees Earning More Than Their Managers
Difficulty: Easy
Category: Database

Problem:
Table: Employee
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| salary      | int     |
| managerId   | int     |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the ID of an employee, their name, salary, and the ID of their manager.
 
Write a solution to find the employees who earn more than their managers.

Return the result table in any order.

The result format is in the following example.

Example 1:
Input: 
Employee table:
+----+-------+--------+-----------+
| id | name  | salary | managerId |
+----+-------+--------+-----------+
| 1  | Joe   | 70000  | 3         |
| 2  | Henry | 80000  | 4         |
| 3  | Sam   | 60000  | Null      |
| 4  | Max   | 90000  | Null      |
+----+-------+--------+-----------+
Output: 
+----------+
| Employee |
+----------+
| Joe      |
+----------+
Explanation: Joe is the only employee who earns more than his manager.

Approach:
- Self join Employee table to match each employee with their manager.
- Compare employee salary with manager salary and keep employees earning more.

Key Points:
- Join condition: employee.managerId = manager.id
- Use inner join to automatically exclude rows with managerId IS NULL
- Return only the employee name as column Employee

  JOIN 让你把员工和经理放到同一行比较
  JOIN 自动排除 managerId IS NULL 的人（因为 join 不上）
  WHERE e.salary > m.salary 就是题目的条件
  输出列名必须叫 Employee
  大概是要更清晰的分别e的表格和m的表格吧
  然后善用JOIN
"""
SELECT
  e.name AS Employee
FROM Employee e
JOIN Employee m
  ON e.managerId = m.id
WHERE e.salary > m.salary;
