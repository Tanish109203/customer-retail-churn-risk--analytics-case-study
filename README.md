# Customer Analytics & Churn Risk Analysis  
### End-to-End Business Analytics Case Study

This repository contains an end-to-end customer analytics project designed to demonstrate practical business analysis skills using **Excel, SQL, Python, and Power BI**.

The project focuses on understanding customer behavior, identifying high-value customers, assessing churn risk, and translating analytical insights into business-ready dashboards.

---

##  Business Problem

The business operates in a high-volume retail environment with thousands of customers and transactions.  
Key challenges included:

- Limited visibility into customer value
- No clear customer segmentation strategy
- Difficulty identifying customers at risk of churn
- Lack of decision-ready insights for stakeholders

---

##  Project Objectives

- Analyze customer purchasing behavior using transactional data
- Segment customers using RFM (Recency, Frequency, Monetary) analysis
- Estimate customer lifetime value (CLV)
- Identify churn-risk customers and quantify value at risk
- Build an executive-friendly dashboard for decision-making

---

##  Tools & Technologies Used

| Tool | Purpose |
|----|----|
| Excel | Data cleaning, validation, and feature preparation |
| SQL (MySQL) | Metric validation and structured analysis |
| Python | Advanced analytics (RFM, CLV, churn logic) |
| Power BI | Interactive dashboards and business storytelling |

---

##  Dataset Overview

- Source: Online retail transactional dataset
- Records: 1M+ transaction-level rows
- Key fields:
  - Customer ID
  - Invoice & Invoice Date
  - Quantity & Price
  - Revenue
  - Transaction Type

---

##  Project Phases

### Phase 1: Data Preparation (Excel)
- Cleaned raw transactional data
- Standardized date formats and derived time-based features
- Calculated revenue at transaction level
- Validated data quality before deeper analysis

### Phase 2: Data Validation (SQL)
- Loaded cleaned data into MySQL
- Revalidated revenue, order counts, and customer metrics
- Ensured data integrity and consistency across tools

### Phase 3: Advanced Analytics (Python)
- Performed RFM analysis for customer segmentation
- Assigned RFM scores and customer segments
- Estimated Customer Lifetime Value (CLV)
- Identified churn-risk customers based on inactivity
- Exported analytics-ready datasets for visualization

### Phase 4: Business Storytelling (Power BI)
- Built a structured dashboard with three focused views:
  - Executive Overview
  - Customer Segmentation (RFM)
  - Churn & Risk Analysis
- Designed dashboards to prioritize clarity over clutter
- Enabled stakeholder-driven insights and actionability

---

##  Key Insights

- A small percentage of customers contribute a significant share of revenue
- High-value customers show distinct purchase behavior
- Churn risk increases sharply with prolonged inactivity
- Not all frequent customers are high value — CLV provides critical context

---

##  Business Recommendations

- Implement targeted retention campaigns for high-CLV at-risk customers
- Reward Champions through loyalty programs
- Re-engage dormant customers before churn becomes permanent
- Shift from mass marketing to segment-based strategies

---
