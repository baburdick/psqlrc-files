SELECT
  table_schema,
  table_name,
  pg_size_pretty(size)       AS size,
  pg_size_pretty(total_size) AS total_size
FROM (:rtsize) x
ORDER BY
  x.size DESC,
  x.total_size DESC,
  table_schema,
  table_name
