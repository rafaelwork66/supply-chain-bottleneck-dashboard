# supply-chain-bottleneck-dashboard

Supply Chain Bottleneck Dashboard (SQL + Tableau)

Goal
Identify shipping bottlenecks (time, risk, cost) and recommend operational improvements using SQL aggregation + Tableau dashboarding.

Tools

MySQL (views + aggregation)

Tableau Public (dashboard + interactivity)

CSV exports (for Tableau ingestion)

KPIs

Avg Lead Time (by transport mode)

Weighted Defect Risk (by mode)

Cost per Unit (by carrier)

Revenue & Units (carrier performance)

SKU Drilldown (which SKUs drive issues)

Dashboard (Tableau Public)
[Paste your Tableau Public link here]

Key Insights

Slowest mode: [Air / Road / etc] → highest average lead time

Highest risk mode: [Road / etc] → highest weighted defect risk

Most expensive carrier: [Carrier C / etc] → highest cost per unit

Certain product × mode combinations repeatedly show high lead time / risk

A small number of SKUs contribute disproportionately to bottleneck metrics

Recommendations

Reallocate critical SKUs away from high-risk mode where service levels matter

Negotiate or switch from high cost-per-unit carrier for high-volume lanes

Set SLA thresholds for lead time by mode and monitor monthly

Investigate SKUs with extreme lead time / defect risk for root cause (routing, packaging, vendor, handoffs)

How I Built It

Imported raw supply-chain dataset into MySQL

Created aggregated views (Mode scorecard, Carrier scorecard, Product-mode heatmap, SKU bottleneck list)

Exported CSVs from MySQL

Built Tableau dashboard with KPI cards + drilldown + filters

Files

/data → exported CSVs

/sql → queries/views used

/images → dashboard screenshots
