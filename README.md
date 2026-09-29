# 🛒 Amazon Sales Analysis

An end-to-end sales analysis project using **Excel, SQL Server, and Power BI** to examine revenue, orders, products, fulfilment, geography, customer segments, and order disruptions.

## 📌 Project Overview

This project analyzes an Amazon sales dataset using three complementary tools:

- **Excel** for data preparation and cleaning
- **SQL Server** for structured business analysis
- **Power BI** for interactive dashboarding and visualization

The analysis is organized around executive KPIs, monthly sales trends, category performance, fulfilment, geography, B2B/B2C segmentation, transaction tiers, SKU ranking, order disruptions, and high-quantity orders.

## 🎯 Business Objectives

- Monitor overall revenue, order volume, units sold, and average order value
- Understand monthly revenue and order trends
- Compare product categories by sales volume and revenue
- Evaluate fulfilment channels and cancellation activity
- Identify leading states by revenue and order count
- Compare B2B and B2C customer segments
- Segment transactions into spending tiers
- Identify the top-performing SKUs within each category
- Audit disrupted orders and associated revenue
- Identify unusually high-quantity orders

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| Microsoft Excel | Data cleaning and preparation |
| SQL Server | Analytical querying and business analysis |
| Power BI | Data modeling, DAX, KPIs, interactive dashboards |

### SQL techniques used

`SUM` · `COUNT` · `AVG` · `GROUP BY` · `CASE` · `TOP` · `ROUND` · `CAST` · subqueries · CTEs · `DENSE_RANK()` · `PARTITION BY` · conditional aggregation

## 📊 Dashboard Snapshot

### Executive Overview

![Amazon Sales Overview](powerbi/images/amazon-overview.png)

The dashboard displays the following headline KPIs:

- **Total Revenue:** ₹78.58M
- **Total Orders:** 120K
- **Average Order Value:** ₹652.87
- **Cancellation Rate:** 14.28%

The overview also examines category volume, revenue over time, fulfilment contribution, and state-level revenue.

### Product & Fulfilment Analysis

![Amazon Product and Fulfilment Dashboard](powerbi/images/amazon-product-fulfillment.png)

This view includes order status, units sold by size, B2B segmentation, ship-state distribution, and SKU-level performance.

## 🔍 SQL Analysis

The SQL analysis contains 10 business-focused sections:

1. **Executive Overview (KPI Summary)** — revenue, distinct orders, items sold, and average order value.
2. **Month-over-Month (MoM) Revenue Growth Rate** — monthly order and revenue totals by year and month.
3. **Product Category Market Share & Performance** — orders, quantity sold, revenue, and revenue market share by category.
4. **Fulfillment Channel Analysis (FBA vs. Merchant Easy Ship)** — order volume, cancelled orders, cancellation rate, and revenue by fulfilment channel.
5. **Geographical Sales Deep-Dive (Top 10 States)** — state-level orders, revenue, and average spend per order.
6. **B2B Corporate vs. B2C Consumer Segmentation** — orders, units, revenue, and average price per unit by customer segment.
7. **Identifying High-Value Transaction Tiers** — transaction classification into premium, core mid-spend, and budget tiers.
8. **Top 5 SKUs per Category Ranker** — category-level SKU ranking using `DENSE_RANK()`.
9. **Return & Order Disruption Audit** — impacted orders and trapped revenue for specified disruption statuses.
10. **High-Velocity Order Trailing Check** — identifies orders with quantity greater than three times the overall average quantity.

## 📈 Selected Dataset Metrics

Based on the cleaned workbook used for the analysis:

- **128,974 rows** in the cleaned sheet
- **120,377 distinct orders**
- **116,645 units sold**
- **₹78.59M total amount** in the cleaned workbook
- **14.28% cancelled distinct-order rate**

The Power BI dashboard rounds/displays its headline figures as **₹78.58M revenue, 120K orders, ₹652.87 AOV, and 14.28% cancellation rate**.

## 💡 Analysis Areas

### Category Performance

The largest categories by units sold in the cleaned data are **Set**, **kurta**, and **Western Dress**.

### Fulfilment

The cleaned data contains two fulfilment groups: **Amazon** and **Merchant**. The dashboard compares their revenue contribution and order/cancellation activity.

### Geography

The analysis ranks states by revenue and order count, with **Maharashtra, Karnataka, Telangana, Uttar Pradesh, and Tamil Nadu** among the highest-revenue states in the cleaned workbook.

### Customer Segmentation

The SQL analysis separates transactions into **Corporate / B2B** and **Retail / B2C** segments using the `B2B` field.

## 📁 Repository Structure

```text
amazon-sales-analysis/
│
├── README.md
├── sql/
│   └── amazon_sales_analysis.sql
├── powerbi/
│   └── images/
│       ├── amazon-overview.png
│       └── amazon-product-fulfillment.png
└── images/
    └── amazon-data-preview.png
```

## 🚀 Skills Demonstrated

- Data cleaning and preparation
- Exploratory and business-oriented data analysis
- SQL aggregation and segmentation
- CTEs and subqueries
- Window functions and ranking
- KPI development
- Power BI dashboard development
- Data visualization
- Business question framing
- Communicating analytical findings

## ⚠️ Data Note

The repository is intended to demonstrate the analysis workflow and portfolio work. The provided project files do not document the original dataset's source or redistribution terms, so the full raw workbook is not included here by default.

## 👩‍💻 Author

**Husan Fatma**  
Entry-Level Data Analyst | Excel • SQL • Power BI • Python

[LinkedIn](https://www.linkedin.com/in/husan-fatma/)
