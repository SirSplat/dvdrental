BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', '_get', ARRAY['text']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', '_get', ARRAY['text']::TEXT[], 'dbo', 'Function pgtap._get(text) should have the correct owner.');

  SELECT function_lang_is('pgtap', '_get', ARRAY['text']::TEXT[], 'plpgsql', 'Function pgtap._get(text) should have the correct language.');

  SELECT function_returns('pgtap', '_get', ARRAY['text']::TEXT[], 'integer', 'Function pgtap._get(text) should have the correct return type.');

  SELECT isnt_definer('pgtap', '_get', ARRAY['text']::TEXT[], 'Function pgtap._get(text) should have the correct security invoker.');

  SELECT is_strict('pgtap', '_get', ARRAY['text']::TEXT[], 'Function pgtap._get(text) should be strict.');

  SELECT is_normal_function('pgtap', '_get', ARRAY['text']::TEXT[], 'Function pgtap._get(text) should be a normal function.');

  SELECT isnt_aggregate('pgtap', '_get', ARRAY['text']::TEXT[], 'Function pgtap._get(text) should not be an aggregate function.');

  SELECT isnt_window('pgtap', '_get', ARRAY['text']::TEXT[], 'Function pgtap._get(text) should not be a window function.');

  SELECT isnt_procedure('pgtap', '_get', ARRAY['text']::TEXT[], 'Function pgtap._get(text) should not be a procedure.');

  SELECT volatility_is('pgtap', '_get', ARRAY['text']::TEXT[], 'v', 'Function pgtap._get(text) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
