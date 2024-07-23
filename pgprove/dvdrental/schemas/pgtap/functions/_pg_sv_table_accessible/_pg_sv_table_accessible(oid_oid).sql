BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', '_pg_sv_table_accessible', ARRAY['oid', 'oid']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', '_pg_sv_table_accessible', ARRAY['oid', 'oid']::TEXT[], 'dbo', 'Function pgtap._pg_sv_table_accessible(oid_oid) should have the correct owner.');

  SELECT function_lang_is('pgtap', '_pg_sv_table_accessible', ARRAY['oid', 'oid']::TEXT[], 'sql', 'Function pgtap._pg_sv_table_accessible(oid_oid) should have the correct language.');

  SELECT function_returns('pgtap', '_pg_sv_table_accessible', ARRAY['oid', 'oid']::TEXT[], 'boolean', 'Function pgtap._pg_sv_table_accessible(oid_oid) should have the correct return type.');

  SELECT isnt_definer('pgtap', '_pg_sv_table_accessible', ARRAY['oid', 'oid']::TEXT[], 'Function pgtap._pg_sv_table_accessible(oid_oid) should have the correct security invoker.');

  SELECT is_strict('pgtap', '_pg_sv_table_accessible', ARRAY['oid', 'oid']::TEXT[], 'Function pgtap._pg_sv_table_accessible(oid_oid) should be strict.');

  SELECT is_normal_function('pgtap', '_pg_sv_table_accessible', ARRAY['oid', 'oid']::TEXT[], 'Function pgtap._pg_sv_table_accessible(oid_oid) should be a normal function.');

  SELECT isnt_aggregate('pgtap', '_pg_sv_table_accessible', ARRAY['oid', 'oid']::TEXT[], 'Function pgtap._pg_sv_table_accessible(oid_oid) should not be an aggregate function.');

  SELECT isnt_window('pgtap', '_pg_sv_table_accessible', ARRAY['oid', 'oid']::TEXT[], 'Function pgtap._pg_sv_table_accessible(oid_oid) should not be a window function.');

  SELECT isnt_procedure('pgtap', '_pg_sv_table_accessible', ARRAY['oid', 'oid']::TEXT[], 'Function pgtap._pg_sv_table_accessible(oid_oid) should not be a procedure.');

  SELECT volatility_is('pgtap', '_pg_sv_table_accessible', ARRAY['oid', 'oid']::TEXT[], 'i', 'Function pgtap._pg_sv_table_accessible(oid_oid) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
