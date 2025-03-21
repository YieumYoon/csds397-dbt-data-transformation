-- employee hire count by start year
with employee_data as (
    select * from {{ ref('stg_employee_data') }}
),
employee_hire_by_start_year as (
    select 
        year(date_of_joining) as start_year,
        count(employee_id) as hire_count
    from employee_data
    group by start_year
    order by start_year
)
select * from employee_hire_by_start_year