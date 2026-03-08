# 🏦 Bank Database — SQL Portfolio Project

A relational database project built in MySQL to simulate a real-world banking system. This project covers database design, data insertion, and a variety of SQL queries ranging from basic to advanced.

---

##  About the Project

This project models a simplified banking system with the following tables:

- **Customers** — stores customer personal info
- **Accounts** — savings and current accounts linked to customers
- **Transactions** — credit and debit transactions per account
- **Loans** — active and closed loans with interest rates
- **Employees** — bank staff with roles and salaries

---

## 🔍 Queries Covered

| Category | Examples |
|---|---|
| Basic | Filter by city, credit transactions, total debits |
| Joins | Customer accounts, active loans, multi-table joins |
| Aggregate | Total loans per city, highest loan per city, salary bill per role |
| Subqueries | Employees earning above average salary |
| Challenge | Remaining balance after debit transactions |

---

##  What I Learned

- Designing relational tables with **primary and foreign keys**
- Writing **INNER JOINs** across multiple tables
- Using **aggregate functions** like SUM, MAX, AVG with GROUP BY
- Filtering grouped results with **HAVING** vs **WHERE**
- Writing **subqueries** inside WHERE clauses
- Always specifying table names to avoid **ambiguous column errors**
- The difference between row-level filtering and aggregate filtering

---

##  Tools Used

- MySQL 8.0
- MySQL Workbench

---

> Built by **Muhammad Ammar Saleem** — BSCS Data Science Student
