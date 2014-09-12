SELECT
  pg_stat_activity.pid,
  pg_stat_activity.query,
  pg_stat_activity.waiting,
  now() - pg_stat_activity.query_start AS totaltime,
  pg_stat_activity.backend_start
FROM pg_stat_activity
WHERE pg_stat_activity.query !~ '%IDLE%'::text
  AND pg_stat_activity.waiting = true
