# CSDS397 DBT Data Transformation Project

This project demonstrates how to use dbt (data build tool) to transform employee data and generate analytical insights.

[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/F9DKYsXZ-0M/0.jpg)](https://www.youtube.com/watch?v=F9DKYsXZ-0M)

## Project Overview

This dbt project transforms raw employee data from a CSV file into several analytical models that provide insights into:

- Salary analysis by department
- Relationship between tenure and salary
- Performance ratings by salary
- Performance trends by start year
- Salary trends by start year
- Hiring patterns by year

## Prerequisites

- MySQL database server
- Python 3.7+
- dbt-core and dbt-mysql packages

## Setup Instructions

1. **Clone the repository**
   ```bash
   git clone [repository-url]
   cd csds397-dbt-data-transformation
   ```

2. **Create a virtual environment**
   ```bash
   python -m venv dbt_env
   source dbt_env/bin/activate  # On Windows: dbt_env\Scripts\activate
   ```

3. **Install dbt and dependencies**
   ```bash
   pip install dbt-core dbt-mysql
   ```

4. **Configure your profiles.yml**
   
   Make sure your `profiles.yml` file is properly configured with your MySQL database credentials. You can place it in the `~/.dbt/` directory or reference it using the `--profiles-dir` flag.
   
   Example configuration:
   ```yaml
   csds397_dbt_project:
     target: dev
     outputs:
       dev:
         type: mysql
         server: localhost
         port: 3306
         database: csds397_dbt
         schema: csds397_dbt
         username: [your_username]
         password: [your_password]
         threads: 4
   ```

5. **Test the connection**
   ```bash
   cd csds397_dbt_project
   dbt debug
   ```

## Project Structure

- `seeds/`: Contains the raw CSV data
  - `employee_data_clean.csv`: Employee dataset with 300 records

- `models/`: Contains SQL transformations
  - `staging/`: Initial data preparation
    - `stg_employee_data.sql`: Cleans and prepares raw data
  - Core analysis models:
    - `01_average_salary_by_department.sql`: Calculates average salary by department
    - `02_tenure_to_salary.sql`: Analyzes relationship between experience and salary
    - `03_perfomance_by_salary.sql`: Evaluates performance ratings vs salary
    - `04_performance_by_start_year.sql`: Analyzes performance trends by hire year
    - `05_salary_by_start_year.sql`: Examines salary trends by hire year
    - `06_employee_hire_by_start_year.sql`: Tracks hiring patterns over time

- `schema.yml`: Contains column descriptions and tests for data validation

## Running the Project

1. **Seed the raw data into the database**
   ```bash
   dbt seed
   ```

2. **Run all models**
   ```bash
   dbt run
   ```

3. **Run tests to validate the models**
   ```bash
   dbt test
   ```
`
4. **Generate documentation**
   ```bash
   dbt docs generate
   dbt docs serve
   ```

## Materialization

This project uses different materialization strategies:
- Staging models are materialized as views for flexibility
- Final analytical models are materialized as tables for performance

## Customization

You can customize this project by:
- Adding new models in the `models/` directory
- Modifying existing transformations
- Extending the schema tests
- Adding more data sources