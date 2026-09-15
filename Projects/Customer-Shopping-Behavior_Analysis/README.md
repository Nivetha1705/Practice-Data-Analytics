\# 🛍️ Customer Shopping Behavior Analysis



An end-to-end \*\*Data Analytics project\*\* analyzing 3,900 customer transactions to uncover purchasing patterns, customer segments, product performance, discount behavior, and subscription trends.



The project follows a complete analytics workflow using \*\*Python, Pandas, MySQL, SQL, and Power BI\*\* — from data cleaning and exploratory analysis to business-question-driven SQL analysis, interactive visualization, and actionable business recommendations.



\---



\## 📌 Project Overview



Retail businesses generate large volumes of customer transaction data, but converting this data into meaningful business insights can be challenging.



This project analyzes customer shopping behavior to understand:



\- Customer spending patterns

\- Product and category performance

\- Customer loyalty and segmentation

\- Subscription behavior

\- Discount dependency

\- Age-group purchasing patterns

\- Shipping preferences

\- Customer review ratings



The objective is to transform raw transactional data into \*\*actionable insights that can support marketing, customer retention, product positioning, and business decision-making.\*\*



\---



\## 🎯 Business Objectives



The analysis focuses on answering the following business questions:



\- Who are the highest-value customers?

\- Which customer groups generate the most revenue?

\- Which products and categories perform best?

\- Which products are highly dependent on discounts?

\- How does subscription status relate to customer value?

\- How are customers distributed across loyalty segments?

\- Which age groups contribute the most revenue?

\- Do shipping preferences relate to customer spending?

\- Which products receive the highest customer ratings?



\---



\## 📊 Dataset Overview



The dataset contains \*\*3,900 customer purchase transactions\*\* with \*\*18 columns\*\* covering customer demographics, purchasing behavior, product information, and transaction details.



| Attribute | Details |

|---|---|

| Records | 3,900 |

| Columns | 18 |

| Domain | Retail / Customer Shopping |

| Data Type | Transactional Customer Data |

| Missing Values | 37 in `Review Rating` |



\### Key Features



\*\*Customer Demographics\*\*

\- Age

\- Gender

\- Location

\- Subscription Status



\*\*Purchase Information\*\*

\- Item Purchased

\- Category

\- Purchase Amount

\- Season

\- Size

\- Color



\*\*Shopping Behavior\*\*

\- Discount Applied

\- Promo Code Used

\- Previous Purchases

\- Frequency of Purchases

\- Review Rating

\- Shipping Type



\---



\## 🧹 Data Cleaning \& Exploratory Data Analysis



Python and Pandas were used to clean, transform, and explore the dataset.



\### Data Preparation



\- Loaded the raw dataset using Pandas.

\- Performed initial data exploration using `df.info()` and `df.describe()`.

\- Identified \*\*37 missing values\*\* in the `Review Rating` column.

\- Imputed missing review ratings using the \*\*median rating of each product category\*\*.

\- Standardized column names using `snake\_case`.

\- Created an `age\_group` feature by grouping customers into:

&#x20; - Young Adult

&#x20; - Adult

&#x20; - Middle-aged

&#x20; - Senior

\- Created a `purchase\_frequency\_days` feature from purchase frequency data.

\- Identified redundancy between `discount\_applied` and `promo\_code\_used`.

\- Removed the redundant `promo\_code\_used` column.

\- Prepared the cleaned dataset for MySQL-based analysis.



📁 \*\*Python Notebook:\*\*  

\[`Customer\_Shopping\_Behavior\_Analysis.ipynb`](Python/Customer\_Shopping\_Behavior\_Analysis.ipynb)



\---



\## 🗄️ MySQL \& SQL Analysis



The cleaned customer data was analyzed using \*\*MySQL\*\* with business-question-driven SQL queries.



The SQL analysis focused on revenue performance, customer behavior, product ratings, discount dependency, customer segmentation, subscription behavior, and age-group performance.



\### Key SQL Findings



| # | Business Question | Key Finding |

|---|---|---|

| 1 | Revenue by Gender | Male customers generated \*\*$157,890\*\* compared with \*\*$75,191\*\* from female customers |

| 2 | High-Spending Discount Users | \*\*839 customers\*\* used discounts while spending above the average purchase amount |

| 3 | Top 5 Products by Rating | Gloves (\*\*3.86\*\*), Sandals (\*\*3.84\*\*), Boots (\*\*3.82\*\*), Hat (\*\*3.80\*\*), and Skirt (\*\*3.78\*\*) |

| 4 | Shipping Type Comparison | Express customers spent \*\*$60.48\*\* on average compared with \*\*$58.46\*\* for Standard |

| 5 | Subscribers vs. Non-Subscribers | Non-subscribers generated \*\*$170,436\*\* in total revenue |

| 6 | Discount-Dependent Products | Hat (\*\*50%\*\*), Sneakers (\*\*49.66%\*\*), and Coat (\*\*49.07%\*\*) had the highest discount dependency |

| 7 | Customer Segmentation | \*\*3,116 Loyal\*\*, \*\*701 Returning\*\*, and \*\*83 New\*\* customers |

| 8 | Top Products by Category | Jewelry, Blouse, Sandals, and Jacket were among the leading products in their categories |

| 9 | Repeat Buyers \& Subscriptions | Repeat non-subscribers significantly outnumbered repeat subscribers (\*\*2,518 vs. 958\*\*) |

| 10 | Revenue by Age Group | Young Adults generated the highest revenue contribution at \*\*$62,143\*\* |



📁 \*\*SQL Queries:\*\*  

\[`customer\_shopping\_analysis.sql`](SQL/customer\_shopping\_analysis.sql)



\---



\## 📈 Power BI Dashboard



An interactive \*\*Customer Behavior Dashboard\*\* was developed in Power BI to visualize customer and sales performance.



\### Dashboard KPIs



\- 👥 \*\*Customers:\*\* 3.9K

\- 💰 \*\*Average Purchase Amount:\*\* $59.76

\- ⭐ \*\*Average Review Rating:\*\* 3.75

\- 🔔 \*\*Subscribers:\*\* \~27%

\- 🛍️ \*\*Non-Subscribers:\*\* \~73%



\### Dashboard Analysis



The dashboard provides visual analysis of:



\- Revenue and sales by product category

\- Revenue by age group

\- Subscription vs. non-subscription customers

\- Customer purchasing behavior

\- Gender-based revenue performance

\- Shipping preferences

\- Product and category performance



\### Interactive Filters



The dashboard allows users to dynamically explore the data using:



\- Gender

\- Category

\- Shipping Type

\- Subscription Status



📁 \*\*Power BI Dashboard:\*\*  

\[`Customer\_Behavior\_Dashboard.pbix`](Power\_BI/Customer\_Behavior\_Dashboard.pbix)



\---



\## 💡 Key Business Insights



\### 1. Male Customers Drive Higher Revenue



Male customers generated \*\*$157,890\*\*, compared with \*\*$75,191\*\* from female customers.



This indicates a significant difference in revenue contribution and highlights an opportunity to further understand gender-based purchasing behavior.



\### 2. The Customer Base Shows Strong Loyalty



The customer segmentation analysis identified:



\- \*\*3,116 Loyal customers\*\*

\- \*\*701 Returning customers\*\*

\- \*\*83 New customers\*\*



The large loyal segment indicates strong repeat-purchase behavior, while the returning segment provides an opportunity for further customer retention initiatives.



\### 3. Non-Subscribers Generate the Majority of Revenue



Non-subscribers generated \*\*$170,436\*\* in total revenue.



Despite the subscription program, the majority of revenue is coming from customers who are not subscribed, suggesting an opportunity to improve subscription adoption among valuable customers.



\### 4. Certain Products Are Highly Discount Dependent



The products with the highest discount dependency include:



\- \*\*Hat — 50%\*\*

\- \*\*Sneakers — 49.66%\*\*

\- \*\*Coat — 49.07%\*\*



These products may require a review of their discount strategy to balance sales volume with profitability.



\### 5. Young Adults Are the Highest Revenue-Contributing Age Group



Young Adults generated \*\*$62,143\*\* in revenue, making them the highest-contributing age group.



However, revenue is distributed across the different age groups, indicating that the business has a relatively broad customer base.



\### 6. Express Shipping Customers Spend Slightly More



Customers using Express shipping have an average purchase amount of \*\*$60.48\*\*, compared with \*\*$58.46\*\* for Standard shipping.



This suggests a potential relationship between premium shipping preferences and slightly higher customer spending.



\### 7. Highly Rated Products Provide Marketing Opportunities



Products such as \*\*Gloves, Sandals, Boots, Hat, and Skirt\*\* achieved the highest average ratings.



These products can be considered for greater visibility in promotional campaigns and product recommendations.



\---



\## 🎯 Business Recommendations



\### 1. Increase Subscription Adoption



Since non-subscribers contribute the majority of revenue, the business can focus on converting high-value non-subscribers through:



\- Exclusive member benefits

\- Personalized offers

\- Loyalty rewards

\- Early access to products

\- Subscription-specific discounts



\### 2. Strengthen Customer Loyalty



The large loyal customer base provides an opportunity to build stronger retention strategies.



Returning customers can be targeted with personalized recommendations and loyalty rewards to encourage more frequent purchases.



\### 3. Optimize Discount Strategies



Discount-heavy products such as Hats, Sneakers, and Coats should be monitored carefully.



The business can evaluate whether discounts are driving incremental sales or unnecessarily reducing margins.



\### 4. Promote High-Performing Products



Highly rated and strong-performing products such as Gloves, Jewelry, Blouse, Jacket, and other leading products can receive greater visibility through:



\- Homepage promotions

\- Product recommendations

\- Marketing campaigns

\- Featured product sections



\### 5. Target High-Revenue Customer Segments



Young Adults contribute the highest revenue and can be targeted with relevant campaigns while continuing to serve other age groups based on their purchasing behavior.



\### 6. Leverage Customer and Shipping Preferences



Express-shipping users show slightly higher average spending.



The business could investigate whether premium delivery options can be combined with higher-value product recommendations or targeted offers.



\---



\## 🛠️ Technologies Used



| Category | Tools |

|---|---|

| Programming | Python |

| Data Manipulation | Pandas |

| Data Analysis | Python, Pandas |

| Database | MySQL |

| Querying | SQL |

| Data Visualization | Power BI |

| Development Environment | Jupyter Notebook |

| Version Control | Git, GitHub |

| Documentation | Markdown, PDF, PowerPoint |



\---



\## 📁 Project Structure



```text

Customer-Shopping-Behavior\_Analysis/

│

├── Dataset/

│   └── customer\_shopping\_behavior.csv

│

├── Python/

│   └── Customer\_Shopping\_Behavior\_Analysis.ipynb

│

├── SQL/

│   └── customer\_shopping\_analysis.sql

│

├── Power\_BI/

│   └── Customer\_Behavior\_Dashboard.pbix

│

├── Report/

│   └── Customer Shopping Behavior Analysis (1).pdf

│

├── Presentation/

│   └── Customer-Shopping-Behavior-Analysis.pptx

│

└── README.md

