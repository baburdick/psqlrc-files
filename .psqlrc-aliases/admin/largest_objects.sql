/*
  Purpose: largest tables and indexes.
*/
SELECT relname, relpages, relnamespace
FROM pg_class
ORDER BY relpages DESC;
