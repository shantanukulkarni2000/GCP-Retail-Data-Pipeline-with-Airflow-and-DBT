WITH fct_invoices_cte AS (
  SELECT
    InvoiceNo AS invoice_id,
    InvoiceDate AS datetime_id,
    {{ dbt_utils.generate_surrogate_key(['StockCode', 'Description', 'UnitPrice']) }} AS product_id,
    {{ dbt_utils.generate_surrogate_key(['CustomerID', 'Country']) }} AS customer_id,
    Quantity AS quantity,
    Quantity * UnitPrice AS total
  FROM {{ source('retail', 'raw_invoices') }}
  WHERE Quantity > 0
)
SELECT
  invoice_id,
  dt.datetime_id,
  dp.product_id,
  dc.customer_id,
  quantity,
  total
FROM fct_invoices_cte fi
JOIN {{ ref('dim_datetime') }} dt ON fi.datetime_id = dt.datetime_id
JOIN {{ ref('dim_product') }} dp ON fi.product_id = dp.product_id
JOIN {{ ref('dim_customer') }} dc ON fi.customer_id = dc.customer_id
