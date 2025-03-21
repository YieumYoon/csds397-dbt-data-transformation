{{ config(materialized='view') }}

SELECT 
  CAST(`Employee Id` AS SIGNED) as employee_id,
  `Name` as employee_name,
  CAST(`Age` AS SIGNED) as age,
  `Department` as department,
  STR_TO_DATE(`Date of Joining`, '%Y-%m-%d') as date_of_joining,
  CAST(`Years of Experience` AS SIGNED) as years_experience, 
  `Country` as country,
  CAST(`Salary` AS SIGNED) as salary,
  `Performance Rating` as performance_rating
FROM {{ ref('employee_data_clean') }}