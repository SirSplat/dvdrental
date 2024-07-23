BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', '_func_compare', ARRAY['name', 'name', 'name[]', 'boolean', 'text']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', '_func_compare', ARRAY['name', 'name', 'name[]', 'boolean', 'text']::TEXT[], 'dbo', 'Function pgtap._func_compare(name_name_name[]_boolean_text) should have the correct owner.');

  SELECT function_lang_is('pgtap', '_func_compare', ARRAY['name', 'name', 'name[]', 'boolean', 'text']::TEXT[], 'sql', 'Function pgtap._func_compare(name_name_name[]_boolean_text) should have the correct language.');

  SELECT function_returns('pgtap', '_func_compare', ARRAY['name', 'name', 'name[]', 'boolean', 'text']::TEXT[], 'text', 'Function pgtap._func_compare(name_name_name[]_boolean_text) should have the correct return type.');

  SELECT isnt_definer('pgtap', '_func_compare', ARRAY['name', 'name', 'name[]', 'boolean', 'text']::TEXT[], 'Function pgtap._func_compare(name_name_name[]_boolean_text) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', '_func_compare', ARRAY['name', 'name', 'name[]', 'boolean', 'text']::TEXT[], 'Function pgtap._func_compare(name_name_name[]_boolean_text) should not be strict.');

  SELECT is_normal_function('pgtap', '_func_compare', ARRAY['name', 'name', 'name[]', 'boolean', 'text']::TEXT[], 'Function pgtap._func_compare(name_name_name[]_boolean_text) should be a normal function.');

  SELECT isnt_aggregate('pgtap', '_func_compare', ARRAY['name', 'name', 'name[]', 'boolean', 'text']::TEXT[], 'Function pgtap._func_compare(name_name_name[]_boolean_text) should not be an aggregate function.');

  SELECT isnt_window('pgtap', '_func_compare', ARRAY['name', 'name', 'name[]', 'boolean', 'text']::TEXT[], 'Function pgtap._func_compare(name_name_name[]_boolean_text) should not be a window function.');

  SELECT isnt_procedure('pgtap', '_func_compare', ARRAY['name', 'name', 'name[]', 'boolean', 'text']::TEXT[], 'Function pgtap._func_compare(name_name_name[]_boolean_text) should not be a procedure.');

  SELECT volatility_is('pgtap', '_func_compare', ARRAY['name', 'name', 'name[]', 'boolean', 'text']::TEXT[], 'v', 'Function pgtap._func_compare(name_name_name[]_boolean_text) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
