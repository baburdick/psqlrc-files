SELECT
  bl.pid     AS blocked_pid,
  a.usename  AS blocked_user,
  kl.pid     AS blocking_pid,
  ka.usename AS blocking_user,
  a.query    AS blocked_statement
FROM pg_catalog.pg_locks bl
  JOIN pg_catalog.pg_stat_activity a  ON bl.pid = a.pid
  JOIN pg_catalog.pg_locks kl         ON bl.transactionid = kl.transactionid
                                        AND bl.pid != kl.pid
  JOIN pg_catalog.pg_stat_activity ka ON kl.pid = ka.pid
WHERE NOT bl.granted
