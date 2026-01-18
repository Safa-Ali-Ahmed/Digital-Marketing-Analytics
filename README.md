# 📊 Digital Marketing Analytics Project

## 📝 Overview

This project analyzes digital marketing performance to solve real
business challenges such as: - Low customer engagement
- Declining conversion rates
- High marketing costs with low ROI
- Limited analysis of customer reviews

The objective is to provide **data-driven insights** that improve
conversion rate, customer engagement, and overall marketing
effectiveness.

------------------------------------------------------------------------

## 🎯 Business Objectives

-   Analyze the marketing funnel and identify drop-off points
-   Improve conversion rate and engagement metrics
-   Extract insights from customer reviews using sentiment analysis
-   Support decision-makers with clear KPIs and dashboards

------------------------------------------------------------------------

## 🛠 Tech Stack

-   **SQL** -- Data cleaning and transformation
-   **Python (NLTK)** -- Sentiment analysis
-   **Power BI** -- Data modeling, DAX, and visualization

------------------------------------------------------------------------

## 🗄 Data Cleaning & Transformation (SQL)

-   Categorized products into **three main categories**
-   Merged customer data with **geography** tables
-   Categorized cities and countries based on business needs
-   Cleaned customer review text (removed extra spaces)
-   Split engagement data into separate **views** and **clicks**
    columns
-   Standardized date formats (DD-MM-YYYY)
-   Removed duplicate records from customer journey data
-   Handled missing values by replacing nulls with averages
-   Standardized journey stage values (uppercase)

------------------------------------------------------------------------

## 🧠 Sentiment Analysis (Python)

-   Used **NLTK** for customer sentiment analysis
-   Built reusable functions to:
    -   Connect to the database
    -   Load data into Pandas DataFrames
    -   Generate sentiment scores from review text
    -   Categorize sentiment (Positive / Neutral / Negative)
-   Conducted comparative analysis:
    -   With customer reviews
    -   Without customer reviews
    -   To evaluate the impact of sentiment on engagement and conversion

------------------------------------------------------------------------

## 📐 Data Modeling (Power BI)

-   Implemented a **Galaxy Schema**
-   Model includes:
    -   3 Fact Tables
    -   Multiple Dimension Tables
    -   A Calendar Table
-   Created **DAX Measures** for key KPIs:
    -   Conversion Rate
    -   Click-Through Rate (CTR)
    -   Click-to-Purchase Rate
    -   Total Views, Likes, and Clicks
    -   Month-over-Month (MoM)
    -   Year-over-Year (YoY)

------------------------------------------------------------------------

## 📊 Dashboard Pages

1.  **Overview Dashboard** -- High-level KPIs for managers
2.  **Conversion Rate Analysis** -- Funnel analysis (Views → Clicks →
    Purchases)
3.  **Customer Reviews Analysis** -- Sentiment insights
4.  **Customer Behavior Analysis** -- Customer journey & engagement
5.  **Social Media Performance** -- Channel comparison

------------------------------------------------------------------------

## 📈 Key Insights

-   Clear visibility into customer behavior and engagement patterns
-   Identified conversion bottlenecks across marketing channels
-   Measurable impact of customer sentiment on conversion and engagement

------------------------------------------------------------------------

## 🚀 Future Improvements

-   Predictive modeling for conversion probability
-   Advanced customer segmentation
-   Real-time dashboard integration
