"""
LeetCode 175 - Combine Two Tables
Difficulty: Easy
Category: Database

Problem:
Table: Person

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| personId    | int     |
| lastName    | varchar |
| firstName   | varchar |
+-------------+---------+
personId is the primary key (column with unique values) for this table.
This table contains information about the ID of some persons and their first and last names.
 

Table: Address

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| addressId   | int     |
| personId    | int     |
| city        | varchar |
| state       | varchar |
+-------------+---------+
addressId is the primary key (column with unique values) for this table.
Each row of this table contains information about the city and state of one person with ID = PersonId.
 

Write a solution to report the first name, last name, city, and state of each person in the Person table. If the address of a personId is not present in the Address table, report null instead.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Person table:
+----------+----------+-----------+
| personId | lastName | firstName |
+----------+----------+-----------+
| 1        | Wang     | Allen     |
| 2        | Alice    | Bob       |
+----------+----------+-----------+
Address table:
+-----------+----------+---------------+------------+
| addressId | personId | city          | state      |
+-----------+----------+---------------+------------+
| 1         | 2        | New York City | New York   |
| 2         | 3        | Leetcode      | California |
+-----------+----------+---------------+------------+
Output: 
+-----------+----------+---------------+----------+
| firstName | lastName | city          | state    |
+-----------+----------+---------------+----------+
| Allen     | Wang     | Null          | Null     |
| Bob       | Alice    | New York City | New York |
+-----------+----------+---------------+----------+
Explanation: 
There is no address in the address table for the personId = 1 so we return null in their city and state.
addressId = 1 contains information about the address of personId = 2.
  
Approach:
- Use outer join
  
Key Points:
- Since the PersonId in table Address is the foreign key of table Person, we can join these two tables to get the address information of a person.
- Considering there might be no address information for every person, we should use outer join instead of the default inner join.
  Note: For MySQL, an outer join is performed either using left join or right join.
  
"""

Select Person.firstName, Person.lastName, Address.city, Address.state
    from Person
    Left join Address
    On Person.personId = Address.personId;

"""
Tried agian
summary:
确认哪个是主表哪个是附表
如果加入的无信息就会变成null
 LEFT JOIN：保证所有 Person 都出现
没有 Address 的人 → city/state = NULL
join 的是 表 Address a
列只出现在 SELECT 或 ON
- JOIN connects tables, not columns.
- Use LEFT JOIN when rows from the main table must be preserved.
- Select columns only after defining correct table relationships.
1. 确认主表 2.Adress是附加信息 3.链接条件
只有Join 或者是Join...on...
"""
SELECT p.firstName, p.lastName, a.city, a.state
FROM Person p
LEFT JOIN Address a
  ON p.personId = a.personId;
