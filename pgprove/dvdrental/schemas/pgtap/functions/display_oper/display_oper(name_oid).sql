BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'display_oper', ARRAY['name', 'oid']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'display_oper', ARRAY['name', 'oid']::TEXT[], 'dbo', 'Function pgtap.display_oper(name_oid) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'display_oper', ARRAY['name', 'oid']::TEXT[], 'sql', 'Function pgtap.display_oper(name_oid) should have the correct language.');

  SELECT function_returns('pgtap', 'display_oper', ARRAY['name', 'oid']::TEXT[], 'text', 'Function pgtap.display_oper(name_oid) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'display_oper', ARRAY['name', 'oid']::TEXT[], 'Function pgtap.display_oper(name_oid) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'display_oper', ARRAY['name', 'oid']::TEXT[], 'Function pgtap.display_oper(name_oid) should not be strict.');

  SELECT is_normal_function('pgtap', 'display_oper', ARRAY['name', 'oid']::TEXT[], 'Function pgtap.display_oper(name_oid) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'display_oper', ARRAY['name', 'oid']::TEXT[], 'Function pgtap.display_oper(name_oid) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'display_oper', ARRAY['name', 'oid']::TEXT[], 'Function pgtap.display_oper(name_oid) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'display_oper', ARRAY['name', 'oid']::TEXT[], 'Function pgtap.display_oper(name_oid) should not be a procedure.');

  SELECT volatility_is('pgtap', 'display_oper', ARRAY['name', 'oid']::TEXT[], 'v', 'Function pgtap.display_oper(name_oid) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
