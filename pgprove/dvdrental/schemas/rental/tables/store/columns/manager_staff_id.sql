BEGIN;
  SELECT plan(8);

  SELECT has_schema('rental', 'Schema rental should exist.');

  SELECT has_table('rental', 'store', 'Table rental.store should exist.');

  SELECT has_column('rental', 'store', 'manager_staff_id', 'Column rental.store.manager_staff_id should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'int2', 'Data type pg_catalog.int2 should exist.');

  SELECT col_not_null('rental', 'store', 'manager_staff_id', 'Column rental.store.manager_staff_id should be NOT NULL.');

  SELECT col_hasnt_default('rental', 'store', 'manager_staff_id', 'Column rental.store.manager_staff_id should not have DEFAULT.');

  SELECT col_type_is('rental', 'store', 'manager_staff_id', 'pg_catalog', 'smallint', 'Column rental.store.manager_staff_id should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
