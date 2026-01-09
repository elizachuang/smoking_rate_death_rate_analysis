# 🌍 Global Smoking Prevalence & Mortality Impact Analysis
<img width="auto" height="auto" alt="image" src="https://github.com/user-attachments/assets/2b706c27-453f-4129-bc6e-4e15fe2d8ca1" />

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

**Key finding:**
- **Kiribati** has the highest smoking-related death rate at **223.4 deaths per 100,000**
- Other high-ranking countries include **Nauru, Lesotho, Solomon Islands, and Micronesia**

This highlights regions where smoking leads to especially severe health outcomes.

---

### 2. Countries with the Highest Smoking Prevalence
Countries were ranked by **smoking prevalence (% of adults who smoke)**.

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

---

## Countries with Better-Than-Average Outcomes

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


