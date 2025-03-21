-- salary by start year
with employee_data as (
    select * from {{ ref('stg_employee_data') }}
),
salary_by_start_year as (
    select 
        year(date_of_joining) as start_year,
        avg(salary) as avg_salary,
        min(salary) as min_salary,
        max(salary) as max_salary
    from employee_data
    group by start_year
    order by start_year desc
)
select * from salary_by_start_year