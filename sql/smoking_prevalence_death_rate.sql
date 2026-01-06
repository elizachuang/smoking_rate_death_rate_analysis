-- Which country has highest death_rate?
SELECT de.country, de.death_rate
FROM cigarette_death de
where de.death_rate is not null
order by de.death_rate DESC;

-- Which country has highest prevalence_rate?
select sp.country, sp.prevalence_rate
from smoking_prevalence sp
where sp.prevalence_rate is not null
order by sp.prevalence_rate desc;


--- Joining two tables and calculate the ratio to display how many deaths per percentage point of smoking?

select de.country,
de.death_rate as death_per_100k,
sp.prevalence_rate as prevalence_rate,
round(de.death_rate / sp.prevalence_rate, 2) as Mortality_Impact_Ratio
from  cigarette_death de
left join smoking_prevalence sp
on de.code = sp.code 
where sp.prevalence_rate is not NULL
order by Mortality_Impact_Ratio desc;

--- Add label to categorized the countries by mortality impact

select de.country,
de.death_rate as death_per_100k,
sp.prevalence_rate as prevalence_rate,
round(de.death_rate / sp.prevalence_rate, 2) as Mortality_Impact_Ratio,
case 
	when (de.death_rate / sp.prevalence_rate) > 9 then 'Extremly high'
	when (de.death_rate / sp.prevalence_rate) > 6 then 'High'
	when (de.death_rate / sp.prevalence_rate) between 3 and 6 then 'Moderate'
	else 'Low' end as deadly_impact
from  cigarette_death de
left join smoking_prevalence sp
on de.code = sp.code 
where sp.prevalence_rate is not NULL
order by Mortality_Impact_Ratio desc;

--- See outliers by calcualate the average of all countries
SELECT ROUND(AVG(de.death_rate / sp.prevalence_rate), 2) as world_mortality_average
from  cigarette_death de
left join smoking_prevalence sp
on de.code = sp.code 
where sp.prevalence_rate is not null;

--- Result world_mortality_average = 3.23, 
--- Which means countries below 3.23: Better than average health outcomes or a "young" smoking population.
--- Countries above 3.23: Worse than average health outcomes or a "legacy" smoking burden.

--- Which country's mortality impact is better than average? 
SELECT de.country, 
round(de.death_rate / sp.prevalence_rate, 2) as Mortality_Impact_Ratio
from  cigarette_death de
left join smoking_prevalence sp
on de.code = sp.code 
where sp.prevalence_rate is not null
and round(de.death_rate / sp.prevalence_rate, 2)  <3.23
ORDER BY mortality_impact_ratio asc;
