/*
  Purpose: Whether autovacuum is running, and how long it has been running.
*/
SELECT  datname,
        usename,
        pid,
        waiting,
        current_timestamp - xact_start AS xact_runtime,
        query
FROM pg_stat_activity
WHERE upper(query) LIKE '%VACUUM%'
ORDER BY xact_start;
