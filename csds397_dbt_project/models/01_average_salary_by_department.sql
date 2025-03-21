-- average salary by department
with employee_data as (
    select * from {{ ref('stg_employee_data') }}
),
average_salary_by_department as (
    select 
        department,
        avg(salary) as avg_salary
    from employee_data
    group by department
    order by avg_salary desc
)
select * from average_salary_by_department