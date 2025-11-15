# 💰 Profitability by Product and Sales Channel Analysis  
*SQL + Tableau Project (AdventureWorksDW2022)*  

---

## 🧩 Project Overview  

This project analyzes **product-level profitability** and **sales performance** across multiple **regions** and **sales channels** (Internet vs. Reseller) using the **AdventureWorksDW2022** data warehouse.  

The aim is to identify which **products, categories, and regions** generate the highest revenue and profit, and where margins can be improved to optimize business performance.  

It demonstrates advanced **SQL data modeling** and **interactive Tableau dashboarding** for clear business storytelling.

---

## 🎯 Business Question  

> Which products, categories, and sales channels are the most profitable,  
> and where is the business losing margin?

---
## Tools Used :
> T-SQL and Tablueau
## 🧮 SQL Data Preparation Summary  

All data was extracted and transformed in **SQL Server** from the AdventureWorksDW2022 database.  
The dataset was created by combining Internet and Reseller sales tables to produce a unified profitability model.

### 🧱 **SQL Techniques Used**

- **CTE (Common Table Expression):**  
  Used to temporarily store merged Internet and Reseller sales data into a logical view called `Sales_Table`.

- **UNION:**  
  Combined both datasets (Internet and Reseller sales) into one unified table while automatically removing duplicates.  
  ```sql
  SELECT ..., 'Internet' AS SalesChannel FROM FactInternetSales  
  UNION  
  SELECT ..., 'Reseller' AS SalesChannel FROM FactResellerSales


### 🧩 **JOINS**
Integrated supporting dimension tables —  
`DimProduct`, `DimProductSubcategory`, `DimProductCategory`, and `DimSalesTerritory` —  
to enrich the dataset with **product hierarchy**, **region**, and **category** details.

### 📊 **AGGREGATION FUNCTIONS**
Used SQL aggregate functions to calculate the key financial performance metrics:
- `SUM(SalesAmount)` → **Total Revenue**  
- `SUM(SalesAmount - TotalProductCost)` → **Total Profit**

### 🧱 **ALIASING + GROUPING**
Grouped the results by **Region**, **Category**, **Product**, and **SalesChannel**  
to provide profitability insights at multiple business hierarchy levels.

### 📈 **ORDER BY**
Sorted data by **Revenue (DESC)** to highlight the **top-performing products and regions**.

---

## 📊 Tableau Visualization Overview

The cleaned and aggregated dataset was imported into **Tableau Desktop** to create an interactive dashboard titled:  
### 🖥️ *“Profitability by Product and Region”*

---

## 🧾 Dashboard Elements

### 💼 **KPI Cards**
- **Total Revenue:** `$109.81M`  
- **Average Profit Margin:** `36.18%`  
- **Total Profit:** `$12.55M`

---

### 🌍 **Regional Profitability (Treemap)**
Displays profit contribution across **regions** and **product categories**.  
**Insight:** *Bikes* dominate profit share, especially in **Northwest**, **United Kingdom**, and **Australia** regions.

---

### 🥧 **Sales Channel Distribution (Pie Chart)**
Compares profitability between **Internet** and **Reseller** channels.  
**Insight:** *Internet sales* are the major driver of total profit.

---

### 📈 **Average Profit Margin Trend by Quarter (Combo Chart)**
Shows quarterly fluctuations in **profit margin** during 2014.  
**Insight:** Profit margin peaked in **Q3 2014**, indicating a possible **seasonal pattern** or **campaign impact**.

---

### 💵 **Top 10 Products by Profit (Bar Chart)**
Highlights products generating the **highest profit**.  
**Insight:** The *Mountain-200* series leads consistently in profitability.

---

### 💰 **Top 15 Products by Revenue (Bar Chart)**
Displays the **highest revenue-generating products**.  
**Insight:** High-revenue and high-profit products overlap, indicating a **healthy pricing and cost strategy**.

---

### 🎚 **Interactive Filters**
Added filters for:
- **Year of Date**  
- **Region**  
- **Sales Channel (Internet / Reseller)**  

These slicers allow interactive exploration of profitability patterns across different channels, products, and geographies.

---

## 💡 Key Insights

- **Total Revenue:** `$109.81M` with an **Average Profit Margin of 36.18%**  
- **Internet Channel** outperformed **Reseller Channel** in both **revenue** and **profit**  
- **Bikes** category generated the **highest profit share**, especially in **Northwest** and **UK**  
- **Q3 2014** saw the **peak profit margin**, suggesting **seasonal demand influence**  
- **Top 10 Products** accounted for over **60% of total profits**, showing a **concentrated profit base**  
- **Germany** and **France** maintained stable revenue but thinner margins — indicating **pricing optimization opportunities**

---

## Summary
This project demonstrates end-to-end analytics — combining SQL data engineering with Tableau data visualization.
It showcases how data from multiple sources can be merged, analyzed, and transformed into insights that drive
profitability-focused business strategy.

💼 By leveraging SQL and Tableau together, I built a complete profitability intelligence solution to identify
top-performing channels, regions, and products.
