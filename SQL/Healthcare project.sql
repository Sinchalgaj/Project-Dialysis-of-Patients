-- KPI-1 Number of Patients across various summaries
SELECT
    SUM(`Number of patients in Serum phosphorus summary`),
    SUM(`Number of patients included in hospitalization summary`),
    SUM(`Number of Patients included in survival summary`),
    SUM(`Number of Patients included in fistula summary`),
    SUM(`Number of patients in long term catheter summary`),
    SUM(`Number of patients in nPCR summary`)
FROM `dialysis_i`;
    
    
-- KPI -2 Profit Vs Non-Profit Stats
SELECT 
    State,
    SUM(CASE
        WHEN `Profit or Non-Profit` = 'Profit' THEN 1
    END) AS Profit,
    SUM(CASE
        WHEN `Profit or Non-Profit` = 'Non-Profit' THEN 1
    END) AS `Non-Profit`
FROM `dialysis_i`
GROUP BY State;

-- KPI -3 Chain Organizations w.r.t. Total Performance Score as No Score
SELECT 
    `Chain Organization`,
    COUNT(`Total Performance Score`) AS `No Score`
FROM dialysis_i d1 inner JOIN dialysis_ii d2 ON d1.`Facility Name` = d2.`Facility Name`
GROUP BY `Chain Organization`;


-- KPI- 4 Dialysis Stations Stats
SELECT 
    state,
    COUNT(`# of Dialysis Stations`)
FROM dialysis_i
GROUP BY State;

-- KPI - 5 # of Category Text  - As Expected
SELECT 
    SUM(CASE
        WHEN `Patient Transfusion category text` = 'As Expected' THEN 1
    END) AS `Patient Transfusion`,
    SUM(CASE
        WHEN `Patient hospitalization category text` = 'As Expected' THEN 1
    END) AS `Patient hospitalization`,
    SUM(CASE
        WHEN `Patient Survival Category Text` = 'As Expected' THEN 1
    END) AS `Patient Survival`,
    SUM(CASE
        WHEN `Patient Infection category text` = 'As Expected' THEN 1
    END) AS `Patient Infection`,
    SUM(CASE
        WHEN `Fistula Category Text` = 'As Expected' THEN 1
    END) AS `Fistula`,
    SUM(CASE
        WHEN `SWR category text` = 'As Expected' THEN 1
    END) AS `SWR`,
    SUM(CASE
        WHEN `PPPW category text` = 'As Expected' THEN 1
    END) AS `PPPW`
FROM dialysis_i;


-- KPI - 6 Average Payment Reduction Rate
SELECT 
    ROUND(AVG(`PY2020 Payment Reduction Percentage`),
            2) AS AveragePaymentReductionRate
FROM dialysis_ii;