-- Verify db_design_intro:tables/actor on pg

BEGIN;

SELECT pg_catalog.has_table_privilege( current_user, 'rental.actor', 'insert' );

ROLLBACK;