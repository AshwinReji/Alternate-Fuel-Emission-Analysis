CREATE DATABASE Fuel_Analysis;
USE Fuel_Analysis;
SELECT * FROM Alternate_Fuel_Analysis;
SELECT * FROM Alternate_Fuel_Analysis
LIMIT 10;


-- Average emissions by fuel blend + hydrogen --
SELECT 
  `Fuel + H2 Combo`,
  ROUND(AVG(`CO (ppm)`), 2) AS avg_CO,
  ROUND(AVG(`NOx (ppm)`), 2) AS avg_NOx,
  ROUND(AVG(`HC (ppm)`), 2) AS avg_HC
FROM Alternate_Fuel_Analysis
GROUP BY `Fuel + H2 Combo`
ORDER BY avg_NOx ASC;


-- Rank blends by efficiency --
SELECT 
  `Fuel + H2 Combo`,
  ROUND(AVG(`Thermal Efficiency (%)`), 2) AS avg_eff
FROM Alternate_Fuel_Analysis
GROUP BY `Fuel + H2 Combo`
ORDER BY avg_eff DESC;


-- Emissions stats With and Without Hydrogen --
SELECT 
  CASE 
    WHEN `Hydrogen Flow (lpm)` = 0 THEN 'Without H₂'
    ELSE 'With H₂'
  END AS H2_Status,
  ROUND(AVG(`CO (ppm)`), 2) AS avg_CO,
  ROUND(AVG(`HC (ppm)`), 2) AS avg_HC,
  ROUND(AVG(`NOx (ppm)`), 2) AS avg_NOx
FROM Alternate_Fuel_Analysis
GROUP BY H2_Status;


-- Top 5 Most Efficient Fuel + H₂ Combinations --
SELECT 
  `Fuel + H2 Combo`,
  ROUND(AVG(`Thermal Efficiency (%)`), 2) AS avg_efficiency
FROM Alternate_Fuel_Analysis
GROUP BY `Fuel + H2 Combo`
ORDER BY avg_efficiency DESC
LIMIT 10;


-- Least Polluting Fuel Combos (Lowest Combined Emissions) --
SELECT 
  `Fuel + H2 Combo`,
  ROUND(AVG(`CO (ppm)` + `HC (ppm)` + `NOx (ppm)`), 2) AS total_emission
FROM Alternate_Fuel_Analysis
GROUP BY `Fuel + H2 Combo`
ORDER BY total_emission ASC
LIMIT 10;


-- Average Net Heat Release Rate by Blend --
SELECT 
  `Fuel + H2 Combo`,
  ROUND(AVG(`Net Heat Release Rate (J/°CA)`), 2) AS avg_NHRR
FROM Alternate_Fuel_Analysis
GROUP BY `Fuel + H2 Combo`
ORDER BY avg_NHRR DESC;


-- Performance by Load Level --
SELECT 
  `Load%`,
  ROUND(AVG(`Thermal Efficiency (%)`), 2) AS avg_eff,
  ROUND(AVG(`Brake Power (kW)`), 2) AS avg_BP
FROM Alternate_Fuel_Analysis
GROUP BY `Load%`
ORDER BY `Load%`;


-- Highest Exhaust Temperatures --
SELECT 
  `Fuel + H2 Combo`,
  MAX(`Exhaust Temp (°C)`) AS max_temp
FROM Alternate_Fuel_Analysis
GROUP BY `Fuel + H2 Combo`
ORDER BY max_temp DESC
LIMIT 10;


DROP VIEW IF EXISTS blend_summary;
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


SELECT * 
FROM blend_summary
ORDER BY avg_eff DESC;
SELECT * FROM blend_summary;
