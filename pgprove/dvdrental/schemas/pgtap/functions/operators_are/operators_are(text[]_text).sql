BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'operators_are', ARRAY['text[]', 'text']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'operators_are', ARRAY['text[]', 'text']::TEXT[], 'dbo', 'Function pgtap.operators_are(text[]_text) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'operators_are', ARRAY['text[]', 'text']::TEXT[], 'sql', 'Function pgtap.operators_are(text[]_text) should have the correct language.');

  SELECT function_returns('pgtap', 'operators_are', ARRAY['text[]', 'text']::TEXT[], 'text', 'Function pgtap.operators_are(text[]_text) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'operators_are', ARRAY['text[]', 'text']::TEXT[], 'Function pgtap.operators_are(text[]_text) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'operators_are', ARRAY['text[]', 'text']::TEXT[], 'Function pgtap.operators_are(text[]_text) should not be strict.');

  SELECT is_normal_function('pgtap', 'operators_are', ARRAY['text[]', 'text']::TEXT[], 'Function pgtap.operators_are(text[]_text) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'operators_are', ARRAY['text[]', 'text']::TEXT[], 'Function pgtap.operators_are(text[]_text) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'operators_are', ARRAY['text[]', 'text']::TEXT[], 'Function pgtap.operators_are(text[]_text) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'operators_are', ARRAY['text[]', 'text']::TEXT[], 'Function pgtap.operators_are(text[]_text) should not be a procedure.');

  SELECT volatility_is('pgtap', 'operators_are', ARRAY['text[]', 'text']::TEXT[], 'v', 'Function pgtap.operators_are(text[]_text) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
