BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', '_array_to_sorted_string', ARRAY['name[]', 'text']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', '_array_to_sorted_string', ARRAY['name[]', 'text']::TEXT[], 'dbo', 'Function pgtap._array_to_sorted_string(name[]_text) should have the correct owner.');

  SELECT function_lang_is('pgtap', '_array_to_sorted_string', ARRAY['name[]', 'text']::TEXT[], 'sql', 'Function pgtap._array_to_sorted_string(name[]_text) should have the correct language.');

  SELECT function_returns('pgtap', '_array_to_sorted_string', ARRAY['name[]', 'text']::TEXT[], 'text', 'Function pgtap._array_to_sorted_string(name[]_text) should have the correct return type.');

  SELECT isnt_definer('pgtap', '_array_to_sorted_string', ARRAY['name[]', 'text']::TEXT[], 'Function pgtap._array_to_sorted_string(name[]_text) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', '_array_to_sorted_string', ARRAY['name[]', 'text']::TEXT[], 'Function pgtap._array_to_sorted_string(name[]_text) should not be strict.');

  SELECT is_normal_function('pgtap', '_array_to_sorted_string', ARRAY['name[]', 'text']::TEXT[], 'Function pgtap._array_to_sorted_string(name[]_text) should be a normal function.');

  SELECT isnt_aggregate('pgtap', '_array_to_sorted_string', ARRAY['name[]', 'text']::TEXT[], 'Function pgtap._array_to_sorted_string(name[]_text) should not be an aggregate function.');

  SELECT isnt_window('pgtap', '_array_to_sorted_string', ARRAY['name[]', 'text']::TEXT[], 'Function pgtap._array_to_sorted_string(name[]_text) should not be a window function.');

  SELECT isnt_procedure('pgtap', '_array_to_sorted_string', ARRAY['name[]', 'text']::TEXT[], 'Function pgtap._array_to_sorted_string(name[]_text) should not be a procedure.');

  SELECT volatility_is('pgtap', '_array_to_sorted_string', ARRAY['name[]', 'text']::TEXT[], 'i', 'Function pgtap._array_to_sorted_string(name[]_text) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
