# 📊 Power BI Dashboard Module: HR Analytics

> This module details the design architecture, star schema data model, DAX measures, and page layout of the interactive 3-page Power BI dashboard.

---

## 🗂️ Star Schema Data Model

The data model uses a clean star schema design to ensure high-performing queries, logical relationship mapping, and easy-to-use filter directions.

![Star Schema Data Model](../screenshots/Star_schema.png)

### Table Metadata & Keys

| Table Name           | Type       | Record Count | Join / Key Column |
| :------------------- | :--------- | :----------- | :---------------- |
| **`hr_cleaned`**     | Fact Table | 1,470 rows   | —                 |
| **`Dim_Department`** | Dimension  | 3 rows       | `DepartmentID`    |
| **`Dim_JobRole`**    | Dimension  | 9 rows       | `JobRoleID`       |
| **`Dim_AgeGroup`**   | Dimension  | 4 rows       | `AgeGroupID`      |
| **`Dim_Education`**  | Dimension  | 6 rows       | `EducationID`     |

---

## 📐 Calculated DAX Measures

All calculations are built in DAX and stored in a dedicated, clean `Measures_Table` for clarity and ease of access:

```dax
-- Total Headcount
Total Employees = COUNTROWS(hr_cleaned)

-- Total who Left
Total Attrited = SUM(hr_cleaned[Attrition])

-- Core HR Attrition KPI
Attrition Rate % =
    DIVIDE([Total Attrited], [Total Employees], 0) * 100

-- Currently Active Headcount
Active Employees =
    CALCULATE([Total Employees], hr_cleaned[Attrition] = 0)

-- Average Monthly Compensation
Avg Monthly Income = AVERAGE(hr_cleaned[MonthlyIncome])

-- Overtime Cohort Attrition Rate
Overtime Attrition Rate % =
    CALCULATE([Attrition Rate %], hr_cleaned[OverTime] = 1)

-- Average Workplace Satisfaction Metric
Avg Job Satisfaction = AVERAGE(hr_cleaned[JobSatisfaction])
```

---

## 📄 Dashboard Pages & Layout

### 📍 Page 1: HR Overview

![Overview](../screenshots/screenshot_page1_overview.jpg)

- **KPI Cards (Top Row):** `Total Headcount`, `Active Employees`, `Attrition Rate %` (**16.12%**), `Avg Monthly Income`, `Overtime Attrition Rate %` (**30.53%**).
- **Visual Layout:**
  - **Attrition by Department** _(Horizontal Bar Chart)_
  - **Attrition by Age Group** _(Column Chart)_
  - **Overtime Impact on Attrition** _(Donut Chart)_
  - **Job Role-Wise Attrition Details** _(Conditional Formatted Grid)_
  - **Attrition by Salary Band** _(Bar Chart)_

---

### 📍 Page 2: Attrition Deep Dive

![Deep Dive](../screenshots/screenshot_page2_attrition_deep_dive.jpg)

- **Filter Panel (Right/Top):** Slicers for `Gender` (Button style), `AgeGroup` (Dropdown), and `Department` (Dropdown).
- **Visual Layout:**
  - **Attrition Rate by Job Role** _(Vertical Column Chart)_
  - **Attrition Rate by Gender** _(Donut Chart)_
  - **Attrition by Tenure Bracket** _(Column Chart)_
- **Dynamic Title:** Formatted to display active filter contexts (e.g., _"Gender Selected: Female"_).

---

### 📍 Page 3: Salary Analysis

![Salary](../screenshots/screenshot_page3_salary_analysis.jpg)

- **Filter Panel:** Slicers for `Gender`, `AgeGroup`, and `Department`.
- **Visual Layout:**
  - **Avg Monthly Income by Job Role** _(Horizontal Bar Chart)_
  - **Avg Monthly Income by Job Level** _(Column Chart)_
  - **Attrition Rate by Job Satisfaction** _(Column Chart)_
- **Context:** Clearly details the relation between satisfaction, monthly compensation, and attrition risk.

---

## 💡 Key Business Insights

| #     | Insight Area        | Key Finding                                                        | Attrition Detail                   |
| ----- | ------------------- | ------------------------------------------------------------------ | ---------------------------------- |
| **1** | **Department Risk** | **Sales department** has the highest attrition rate.               | **~20%** attrition                 |
| **2** | **Overtime Impact** | Employees working **overtime** show extremely high attrition.      | **30.53%** vs **10%** (3x higher!) |
| **3** | **Age Group Risk**  | Young professionals aged **18–25** show the highest exit rates.    | **~34%** attrition                 |
| **4** | **Tenure Risk**     | Employees in their first **0–2 years** are highly likely to leave. | **29.82%** attrition               |
| **5** | **Salary Impact**   | **Sales Representatives** have low monthly income and high exits.  | High compensation-related risk     |
| **6** | **Satisfaction**    | Employees with low satisfaction have double the attrition rate.    | Strong correlation with attrition  |
| **7** | **Gender Pay**      | The dataset shows no major average salary gap between genders.     | Balanced compensation equity       |

---

## ⚙️ How to Open the Dashboard

1. Download and install [Power BI Desktop](https://powerbi.microsoft.com/desktop/) (free).
2. Open [`dashboard/hr_dashboard.pbix`](hr_dashboard.pbix).
3. If prompted with a data source error, click **Transform Data** > **Data Source Settings** and update the path to point to your local copy of [`data/hr_cleaned.csv`](../data/hr_cleaned.csv).
4. Click **Refresh** to reload.

---

## 💡 Key Dashboard Findings

> [!NOTE]
> **Key Finding 1 (Compensation & Role Risk)**  
> Sales Representatives experience an attrition rate of **39.76%** while earning an average monthly income of just **$2,626** — representing the highest compensation-related exit cohort in the business.

> [!IMPORTANT]
> **Key Finding 2 (Overtime Driver)**  
> Employees who work overtime face an attrition rate of **30.53%** vs. **10.44%** for those who don't. Reducing overtime reliance is critical to retaining personnel.
