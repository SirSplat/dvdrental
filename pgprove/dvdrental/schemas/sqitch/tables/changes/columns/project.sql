BEGIN;
  SELECT plan(8);

  SELECT has_schema('sqitch', 'Schema sqitch should exist.');

  SELECT has_table('sqitch', 'changes', 'Table sqitch.changes should exist.');

  SELECT has_column('sqitch', 'changes', 'project', 'Column sqitch.changes.project should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'text', 'Data type pg_catalog.text should exist.');

  SELECT col_not_null('sqitch', 'changes', 'project', 'Column sqitch.changes.project should be NOT NULL.');

  SELECT col_hasnt_default('sqitch', 'changes', 'project', 'Column sqitch.changes.project should not have DEFAULT.');

  SELECT col_type_is('sqitch', 'changes', 'project', 'pg_catalog', 'text', 'Column sqitch.changes.project should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
