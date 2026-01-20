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
