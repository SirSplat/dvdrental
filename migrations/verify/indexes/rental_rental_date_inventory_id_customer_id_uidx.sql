-- Verify db_design_intro:indexes/rental_rental_date_inventory_id_customer_id_uidx on pg

BEGIN;

SELECT
    1 / COUNT( pgci.relname )
FROM
    pg_catalog.pg_class
    JOIN pg_catalog.pg_namespace ON (
        pg_namespace.oid = pg_class.relnamespace
    )
    JOIN pg_catalog.pg_index ON (
        pg_index.indrelid = pg_class.oid
    )
    JOIN pg_catalog.pg_class AS pgci ON (
        pgci.oid = pg_index.indexrelid
    )
WHERE
    pg_namespace.nspname = 'rental' AND
    pg_class.relname = 'rental' AND
    pgci.relname = 'rental_rental_date_inventory_id_customer_id_uidx' AND
    pg_index.indisunique;

ROLLBACK;
