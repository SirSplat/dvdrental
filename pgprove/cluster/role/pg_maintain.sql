BEGIN;
  SELECT plan(2);

  SELECT has_role('pg_maintain', 'Role pg_maintain should exist.');

  SELECT isnt_superuser('pg_maintain', 'Group pg_maintain should not be a superuser.');

  SELECT * FROM finish();
ROLLBACK;
