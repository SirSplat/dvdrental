BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'has_extension', ARRAY['name', 'text']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'has_extension', ARRAY['name', 'text']::TEXT[], 'dbo', 'Function pgtap.has_extension(name_text) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'has_extension', ARRAY['name', 'text']::TEXT[], 'sql', 'Function pgtap.has_extension(name_text) should have the correct language.');

  SELECT function_returns('pgtap', 'has_extension', ARRAY['name', 'text']::TEXT[], 'text', 'Function pgtap.has_extension(name_text) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'has_extension', ARRAY['name', 'text']::TEXT[], 'Function pgtap.has_extension(name_text) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'has_extension', ARRAY['name', 'text']::TEXT[], 'Function pgtap.has_extension(name_text) should not be strict.');

  SELECT is_normal_function('pgtap', 'has_extension', ARRAY['name', 'text']::TEXT[], 'Function pgtap.has_extension(name_text) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'has_extension', ARRAY['name', 'text']::TEXT[], 'Function pgtap.has_extension(name_text) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'has_extension', ARRAY['name', 'text']::TEXT[], 'Function pgtap.has_extension(name_text) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'has_extension', ARRAY['name', 'text']::TEXT[], 'Function pgtap.has_extension(name_text) should not be a procedure.');

  SELECT volatility_is('pgtap', 'has_extension', ARRAY['name', 'text']::TEXT[], 'v', 'Function pgtap.has_extension(name_text) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
