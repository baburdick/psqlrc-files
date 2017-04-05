SELECT datname, pg_size_pretty(pg_database_size(datname)) db_size
FROM pg_database
ORDER BY pg_database_size(datname)
