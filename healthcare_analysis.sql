USE healthcare_db;
CREATE TABLE healthcare_data (
    Person_ID INT,
    Gender VARCHAR(20),
    Age INT,
    Occupation VARCHAR(100),
    Sleep_Duration DECIMAL(4,2),
    Quality_of_Sleep INT,
    Physical_Activity_Level INT,
    Stress_Level INT,
    BMI_Category VARCHAR(50),
    Blood_Pressure VARCHAR(20),
    Heart_Rate INT,
    Daily_Steps INT,
    Sleep_Disorder VARCHAR(50),
    Systolic_BP INT,
    Diastolic_BP INT
);
USE healthcare_db;

SELECT COUNT(*) AS total_records
FROM healthcare_cleaned;
SELECT *
FROM healthcare_cleaned
LIMIT 10;
SELECT AVG(Age) AS average_age
FROM healthcare_cleaned;
DESCRIBE healthcare_cleaned;
SELECT AVG(`Sleep Duration`) AS average_sleep_hours
FROM healthcare_cleaned;
SELECT AVG(`Quality of Sleep`) AS average_sleep_quality
FROM healthcare_cleaned;
SELECT AVG(`Daily Steps`) AS average_daily_steps
FROM healthcare_cleaned;
SELECT AVG(`Stress Level`) AS average_stress_level
FROM healthcare_cleaned;
SELECT AVG(`Heart Rate`) AS average_heart_rate
FROM healthcare_cleaned;
SELECT
    AVG(`Systolic BP`) AS average_systolic_bp,
    AVG(`Diastolic BP`) AS average_diastolic_bp
FROM healthcare_cleaned;
SELECT
    ROUND(AVG(Age), 2) AS average_age,
    ROUND(AVG(`Sleep Duration`), 2) AS average_sleep_hours,
    ROUND(AVG(`Quality of Sleep`), 2) AS average_sleep_quality,
    ROUND(AVG(`Daily Steps`), 2) AS average_daily_steps,
    ROUND(AVG(`Stress Level`), 2) AS average_stress_level,
    ROUND(AVG(`Heart Rate`), 2) AS average_heart_rate,
    ROUND(AVG(`Systolic BP`), 2) AS average_systolic_bp,
    ROUND(AVG(`Diastolic BP`), 2) AS average_diastolic_bp
FROM healthcare_cleaned;
    
SELECT
    COALESCE(NULLIF(TRIM(`Sleep Disorder`), ''), 'Missing')
        AS sleep_disorder_status,
    COUNT(*) AS total_records
FROM healthcare_cleaned
GROUP BY COALESCE(NULLIF(TRIM(`Sleep Disorder`), ''), 'Missing');
SELECT
    COALESCE(NULLIF(TRIM(`Sleep Disorder`), ''), 'Missing')
        AS sleep_disorder_status,
    COUNT(*) AS total_records,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM healthcare_cleaned), 2)
        AS percentage
FROM healthcare_cleaned
GROUP BY COALESCE(NULLIF(TRIM(`Sleep Disorder`), ''), 'Missing');
SELECT
    `BMI Category`,
    ROUND(AVG(`Sleep Duration`), 2) AS average_sleep_hours,
    COUNT(*) AS total_records
FROM healthcare_cleaned
GROUP BY `BMI Category`
ORDER BY average_sleep_hours DESC;
SELECT
    Occupation,
    ROUND(AVG(`Stress Level`), 2) AS average_stress_level,
    COUNT(*) AS total_records
FROM healthcare_cleaned
GROUP BY Occupation
ORDER BY average_stress_level DESC;
SELECT
    `BMI Category`,
    ROUND(AVG(`Daily Steps`), 2) AS average_daily_steps,
    COUNT(*) AS total_records
FROM healthcare_cleaned
GROUP BY `BMI Category`
ORDER BY average_daily_steps DESC;
SELECT
    COUNT(*) AS total_records,
    ROUND(AVG(Age), 2) AS average_age,
    ROUND(AVG(`Sleep Duration`), 2) AS average_sleep_hours,
    ROUND(AVG(`Quality of Sleep`), 2) AS average_sleep_quality,
    ROUND(AVG(`Daily Steps`), 2) AS average_daily_steps,
    ROUND(AVG(`Stress Level`), 2) AS average_stress_level,
    ROUND(AVG(`Heart Rate`), 2) AS average_heart_rate,
    ROUND(AVG(`Systolic BP`), 2) AS average_systolic_bp,
    ROUND(AVG(`Diastolic BP`), 2) AS average_diastolic_bp
FROM healthcare_cleaned;
USE healthcare_db;

SHOW TABLES;
SELECT COUNT(*) AS total_records
FROM healthcare_db.healthcare_sleep_flags;
SELECT
    `Sleep Duration Flag`,
    COUNT(*) AS total_people,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM healthcare_db.healthcare_sleep_flags),
        2
    ) AS percentage
FROM healthcare_db.healthcare_sleep_flags
GROUP BY `Sleep Duration Flag`;