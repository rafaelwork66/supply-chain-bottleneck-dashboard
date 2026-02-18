-- make the first table "Mode Scorecard"--
CREATE OR REPLACE VIEW v_mode_scorecard AS
SELECT
  `Transportation modes` AS transport_mode,

  SUM(`Number of products sold`) AS total_units,

  ROUND(AVG(`Lead times`), 2) AS avg_lead_time,
  ROUND(AVG(`Shipping times`), 2) AS avg_shipping_time,

  ROUND(
    SUM(`Defect rates` * `Number of products sold`)
    / SUM(`Number of products sold`),
    4
  ) AS weighted_defect_rate,

  ROUND(
    SUM(`Shipping costs`)
    / SUM(`Number of products sold`),
    4
  ) AS cost_per_unit

FROM supply_chain_data
GROUP BY `Transportation modes`;

-- To check and export the "Mode Scorecard"

SELECT * FROM v_mode_scorecard;

-- make the Second table "Carrier Scorecard"--
CREATE OR REPLACE VIEW v_carrier_scorecard AS
SELECT
  `Shipping carriers` AS carrier,

  SUM(`Number of products sold`) AS total_units,
  ROUND(SUM(`Revenue generated`), 2) AS total_revenue,

  ROUND(SUM(`Shipping costs`), 2) AS total_shipping_cost,

  ROUND(
    SUM(`Shipping costs`)
    / SUM(`Number of products sold`),
    4
  ) AS ship_cost_per_unit,

  ROUND(AVG(`Lead times`), 2) AS avg_lead_time,

  ROUND(
    SUM(`Defect rates` * `Number of products sold`)
    / SUM(`Number of products sold`),
    4
  ) AS weighted_defect_rate

FROM supply_chain_data
GROUP BY `Shipping carriers`;

-- To check and export the "carrier Scorecard"
SELECT * FROM v_carrier_scorecard;

-- make the third table "Product Mode Heatmap"--
CREATE OR REPLACE VIEW v_product_mode_heatmap AS
SELECT
  `Product type` AS product_type,
  `Transportation modes` AS transport_mode,

  SUM(`Number of products sold`) AS total_units,

  ROUND(AVG(`Lead times`), 2) AS avg_lead_time,

  ROUND(
    SUM(`Defect rates` * `Number of products sold`)
    / SUM(`Number of products sold`),
    4
  ) AS weighted_defect_rate

FROM supply_chain_data
GROUP BY `Product type`, `Transportation modes`;

-- Selecting the table for the heatmap --
SELECT * FROM v_product_mode_heatmap;

-- make the fourth table "SKU Bottlenecks"--
CREATE OR REPLACE VIEW v_sku_bottlenecks AS
SELECT
  SKU,
  `Product type` AS product_type,
  `Transportation modes` AS transport_mode,
  `Shipping carriers` AS carrier,

  SUM(`Number of products sold`) AS total_units,

  ROUND(SUM(`Revenue generated`), 2) AS total_revenue,

  ROUND(AVG(`Lead times`), 2) AS avg_lead_time,

  ROUND(
    SUM(`Defect rates` * `Number of products sold`)
    / SUM(`Number of products sold`),
    4
  ) AS weighted_defect_rate,

  ROUND(
    SUM(`Shipping costs`)
    / SUM(`Number of products sold`),
    4
  ) AS ship_cost_per_unit,

  ROUND(
    AVG(`Order quantities`) - AVG(`Stock levels`),
    2
  ) AS stock_gap

FROM supply_chain_data
GROUP BY
  SKU,
  `Product type`,
  `Transportation modes`,
  `Shipping carriers`;

-- Pullin the sku bottlenneck--
SELECT * FROM v_sku_bottlenecks;


