# 🐍 Python — Data Cleaning & EDA

> This module covers the complete data preparation and exploratory data analysis (EDA) phase of the HR Analytics project.

---

## 📋 Overview

| Property | Detail |
|----------|--------|
| **Tool** | Python 3.9+ |
| **Libraries** | Pandas, NumPy, Matplotlib, Seaborn |
| **Input** | `../data/hr_raw.csv` (1,470 rows, 35 columns) |
| **Output** | `../data/hr_cleaned.csv` + 7 chart PNGs |
| **Notebook** | `hr_analysis.ipynb` |

---

## 🔧 Data Cleaning Steps

### 1. Dropped Useless Columns
These 4 columns had the same value for every employee — zero analytical value:

| Column | Reason Dropped |
|--------|---------------|
| `EmployeeCount` | Always = 1 |
| `Over18` | Always = Y |
| `StandardHours` | Always = 80 |
| `EmployeeNumber` | Just an ID, not analytical |

### 2. Encoded Binary Columns
```python
df['Attrition'] = df['Attrition'].map({'Yes': 1, 'No': 0})
df['OverTime']  = df['OverTime'].map({'Yes': 1, 'No': 0})
```

### 3. Feature Engineering — 3 New Columns

```python
# Age Group
df['AgeGroup'] = pd.cut(df['Age'],
    bins=[18, 25, 35, 45, 60],
    labels=['18-25', '26-35', '36-45', '45+'])

# Tenure Bracket
df['TenureBracket'] = pd.cut(df['YearsAtCompany'],
    bins=[-1, 2, 5, 10, 40],
    labels=['0-2 yrs', '3-5 yrs', '6-10 yrs', '10+ yrs'])

# Salary Band
df['SalaryBand'] = pd.cut(df['MonthlyIncome'],
    bins=[0, 3000, 7000, 20000],
    labels=['Low', 'Mid', 'High'])
```

### 4. Final Dataset Stats
```
Original shape : (1470, 35)
Cleaned shape  : (1470, 34)
Missing values : 0
New columns    : AgeGroup, TenureBracket, SalaryBand
```

---

## 📊 EDA Charts

| Chart | File | Key Finding |
|-------|------|------------|
| Attrition Overview | `chart1_attrition_overview.png` | 237 attrited (16.1%) out of 1,470 |
| Attrition by Department | `chart2_attrition_by_dept.png` | Sales highest at 20% |
| Attrition by Age Group | `chart3_attrition_by_age.png` | 18-25 most at risk — 34% |
| Income by Job Role | `chart4_income_by_jobrole.png` | Manager $17.2K vs Sales Rep $2.6K |
| Overtime Impact | `chart5_overtime_attrition.png` | Overtime = 30% vs No Overtime = 10% |
| Correlation Heatmap | `chart6_correlation_heatmap.png` | Income strongly correlated with Job Level |
| Attrition by Salary | `chart7_attrition_by_salary.png` | Low salary band = 29% attrition |

---

## 📦 Libraries Required

```bash
pip install pandas numpy matplotlib seaborn jupyter
```

---

## ▶️ How to Run

```bash
# Open Jupyter
jupyter notebook hr_analysis.ipynb

# Or in VS Code
# Open hr_analysis.ipynb → Run All Cells
```

---

## 📤 Output

After running the notebook:
- `../data/hr_cleaned.csv` — cleaned dataset ready for PostgreSQL and Power BI
- `../charts/chart1_*.png` through `chart7_*.png` — all EDA visualizations saved
