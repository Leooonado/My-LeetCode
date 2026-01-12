"""
LeetCode 180 - Consecutive Numbers
Difficulty: Medium
Category: Database

Table: Logs
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| num         | varchar |
+-------------+---------+
In SQL, id is the primary key for this table.
id is an autoincrement column starting from 1.
 
Find all numbers that appear at least three times consecutively.

Return the result table in any order.

The result format is in the following example.

Example 1:

Input: 
Logs table:
+----+-----+
| id | num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+
Output: 
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
Explanation: 1 is the only number that appears consecutively for at least three times.
  
  ###
  Approach:
- Consecutive means adjacent rows by id.
- We need any num such that it appears in three consecutive ids: id, id+1, id+2.
- Use self-joins to align three consecutive rows and filter where all nums match.
- Use DISTINCT to return each qualifying number once.

Key Points:
- GROUP BY counts overall frequency but does not capture consecutiveness.
- Self-join on id offsets is a simple way to compare adjacent rows.

  Reflection:
  我之前思路的错误点在于
  num = num 永远为真（除非 NULL），没有约束意义
  GROUP BY id 会让每行都变成单独一组，聚合没意义
  即使 GROUP BY num，也只能得到“出现次数”，得不到“连续出现次数”

  JOIN ... id = id+1 / id+2：强制三行必须是连续的 id
  WHERE l1.num = l2.num AND l2.num = l3.num：三行的 num 必须相同
  DISTINCT：避免出现 1 1 1 1 这种连 4 次导致重复输出
  
"""
SELECT DISTINCT
  l1.num AS ConsecutiveNums
FROM Logs l1
JOIN Logs l2 ON l2.id = l1.id + 1
JOIN Logs l3 ON l3.id = l1.id + 2
WHERE l1.num = l2.num
  AND l2.num = l3.num;

"""
log a "faster" solution based on editorial
The logic is similar, just the way it's written is a little bit different
However, write Join...On... Obviously might be better. 
"""
SELECT DISTINCT
    l1.Num AS ConsecutiveNums
FROM
    Logs l1,
    Logs l2,
    Logs l3
WHERE
    l1.Id = l2.Id - 1
    AND l2.Id = l3.Id - 1
    AND l1.Num = l2.Num
    AND l2.Num = l3.Num
;
