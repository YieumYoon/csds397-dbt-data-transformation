-- performance by start year
with employee_data as (
    select * from {{ ref('stg_employee_data') }}
),
performance_by_start_year as (
    select 
        year(date_of_joining) as start_year,
        avg(case
            when performance_rating = 'Low Performers' then 1
            when performance_rating = 'Average Performers' then 3
            when performance_rating = 'High Performers' then 5
            else 0
        end) as average_performance_rating
    from employee_data
    group by start_year
    order by start_year desc
)
select * from performance_by_start_year