SELECT * 
FROM company_dim;

SELECT *
FROM job_postings_fact
LIMIT 100

SELECT job_posted_date
FROM job_postings_fact
LIMIT 10;

/* 
HANDLING DATES
Date Functions in SQL: Used to perform operations on date and time values
::DATE - converts to a date format by removing the time portion
AT TIME ZONE - Converts a timestamp to a specified time zone
EXTRACT - Gets specific date parts (e.g Year, Month, Day)
*/

SELECT '2023-02-19' ::DATE

SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date AS date
FROM 
    job_postings_fact; 

SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date::DATE AS date
FROM 
    job_postings_fact
LIMIT 5;

SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time
FROM 
    job_postings_fact
LIMIT 5;

-- The keyword EXTRACT is used to get/extract fields(e.g, year, month, day) from a date/time value
SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time,
    EXTRACT(MONTH FROM job_posted_date) AS date_month,
    EXTRACT(YEAR FROM job_posted_date) AS date_year
FROM 
    job_postings_fact
LIMIT 5;

SELECT 
    job_id,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM 
    job_postings_fact
LIMIT 5;                


SELECT 
    COUNT(job_id) AS job_posted_count,
    EXTRACT(MONTH FROM job_posted_date) AS month
FROM 
    job_postings_fact
WHERE 
    job_title_short = 'Data Engineer'        
GROUP BY 
    month        
ORDER BY 
    job_posted_count DESC;

SELECT *
FROM job_postings_fact;

SELECT 
  AVG(salary_year_avg) AS avg_salary_year,
  AVG(salary_hour_avg) AS avg_salary_hour,
  job_schedule_type,
  job_posted_date,
  EXTRACT(YEAR FROM job_posted_date) AS year,
  EXTRACT(MONTH FROM job_posted_date) AS month
FROM 
    job_postings_fact
WHERE 
    job_posted_date >= '2023-06-01'
GROUP BY
    job_schedule_type,
    job_posted_date
ORDER BY
    month DESC
LIMIT 10;

SELECT
    job_schedule_type,
    AVG(salary_year_avg) AS avg_salary_year,
    AVG(salary_hour_avg) AS avg_salary_hour
FROM
    job_postings_fact
WHERE
    job_posted_date >= '2023-06-01'
GROUP BY
    job_schedule_type;


SELECT
    COUNT(job_id) AS job_posting_count,
    job_posted_date,
    EXTRACT(MONTH FROM job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'America/New_York') AS month
FROM
    job_postings_fact
WHERE
    job_posted_date >= '2023-01-01'
    AND job_posted_date < '2024-01-01'
GROUP BY
    job_postings_fact.job_posted_date
ORDER BY
    month;


SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 1
LIMIT 10;
   

-- Query to find job postings in January
CREATE TABLE january_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

-- Query to find job postings in February 
CREATE TABLE february_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- Query to find job postings in March
CREATE TABLE march_jobs AS
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;    

-- Retrieve job posting dates from the march_jobs table
SELECT job_posted_date
FROM march_jobs

/*
CASE EXPRESSION 
A CASE expression is a way to perform conditional logic in SQL queries.
It allows you to return different values based on certain conditions.
The CASE expression can be used in SELECT, WHERE, ORDER BY, and other clauses.
The syntax for a CASE expression is as follows:
SELECT
    CASE 
        WHEN column name = 'value1' THEN 'Description for value1'
        WHEN column name = 'value2' THEN 'Description for value2'
        ELSE 'other'
    END AS column_description    
FROM
    table_name;
*/
/*
CASE - begins the expression
WHEN - specifies the condition(s) to check
THEN - specifies the value to return if the condition is true
ELSE - specifies the value to return if none of the conditions are true
END - ends the CASE expression
*/

SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date AS date
FROM 
    job_postings_fact; 
/* Now using the above query:
Label new column as follows:
- 'Anywhere' jobs as 'Remote'
- 'New York, NY' jobs as 'local'
- Otherwise 'Ónsite'
*/
SELECT 
    job_title_short AS title,
    job_location AS location,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM 
    job_postings_fact; 

SELECT 
    COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM 
    job_postings_fact
WHERE 
    job_title_short = 'Data Engineer'    
GROUP BY
    location_category;    


/* 
SUBQUERIES and CTEs
- A subquery is a query nested inside another query. It can be used to retrieve data that will be used in the main query.
- A Common Table Expression (CTE) is a temporary result set that can be referenced within a SELECT, INSERT, UPDATE, or DELETE statement.
- CTEs are similar to subqueries but can be more readable and reusable.
- Subqueries can be used in various parts of a SQL statement, such as the SELECT, FROM, WHERE, and HAVING clauses.
- CTEs can be used to break down complex queries into simpler parts, making them easier to understand and maintain.
- Subqueries can be used to filter results, perform calculations, or retrieve additional data.
- Note that subqueries can be correlated or non-correlated. A correlated subquery depends on the outer query, while a non-correlated subquery does not.
- Also note that SUBQUERIES are for simpler queries while CTEs are for more complex queries.
- Subqueries can be used in SELECT, FROM, WHERE, and HAVING clauses, while CTEs are defined using the WITH clause.
- CTEs can be recursive, allowing you to perform operations on hierarchical data.
- CTEs are defined using the WITH clause and can be used to simplify complex queries by breaking them down into smaller, more manageable parts.
- subqueries can be used in various clauses such as SELECT, FROM, WHERE, and HAVING.
- The syntax for a subquery is as follows:        
SELECT column_name
FROM table_name
WHERE column_name IN (SELECT column_name FROM another_table WHERE condition);
*/      
-- Example of a subquery in the WHERE clause
SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date AS date
FROM
    job_postings_fact
WHERE
    job_posted_date IN (SELECT job_posted_date FROM job_postings_fact WHERE job_title_short = 'Data Engineer');

-- Example of a subquery in the FROM clause
SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date AS date
FROM
    (SELECT * FROM job_postings_fact WHERE job_title_short = 'Data Engineer') AS subquery;

-- Example of a subquery in the SELECT clause
SELECT 
    job_title_short AS title,
    job_location AS location,
    job_posted_date AS date,
    (SELECT COUNT(*) FROM job_postings_fact WHERE job_title_short = 'Data Engineer') AS total_data_engineer_jobs        
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Engineer';  

-- Example of a subquery in the HAVING clause
SELECT 
    job_title_short AS title,
    job_location AS location,
    COUNT(job_id) AS job_count
FROM        
    job_postings_fact
WHERE
    job_title_short = 'Data Engineer'
GROUP BY
    job_title_short, job_location
HAVING
    COUNT(job_id) > 1;  

-- Example of a CTE 
WITH data_engineer_jobs AS (
    SELECT 
        job_id,
        job_title_short,
        job_location,
        job_posted_date
    FROM 
        job_postings_fact
    WHERE 
        job_title_short = 'Data Engineer'
)
SELECT 
    job_id,
    job_title_short,
    job_location,
    job_posted_date
FROM
    data_engineer_jobs;

-- Example of a CTE with multiple queries
WITH data_engineer_jobs AS (
    SELECT 
        job_id,
        job_title_short,
        job_location,
        job_posted_date
    FROM 
        job_postings_fact
    WHERE 
        job_title_short = 'Data Engineer'
),
data_engineer_job_counts AS (
    SELECT 
        job_location,
        COUNT(*) AS job_count
    FROM 
        data_engineer_jobs
    GROUP BY
        job_location
)

SELECT 
    job_location,
    job_count
FROM
    data_engineer_job_counts;

SELECT *
FROM ( --subquery starts here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) AS january_jobs --subquery ends here    


WITH january_jobs AS ( -- CTE definition starts here
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
) -- CTE definition ends here
SELECT *
FROM january_jobs;


-- list of companies offering jobs that do not require a college degree 
SELECT 
    company_id,
    name AS company_name
FROM 
    company_dim
WHERE company_id IN (
    SELECT 
        company_id
    FROM 
        job_postings_fact
    WHERE 
        job_no_degree_mention = true
    ORDER BY 
        company_id            
);


SELECT 
    company_id,
    job_no_degree_mention
FROM 
    job_postings_fact
WHERE 
    job_no_degree_mention = true       

SELECT 
    company_id,
    job_no_degree_mention
FROM 
    job_postings_fact        


/*
Find the companies that have the most job openings
-- Get the total number of job postings per company id (job_postings_fact)
-- Return the total number of jobs with the company name (company_dim)
*/
SELECT 
    company_id,
    COUNT(*)
FROM 
    job_postings_fact            
GROUP BY 
    company_id;


WITH company_job_count AS (
    SELECT 
        company_id,
        COUNT(*) AS total_jobs -- COUNT(*) counts all rows for each company_id
    FROM 
        job_postings_fact
    GROUP BY 
        company_id
)
-- LEFT JOIN 
SELECT 
    company_dim.name AS company_name,
    company_job_count.total_jobs
FROM company_dim
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY
    total_jobs DESC


/*
Find the count of the number of remote job postings per skill
- Display the top 5 skills by their demand in remote jobs
- Include skills ID, name, and count of postings requiring the skill
*/
SELECT 
    job_postings.job_id,
    skill_id,
    job_postings.job_work_from_home
FROM 
    skills_job_dim AS skills_to_job        
INNER JOIN 
    job_postings_fact AS job_postings 
    ON job_postings.job_id = skills_to_job.job_id
WHERE 
    job_postings.job_work_from_home


WITH remote_job_skills AS (
    SELECT 
        skill_id,
        COUNT(*) AS skill_count
    FROM 
        skills_job_dim AS skills_to_job        
    INNER JOIN 
        job_postings_fact AS job_postings 
        ON job_postings.job_id = skills_to_job.job_id
    WHERE 
        job_postings.job_work_from_home = True AND
        job_postings.job_title_short = 'Data Engineer'

    GROUP BY 
        skill_id
)
SELECT 
    skills.skill_id,
    skills AS skill_name,
    skill_count
FROM remote_job_skills
INNER JOIN skills_dim AS skills ON skills.skill_id = remote_job_skills.skill_id
ORDER BY 
    skill_count DESC
LIMIT 5;    

/* UNION OPERATOR
The UNION operator is used to combine the results of two or more SELECT statements.
- The UNION operator removes duplicate rows from the result set.
- The UNION ALL operator includes all rows, including duplicates.
- The number of columns and their data types must match in all SELECT statements. 
- That is, Each SELECT statement must have the same number of columns, and the corresponding columns must have compatible data types.
- The column names in the result set are taken from the first SELECT statement.
- The UNION operator can be used to combine results from different tables or queries.
EXAMPLE of the UNION syntax is:
SELECT column1, column2 
FROM table1
UNION
SELECT column1, column2 
FROM table2;
*/

-- Get jobs and companies from January.
SELECT 
    job_title_short,
    company_id,
    job_location
FROM 
    january_jobs    

UNION 

-- Get jobs and companies from February.
SELECT 
    job_title_short,
    company_id,
    job_location
FROM 
    february_jobs

UNION 

-- Get jobs and companies from March.
SELECT 
    job_title_short,
    company_id,
    job_location
FROM 
    march_jobs

/*
SYNTAX FOR UNION ALL:
SELECT column1, column2
FROM table1
UNION ALL
SELECT column1, column2
FROM table2;
*/
-- Get jobs and companies from January.
SELECT 
    job_title_short,
    company_id,
    job_location
FROM 
    january_jobs   

UNION ALL

-- Get jobs and companies from February.
SELECT 
    job_title_short,
    company_id,
    job_location
FROM 
    february_jobs

UNION ALL

-- Get jobs and companies from March.
SELECT 
    job_title_short,
    company_id,
    job_location
FROM 
    march_jobs


/*
Find job postings from the first quarter that have a salary greater than $70k
- Combine job posting tables from the first quarter of 2023 (Jan-Mar)
- Get job postings with an average yearly salary > $70k
*/
SELECT 
    quarter1_job_postings.job_title_short,
    quarter1_job_postings.job_location,
    quarter1_job_postings.job_via,
    quarter1_job_postings.job_posted_date::DATE,
    quarter1_job_postings.salary_year_avg
FROM (
    SELECT *
    FROM january_jobs
    UNION ALL
    SELECT *
    FROM february_jobs
    UNION ALL
    SELECT *
    FROM march_jobs
) AS quarter1_job_postings
WHERE 
    quarter1_job_postings.salary_year_avg > 70000 AND 
    quarter1_job_postings.job_title_short = 'Data Engineer'
ORDER BY 
    quarter1_job_postings.salary_year_avg DESC
