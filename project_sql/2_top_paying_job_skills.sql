/* 
QUESTION: What skills are required for the top-paying Data Engineering jobs?
- Use the top 10 highest-paying Data Engineering jobs from the previous query.
- Add the specific skills required for these roles.
- Why? It provides a detailed look at which skills to develop that align with top salaries
*/
-- This query retrieves the top 10 highest-paying Data Engineering jobs and their associated skills.
WITH top_paying_jobs AS (
    SELECT 
        job_id,
        job_title,
        salary_year_avg,
        company_id
    FROM 
        job_postings_fact  
    WHERE
        job_title_short = 'Data Engineer' AND
        job_location = 'Anywhere' AND
        salary_year_avg IS NOT NULL     
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)
SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;

/*
Here’s a highlighted list of the **top 10 skills data engineers should have in 2025**:

### 1. **Python**

* Widely used for data manipulation, ETL pipelines, and data analysis.

### 2. **Apache Spark**

* Essential for large-scale data processing (batch and real-time).

### 3. **SQL and NoSQL Databases**

* SQL remains critical for relational databases, while NoSQL is important for unstructured and semi-structured data.

### 4. **Data Warehousing (e.g., Snowflake, Redshift, BigQuery)**

* Key tools for centralized data storage and analytics in cloud-based environments.

### 5. **ETL/ELT Processes**

* Expertise in designing and maintaining data pipelines for efficient data movement and transformation.

### 6. **Cloud Platforms (AWS, Azure, GCP)**

* Proficiency in cloud platforms for scalable data storage and processing.

### 7. **Containerization and Orchestration (Docker, Kubernetes)**

* Ensures scalability and consistency in deploying data applications and workflows.

### 8. **Data Modeling and Schema Design**

* Skills in creating efficient data structures for optimized data storage and retrieval.

### 9. **Data Governance and Security**

* Knowledge of data privacy, security, and compliance regulations (e.g., GDPR).

### 10. **Machine Learning and AI Integration**

* Ability to integrate machine learning models into data pipelines and support data scientists.

### Honorable Mentions:

* **Apache Kafka** (Real-time data streaming)
* **DevOps** practices (Automated deployment and scaling)
* **CI/CD pipelines** (Automated testing and deployment of data pipelines)

These skills will define the data engineering landscape in 2025, emphasizing cloud solutions, real-time processing, and integration with AI/ML technologies.
-- Note: The skills listed are based on industry trends and may vary by specific job requirements.
*/
/* The query above is designed to extract the top-paying Data Engineering jobs and their required skills, providing insights into the skills that are most valuable in the job market.
This information is crucial for job seekers and professionals looking to enhance their skill sets in alignment with market demands.
*/-- Note: Ensure that the `skills_job_dim` and `skills_dim` tables are properly defined in your database schema for this query to work.
-- Ensure that the `skills_job_dim` and `skills_dim` tables are properly defined in your database schema for this query to work.

/* [
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_id": 18,
    "skills": "python"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_id": 18,
    "skills": "spark"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_id": 18,
    "skills": "pandas"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_id": 18,
    "skills": "numpy"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_id": 18,
    "skills": "pyspark"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_id": 18,
    "skills": "hadoop"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_id": 18,
    "skills": "kafka"
  },
  {
    "job_id": 21321,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_id": 18,
    "skills": "kubernetes"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_id": 18,
    "skills": "python"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_id": 18,
    "skills": "spark"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_id": 18,
    "skills": "pandas"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_id": 18,
    "skills": "numpy"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_id": 18,
    "skills": "pyspark"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_id": 18,
    "skills": "hadoop"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_id": 18,
    "skills": "kafka"
  },
  {
    "job_id": 157003,
    "job_title": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_id": 18,
    "skills": "kubernetes"
  },
  {
    "job_id": 270455,
    "job_title": "Data Engineer",
    "salary_year_avg": "300000.0",
    "company_id": 141234,
    "skills": "sql"
  },
  {
    "job_id": 270455,
    "job_title": "Data Engineer",
    "salary_year_avg": "300000.0",
    "company_id": 141234,
    "skills": "python"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "salary_year_avg": "251000.0",
    "company_id": 12572,
    "skills": "spark"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "salary_year_avg": "251000.0",
    "company_id": 12572,
    "skills": "hadoop"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "salary_year_avg": "251000.0",
    "company_id": 12572,
    "skills": "kafka"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "salary_year_avg": "251000.0",
    "company_id": 12572,
    "skills": "tensorflow"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "salary_year_avg": "251000.0",
    "company_id": 12572,
    "skills": "keras"
  },
  {
    "job_id": 230458,
    "job_title": "Director of Engineering - Data Platform",
    "salary_year_avg": "251000.0",
    "company_id": 12572,
    "skills": "pytorch"
  },
  {
    "job_id": 561728,
    "job_title": "Data Engineer",
    "salary_year_avg": "250000.0",
    "company_id": 497713,
    "skills": "python"
  },
  {
    "job_id": 561728,
    "job_title": "Data Engineer",
    "salary_year_avg": "250000.0",
    "company_id": 497713,
    "skills": "scala"
  },
  {
    "job_id": 561728,
    "job_title": "Data Engineer",
    "salary_year_avg": "250000.0",
    "company_id": 497713,
    "skills": "r"
  },
  {
    "job_id": 561728,
    "job_title": "Data Engineer",
    "salary_year_avg": "250000.0",
    "company_id": 497713,
    "skills": "azure"
  },
  {
    "job_id": 595768,
    "job_title": "Principal Data Engineer",
    "salary_year_avg": "250000.0",
    "company_id": 10,
    "skills": "python"
  },
  {
    "job_id": 595768,
    "job_title": "Principal Data Engineer",
    "salary_year_avg": "250000.0",
    "company_id": 10,
    "skills": "scala"
  },
  {
    "job_id": 595768,
    "job_title": "Principal Data Engineer",
    "salary_year_avg": "250000.0",
    "company_id": 10,
    "skills": "databricks"
  },
  {
    "job_id": 595768,
    "job_title": "Principal Data Engineer",
    "salary_year_avg": "250000.0",
    "company_id": 10,
    "skills": "spark"
  },
  {
    "job_id": 543728,
    "job_title": "Staff Data Engineer",
    "salary_year_avg": "250000.0",
    "company_id": 10,
    "skills": "python"
  },
  {
    "job_id": 543728,
    "job_title": "Staff Data Engineer",
    "salary_year_avg": "250000.0",
    "company_id": 10,
    "skills": "scala"
  },
  {
    "job_id": 543728,
    "job_title": "Staff Data Engineer",
    "salary_year_avg": "250000.0",
    "company_id": 10,
    "skills": "databricks"
  },
  {
    "job_id": 543728,
    "job_title": "Staff Data Engineer",
    "salary_year_avg": "250000.0",
    "company_id": 10,
    "skills": "spark"
  },
  {
    "job_id": 151972,
    "job_title": "Principal Data Engineer (Remote)",
    "salary_year_avg": "245000.0",
    "company_id": 36132,
    "skills": "nosql"
  },
  {
    "job_id": 151972,
    "job_title": "Principal Data Engineer (Remote)",
    "salary_year_avg": "245000.0",
    "company_id": 36132,
    "skills": "aws"
  },
  {
    "job_id": 151972,
    "job_title": "Principal Data Engineer (Remote)",
    "salary_year_avg": "245000.0",
    "company_id": 36132,
    "skills": "gcp"
  },
  {
    "job_id": 204320,
    "job_title": "Staff Data Engineer",
    "salary_year_avg": "245000.0",
    "company_id": 17073,
    "skills": "go"
  },
  {
    "job_id": 609418,
    "job_title": "Data Engineering Manager",
    "salary_year_avg": "242000.0",
    "company_id": 21,
    "skills": "sql"
  },
  {
    "job_id": 609418,
    "job_title": "Data Engineering Manager",
    "salary_year_avg": "242000.0",
    "company_id": 21,
    "skills": "python"
  },
  {
    "job_id": 609418,
    "job_title": "Data Engineering Manager",
    "salary_year_avg": "242000.0",
    "company_id": 21,
    "skills": "java"
  },
  {
    "job_id": 609418,
    "job_title": "Data Engineering Manager",
    "salary_year_avg": "242000.0",
    "company_id": 21,
    "skills": "perl"
  }
]
*/

