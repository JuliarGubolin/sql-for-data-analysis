# SQL INTERMEDIATE/ADVACED PRACTICING

This repository has the aim to present pratical queries and graphics I did/do while I am studying. The SQL content I present here was learned by **"*SQL for Data Analysis*, written by Cathy Tanimura (O'Reilly). Copyright 2021 Cathy Tanimura, 978-1-492-08878-3".**

The topics are based by each chapters's content.

I used BigQuery to practice and datasets I got from **Kaggle** and from **basededados** (a Brazilian team that provides clean databases to apply analysis for free).


## CHAPTER 1 AND CHAPTER 2: INTRODUCTION AND PREPARING DATA FOR ANALYSIS

To practice the examples of this chapter, I downloaded a dataset from Kaggle, which has information about job salaries in Data Science domain. You can check [here](https://www.kaggle.com/datasets/ruchi798/data-science-job-salaries/discussion/344701). The author is **Ruchi Bhatia** and this dataset has data from two years ago. 

The content I am going to practice is: bining and window functions. [Link](https://console.cloud.google.com/bigquery?ws=!1m4!1m3!3m2!1sdias-de-codigo-alura!2ssalaries_datascience_domain).

Before starts the analysis, I searched for duplicates and null values. I found out there where some dupplicate rows (53 rows). So, I deleted this rows.

- **FIND DUPLICATES:** This query returns a integer number which represents how many duplicated rows are in the dataset. After I deleted all duplicated rows, the result shown was 0.

~~~~
SELECT COUNT(*) AS duplicated_rows
FROM 
(
  SELECT cod_id, work_year, experience_level, employment_type, 
  job_title, salary, salary_currency, salary_in_usd, employee_residence,
  remote_ratio, company_location, company_size,
  COUNT(*) as records
  FROM `dias-de-codigo-alura.salaries_datascience_domain.salaries_datascience`
  GROUP BY 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
) a
WHERE records > 1;
~~~~

There where any null values and the column types were pretty clean

