<div align="center">

# HR Analytics & Employee Attrition Dashboard

### End-to-End Data Analytics Project using Python, PostgreSQL, and Power BI

This project analyzes employee attrition patterns using HR data and converts raw data into actionable business insights through data cleaning, exploratory analysis, SQL-based investigation, and an interactive Power BI dashboard.

[![Python](https://img.shields.io/badge/-Python-3776AB?style=for-the-badge&logo=python&logoColor=white)](notebooks/hr_analysis.ipynb)
[![Power BI](https://img.shields.io/badge/-Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)](dashboard/hr_dashboard.pbix)
[![PostgreSQL](https://img.shields.io/badge/-PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)](scripts/hr_analysis.sql)

</div>

---

## Table of Contents

- [Project Overview](#project-overview)
- [Business Problem](#business-problem)
- [Objectives](#objectives)
- [Dataset](#dataset)
- [Tech Stack](#tech-stack)
- [Project Workflow](#project-workflow)
- [Repository Structure](#repository-structure)
- [Dashboard Preview](#dashboard-preview)
- [Key Business Insights](#key-business-insights)
- [Business Recommendations](#business-recommendations)
- [How to Run This Project](#how-to-run-this-project)
- [Project Documentation](#project-documentation)
- [Author](#author)

---

## Project Overview

Employee attrition is one of the most important HR challenges because it directly affects hiring cost, team stability, productivity, and organizational knowledge retention.

This project uses the IBM HR Analytics Employee Attrition dataset to identify the major factors influencing employee exits. The final output is a 3-page Power BI dashboard that helps HR teams monitor attrition, compare risk segments, and make data-driven retention decisions.

The project covers the complete analytics lifecycle:

- Business problem understanding
- Data cleaning and preparation using Python
- Exploratory data analysis and visualization
- SQL-based business question analysis using PostgreSQL
- Data modeling, DAX measures, and dashboard creation in Power BI
- Insight generation and recommendation building

---

## Business Problem

A mid-sized organization is facing an employee attrition rate of approximately **16%**. High attrition can increase recruitment costs, reduce team efficiency, and create knowledge gaps across departments.

### Business Goal

Identify the main drivers of employee attrition and build an interactive dashboard for HR leadership to support retention strategy decisions, with a target of reducing attrition from **16% to below 12%**.

---

## Objectives

The main objectives of this project are:

1. Analyze overall employee attrition trends.
2. Identify high-risk departments, job roles, age groups, and tenure groups.
3. Understand the impact of overtime, salary, satisfaction, and work-life balance on attrition.
4. Create SQL queries to answer business-focused HR questions.
5. Build an interactive Power BI dashboard for HR decision-makers.
6. Convert analysis findings into practical business recommendations.

---

## Dataset

| Attribute | Details |
|---|---|
| Dataset Name | IBM HR Analytics Employee Attrition Dataset |
| Source | [Kaggle - IBM HR Analytics Attrition Dataset](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset) |
| Total Records | 1,470 employees |
| Total Features | 35 columns |
| Target Variable | Attrition |
| Target Values | Yes / No |
| Use Case | HR analytics, attrition analysis, employee retention strategy |

---

## Tech Stack

| Tool / Technology | Purpose |
|---|---|
| Python | Data cleaning, feature engineering, exploratory data analysis |
| Pandas | Data manipulation and transformation |
| Matplotlib / Seaborn | Exploratory data visualization |
| PostgreSQL | SQL-based business analysis |
| Power BI | Interactive dashboard development |
| DAX | KPI measures and calculated metrics |
| Jupyter Notebook | Analysis documentation |
| GitHub | Version control and project presentation |

---

## Project Workflow

```text
Business Requirement Understanding
            ↓
Raw HR Dataset
            ↓
Python Data Cleaning & Feature Engineering
            ↓
Exploratory Data Analysis
            ↓
PostgreSQL Business Query Analysis
            ↓
Power BI Data Modeling & DAX Measures
            ↓
Interactive 3-Page Dashboard
            ↓
Business Insights & Recommendations
```

---

## Repository Structure

```text
HR-Analytics-Dashboard/
│
├── data/
│   ├── hr_raw.csv
│   └── hr_cleaned.csv
│
├── notebooks/
│   ├── hr_analysis.ipynb
│   └── README.md
│
├── scripts/
│   ├── hr_analysis.sql
│   └── README.md
│
├── charts/
│   ├── chart1_attrition_overview.png
│   ├── chart2_attrition_by_dept.png
│   ├── chart3_attrition_by_age.png
│   ├── chart4_income_by_jobrole.png
│   ├── chart5_overtime_attrition.png
│   ├── chart6_correlation_heatmap.png
│   └── chart7_attrition_by_salary.png
│
├── dashboard/
│   ├── hr_dashboard.pbix
│   └── README.md
│
├── screenshots/
│   ├── screenshot_page1_overview.jpg
│   ├── screenshot_page2_attrition_deep_dive.jpg
│   └── screenshot_page3_salary_analysis.jpg
│
└── README.md
```

---

## Dashboard Preview

### Page 1: HR Overview

![HR Overview](screenshots/screenshot_page1_overview.jpg)

This page provides a high-level view of total employees, attrition count, attrition rate, average salary, and overall workforce distribution.

### Page 2: Attrition Deep Dive

![Attrition Deep Dive](screenshots/screenshot_page2_attrition_deep_dive.jpg)

This page focuses on attrition patterns across departments, job roles, age groups, overtime status, satisfaction levels, and tenure groups.

### Page 3: Salary Analysis

![Salary Analysis](screenshots/screenshot_page3_salary_analysis.jpg)

This page analyzes salary distribution, monthly income by job role, salary-based attrition risk, and income comparison across employee groups.

---

## Key Business Insights

| # | Insight Area | Key Finding |
|---|---|---|
| 1 | Department Risk | Sales department has the highest attrition rate at approximately **20%**. |
| 2 | Overtime Impact | Employees working overtime show around **30.53% attrition**, compared to nearly **10%** for employees without overtime. |
| 3 | Age Group Risk | Employees aged **18–25** show the highest attrition risk, with approximately **34% attrition**. |
| 4 | Tenure Risk | Employees in their first **0–2 years** have an attrition rate of approximately **29.82%**. |
| 5 | Salary Impact | Sales Representatives have low average monthly income and high attrition, indicating compensation-related risk. |
| 6 | Satisfaction Impact | Employees with low satisfaction have higher attrition compared to employees with high satisfaction. |
| 7 | Gender Pay View | The dataset shows no major average salary gap between male and female employees. |

---

## Business Recommendations

Based on the analysis, HR leadership should focus on the following actions:

1. **Reduce overtime dependency**  
   Overtime is one of the strongest attrition indicators. HR should monitor overtime-heavy teams and balance workload more effectively.

2. **Improve early-tenure employee experience**  
   Since employees in the first two years show high attrition, the company should strengthen onboarding, mentorship, and career guidance programs.

3. **Focus on young employee retention**  
   Employees aged 18–25 are more likely to leave. HR should provide growth paths, learning opportunities, and regular engagement check-ins.

4. **Review compensation for high-risk roles**  
   Sales Representative roles show high attrition and low average income. Compensation benchmarking and incentive restructuring can help reduce exits.

5. **Track satisfaction continuously**  
   Low satisfaction is linked with higher attrition. HR should conduct regular pulse surveys and act quickly on negative satisfaction signals.

---

## How to Run This Project

### 1. Clone the Repository

```bash
git clone https://github.com/yashawasthi27/HR-Analytics-Dashboard.git
cd HR-Analytics-Dashboard
```

### 2. Run Python Analysis

Install required Python libraries:

```bash
pip install pandas numpy matplotlib seaborn jupyter
```

Open the notebook:

```bash
jupyter notebook notebooks/hr_analysis.ipynb
```

### 3. Run SQL Analysis

Create a PostgreSQL database:

```sql
CREATE DATABASE hr_analytics;
```

Then import `data/hr_cleaned.csv` and run the SQL queries available in:

```text
scripts/hr_analysis.sql
```

### 4. Open Power BI Dashboard

Open the Power BI file:

```text
dashboard/hr_dashboard.pbix
```

Then update the data source path if required and refresh the dashboard.

---

## Project Documentation

| Module | Description | Link |
|---|---|---|
| Python EDA | Data cleaning, feature engineering, and exploratory analysis | [notebooks/README.md](notebooks/README.md) |
| SQL Analysis | Business questions solved using PostgreSQL | [scripts/README.md](scripts/README.md) |
| Power BI Dashboard | Dashboard design, pages, KPIs, and visuals | [dashboard/README.md](dashboard/README.md) |

---

## Skills Demonstrated

- Business problem understanding
- Data cleaning and preprocessing
- Exploratory data analysis
- SQL query writing for business analysis
- Power BI dashboard design
- DAX measure creation
- KPI tracking and storytelling
- Business insight generation
- GitHub project documentation

---

## Author

### Yash Awasthi

BCA Student - Artificial Intelligence & Data Science  
Aspiring Data Analyst

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/yashawasthi27)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/yashawasthi27)
[![Portfolio](https://img.shields.io/badge/Portfolio-Visit-E34F26?style=for-the-badge&logo=html5&logoColor=white)](https://yashawasthi27.github.io/Portfolio/)

Email: [yashonwork247@gmail.com](mailto:yashonwork247@gmail.com)

---

<div align="center">

**If you found this project useful, consider starring the repository.**

</div>
