# 🐍 Python Module: Data Cleaning & Exploratory Data Analysis (EDA)

> This module details the data preprocessing, cleaning, feature engineering, and exploratory data analysis (EDA) steps executed in Python to prepare the raw HR dataset for downstream analysis.

---

## 🔧 Data Cleaning & Preprocessing Workflow

To ensure high-quality analysis, the raw dataset underwent several preprocessing steps:

### 1. Dropping Redundant Columns
The following 4 columns had zero variance (same value for every record) or were irrelevant ID fields, so they were removed:

| Column | Data Type | Reason for Dropping |
| :--- | :--- | :--- |
| `EmployeeCount` | Integer | Constant value of `1` for all rows |
| `Over18` | Categorical | Constant value of `'Y'` for all rows |
| `StandardHours` | Integer | Constant value of `80` for all rows |
| `EmployeeNumber` | Integer | System-generated identifier with no analytical value |

### 2. Binary Feature Encoding
Categorical values for attrition and overtime were mapped to binary integers for correlation analysis and aggregation:
```python
df['Attrition'] = df['Attrition'].map({'Yes': 1, 'No': 0})
df['OverTime']  = df['OverTime'].map({'Yes': 1, 'No': 0})
```

### 3. Feature Engineering (New Columns)
To support granular cohort analysis, three new columns were engineered by binning numerical continuous variables:

```python
# 1. Age Group Binning
df['AgeGroup'] = pd.cut(df['Age'],
    bins=[18, 25, 35, 45, 60],
    labels=['18-25', '26-35', '36-45', '45+'])

# 2. Tenure Bracket Binning
df['TenureBracket'] = pd.cut(df['YearsAtCompany'],
    bins=[-1, 2, 5, 10, 40],
    labels=['0-2 yrs', '3-5 yrs', '6-10 yrs', '10+ yrs'])

# 3. Salary Band Binning
df['SalaryBand'] = pd.cut(df['MonthlyIncome'],
    bins=[0, 3000, 7000, 20000],
    labels=['Low', 'Mid', 'High'])
```

### 4. Preprocessed Dataset Statistics
> [!NOTE]
> *   **Original Shape:** `(1470, 35)`
> *   **Preprocessed Shape:** `(1470, 34)`
> *   **Missing/Null Values:** `0` (clean dataset)
> *   **Engineered Columns:** `AgeGroup`, `TenureBracket`, `SalaryBand`

---

## 📊 Exploratory Data Analysis & Visualizations

The Jupyter notebook generates and saves several key EDA charts in the `charts/` directory to study factors driving employee exit patterns:

| Chart | Filename | Key Analytical Insight |
| :--- | :--- | :--- |
| **Attrition Overview** | [`chart1_attrition_overview.png`](../charts/chart1_attrition_overview.png) | 237 employees left (16.1%) out of 1,470 total. |
| **Attrition by Department** | [`chart2_attrition_by_dept.png`](../charts/chart2_attrition_by_dept.png) | Sales department has the highest exit rate at 20.6%. |
| **Attrition by Age Group** | [`chart3_attrition_by_age.png`](../charts/chart3_attrition_by_age.png) | High attrition among 18-25 cohort (34.4%). |
| **Income by Job Role** | [`chart4_income_by_jobrole.png`](../charts/chart4_income_by_jobrole.png) | Managers earn ~$17.2K while Sales Representatives earn only ~$2.6K. |
| **Overtime Impact** | [`chart5_overtime_attrition.png`](../charts/chart5_overtime_attrition.png) | Overtime employees show 30.5% attrition vs 10.4% without overtime. |
| **Correlation Heatmap** | [`chart6_correlation_heatmap.png`](../charts/chart6_correlation_heatmap.png) | Monthly income strongly correlates with Job Level and Total Working Years. |
| **Attrition by Salary Band** | [`chart7_attrition_by_salary.png`](../charts/chart7_attrition_by_salary.png) | Low salary band experiences the highest attrition at 29.3%. |

---

## 💻 Environment Setup & Libraries

To run the notebook, install the following required Python dependencies:

```bash
pip install pandas numpy matplotlib seaborn jupyter
```

---

## 🚀 Execution Instructions

You can run the analysis using Jupyter notebook or directly inside VS Code:

### Option A: Jupyter Notebook Interface
```bash
# Navigate to the notebooks directory and start Jupyter
cd notebooks
jupyter notebook hr_analysis.ipynb
```

### Option B: VS Code Interactive Window
1. Open the workspace in VS Code.
2. Select [`notebooks/hr_analysis.ipynb`](hr_analysis.ipynb).
3. Ensure your Python kernel is selected and click **Run All**.

---

## 📤 Generated Outputs

Running the notebook successfully will generate and update:
1. **Cleaned Data File:** [`data/hr_cleaned.csv`](../data/hr_cleaned.csv) — loaded into the database and dashboard.
2. **EDA Plots:** Saves `chart1_*.png` through `chart7_*.png` in the [`charts/`](../charts/) directory.
