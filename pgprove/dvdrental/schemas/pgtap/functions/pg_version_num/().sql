BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'pg_version_num', ARRAY[]::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'pg_version_num', ARRAY[]::TEXT[], 'dbo', 'Function pgtap.() should have the correct owner.');

  SELECT function_lang_is('pgtap', 'pg_version_num', ARRAY[]::TEXT[], 'sql', 'Function pgtap.() should have the correct language.');

  SELECT function_returns('pgtap', 'pg_version_num', ARRAY[]::TEXT[], 'integer', 'Function pgtap.() should have the correct return type.');

  SELECT isnt_definer('pgtap', 'pg_version_num', ARRAY[]::TEXT[], 'Function pgtap.() should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'pg_version_num', ARRAY[]::TEXT[], 'Function pgtap.() should not be strict.');

  SELECT is_normal_function('pgtap', 'pg_version_num', ARRAY[]::TEXT[], 'Function pgtap.() should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'pg_version_num', ARRAY[]::TEXT[], 'Function pgtap.() should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'pg_version_num', ARRAY[]::TEXT[], 'Function pgtap.() should not be a window function.');

  SELECT isnt_procedure('pgtap', 'pg_version_num', ARRAY[]::TEXT[], 'Function pgtap.() should not be a procedure.');

  SELECT volatility_is('pgtap', 'pg_version_num', ARRAY[]::TEXT[], 'i', 'Function pgtap.() should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
