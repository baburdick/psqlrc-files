SELECT
  nspname,
  relname,
  attname,
  typname,
  (stanullfrac * 100)::int AS null_percent,
  CASE WHEN stadistinct >= 0 THEN stadistinct
       ELSE abs(stadistinct) * reltuples
  END AS distinct,
  CASE 1 WHEN stakind1 THEN stavalues1
         WHEN stakind2 THEN stavalues2
  END AS values
FROM pg_class c
  JOIN pg_namespace ns ON ns.oid = relnamespace
  JOIN pg_attribute    ON c.oid  = attrelid
  JOIN pg_type t       ON t.oid  = atttypid
  JOIN pg_statistic    ON c.oid  = starelid
                        AND staattnum = attnum
WHERE nspname NOT LIKE E'pg\\_%'
  AND nspname != 'information_schema'
  AND relkind = 'r'
  AND NOT attisdropped
  AND attstattarget != 0
  AND reltuples >= 100
  AND stadistinct BETWEEN 0 AND 1
ORDER BY nspname, relname, attname
