# SQL JOIN Mental Model (Data Analytics Oriented)

This note summarizes a practical mental model for understanding and using SQL JOINs,
with a focus on data analysis and interview-style problems.

---

## 1. The Core Principle

> **A JOIN answers this question:  
> “Which table is my main perspective, and what additional information do I want to attach to it?”**

Before writing SQL syntax, always decide:
- Which table must appear in the final result?
- Which table is optional or conditional?

---

## 2. Three Questions to Ask Before Writing a JOIN

### ① Who is the main table?
Ask:
- Which rows must be kept no matter what?
- What is the business entity I care about?

This table goes after `FROM`.

Example:
- Person & Address → main table is `Person`
- Employee vs Manager → main table is the employee

---

### ② What type of JOIN do I need?

| Situation | JOIN Type |
|---------|----------|
| Keep all rows from main table | LEFT JOIN |
| Only keep matched rows | INNER JOIN |
| Rarely used in practice | RIGHT / FULL JOIN |

**Rule of thumb**:
- “Must keep all main rows” → `LEFT JOIN`
- “Only care about matched cases” → `INNER JOIN`

---

### ③ What defines the relationship between tables?

JOIN conditions almost always follow this pattern:

```sql
tableA.id = tableB.foreignKey

```
---

### Examples:

```sql
p.personId = a.personId
e.managerId = m.id
e.departmentId = d.id


```

## 3. Common JOIN Patterns (with Examples)
#Pattern 1: Enriching a main table (LEFT JOIN)

Problem type:
“Show all entities, even if related data is missing.”

- Example: Combine Person and Address

```sql
FROM Person p
LEFT JOIN Address a
  ON p.personId = a.personId

```

Key idea:
- Person must always appear
- Address may be NULL

### Pattern 2: Self Join (table plays two roles)

Problem type:
“Compare rows within the same table.”

- Example: Employees earning more than their managers

```sql
FROM Employee e
JOIN Employee m
  ON e.managerId = m.id

```

Key idea:

- Same table, different roles
- Use aliases to distinguish roles

### Pattern 3: Group-level metric + join back

Problem type:
“Highest / lowest / top N per group.”

Example: Highest salary per department

Employee
→ GROUP BY departmentId (compute metric)
→ JOIN back to Employee
→ JOIN Department for names


Key idea:
- Aggregation alone loses row detail

- Join back restores employee-level rows

## 4. JOIN vs WHERE: Division of Responsibility
ON clause	WHERE clause
Defines table relationships	Filters final results
Controls how rows match	Controls which rows stay

⚠️ Common pitfall:
```sql
LEFT JOIN Address a
WHERE a.city = 'NY'

```

This turns the LEFT JOIN into an INNER JOIN.

Correct version:
```sql
LEFT JOIN Address a
  ON p.personId = a.personId
 AND a.city = 'NY'

```

---
## 5. A Universal SQL JOIN Template

```sql
SELECT
  -- final output columns
FROM main_table t1
LEFT / INNER JOIN related_table t2
  ON t1.key = t2.key
LEFT / INNER JOIN (
  -- aggregated subquery
) t3
  ON ...
WHERE
  -- business filters only

```

---
## 6. Interview-Oriented Takeaways

- JOINs connect tables, not columns
- Always identify the main table first
- LEFT JOIN preserves rows; WHERE can remove them
- Aggregation answers “what”, JOIN answers “who”

This mental model applies to most SQL interview and real-world analytics problems.
