# Emission & Efficiency Analysis of Alternative Fuels in CI Engine
This project investigates the emission characteristics and engine performance of various alternative fuel blends, including Waste Cooking Oil (WCO), Waste Plastic Oil (WPO), and Diesel, with and without Hydrogen gas enrichment. The dataset was derived from experimental testing under multiple load conditions and analyzed using both Power BI and SQL (MySQL).

## 📌 Project Objectives

- Analyze pollutant emissions (CO, HC, NOx, Smoke %) for different fuel blends
- Evaluate performance metrics such as Thermal Efficiency, Specific Fuel Consumption, and Net Heat Release Rate
- Compare results with and without hydrogen gas injection
- Showcase SQL and Power BI (DAX) integration for data analysis

## 🛠️ Tools Used

- **Power BI** (with DAX measures and visuals)
- **MySQL** (views, aggregations, filtering)
- **Excel/CSV** (source data)
- **GitHub** (portfolio)

## 📊 Dashboards

### 📘 Dashboard 1: Excel + Power BI (DAX-Based)
![Dashboard Preview](https://github.com/AshwinReji/Alternate-Fuel-Emission-Analysis/blob/main/Excel%20%2B%20Power%20BI%20(DAX-Based).png)
- Developed using Excel data and calculated DAX measures
- Visuals include clustered bar charts, matrix, KPIs, tooltips, and gauge meters
- Focused on emission vs performance across different blends
### 🟦 Dashboard 2: MySQL + Power BI
![Dashboard Preview](https://github.com/AshwinReji/Alternate-Fuel-Emission-Analysis/blob/main/Power%20BI%20%2B%20SQL.png)  
- SQL views used to summarize and group emissions by blend
- Power BI connected directly to MySQL
- Separate dashboard created using SQL as the backend source

## 🧠 SQL Queries Used

All SQL analysis queries used to summarize emission data and calculate average performance metrics are included in the file:
![View all SQL queries](https://github.com/AshwinReji/Alternate-Fuel-Emission-Analysis/blob/main/Alternate%20Fuel%20Analysis.sql)
### Example Query
```sql
CREATE VIEW blend_summary AS
SELECT 
  `Fuel + H2 Combo`,
  ROUND(AVG(`CO (ppm)`), 2) AS avg_CO,
  ROUND(AVG(`NOx (ppm)`), 2) AS avg_NOx,
  ROUND(AVG(`HC (ppm)`), 2) AS avg_HC,
  ROUND(AVG(`Thermal Efficiency (%)`), 2) AS avg_eff,
  ROUND(AVG(`Smoke (%)`), 2) AS avg_smoke
FROM Alternate_Fuel_Analysis
GROUP BY `Fuel + H2 Combo`;
