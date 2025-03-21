-- Performance Rating by Salary
with employee_data as (
    select * from {{ ref('stg_employee_data') }}
),
performance_by_salary as (
    select 
        performance_rating,
        avg(salary) as avg_salary
    from employee_data
    group by performance_rating
    order by avg_salary desc
)
select * from performance_by_salary