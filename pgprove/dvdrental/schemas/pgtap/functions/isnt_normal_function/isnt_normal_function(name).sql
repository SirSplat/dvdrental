BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'isnt_normal_function', ARRAY['name']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'isnt_normal_function', ARRAY['name']::TEXT[], 'dbo', 'Function pgtap.isnt_normal_function(name) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'isnt_normal_function', ARRAY['name']::TEXT[], 'sql', 'Function pgtap.isnt_normal_function(name) should have the correct language.');

  SELECT function_returns('pgtap', 'isnt_normal_function', ARRAY['name']::TEXT[], 'text', 'Function pgtap.isnt_normal_function(name) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'isnt_normal_function', ARRAY['name']::TEXT[], 'Function pgtap.isnt_normal_function(name) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'isnt_normal_function', ARRAY['name']::TEXT[], 'Function pgtap.isnt_normal_function(name) should not be strict.');

  SELECT is_normal_function('pgtap', 'isnt_normal_function', ARRAY['name']::TEXT[], 'Function pgtap.isnt_normal_function(name) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'isnt_normal_function', ARRAY['name']::TEXT[], 'Function pgtap.isnt_normal_function(name) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'isnt_normal_function', ARRAY['name']::TEXT[], 'Function pgtap.isnt_normal_function(name) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'isnt_normal_function', ARRAY['name']::TEXT[], 'Function pgtap.isnt_normal_function(name) should not be a procedure.');

  SELECT volatility_is('pgtap', 'isnt_normal_function', ARRAY['name']::TEXT[], 'v', 'Function pgtap.isnt_normal_function(name) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
