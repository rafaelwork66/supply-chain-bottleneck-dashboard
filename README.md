# supply-chain-bottleneck-dashboard

Supply Chain Bottleneck Dashboard (SQL + Tableau)

Goal : Identify shipping bottlenecks (time, risk, cost) and recommend operational improvements using SQL aggregation + Tableau dashboarding.

Tools
- MySQL (views + aggregation)
- Tableau Public (dashboard + interactivity)
- CSV exports (for Tableau ingestion)

KPIs
- Avg Lead Time (by transport mode)
- Weighted Defect Risk (by mode)
- Cost per Unit (by carrier)
- Revenue & Units (carrier performance)
- SKU Drilldown (which SKUs drive issues)

Dashboard (Tableau Public)
https://public.tableau.com/app/profile/rafael.pasaribu/viz/SuplyChainproject/SupplyChainBottleneckDashboard?publish=yes 

Key Insights
- Slowest mode: [Air / Road / etc] → highest average lead time
- Highest risk mode: [Road / etc] → highest weighted defect risk
- Most expensive carrier: [Carrier C / etc] → highest cost per unit
- Certain product × mode combinations repeatedly show high lead time / risk
- A small number of SKUs contribute disproportionately to bottleneck metrics

Recommendations
1. Reallocate critical SKUs away from high-risk mode where service levels matter
2. Negotiate or switch from high cost-per-unit carrier for high-volume lanes
3. Set SLA thresholds for lead time by mode and monitor monthly
4. Investigate SKUs with extreme lead time / defect risk for root cause (routing, packaging, vendor, handoffs)

How I Built It
1.Imported raw supply-chain dataset into MySQL
2. Created aggregated views (Mode scorecard, Carrier scorecard, Product-mode heatmap, SKU bottleneck list)
3. Exported CSVs from MySQL
4. Built Tableau dashboard with KPI cards + drilldown + filters

Files
<img width="1716" height="875" alt="image" src="https://github.com/user-attachments/assets/6388dfd1-e1e7-40a8-a4eb-a95afa05704d" />

/data → exported CSVs

/sql → queries/views used

/images → dashboard screenshots
