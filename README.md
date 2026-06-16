# Superstore Sales Analysis

## Objective
Analyzed US retail transaction data to identify revenue drivers, profitability issues, and actionable business recommendations across categories, regions, discount strategy, customer segments, and shipping preferences.

## Tools Used
SQL (MySQL)

## Dataset Overview
- **Scope:** Retail transactions across the United States
- **Key fields:** Ship Mode, Segment, Region, Category, Sub-Category, Sales, Quantity, Discount, Profit
- **Segments:** Consumer, Corporate, Home Office
- **Regions:** West, East, Central, South
- **Categories:** Furniture, Office Supplies, Technology

## Key Findings

**1. Technology drives revenue and profit; Furniture is bleeding money**
Technology generated the highest revenue ($16,819) and profit ($5,514). Furniture had the second highest revenue ($10,823) but a negative profit of -$2,487 — indicating a serious pricing or discounting problem within the category.

**2. East is the only loss-making region**
East region posted a -$464 loss despite $2,093 in sales. Central region had the strongest profit margins ($1,625) despite not having the highest revenue. West had the highest revenue ($11,168) but comparatively thin margins.

**3. High discounts are the primary driver of unprofitability**
Orders with no discount averaged $204 profit each. Orders with discounts above 20% averaged a loss of -$269 each, wiping out $2,959 in total profit. Discounting beyond 20% appears to directly cause losses.

**4. Tables and Bookcases are the only loss-making sub-categories**
Tables (-$2,425) and Bookcases (-$534) are the sole sub-categories with negative total profit — both belonging to the Furniture category. This confirms Furniture's overall losses are concentrated in just two product lines.

**5. Corporate customers are the most profitable per order**
Corporate has the lowest total sales ($8,063) but the highest average profit per order ($118.90), suggesting fewer but well-margined deals. Consumer drives the highest sales volume ($12,654) but the lowest average profit per order ($35.40), pointing to heavier discounting at the consumer level.

**6. First Class shipping is nearly as popular as Standard, and more valuable**
Standard Class is the most used shipping option (15 orders), with First Class close behind (14 orders). First Class also has the highest average order value ($692) of any shipping tier — making it a high-value option that isn't being underused.

## Business Recommendations
- Audit and revise the discount policy for Furniture, particularly Tables and Bookcases — consider capping discounts at 20%.
- Investigate root causes of underperformance in the East region, with a focus on discount practices and Furniture sales mix.
- Prioritize retention and growth of Corporate accounts given their high per-order profitability.
- Promote First Class shipping more actively, as it delivers higher order value without a meaningful drop in adoption versus Standard Class.

## Methodology Note
Initial analysis used arbitrary thresholds for categorizing customer segments and ship modes (e.g., a fixed profit cutoff, and total quantity rather than order count). These were corrected after reviewing the actual data distribution — segment value buckets were re-set based on real average-profit gaps between segments, and "most used" shipping mode was redefined using order count instead of item quantity, since the two metrics led to different conclusions.

## Files
- `sql/analysis_queries.sql` — all 6 analysis queries
