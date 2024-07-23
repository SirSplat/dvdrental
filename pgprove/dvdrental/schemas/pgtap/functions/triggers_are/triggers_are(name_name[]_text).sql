BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'triggers_are', ARRAY['name', 'name[]', 'text']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'triggers_are', ARRAY['name', 'name[]', 'text']::TEXT[], 'dbo', 'Function pgtap.triggers_are(name_name[]_text) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'triggers_are', ARRAY['name', 'name[]', 'text']::TEXT[], 'sql', 'Function pgtap.triggers_are(name_name[]_text) should have the correct language.');

  SELECT function_returns('pgtap', 'triggers_are', ARRAY['name', 'name[]', 'text']::TEXT[], 'text', 'Function pgtap.triggers_are(name_name[]_text) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'triggers_are', ARRAY['name', 'name[]', 'text']::TEXT[], 'Function pgtap.triggers_are(name_name[]_text) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'triggers_are', ARRAY['name', 'name[]', 'text']::TEXT[], 'Function pgtap.triggers_are(name_name[]_text) should not be strict.');

  SELECT is_normal_function('pgtap', 'triggers_are', ARRAY['name', 'name[]', 'text']::TEXT[], 'Function pgtap.triggers_are(name_name[]_text) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'triggers_are', ARRAY['name', 'name[]', 'text']::TEXT[], 'Function pgtap.triggers_are(name_name[]_text) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'triggers_are', ARRAY['name', 'name[]', 'text']::TEXT[], 'Function pgtap.triggers_are(name_name[]_text) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'triggers_are', ARRAY['name', 'name[]', 'text']::TEXT[], 'Function pgtap.triggers_are(name_name[]_text) should not be a procedure.');

  SELECT volatility_is('pgtap', 'triggers_are', ARRAY['name', 'name[]', 'text']::TEXT[], 'v', 'Function pgtap.triggers_are(name_name[]_text) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
