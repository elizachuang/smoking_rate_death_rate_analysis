# Global Smoking Prevalence & Mortality Impact Analysis
<img width="auto" height="auto" alt="An infographic-style banner with a minimalist aesthetic, split diagonally into two shades of light beige. In the center, a simple illustration shows a single lit cigarette resting at an angle, with a thin wisp of smoke rising from the tip. Above the cigarette, the word SMOKING. is written in large, bold, dark blue serif font. Below the cigarette, the subtitle reads Prevalence & Death Rate followed by smaller text: Uncovering the Highest Mortality Rates, Prevalence Hotspots, and Statistical Red Flags Across Nations. Color Palette: Minimalist, high-contrast cream and dark blue. Imagery: Central focal point of a smoking cigarette.Main Text: SMOKING.Context: Clearly defines the topic as a global statistical report on mortality and prevalence." src="https://github.com/user-attachments/assets/4a05fe85-89bc-46a9-8f1f-705e69a1bbc8" />


## 📌 Research Question
**Which country has the highest smoking prevalence, and which country has the deadliest outcomes for smokers?**

This project explores the global relationship between smoking prevalence and smoking-related mortality using SQL-based analysis.

---

## 📊 Data Sources

All data used in this analysis comes from **Our World in Data**:

- **Smoking-related death rate (per 100,000 people):**  
  https://ourworldindata.org/grapher/death-rate-smoking

- **Share of adults who smoke (%):**  
  https://ourworldindata.org/grapher/share-of-adults-who-smoke?country=USA~BRA~RUS~IND~CHN~European+Union~IDN~OWID_WRL

---

## 🗂️ Datasets Used

Two primary tables were analyzed:

### 1. `smoking_prevalence`
- `country` – Country name  
- `code` – Country code  
- `prevalence_rate` – Percentage of the adult population that smokes  

### 2. `cigarette_death`
- `country` – Country name  
- `code` – Country code  
- `death_rate` – Smoking-related deaths per 100,000 people  

Both datasets are joined using the **country code**.

---

## 🔎 Analysis Overview

### 1. Countries with the Highest Smoking-Related Death Rates
This query identifies which countries experience the highest **smoking-related death rates**.

```
SELECT de.country, de.death_rate
FROM cigarette_death de
WHERE de.death_rate IS NOT NULL
ORDER BY de.death_rate DESC;
```

**Key finding:**
- **Kiribati** has the highest smoking-related death rate at **223.4 deaths per 100,000**
- Other high-ranking countries include **Nauru, Lesotho, Solomon Islands, and Micronesia**

This highlights regions where smoking leads to especially severe health outcomes.

---

### 2. Countries with the Highest Smoking Prevalence
Countries were ranked by **smoking prevalence (% of adults who smoke)**.
```
SELECT sp.country, sp.prevalence_rate
FROM smoking_prevalence sp
WHERE sp.prevalence_rate IS NOT NULL
ORDER BY sp.prevalence_rate DESC;
```
**Key finding:**
- **Nauru** has the highest smoking prevalence at **48.3%**
- Followed by **Myanmar (44.4%)**, **Kiribati (39.7%)**, and **Papua New Guinea (39.6%)**

High smoking prevalence does not always correspond to the highest death rates.

---

## Mortality Impact Ratio

To better understand how deadly smoking is **per smoker**, a new metric was created:
Mortality Impact Ratio = death_rate / prevalence_rate

### Interpretation:
- **Higher ratio** → Smoking is more deadly per smoker  
- **Lower ratio** → Better health outcomes, healthcare access, or younger smoking populations  

---

### 3. Countries Where Smoking Is Most Deadly per Smoker


```
select de.country,
de.death_rate as death_per_100k,
sp.prevalence_rate as prevalence_rate,
round(de.death_rate / sp.prevalence_rate, 2) as Mortality_Impact_Ratio
from  cigarette_death de
left join smoking_prevalence sp
on de.code = sp.code 
where sp.prevalence_rate is not NULL
order by Mortality_Impact_Ratio desc;
```

**Top countries by Mortality Impact Ratio:**

| Country | Mortality Impact Ratio |
|------|----------------------|
| Turkmenistan | **12.13** |
| Zimbabwe | **9.36** |
| Ghana | **8.65** |
| Cambodia | **7.62** |
| Togo | **7.38** |

These countries tend to have **lower smoking prevalence but extremely high mortality**, indicating structural healthcare and public health challenges.

---

## Mortality Impact Classification

Countries were categorized based on their Mortality Impact Ratio:
```
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
```

| Category | Definition |
|-------|-----------|
| **Extremely High** | Ratio > 9 |
| **High** | Ratio > 6 |
| **Moderate** | Ratio between 3 and 6 |
| **Low** | Ratio < 3 |

This classification helps identify where smoking has a disproportionately lethal impact.

---

## Global Benchmark

The **global average Mortality Impact Ratio** is:
World Average = 3.23

### Interpretation:
- **Below 3.23** → Better-than-average health outcomes  
- **Above 3.23** → Worse-than-average outcomes or a legacy smoking burden

```
SELECT ROUND(AVG(de.death_rate / sp.prevalence_rate), 2) as world_mortality_average
from  cigarette_death de
left join smoking_prevalence sp
on de.code = sp.code 
where sp.prevalence_rate is not null;
```

---

## Countries with Better-Than-Average Outcomes

```
SELECT de.country, 
round(de.death_rate / sp.prevalence_rate, 2) as Mortality_Impact_Ratio
from  cigarette_death de
left join smoking_prevalence sp
on de.code = sp.code 
where sp.prevalence_rate is not null
and round(de.death_rate / sp.prevalence_rate, 2)  <3.23
ORDER BY mortality_impact_ratio asc;
```

Countries with mortality impact **below the global average** include:

- **Chile (0.76)**  
- **France (1.10)**  
- **Portugal (1.19)**  
- **Singapore (1.21)**  
- **Switzerland (1.40)**  
- **Japan (1.75)**  
- **Australia (1.98)**  

These countries likely benefit from:
- Strong healthcare systems  
- Effective tobacco regulation  
- Early detection and cessation programs  

---

## 🧠 Key Insights

- High smoking prevalence does **not** always lead to the deadliest outcomes
- Mortality impact highlights hidden health inequities
- Countries with limited healthcare access often experience higher death rates per smoker
- Policy, prevention, and healthcare infrastructure matter as much as smoking behavior

<img width="250" height="auto" alt="A data visualization showing Turkmenistan as a major outlier. The chart compares a low smoking prevalence rate against a smoking-related death rate that is four times the global average, suggesting a statistical anomaly or severe health crisis" src="https://github.com/user-attachments/assets/8e2ad00a-15b2-4448-9f82-c863447bf971" />
<img width="250" height="auto" alt="Kiribati with the highest cigarette-related death rate per 100,000 people." src="https://github.com/user-attachments/assets/5e19dcec-3a31-4124-a9f7-9228f06a102d" />
<img width="250" height="auto" alt="Nauru with the world's highest smoking prevalence rate, affecting nearly half the population." src="https://github.com/user-attachments/assets/8c774bf9-2ba8-47fe-b2ef-44b4cc643b92" />

---

## 🛠️ Tools Used
- SQL (JOINs, aggregations, CASE statements)
- Country-level public health datasets from **Our World in Data**

---

## 📌 Conclusion

Understanding the global burden of smoking requires analyzing both **prevalence** and **mortality**. This project demonstrates how a combined metric can reveal countries where smoking is disproportionately deadly and where public health interventions may be most urgently needed.

---

### 📚 Data Attribution
Data sourced from **Our World in Data**:
- https://ourworldindata.org/grapher/death-rate-smoking  
- https://ourworldindata.org/grapher/share-of-adults-who-smoke

---

## 👤 Contact
- Eliza C. Huang | Data Analyst with a background in UX research and data-driven analysis. Interested in roles within public policy, NGOs, human rights, and social impact organizations.
- Portfolio / Data Visualizations: Instagram – DataDrawers [https://www.instagram.com/datadrawers/]
- LinkedIn: [https://www.linkedin.com/in/chuyunh/]


