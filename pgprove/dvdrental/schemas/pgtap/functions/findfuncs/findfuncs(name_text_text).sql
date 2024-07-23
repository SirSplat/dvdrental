BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'findfuncs', ARRAY['name', 'text', 'text']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'findfuncs', ARRAY['name', 'text', 'text']::TEXT[], 'dbo', 'Function pgtap.findfuncs(name_text_text) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'findfuncs', ARRAY['name', 'text', 'text']::TEXT[], 'sql', 'Function pgtap.findfuncs(name_text_text) should have the correct language.');

  SELECT function_returns('pgtap', 'findfuncs', ARRAY['name', 'text', 'text']::TEXT[], 'text[]', 'Function pgtap.findfuncs(name_text_text) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'findfuncs', ARRAY['name', 'text', 'text']::TEXT[], 'Function pgtap.findfuncs(name_text_text) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'findfuncs', ARRAY['name', 'text', 'text']::TEXT[], 'Function pgtap.findfuncs(name_text_text) should not be strict.');

  SELECT is_normal_function('pgtap', 'findfuncs', ARRAY['name', 'text', 'text']::TEXT[], 'Function pgtap.findfuncs(name_text_text) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'findfuncs', ARRAY['name', 'text', 'text']::TEXT[], 'Function pgtap.findfuncs(name_text_text) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'findfuncs', ARRAY['name', 'text', 'text']::TEXT[], 'Function pgtap.findfuncs(name_text_text) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'findfuncs', ARRAY['name', 'text', 'text']::TEXT[], 'Function pgtap.findfuncs(name_text_text) should not be a procedure.');

  SELECT volatility_is('pgtap', 'findfuncs', ARRAY['name', 'text', 'text']::TEXT[], 'v', 'Function pgtap.findfuncs(name_text_text) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
