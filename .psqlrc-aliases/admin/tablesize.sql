SELECT
  nspname || '.' || relname                 AS relation,
  pg_size_pretty(pg_relation_size(pgc.oid)) AS size
FROM pg_class pgc
  LEFT JOIN pg_namespace pgn ON pgn.oid = pgc.relnamespace
WHERE nspname NOT IN ('pg_catalog', 'information_schema')
ORDER BY pg_relation_size(pgc.oid)
DESC LIMIT 40
