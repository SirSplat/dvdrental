BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'col_is_unique', ARRAY['name', 'name', 'name[]', 'text']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'col_is_unique', ARRAY['name', 'name', 'name[]', 'text']::TEXT[], 'dbo', 'Function pgtap.col_is_unique(name_name_name[]_text) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'col_is_unique', ARRAY['name', 'name', 'name[]', 'text']::TEXT[], 'sql', 'Function pgtap.col_is_unique(name_name_name[]_text) should have the correct language.');

  SELECT function_returns('pgtap', 'col_is_unique', ARRAY['name', 'name', 'name[]', 'text']::TEXT[], 'text', 'Function pgtap.col_is_unique(name_name_name[]_text) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'col_is_unique', ARRAY['name', 'name', 'name[]', 'text']::TEXT[], 'Function pgtap.col_is_unique(name_name_name[]_text) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'col_is_unique', ARRAY['name', 'name', 'name[]', 'text']::TEXT[], 'Function pgtap.col_is_unique(name_name_name[]_text) should not be strict.');

  SELECT is_normal_function('pgtap', 'col_is_unique', ARRAY['name', 'name', 'name[]', 'text']::TEXT[], 'Function pgtap.col_is_unique(name_name_name[]_text) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'col_is_unique', ARRAY['name', 'name', 'name[]', 'text']::TEXT[], 'Function pgtap.col_is_unique(name_name_name[]_text) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'col_is_unique', ARRAY['name', 'name', 'name[]', 'text']::TEXT[], 'Function pgtap.col_is_unique(name_name_name[]_text) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'col_is_unique', ARRAY['name', 'name', 'name[]', 'text']::TEXT[], 'Function pgtap.col_is_unique(name_name_name[]_text) should not be a procedure.');

  SELECT volatility_is('pgtap', 'col_is_unique', ARRAY['name', 'name', 'name[]', 'text']::TEXT[], 'v', 'Function pgtap.col_is_unique(name_name_name[]_text) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
