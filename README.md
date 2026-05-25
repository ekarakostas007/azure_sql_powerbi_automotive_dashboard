# Azure SQL + Power BI Automotive Pricing Dashboard

Interactive business intelligence dashboard built using Azure SQL Database and Power BI to analyze automotive part pricing and customer-level trends.

This project demonstrates an end-to-end analytics workflow including SQL database creation, cloud-based data storage in Azure SQL, query development, Power BI dashboard creation, and DAX-based data transformation.

---

## Overview

Developed a sanitized automotive pricing database and hosted it in Azure SQL to simulate a real-world customer pricing environment.

Created relational tables for customers and automotive piston ring part information, then built SQL queries and views to analyze customer pricing trends, part distribution, and product-level reporting.

Connected Azure SQL to Power BI and designed an interactive dashboard with custom formatting and DAX transformations to create business-friendly reporting visuals.

---

## Dashboard Preview

![Power BI Dashboard](power_bi_dashboard.pdf)

---

## Dashboard Features

### Pricing Analytics
- Average 2026 pricing by customer
- Customer-level price comparisons
- Currency formatting and dashboard styling

### Customer Distribution Analysis
- Donut chart visualization showing part distribution by customer
- Customer share percentage calculations

### Detailed Product Reporting
- Customer-level part detail reporting
- Customer part number and company part number tracking
- Product model and pricing visibility

### Power BI Customization
- Interactive dashboard design
- Sorting and filtering
- Customized formatting and layout
- User-friendly reporting presentation

---

## SQL Database Design

### Tables Created

**customers**
- customer_id
- customer_name

**piston_rings**
- part_id
- customer_id
- customer_part_number
- company_part_number
- model
- description
- price_2026

---

## SQL Operations Demonstrated

### Database Setup
- CREATE TABLE
- INSERT INTO
- CREATE VIEW
- DROP TABLE
- DROP VIEW

### Querying & Filtering
- SELECT
- WHERE
- LIKE
- ORDER BY

### Joins & Relationships
- INNER JOIN between customer and part tables

### Aggregations
- COUNT()
- AVG()
- ROUND()
- GROUP BY

### Reporting Queries

Examples include:

- Customer-specific filtering
- Average price calculations by customer
- Total part counts by customer
- Product price ranking
- Price threshold filtering

---

## Azure SQL Integration

The SQL database was deployed and hosted in Azure SQL Database to simulate a cloud-based production environment.

Azure functionality demonstrated:

- Cloud database deployment
- SQL query execution
- Database connectivity
- Integration with Power BI

---

## Power BI Dashboard Development

Power BI was connected directly to the Azure SQL database to create reporting visuals including:

### Visualizations Created

**Bar Chart**
- Average 2026 Price by Customer

**Donut Chart**
- Parts Distribution by Customer

**Table Report**
- Customer-level product details and pricing

---

## DAX Data Transformation

A Power BI calculated column was created using DAX to transform database-style values into business-friendly display labels.

```DAX
Customer Display =
SWITCH(
    [customer_name],
    "A_Customer", "Customer A",
    "B_Customer", "Customer B",
    "C_Customer", "Customer C",
    [customer_name]
)
```

Purpose:

- Improved dashboard readability
- Converted database values into user-friendly labels
- Preserved source data integrity
- Demonstrated DAX transformation logic

---

## Technologies Used

- SQL
- Azure SQL Database
- Power BI
- DAX
- Data Visualization
- Relational Database Design
- Business Intelligence Reporting
- ETL Concepts

---

## Repository Contents

```text
azure_sql_powerbi_dashboard/
│
├── automotive_pricing.sql
├── Automotive_Pricing_Dashboard.pbix
├── dashboard_screenshot.png
├── README.md
```

---

## Key Skills Demonstrated

- SQL query development
- Relational database modeling
- Azure cloud database deployment
- Power BI dashboard development
- DAX calculations
- Data transformation
- Data visualization
- Business reporting

---

## Author

Developed by Eva Karakostas

M.S. Data Science | Operations Supervisor | Data Analytics & Process Automation
