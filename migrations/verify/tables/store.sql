-- Verify db_design_intro:tables/store on pg

BEGIN;

SELECT pg_catalog.has_table_privilege( current_user, 'rental.store', 'insert' );

ROLLBACK;
