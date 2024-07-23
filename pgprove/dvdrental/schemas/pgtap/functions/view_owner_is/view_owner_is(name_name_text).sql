BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'view_owner_is', ARRAY['name', 'name', 'text']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'view_owner_is', ARRAY['name', 'name', 'text']::TEXT[], 'dbo', 'Function pgtap.view_owner_is(name_name_text) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'view_owner_is', ARRAY['name', 'name', 'text']::TEXT[], 'plpgsql', 'Function pgtap.view_owner_is(name_name_text) should have the correct language.');

  SELECT function_returns('pgtap', 'view_owner_is', ARRAY['name', 'name', 'text']::TEXT[], 'text', 'Function pgtap.view_owner_is(name_name_text) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'view_owner_is', ARRAY['name', 'name', 'text']::TEXT[], 'Function pgtap.view_owner_is(name_name_text) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'view_owner_is', ARRAY['name', 'name', 'text']::TEXT[], 'Function pgtap.view_owner_is(name_name_text) should not be strict.');

  SELECT is_normal_function('pgtap', 'view_owner_is', ARRAY['name', 'name', 'text']::TEXT[], 'Function pgtap.view_owner_is(name_name_text) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'view_owner_is', ARRAY['name', 'name', 'text']::TEXT[], 'Function pgtap.view_owner_is(name_name_text) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'view_owner_is', ARRAY['name', 'name', 'text']::TEXT[], 'Function pgtap.view_owner_is(name_name_text) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'view_owner_is', ARRAY['name', 'name', 'text']::TEXT[], 'Function pgtap.view_owner_is(name_name_text) should not be a procedure.');

  SELECT volatility_is('pgtap', 'view_owner_is', ARRAY['name', 'name', 'text']::TEXT[], 'v', 'Function pgtap.view_owner_is(name_name_text) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
