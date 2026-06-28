# 📊 HR Analytics & Employee Attrition Dashboard

> **End-to-end data analytics project** — from raw HR data to interactive Power BI dashboard, covering Python, PostgreSQL, and Power BI.

![Python](https://img.shields.io/badge/Python-3.9+-blue?logo=python)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-14+-336791?logo=postgresql)
![PowerBI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?logo=powerbi)
![Status](https://img.shields.io/badge/Status-Complete-brightgreen)

---

## 🧩 Problem Statement

A mid-sized organization was experiencing an employee attrition rate of **~16%**, leading to increased recruitment costs, knowledge loss, and reduced team productivity.

**Goal:** Identify the root causes of attrition and provide HR leadership with an interactive dashboard to take data-driven retention decisions — targeting a reduction from 16% to below 12%.

---

## 🛠️ Tech Stack

| Tool | Purpose |
|------|---------|
| **Python (Pandas, Matplotlib, Seaborn)** | Data cleaning, feature engineering, EDA |
| **PostgreSQL** | SQL analysis layer — 10 business queries |
| **Power BI (DAX, Star Schema)** | Interactive 3-page dashboard |
| **Jupyter Notebook** | Analysis documentation |
| **GitHub** | Version control & project showcase |

---

## 📁 Project Structure

```
HR-Analytics-Dashboard/
│
├── data/
│   ├── hr_raw.csv                              ← Original IBM dataset
│   └── hr_cleaned.csv                          ← Cleaned & feature-engineered
│
├── notebooks/
│   ├── hr_analysis.ipynb                       ← Full EDA notebook
│   └── README.md                               ← Python EDA documentation
│
├── scripts/
│   ├── hr_analysis.sql                         ← 10 business SQL queries
│   └── README.md                               ← SQL analysis documentation
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
│   ├── hr_dashboard.pbix                       ← Power BI file
│   └── README.md                               ← Dashboard documentation
│
├── screenshots/
│   ├── screenshot_page1_overview.jpg
│   ├── screenshot_page2_attrition_deep_dive.jpg
│   └── screenshot_page3_salary_analysis.jpg
│
└── README.md                                   ← You are here
```

---

## 📦 Dataset

| Property | Value |
|----------|-------|
| **Name** | IBM HR Analytics Employee Attrition Dataset |
| **Source** | [Kaggle](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset) |
| **Rows** | 1,470 employees |
| **Columns** | 35 attributes |
| **Target Variable** | Attrition (Yes / No) |

---

## 🔄 Project Workflow

```
Business Requirement Document (BRD)
            ↓
    Raw Data (IBM HR CSV)
            ↓
  Python — Cleaning & EDA
            ↓
  PostgreSQL — SQL Analysis
            ↓
  Power BI — Star Schema + DAX
            ↓
   3-Page Interactive Dashboard
            ↓
  Business Insights & GitHub Docs
```

---

## 💡 Key Business Insights

| # | Insight | Finding |
|---|---------|---------|
| 1 | **Sales is highest risk dept** | 20% attrition — highest among all departments |
| 2 | **Overtime = 3x attrition** | Overtime: 30.53% vs No Overtime: 10% |
| 3 | **Young employees leave most** | Age 18-25 has 34% attrition rate |
| 4 | **First 2 years are critical** | 0-2 yr tenure: 29.82% attrition |
| 5 | **Low salary drives exits** | Sales Rep earns $2,626 — lowest paid, highest attrition (39%) |
| 6 | **Satisfaction matters** | Low satisfaction score: 22.84% vs High: 11.33% attrition |
| 7 | **No gender pay gap** | Female avg: $6,687 vs Male avg: $6,381 |

---

## 📸 Dashboard Preview

### Page 1 — Overview
![Overview](screenshots/screenshot_page1_overview.jpg)

### Page 2 — Attrition Deep Dive
![Deep Dive](screenshots/screenshot_page2_attrition_deep_dive.jpg)

### Page 3 — Salary Analysis
![Salary](screenshots/screenshot_page3_salary_analysis.jpg)

---

## 📂 Module Documentation

| Module | README |
|--------|--------|
| 🐍 Python EDA | [notebooks/README.md](notebooks/README.md) |
| 🗄️ SQL Analysis | [scripts/README.md](scripts/README.md) |
| 📊 Power BI Dashboard | [dashboard/README.md](dashboard/README.md) |

---

## 🚀 How to Run

```bash
# Python
pip install pandas numpy matplotlib seaborn
# Open notebooks/hr_analysis.ipynb

# PostgreSQL
CREATE DATABASE hr_analytics;
# Import hr_cleaned.csv → run scripts/hr_analysis.sql

# Power BI
# Open dashboard/hr_dashboard.pbix → update data source path → Refresh
```

---

## 👤 Author

**Yash Awasthi**
BCA (AI & Data Science) — SAGE University, Bhopal

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue)](https://linkedin.com/in/yashawasthi27)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-black)](https://github.com/yashawasthi27)
[![Portfolio](https://img.shields.io/badge/Portfolio-Visit-green)](https://yashawasthi27.github.io/Portfolio/)
📧 yashonwork247@gmail.com
