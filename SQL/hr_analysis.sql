-- =============================================
-- HR ANALYTICS — SQL ANALYSIS
-- Author: Yash Awasthi
-- Database: hr_analytics
-- =============================================

SELECT * FROM hr_employees -- query for data over view

-- Q1: Overall Attrition Rate

SELECT
	COUNT(*) AS total_employees,
	SUM(attrition) AS total_attrited,
	ROUND(SUM(attrition)* 100 / COUNT(*),2) AS total_attrition_pct
FROM  
	hr_employees;
	
	
-- Q2: Attrition Rate By department

SELECT
	department,
	COUNT(*) AS total_employees,
	SUM(attrition) AS total_attrited,
	ROUND(SUM(attrition)* 100 / COUNT(*),2) AS total_attrition_pct
FROM  
	hr_employees
GROUP BY department
ORDER BY total_attrition_pct DESC;


-- Q3: Average Monthly Income by Job Role

SELECT 
jobrole,
ROUND(AVG(monthlyincome),2) AS avg_mounth_salary,
MIN(monthlyincome) AS min_salary,
MAX(monthlyincome) AS max_salary
FROM 
	hr_employees
GROUP BY jobrole
ORDER BY avg_mounth_salary DESC;


-- Q4: Attrition Rate by Overtime Status

SELECT 
	CASE
	WHEN overtime = 1 THEN 'Yes - Overtime'
	ELSE 'No- Overtime'
	END ,
	COUNT(*) AS total_empployees,
	SUM(attrition) AS total_attrited,
	ROUND(SUM(attrition) * 100 / COUNT(*),2) AS total_attrited_pct
FROM
	hr_employees
GROUP BY overtime	
ORDER BY total_attrited_pct DESC ;



-- Q5: Attrition by Age Group

SELECT
	agegroup,
	COUNT(*) AS total_employees,
	SUM(attrition) AS total_attrited,
	ROUND(SUM(attrition) * 100/ COUNT(*),2) AS total_attrited_pct
FROM 
	hr_employees
WHERE agegroup IS NOT NULL	
GROUP BY agegroup
ORDER BY total_attrited_pct DESC;


-- Q6: Job Satisfaction vs Attrition

SELECT 
	CASE 
	WHEN jobsatisfaction = 1 THEN 'LOW'
	WHEN jobsatisfaction = 2 THEN 'Midium'
	WHEN jobsatisfaction = 3 THEN 'High'
	WHEN jobsatisfaction = 4 THEN 'Very High'
	END AS satisfaction_level,
	COUNT(*) AS total_employees,
	SUM(attrition) AS total_attrited,
	ROUND(SUM(attrition) * 100 / COUNT(*),2) AS total_attrited_pct
FROM
	hr_employees
GROUP BY jobsatisfaction	
ORDER BY jobsatisfaction ;	
	

-- Q7: Attrition by Years at Company (Tenure)

SELECT 
	tenurebracket,
	COUNT(*) AS total_employees,
	SUM(attrition) AS total_attrited,
	ROUND(SUM(attrition) * 100 / COUNT(*),2) as total_attrited_pct 
FROM 
	hr_employees
GROUP BY tenurebracket	
ORDER BY tenurebracket ASC;	


-- Q8: Gender wise Attrition

SELECT 
	gender,
	SUM(attrition) AS total_attrited,
	ROUND(SUM(attrition) * 100 / COUNT(*),2) as total_attrited_pct, 
	ROUND(AVG(monthlyincome),0) AS avg_mountly_income
FROM
	hr_employees
GROUP BY 
	gender
ORDER BY
	total_attrited_pct DESC;

	

-- Q9: Top 5 Job Roles by Attrition Rate

SELECT 
	jobrole,
	SUM(attrition) AS total_attrited,
	ROUND(SUM(attrition) * 100 / COUNT(*),2) AS total_attrited_pct,
	ROUND(AVG(monthlyincome),0) AS avg_mountly_income
FROM
	hr_employees
GROUP BY jobrole	
HAVING COUNT(*) > 20
ORDER BY total_attrited_pct DESC
LIMIT 5 ;



-- 10 Work Life Balance VS Attrition

SELECT 
	CASE 
	WHEN worklifebalance = 1 THEN 'Bad'
	WHEN worklifebalance = 2 THEN 'Good'
	WHEN worklifebalance = 3 THEN 'Better'
	WHEN worklifebalance = 4 THEN 'Best'
	END AS wlb_level,
	COUNT(*) AS total_employees,
	SUM(attrition) AS total_attrited,
	ROUND(SUM(attrition) * 100 / COUNT(*),2) AS total_attrition_pct
FROM
	hr_employees
GROUP BY wlb_level	
ORDER BY total_attrition_pct DESC;



	
 