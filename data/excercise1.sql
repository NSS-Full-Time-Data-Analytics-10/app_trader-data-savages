-- How many counties are represented in ECD table
SELECT count(county)
FROM ecd;

SELECT COUNT(company)
FROM ecd;
--How many companies did not get ANY Economic Development grants (ed) for any of their projects?
SELECT COUNT(company)
FROM ecd
WHERE ed IS NULL;

--What is the total capital_investment, in millions, when there was a grant received from the fjtap? Call the column fjtap_cap_invest_mil.

SELECT  company,SUM(grants_total)as fjtap_cap_invest_mil
FROM ecd
WHERE fjtap IS NOT NULL
GROUP BY company;
--What is the average number of new jobs for each county_tier?

SELECT county_tier, AVG(new_jobs) AS avg_new
FROM ecd
group by county_tier
ORDER BY avg_new desc;
--How many companies are llcs
SELECT count(distinct company)
FROM ecd
where company ilike '%llc%'