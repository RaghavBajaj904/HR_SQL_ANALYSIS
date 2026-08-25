# HR SQL Analysis | MySQL

## 📌 Project Overview

This project analyzes HR data using **MySQL** to answer business-focused questions related to workforce, compensation, employee performance, hiring, demographics, and attrition.

The goal is to transform employee data into meaningful insights that can support **HR and management decision-making**.

---

## 🎯 Project Objective

The analysis focuses on understanding:

* Workforce size and employee composition
* Active employees and employee attrition
* Salary and compensation patterns
* Department-wise and role-wise salary differences
* Employee performance
* Bonus distribution
* Hiring trends
* Employee demographics
* Employee locations
* Department-wise attrition

A total of **22 business questions** were analyzed using SQL.

---

## 🗂️ Dataset / Database

The project uses a MySQL database named:

`hr_analytics_db`

The analysis works primarily with the following tables:

* `employees`
* `departments`
* `performance`

The SQL analysis combines these tables where required using `JOIN` operations.

---

## ❓ Business Questions

The project answers 22 HR-related business questions

## The questions were designed around practical HR and management use cases such as workforce planning, compensation planning, performance management, recruitment planning, and employee retention.

## 🛠️ SQL Skills Demonstrated

The project demonstrates the following MySQL concepts:

* `SELECT`
* `WHERE`
* `GROUP BY`
* `ORDER BY`
* `COUNT()`
* `SUM()`
* `AVG()`
* `ROUND()`
* `CASE WHEN`
* `JOIN`
* `LEFT JOIN`
* Date functions
* Subqueries
* CTEs
* Window functions

The project particularly demonstrates how SQL can be used not only for data retrieval but also for **business-oriented analysis**.

---

## 📊 Key Insights

Some of the major findings from the analysis are:

* **Finance** has the largest workforce, with **886 employees**.
* **Operations** has the highest average salary at approximately **₹1,38,354**.
* **IT** has the highest department-level attrition rate at **32.63%**.
* **12.2%** of employees fall into the highest performance category.

These findings can help management focus on areas such as workforce allocation, compensation planning, employee retention, and performance management.

---

## 💼 Business Applications

The analysis can be used by HR and management for:

Workforce Planning,
Compensation Planning,
Performance Management,
Recruitment Planning,
Employee Retention,
Workforce Diversity

---

## 📁 Project Structure

```text
HR-SQL-Analysis/
│
├── hr_analytics_db.sql
├── HR_SQL_Analysis_SQLscript.sql
├── Report.pdf
└── README.md
```

### `HR_SQL_Analysis_SQLscript.sql`

Contains the complete SQL analysis, including all **22 business questions and their corresponding SQL queries**.

### `Report.pdf`

Contains the detailed project report, including:

* Project overview
* Business questions
* SQL queries
* Results/screenshots
* Business uses
* Key takeaways
* Conclusion

---

## 🔍 Analysis Approach

The project follows a simple business-analysis workflow:

```text
HR Data
   ↓
Identify Business Questions
   ↓
Write SQL Queries
   ↓
Aggregate / Join / Filter Data
   ↓
Generate Results
   ↓
Interpret Results
   ↓
Derive Business Insights
```

The SQL queries use aggregation, conditional logic, joins, date analysis, and advanced SQL techniques to answer the business questions.

---

## 🚀 Conclusion

This project demonstrates how **MySQL can be used to analyze HR data and convert raw employee information into actionable business insights**.

The analysis provides a foundation for understanding workforce structure, compensation, employee performance, recruitment activity, demographics, and attrition.

Overall, the project demonstrates the application of SQL for **real-world HR analytics and data-driven decision-making**.

---


⭐ If you found this project useful, consider giving the repository a star!
