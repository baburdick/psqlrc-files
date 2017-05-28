/*
  Purpose: The last time these tables were vacuumed and analyzed.
*/
SELECT schemaname, relname, last_vacuum, last_autovacuum, last_analyze, last_autoanalyze,
  pg_size_pretty(pg_total_relation_size('"' || schemaname || '"."' || relname || '"')) AS size
FROM pg_stat_all_tables
--ORDER BY last_autovacuum, last_autoanalyze;
--ORDER BY schemaname, relname;
ORDER BY pg_total_relation_size('"' || schemaname || '"."' || relname || '"') DESC;
