# 📊 Power BI Dashboard — HR Analytics

> This module covers the complete Power BI dashboard built on top of the cleaned HR dataset — including data model, DAX measures, and 3-page interactive report.

---

## 📋 Overview

| Property | Detail |
|----------|--------|
| **Tool** | Power BI |
| **File** | `hr_dashboard.pbix` |
| **Input** | `../data/hr_cleaned.csv` |
| **Pages** | 3 interactive pages |
| **DAX Measures** | 7 custom measures |
| **Data Model** | Star Schema (1 fact + 4 dimension tables) |

---

## 🗂️ Data Model — Star Schema

```
         Dim_AgeGroup
              │
Dim_Education─┤
              │
         [hr_cleaned]  ←── FACT TABLE (1,470 rows)
              │
  Dim_Department
              │
         Dim_JobRole
```

| Table | Type | Rows | Key Column |
|-------|------|------|-----------|
| `hr_cleaned` | Fact | 1,470 | — |
| `Dim_Department` | Dimension | 3 | `DepartmentID` |
| `Dim_JobRole` | Dimension | 9 | `JobRoleID` |
| `Dim_AgeGroup` | Dimension | 4 | `AgeGroupID` |
| `Dim_Education` | Dimension | 6 | `EducationID` |

---

## 📐 DAX Measures

All measures are stored in a dedicated `Measures_Table`:

```dax
-- Total headcount
Total Employees = COUNTROWS(hr_cleaned)

-- Total who left
Total Attrited = SUM(hr_cleaned[Attrition])

-- Core KPI
Attrition Rate % = 
    DIVIDE([Total Attrited], [Total Employees], 0) * 100

-- Currently active
Active Employees = 
    CALCULATE([Total Employees], hr_cleaned[Attrition] = 0)

-- Average salary
Avg Monthly Income = AVERAGE(hr_cleaned[MonthlyIncome])

-- Overtime-specific attrition
Overtime Attrition Rate % = 
    CALCULATE([Attrition Rate %], hr_cleaned[OverTime] = 1)

-- Engagement score
Avg Job Satisfaction = AVERAGE(hr_cleaned[JobSatisfaction])
```

---

## 📄 Dashboard Pages

### Page 1 — Overview
![Overview](../screenshots/screenshot_page1_overview.jpg)

**Visuals:**
- 5 KPI Cards — Total Employees, Active Employees, Attrition Rate %, Avg Income, Overtime Attrition Rate %
- Attrition Rate by Department (horizontal bar chart)
- Attrition Rate by Age Group (column chart)
- Job Role-Wise Attrition & Salary Analysis (table with conditional formatting)
- Overtime Impact on Attrition (donut chart)
- Attrition Rate by Salary Band (bar chart)
- Attrition Rate by Job Role (treemap)
- Department slicer (dropdown)

**Key numbers visible:**
- Overall attrition: **16.12%**
- Overtime attrition: **30.53%**
- Sales Rep attrition: **39.76%**

---

### Page 2 — Attrition Deep Dive
![Deep Dive](../screenshots/screenshot_page2_attrition_deep_dive.jpg)

**Visuals:**
- Attrition Rate by Job Role (column chart)
- Attrition Rate by Gender (donut chart)
- Attrition Rate by Tenure Bracket (column chart)

**Slicers:**
- Gender (button slicer)
- AgeGroup (dropdown)
- Department (dropdown)

**Dynamic titles:** Show selected filter context (e.g. "Gender Selected: Female")

---

### Page 3 — Salary Analysis
![Salary](../screenshots/screenshot_page3_salary_analysis.jpg)

**Visuals:**
- Avg Monthly Income by Job Role (horizontal bar chart)
- Avg Monthly Income by Job Level (column chart)
- Attrition Rate by Job Satisfaction (column chart)

**Slicers:**
- Gender (button slicer)
- AgeGroup (dropdown)
- Department (dropdown)

---

## 🎨 Design Choices

| Element | Choice | Reason |
|---------|--------|--------|
| **Theme color** | Green (#1a6b3c) | Professional, HR-friendly |
| **Font** | Default Power BI | Clean and readable |
| **KPI cards** | Top row on all pages | Consistent context across pages |
| **Page navigation** | Right side buttons | Easy switching between pages |
| **Slicers** | Dropdown style | Saves canvas space |
| **Treemap** | Job Role attrition | Shows proportional impact visually |

---

## ▶️ How to Open

1. Download and install [Power BI Desktop](https://powerbi.microsoft.com/desktop/) (free)
2. Open `hr_dashboard.pbix`
3. If prompted about data source — update path to your local `hr_cleaned.csv`
4. Click **Refresh** to reload data

---

## 💡 Dashboard Insights

**Biggest finding visible on Page 1:**
Sales Representatives have **39.76% attrition** while earning only **$2,626/month** — the clearest action item for HR leadership.

**Page 2 drill-down:**
Filtering by Gender = Female + Department = Sales reveals concentrated attrition risk in specific sub-segments.

**Page 3 salary story:**
Job Level 5 earns **$19.2K** vs Level 1 at **$2.8K** — a 6.8x difference that directly correlates with the attrition patterns seen on Pages 1 and 2.
