# 📊 Data Job Analysis Project

## 📝 Introduction
This project explores the landscape of data-related job postings, focusing on roles such as Data Engineer, Data Scientist, and related positions. The goal is to analyze job market trends, identify in-demand skills, and uncover insights about salaries, remote work, and company hiring patterns using real-world job posting data.

SQL queries? Check them out here: [project_sql folder](/project_sql/) 

## 🏁 Background
With the rapid growth of the data industry, understanding the job market is crucial for both job seekers and employers. This project was inspired by the need to answer questions like:  
- 💡 What skills are most in demand for data jobs?  
- 🏢 Which companies are hiring the most?  
- 💰 What are the salary trends for different roles?  
- 🏠 How prevalent are remote opportunities?
The dataset consists of job postings collected from various online sources, containing information about job titles, companies, locations, salaries, required skills, benefits, and more.

## 🛠️ Tools I Used
- 🐘 **PostgreSQL:** For storing, querying, and analyzing the job postings data.
- 💻 **SQL (Structured Query Language):** To perform data cleaning, transformation, and analysis.
- 🖥️ **Visual Studio Code:** As the primary code editor and SQL development environment.
- 🧩 **SQLTools Extension:** For database connections and query execution within VS Code.
- ☁️ **Microsoft OneDrive:** For file storage and collaboration.
- 📄 **CSV Files:** As the format for importing raw data into the database.

## 📈 The Analysis
The analysis was conducted in several steps:
1. 📥 **Data Loading:** Imported multiple CSV files into PostgreSQL tables using the `\copy` command for efficient data ingestion.
2. 🧹 **Data Cleaning:** Ensured data consistency, handled missing values, and standardized formats (e.g., dates, salary fields).
3. 🔍 **Exploratory Analysis:**  
    - Counted job postings by title, company, and location.  
    - Analyzed salary distributions and trends over time.  
    - Examined the prevalence of remote jobs and benefits like health insurance.  
    - Identified the most in-demand skills for data roles.
4. 🧠 **Advanced SQL Techniques:**  
    - Used Common Table Expressions (CTEs) and subqueries for complex aggregations.  
    - Performed time zone adjustments to accurately analyze posting dates.  
    - Joined multiple tables to enrich the analysis with company and skill information.
5. 💡 **Insights Extraction:**  
    - Ranked companies by number of job postings.  
    - Found which skills are both high-paying and in high demand.  
    - Investigated job postings that do not require a college degree.

## 🎓 What I Learned
- 🏆 **SQL Mastery:** Improved my ability to write complex SQL queries, including CTEs, window functions, and advanced joins.
- 📊 **Data Analysis:** Gained experience in extracting actionable insights from large, real-world datasets.
- 🗄️ **Database Management:** Learned best practices for importing, cleaning, and managing data in PostgreSQL.
- 🧩 **Problem Solving:** Developed strategies for handling common data issues, such as permission errors and time zone conversions.
- 🌐 **Industry Trends:** Discovered which skills and job types are most valuable in the current data job market.

## 🏆 Conclusion
This project provided a comprehensive look at the data job market using SQL and PostgreSQL. By analyzing thousands of job postings, I identified key trends in demand, salary, and required skills. The findings can help job seekers focus their learning and job search, and assist employers in understanding the competitive landscape. The project also strengthened my technical and analytical skills, preparing me for future data-driven challenges.
