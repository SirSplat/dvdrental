BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'index_is_primary', ARRAY['name', 'name']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'index_is_primary', ARRAY['name', 'name']::TEXT[], 'dbo', 'Function pgtap.index_is_primary(name_name) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'index_is_primary', ARRAY['name', 'name']::TEXT[], 'plpgsql', 'Function pgtap.index_is_primary(name_name) should have the correct language.');

  SELECT function_returns('pgtap', 'index_is_primary', ARRAY['name', 'name']::TEXT[], 'text', 'Function pgtap.index_is_primary(name_name) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'index_is_primary', ARRAY['name', 'name']::TEXT[], 'Function pgtap.index_is_primary(name_name) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'index_is_primary', ARRAY['name', 'name']::TEXT[], 'Function pgtap.index_is_primary(name_name) should not be strict.');

  SELECT is_normal_function('pgtap', 'index_is_primary', ARRAY['name', 'name']::TEXT[], 'Function pgtap.index_is_primary(name_name) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'index_is_primary', ARRAY['name', 'name']::TEXT[], 'Function pgtap.index_is_primary(name_name) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'index_is_primary', ARRAY['name', 'name']::TEXT[], 'Function pgtap.index_is_primary(name_name) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'index_is_primary', ARRAY['name', 'name']::TEXT[], 'Function pgtap.index_is_primary(name_name) should not be a procedure.');

  SELECT volatility_is('pgtap', 'index_is_primary', ARRAY['name', 'name']::TEXT[], 'v', 'Function pgtap.index_is_primary(name_name) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
