BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'pgtap_version', ARRAY[]::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'pgtap_version', ARRAY[]::TEXT[], 'dbo', 'Function pgtap.() should have the correct owner.');

  SELECT function_lang_is('pgtap', 'pgtap_version', ARRAY[]::TEXT[], 'sql', 'Function pgtap.() should have the correct language.');

  SELECT function_returns('pgtap', 'pgtap_version', ARRAY[]::TEXT[], 'numeric', 'Function pgtap.() should have the correct return type.');

  SELECT isnt_definer('pgtap', 'pgtap_version', ARRAY[]::TEXT[], 'Function pgtap.() should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'pgtap_version', ARRAY[]::TEXT[], 'Function pgtap.() should not be strict.');

  SELECT is_normal_function('pgtap', 'pgtap_version', ARRAY[]::TEXT[], 'Function pgtap.() should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'pgtap_version', ARRAY[]::TEXT[], 'Function pgtap.() should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'pgtap_version', ARRAY[]::TEXT[], 'Function pgtap.() should not be a window function.');

  SELECT isnt_procedure('pgtap', 'pgtap_version', ARRAY[]::TEXT[], 'Function pgtap.() should not be a procedure.');

  SELECT volatility_is('pgtap', 'pgtap_version', ARRAY[]::TEXT[], 'i', 'Function pgtap.() should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
