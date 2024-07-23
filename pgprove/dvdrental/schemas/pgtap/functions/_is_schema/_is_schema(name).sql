BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', '_is_schema', ARRAY['name']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', '_is_schema', ARRAY['name']::TEXT[], 'dbo', 'Function pgtap._is_schema(name) should have the correct owner.');

  SELECT function_lang_is('pgtap', '_is_schema', ARRAY['name']::TEXT[], 'sql', 'Function pgtap._is_schema(name) should have the correct language.');

  SELECT function_returns('pgtap', '_is_schema', ARRAY['name']::TEXT[], 'boolean', 'Function pgtap._is_schema(name) should have the correct return type.');

  SELECT isnt_definer('pgtap', '_is_schema', ARRAY['name']::TEXT[], 'Function pgtap._is_schema(name) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', '_is_schema', ARRAY['name']::TEXT[], 'Function pgtap._is_schema(name) should not be strict.');

  SELECT is_normal_function('pgtap', '_is_schema', ARRAY['name']::TEXT[], 'Function pgtap._is_schema(name) should be a normal function.');

  SELECT isnt_aggregate('pgtap', '_is_schema', ARRAY['name']::TEXT[], 'Function pgtap._is_schema(name) should not be an aggregate function.');

  SELECT isnt_window('pgtap', '_is_schema', ARRAY['name']::TEXT[], 'Function pgtap._is_schema(name) should not be a window function.');

  SELECT isnt_procedure('pgtap', '_is_schema', ARRAY['name']::TEXT[], 'Function pgtap._is_schema(name) should not be a procedure.');

  SELECT volatility_is('pgtap', '_is_schema', ARRAY['name']::TEXT[], 'v', 'Function pgtap._is_schema(name) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
