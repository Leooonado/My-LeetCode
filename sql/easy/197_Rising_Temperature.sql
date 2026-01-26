'''
LeetCode 197 - Rising Temperature
Difficulty: Easy
Category: Database

Table: Weather
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id is the column with unique values for this table.
There are no different rows with the same recordDate.
This table contains information about the temperature on a certain day.
  
Write a solution to find all dates’ id with higher temperatures compared to its previous dates (yesterday).

Return the result table in any order.
The result format is in the following example.
 
Example 1:
Input: 
Weather table:
+----+------------+-------------+
| id | recordDate | temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+
Output: 
+----+
| id |
+----+
| 2  |
| 4  |
+----+
Explanation: 
In 2015-01-02, the temperature was higher than the previous day (10 -> 25).
In 2015-01-04, the temperature was higher than the previous day (20 -> 30).

Approach:
- Treat Weather table as two roles: “today” and “yesterday”.
- Join rows where today.recordDate = yesterday.recordDate + 1 day.
- Filter cases where today’s temperature is higher than yesterday’s.
- Return today’s id.

Key Points:
- Use self join to align adjacent dates; avoid cross join to prevent large intermediate results.
- Date adjacency must be exactly 1 day; missing dates should not match.
- Prefer join condition using DATE_ADD equality for better index usage.
'''

SELECT w1.id
FROM Weather w1
JOIN Weather w2
  ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)
WHERE w1.temperature > w2.temperature;
