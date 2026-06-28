# 🗄️ SQL Analysis — PostgreSQL

> This module covers the complete SQL business analysis layer of the HR Analytics project using PostgreSQL.

---

## 📋 Overview

| Property | Detail |
|----------|--------|
| **Tool** | PostgreSQL|
| **Database** | `hr_analytics` |
| **Table** | `hr_employees` |
| **Input** | `../data/hr_cleaned.csv` (1,470 rows, 34 columns) |
| **Queries** | 10 business queries |
| **File** | `hr_analysis.sql` |

---

## 🗃️ Database Setup

```sql
-- Step 1: Create database
CREATE DATABASE hr_analytics;

-- Step 2: Create table
CREATE TABLE hr_employees (
    age INT, attrition INT, businesstravel VARCHAR(50),
    dailyrate INT, department VARCHAR(50), distancefromhome INT,
    education INT, educationfield VARCHAR(50),
    environmentsatisfaction INT, gender VARCHAR(10),
    hourlyrate INT, jobinvolvement INT, joblevel INT,
    jobrole VARCHAR(50), jobsatisfaction INT,
    maritalstatus VARCHAR(20), monthlyincome INT,
    monthlyrate INT, numcompaniesworked INT, overtime INT,
    percentsalaryhike INT, performancerating INT,
    relationshipsatisfaction INT, stockoptionlevel INT,
    totalworkingyears INT, trainingtimeslastyear INT,
    worklifebalance INT, yearsatcompany INT,
    yearsincurrentrole INT, yearssincelastpromotion INT,
    yearswithcurrmanager INT, agegroup VARCHAR(10),
    salaryband VARCHAR(10), tenurebracket VARCHAR(10)
);

-- Step 3: Import CSV via pgAdmin
-- Right click hr_employees → Import/Export Data
-- Select hr_cleaned.csv, Header: ON, Delimiter: ,
```

---

## 📊 10 Business Queries

### Q1 — Overall Attrition Rate
```sql
SELECT 
    COUNT(*) AS total_employees,
    SUM(attrition) AS total_attrited,
    ROUND(SUM(attrition) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM hr_employees;
```
**Result:** 1,470 employees | 237 attrited | **16% attrition rate**

---

### Q2 — Attrition Rate by Department
```sql
SELECT 
    department,
    COUNT(*) AS total_employees,
    SUM(attrition) AS attrited,
    ROUND(SUM(attrition) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM hr_employees
GROUP BY department
ORDER BY attrition_rate_pct DESC;
```
**Result:** Sales: **20%** | HR: **19%** | R&D: **13%**

---

### Q3 — Average Monthly Income by Job Role
```sql
SELECT 
    jobrole,
    COUNT(*) AS total_employees,
    ROUND(AVG(monthlyincome), 0) AS avg_monthly_income,
    MIN(monthlyincome) AS min_income,
    MAX(monthlyincome) AS max_income
FROM hr_employees
GROUP BY jobrole
ORDER BY avg_monthly_income DESC;
```
**Result:** Manager: **$17,181** | Sales Rep: **$2,626** (6.5x gap)

---

### Q4 — Overtime Impact on Attrition
```sql
SELECT 
    CASE WHEN overtime = 1 THEN 'Yes - Overtime'
         ELSE 'No - Overtime' END AS overtime_status,
    COUNT(*) AS total_employees,
    SUM(attrition) AS attrited,
    ROUND(SUM(attrition) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM hr_employees
GROUP BY overtime
ORDER BY attrition_rate_pct DESC;
```
**Result:** Overtime: **30%** | No Overtime: **10%** → 3x difference!

---

### Q5 — Attrition by Age Group
```sql
SELECT 
    agegroup,
    COUNT(*) AS total_employees,
    SUM(attrition) AS attrited,
    ROUND(SUM(attrition) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM hr_employees
WHERE agegroup IS NOT NULL
GROUP BY agegroup
ORDER BY attrition_rate_pct DESC;
```
**Result:** 18-25: **34%** | 26-35: **19%** | 45+: **12%** | 36-45: **9%**

---

### Q6 — Job Satisfaction vs Attrition
```sql
SELECT 
    jobsatisfaction,
    CASE 
        WHEN jobsatisfaction = 1 THEN 'Low'
        WHEN jobsatisfaction = 2 THEN 'Medium'
        WHEN jobsatisfaction = 3 THEN 'High'
        WHEN jobsatisfaction = 4 THEN 'Very High'
    END AS satisfaction_level,
    COUNT(*) AS total_employees,
    SUM(attrition) AS attrited,
    ROUND(SUM(attrition) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM hr_employees
GROUP BY jobsatisfaction
ORDER BY jobsatisfaction ASC;
```
**Result:** Low satisfaction: **22%** | Very High satisfaction: **11%**

---

### Q7 — Attrition by Tenure Bracket
```sql
SELECT 
    tenurebracket,
    COUNT(*) AS total_employees,
    SUM(attrition) AS attrited,
    ROUND(SUM(attrition) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM hr_employees
WHERE tenurebracket IS NOT NULL
GROUP BY tenurebracket
ORDER BY attrition_rate_pct DESC;
```
**Result:** 0-2 yrs: **29%** | 3-5 yrs: **13%** | 10+ yrs: **8%**

---

### Q8 — Gender-wise Attrition
```sql
SELECT 
    gender,
    COUNT(*) AS total_employees,
    SUM(attrition) AS attrited,
    ROUND(SUM(attrition) * 100.0 / COUNT(*), 2) AS attrition_rate_pct,
    ROUND(AVG(monthlyincome), 0) AS avg_income
FROM hr_employees
GROUP BY gender
ORDER BY attrition_rate_pct DESC;
```
**Result:** Male: **17%** ($6,381 avg) | Female: **14%** ($6,687 avg)

---

### Q9 — Top 5 Job Roles by Attrition Rate
```sql
SELECT 
    jobrole,
    COUNT(*) AS total_employees,
    SUM(attrition) AS attrited,
    ROUND(SUM(attrition) * 100.0 / COUNT(*), 2) AS attrition_rate_pct,
    ROUND(AVG(monthlyincome), 0) AS avg_income
FROM hr_employees
GROUP BY jobrole
HAVING COUNT(*) > 20
ORDER BY attrition_rate_pct DESC
LIMIT 5;
```
**Result:** Sales Rep: **39%** | Lab Technician: **23%** | HR: **23%**

---

### Q10 — Work-Life Balance vs Attrition
```sql
SELECT 
    worklifebalance,
    CASE 
        WHEN worklifebalance = 1 THEN 'Bad'
        WHEN worklifebalance = 2 THEN 'Good'
        WHEN worklifebalance = 3 THEN 'Better'
        WHEN worklifebalance = 4 THEN 'Best'
    END AS wlb_level,
    COUNT(*) AS total_employees,
    SUM(attrition) AS attrited,
    ROUND(SUM(attrition) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM hr_employees
GROUP BY worklifebalance
ORDER BY attrition_rate_pct DESC;
```
**Result:** Bad WLB: **31%** | Better WLB: **14%**

---

## 📈 SQL Insights Summary

| Query | Business Question | Key Result |
|-------|------------------|-----------|
| Q1 | Overall attrition | **16%** |
| Q2 | By department | Sales **20%** highest |
| Q3 | Salary by role | 6.5x gap between Manager and Sales Rep |
| Q4 | Overtime impact | **3x** higher attrition with overtime |
| Q5 | By age group | Young employees (18-25) at **34%** |
| Q6 | Job satisfaction | Low satisfaction = **2x** attrition risk |
| Q7 | By tenure | First 2 years = **29%** attrition |
| Q8 | By gender | No significant pay gap detected |
| Q9 | By job role | Sales Rep **39%** — most at risk |
| Q10 | Work-life balance | Bad WLB = **31%** attrition |
