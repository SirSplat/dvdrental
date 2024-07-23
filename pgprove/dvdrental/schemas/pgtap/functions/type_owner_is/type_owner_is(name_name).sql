BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'type_owner_is', ARRAY['name', 'name']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'type_owner_is', ARRAY['name', 'name']::TEXT[], 'dbo', 'Function pgtap.type_owner_is(name_name) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'type_owner_is', ARRAY['name', 'name']::TEXT[], 'sql', 'Function pgtap.type_owner_is(name_name) should have the correct language.');

  SELECT function_returns('pgtap', 'type_owner_is', ARRAY['name', 'name']::TEXT[], 'text', 'Function pgtap.type_owner_is(name_name) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'type_owner_is', ARRAY['name', 'name']::TEXT[], 'Function pgtap.type_owner_is(name_name) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'type_owner_is', ARRAY['name', 'name']::TEXT[], 'Function pgtap.type_owner_is(name_name) should not be strict.');

  SELECT is_normal_function('pgtap', 'type_owner_is', ARRAY['name', 'name']::TEXT[], 'Function pgtap.type_owner_is(name_name) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'type_owner_is', ARRAY['name', 'name']::TEXT[], 'Function pgtap.type_owner_is(name_name) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'type_owner_is', ARRAY['name', 'name']::TEXT[], 'Function pgtap.type_owner_is(name_name) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'type_owner_is', ARRAY['name', 'name']::TEXT[], 'Function pgtap.type_owner_is(name_name) should not be a procedure.');

  SELECT volatility_is('pgtap', 'type_owner_is', ARRAY['name', 'name']::TEXT[], 'v', 'Function pgtap.type_owner_is(name_name) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
