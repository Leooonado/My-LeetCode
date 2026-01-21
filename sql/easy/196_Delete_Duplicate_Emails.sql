'''
LeetCode 196 - Delete Duplicate Email
Difficulty: Easy
Category: Database

Problem:
Table: Person
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| email       | varchar |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table contains an email. The emails will not contain uppercase letters.
Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.
For SQL users, please note that you are supposed to write a DELETE statement and not a SELECT one.
For Pandas users, please note that you are supposed to modify Person in place.
After running your script, the answer shown is the Person table. 
  The driver will first compile and run your piece of code and then show the Person table. 
  The final order of the Person table does not matter.
The result format is in the following example.

Example 1:
Input: 
Person table:
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
| 3  | john@example.com |
+----+------------------+
Output: 
+----+------------------+
| id | email            |
+----+------------------+
| 1  | john@example.com |
| 2  | bob@example.com  |
+----+------------------+
Explanation: john@example.com is repeated two times. We keep the row with the smallest Id = 1.
  
Approach:
- Duplicates are defined by the same email.
- For each duplicated email, we want to keep only one row (usually the one with the smallest id).
- Use a self-join to match rows with the same email, and delete the row with the larger id.
- After deletion, each email remains unique.
  
Key Points:
- Self-join the table on email to identify duplicates.
- Use p1.id > p2.id so only the “extra” rows are deleted and the smallest id is preserved.
- Prefer explicit JOIN ... ON ... over comma joins for readability and safety.
- This deletes all duplicates in one statement (no loops needed).
  
'''

delete p1 from person p1,person p2 
where p1.email=p2.email and p1.id>p2.id; Person.personId = Address.personId;

'''or'''

DELETE p1
FROM Person p1
JOIN Person p2
  ON p1.email = p2.email
 AND p1.id > p2.id;

'''or
Approach:
- Duplicates are defined by having the same email.
- For each email, determine which record should be kept.
- Use GROUP BY email to group duplicate records.
- Select the minimum id in each group as the record to keep.
- Delete all records whose id is not in the set of retained IDs.

Key Points:
- GROUP BY email identifies duplicate groups.
- MIN(id) ensures exactly one row per email is preserved.
- The subquery returns the set of IDs that should remain in the table.
- The outer DELETE removes all rows not in this set.
- An extra subquery layer is required in MySQL to avoid modifying and selecting from the same table in a single query.'''
  
DELETE FROM Person
WHERE id NOT IN (
  SELECT id_to_keep
  FROM (
    SELECT MIN(id) AS id_to_keep
    FROM Person
    GROUP BY email
  ) t
);


