SELECT
    n.nspname   AS enum_schema
  , t.typname   AS enum_name
  , e.enumlabel AS enum_value
FROM pg_type AS t
  INNER JOIN pg_enum AS e
    ON t.oid = e.enumtypid
  INNER JOIN pg_catalog.pg_namespace AS n
    ON n.oid = t.typnamespace
