select * from `dias-de-codigo-alura.salaries_datascience_domain.salaries_datascience`;

-- DUPLICATED ROWS
SELECT COUNT(*) AS duplicated_rows
FROM 
(
  SELECT cod_id, work_year, experience_level, employment_type, job_title, salary, salary_currency, salary_in_usd, employee_residence, remote_ratio, company_location, company_size,
  COUNT(*) as records
  FROM `dias-de-codigo-alura.salaries_datascience_domain.salaries_datascience`
  group by 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12

) a
WHERE records > 1;

-- NULL VALUES: no null values

-- Windown Functions: SUM salaries of entry level (EN) workers

SELECT cod_id, experience_level, job_title, salary,
SUM(salary) OVER (PARTITION BY experience_level ORDER BY cod_id) AS sum_total_salaries
FROM `dias-de-codigo-alura.salaries_datascience_domain.salaries_datascience`
WHERE experience_level = 'EN';

-- NTILE: classify the salaries in 10 bins.

SELECT cod_id, experience_level, salary,
NTILE(10) OVER (ORDER BY salary) as ntiles
FROM `dias-de-codigo-alura.salaries_datascience_domain.salaries_datascience`
ORDER BY 4