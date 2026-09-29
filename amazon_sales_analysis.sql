Use Amazon_Sales 

Select * from [Amazon Sales ]

--1. The Executive Overview (KPI Summary)

SELECT 
    SUM(Amount) AS Total_Revenue,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Qty) AS Total_Items_Sold,
    AVG(Amount) AS Average_Order_Value
FROM [Amazon Sales ]

--2. Month-over-Month (MoM) Revenue Growth Rate

SELECT 
    YEAR(Date) AS Sales_Year,
    MONTH(Date) AS Sales_Month,
    COUNT(Order_ID) AS Total_Orders,
    SUM(Amount) AS Total_Revenue
FROM [Amazon Sales ]
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY Sales_Year, Sales_Month

--3. Product Category Market Share & Performance

SELECT 
    Category,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Qty) AS Total_Qty_Sold,
    SUM(Amount) AS Total_Revenue,
    ROUND((SUM(Amount) / (SELECT SUM(Amount) 
    FROM [Amazon Sales ]) * 100), 2) AS Revenue_Market_Share_Percent
FROM [Amazon Sales ]
GROUP BY Category
ORDER BY Total_Revenue DESC

--4. Fulfillment Channel Analysis (FBA vs. Merchant Easy Ship)

SELECT 
    Fulfilment,
    COUNT(Order_ID) AS Total_Orders,
    SUM(CASE 
    WHEN Status = 'Cancelled' 
    THEN 1 
    ELSE 0 
    END) AS Cancelled_Orders,
    ROUND(CAST
    (SUM(CASE WHEN Status = 'Cancelled' 
    THEN 1 
    ELSE 0 
    END) AS FLOAT) 
          / COUNT(Order_ID) * 100, 2) AS Cancellation_Rate_Percent,
    SUM(Amount) AS Total_Revenue
FROM [Amazon Sales ]
GROUP BY Fulfilment

--5. Geographical Sales Deep-Dive (Top 10 States)

SELECT TOP 10 
    UPPER(ship_state) AS Cleaned_State,
    COUNT(DISTINCT Order_ID) AS Order_Count,
    SUM(Amount) AS Total_Revenue,
    ROUND(AVG(Amount), 2) AS Avg_Spend_Per_Order
FROM [Amazon Sales ]
WHERE ship_state IS NOT NULL
GROUP BY UPPER(ship_state)
ORDER BY Total_Revenue DESC

--6. B2B Corporate vs. B2C Consumer Segmentation

SELECT 
    CASE 
    WHEN B2B = 1 
    THEN 'Corporate / B2B' 
    ELSE 'Retail / B2C' 
    END AS Customer_Segment,
    COUNT(DISTINCT Order_ID) AS Total_Orders,
    SUM(Qty) AS Total_Units,
    SUM(Amount) AS Total_Revenue,
    ROUND(SUM(Amount) / SUM(Qty), 2) AS Average_Price_Per_Unit
FROM [Amazon Sales ]
GROUP BY B2B

--7. Identifying High-Value Transaction Tiers

SELECT 
    Order_Tier,
    COUNT(*) AS Order_Count,
    SUM(Amount) AS Cumulative_Revenue
FROM (
    SELECT Amount,
           CASE WHEN Amount >= 1200 
           THEN 'Tier 1: Premium High Spend'
                WHEN Amount >= 600 
                THEN 'Tier 2: Core Mid Spend'
                ELSE 'Tier 3: Budget Low Spend' 
           END AS Order_Tier
    FROM [Amazon Sales ]
    WHERE Status <> 'Cancelled'
) AS Subquery
GROUP BY Order_Tier
ORDER BY Cumulative_Revenue DESC

--8. The "Top 5 SKUs per Category" Ranker

WITH RankedProducts AS (
    SELECT 
        Category,
        SKU,
        SUM(Qty) AS Units_Sold,
        SUM(Amount) AS Revenue_generated,
        DENSE_RANK() OVER (PARTITION BY Category ORDER BY SUM(Amount) DESC) AS Revenue_Rank
    FROM [Amazon Sales ]
    WHERE Status <> 'Cancelled'
    GROUP BY Category, SKU
)
SELECT Category, SKU, Units_Sold, Revenue_generated, Revenue_Rank
FROM RankedProducts
WHERE Revenue_Rank <= 5

--9. Return & Order Disruption Audit

SELECT 
    Category,
    COUNT(Order_ID) AS Impacted_Orders,
    SUM(Amount) AS Trapped_Revenue_Value
FROM [Amazon Sales ]
WHERE Status IN ('Rejected', 'Shipped - Returned to Seller', 'Shipped - Damaged', 'Shipped - Lost in Transit')
GROUP BY Category
ORDER BY Trapped_Revenue_Value DESC

--10. High-Velocity Order Trailing Check (Detecting Bulk Buyers)

SELECT 
    Order_ID,
    Date,
    Category,
    Qty,
    Amount,
    ship_city
FROM [Amazon Sales ]
WHERE Qty > (SELECT AVG(Qty) FROM [Amazon Sales ]) * 3
ORDER BY Qty DESC