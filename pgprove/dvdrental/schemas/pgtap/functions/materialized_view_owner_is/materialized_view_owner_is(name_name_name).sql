BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'materialized_view_owner_is', ARRAY['name', 'name', 'name']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'materialized_view_owner_is', ARRAY['name', 'name', 'name']::TEXT[], 'dbo', 'Function pgtap.materialized_view_owner_is(name_name_name) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'materialized_view_owner_is', ARRAY['name', 'name', 'name']::TEXT[], 'sql', 'Function pgtap.materialized_view_owner_is(name_name_name) should have the correct language.');

  SELECT function_returns('pgtap', 'materialized_view_owner_is', ARRAY['name', 'name', 'name']::TEXT[], 'text', 'Function pgtap.materialized_view_owner_is(name_name_name) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'materialized_view_owner_is', ARRAY['name', 'name', 'name']::TEXT[], 'Function pgtap.materialized_view_owner_is(name_name_name) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'materialized_view_owner_is', ARRAY['name', 'name', 'name']::TEXT[], 'Function pgtap.materialized_view_owner_is(name_name_name) should not be strict.');

  SELECT is_normal_function('pgtap', 'materialized_view_owner_is', ARRAY['name', 'name', 'name']::TEXT[], 'Function pgtap.materialized_view_owner_is(name_name_name) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'materialized_view_owner_is', ARRAY['name', 'name', 'name']::TEXT[], 'Function pgtap.materialized_view_owner_is(name_name_name) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'materialized_view_owner_is', ARRAY['name', 'name', 'name']::TEXT[], 'Function pgtap.materialized_view_owner_is(name_name_name) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'materialized_view_owner_is', ARRAY['name', 'name', 'name']::TEXT[], 'Function pgtap.materialized_view_owner_is(name_name_name) should not be a procedure.');

  SELECT volatility_is('pgtap', 'materialized_view_owner_is', ARRAY['name', 'name', 'name']::TEXT[], 'v', 'Function pgtap.materialized_view_owner_is(name_name_name) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
