# 🗄️ SQL Business Analysis layer (PostgreSQL)

> This module details the database setup and SQL query queries executed on PostgreSQL to answer critical business questions regarding employee attrition.

---

## 🗃️ Database Setup & Import

Follow these steps to set up the relational database and load the cleaned dataset:

### Step 1: Create the Database
```sql
CREATE DATABASE hr_analytics;
```

### Step 2: Create the Employee Table
```sql
CREATE TABLE hr_employees (
    age INT, 
    attrition INT, 
    businesstravel VARCHAR(50),
    dailyrate INT, 
    department VARCHAR(50), 
    distancefromhome INT,
    education INT, 
    educationfield VARCHAR(50),
    environmentsatisfaction INT, 
    gender VARCHAR(10),
    hourlyrate INT, 
    jobinvolvement INT, 
    joblevel INT,
    jobrole VARCHAR(50), 
    jobsatisfaction INT,
    maritalstatus VARCHAR(20), 
    monthlyincome INT,
    monthlyrate INT, 
    numcompaniesworked INT, 
    overtime INT,
    percentsalaryhike INT, 
    performancerating INT,
    relationshipsatisfaction INT, 
    stockoptionlevel INT,
    totalworkingyears INT, 
    trainingtimeslastyear INT,
    worklifebalance INT, 
    yearsatcompany INT,
    yearsincurrentrole INT, 
    yearssincelastpromotion INT,
    yearswithcurrmanager INT, 
    agegroup VARCHAR(10),
    salaryband VARCHAR(10), 
    tenurebracket VARCHAR(10)
);
```

### Step 3: Import the Cleaned Dataset
1. Open **pgAdmin** and connect to your database.
2. Right-click the newly created `hr_employees` table and choose **Import/Export Data**.
3. Select [`data/hr_cleaned.csv`](../data/hr_cleaned.csv).
4. Set **Header** to `ON` and **Delimiter** to `,`.
5. Click **OK** to run the import.

---

## 📊 Business Queries & Insights

Here are the 10 business-focused queries executed to uncover employee attrition trends:

### Q1: Overall Employee Attrition Rate
```sql
SELECT 
    COUNT(*) AS total_employees,
    SUM(attrition) AS total_attrited,
    ROUND(SUM(attrition) * 100.0 / COUNT(*), 2) AS attrition_rate_pct
FROM hr_employees;
```
> **💡 Key Result:** Out of 1,470 employees, 237 left, resulting in an overall **16.12% attrition rate**.

---

### Q2: Attrition Rate by Department
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
> **💡 Key Result:** **Sales** has the highest exit rate at **20.62%**, followed by **HR** at **19.05%**, and **R&D** at **13.84%**.

---

### Q3: Average Monthly Income by Job Role
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
> **💡 Key Result:** Huge pay disparity exists between roles — **Managers** average **$17,181/month** while **Sales Representatives** earn only **$2,626/month** (a 6.5x pay gap).

---

### Q4: Overtime Impact on Attrition
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
> **💡 Key Result:** Attrition is 3x higher for employees working **overtime** (**30.53%**) compared to those who do not work overtime (**10.44%**).

---

### Q5: Attrition by Age Group
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
> **💡 Key Result:** Younger talent aged **18–25** has the highest exit rate at **34.40%**, whereas the **36–45** age group is the most stable at **9.33%**.

---

### Q6: Job Satisfaction Level vs. Attrition Rate
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
> **💡 Key Result:** Employees reporting **Low** satisfaction have a **22.84%** exit rate — twice that of **Very High** satisfaction employees (**11.33%**).

---

### Q7: Attrition by Tenure Bracket
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
> **💡 Key Result:** Attrition is concentrated in the early career phase. Employees with **0–2 years** of tenure exit at **29.82%**, compared to **8.42%** for employees with **10+ years**.

---

### Q8: Gender-wise Attrition and Average Monthly Income
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
> **💡 Key Result:** Males show slightly higher attrition (**17.01%** at **$6,381 avg income**) than females (**14.80%** at **$6,687 avg income**). Pay equity is relatively balanced.

---

### Q9: Top 5 Job Roles by Attrition Rate
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
> **💡 Key Result:** **Sales Representatives** face the highest risk at **39.76%** attrition, followed by **Lab Technicians** (**23.94%**) and **HR Specialists** (**23.08%**).

---

### Q10: Work-Life Balance vs. Attrition
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
> **💡 Key Result:** Employees reporting **Bad (1/4)** work-life balance leave at **31.20%**, whereas those reporting **Better/Best** leave at a much lower rate (**~14%**).

---

## 📈 SQL Insights Summary

| Query | Business Focus | Key Findings |
| :--- | :--- | :--- |
| **Q1** | **Overall Baseline** | Overall attrition stands at **16.12%** |
| **Q2** | **Departmental View** | **Sales (20.6%)** and **HR (19.1%)** departments are high-risk zones |
| **Q3** | **Job Role Salary Gap** | Executive pay gap is **6.5x** (Managers earn ~$17.2K vs. Sales Reps ~$2.6K) |
| **Q4** | **Overtime Correlation** | Overtime spikes exits by **3x** (**30.5%** vs. **10.4%**) |
| **Q5** | **Demographics Analysis** | Younger talent aged **18–25** leave at an alarming rate of **34.4%** |
| **Q6** | **Employee Sentiment** | Low Job Satisfaction doubles the exit probability (**22.8%** vs. **11.3%**) |
| **Q7** | **Tenure Analysis** | Early attrition risk is high — **29.8%** of new hires (0–2 yrs) exit |
| **Q8** | **Compensation Equity** | No major gender pay gap detected (Females earn slightly higher on average) |
| **Q9** | **Job Role Vulnerability** | **Sales Representatives** are the most vulnerable role (**39.8%** attrition) |
| **Q10**| **Workplace Stress** | Bad Work-Life Balance leads to high exit rates (**31.2%**) |
