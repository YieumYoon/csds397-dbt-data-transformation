-- tenure to Salary Analysis
with employee_data as (
    select * from {{ ref('stg_employee_data') }}
),
average_salary_by_tenure as (
    select 
        years_experience,
        avg(salary) as avg_salary
    from employee_data
    group by years_experience
    order by years_experience desc
)
select * from average_salary_by_tenure