BEGIN;
  SELECT plan(8);

  SELECT has_schema('rental', 'Schema rental should exist.');

  SELECT has_table('rental', 'actor', 'Table rental.actor should exist.');

  SELECT has_column('rental', 'actor', 'first_name', 'Column rental.actor.first_name should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'varchar', 'Data type pg_catalog.varchar should exist.');

  SELECT col_not_null('rental', 'actor', 'first_name', 'Column rental.actor.first_name should be NOT NULL.');

  SELECT col_hasnt_default('rental', 'actor', 'first_name', 'Column rental.actor.first_name should not have DEFAULT.');

  SELECT col_type_is('rental', 'actor', 'first_name', 'pg_catalog', 'character varying(45)', 'Column rental.actor.first_name should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;