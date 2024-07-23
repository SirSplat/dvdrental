BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'check_test', ARRAY['text', 'boolean', 'text']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'check_test', ARRAY['text', 'boolean', 'text']::TEXT[], 'dbo', 'Function pgtap.check_test(text_boolean_text) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'check_test', ARRAY['text', 'boolean', 'text']::TEXT[], 'sql', 'Function pgtap.check_test(text_boolean_text) should have the correct language.');

  SELECT function_returns('pgtap', 'check_test', ARRAY['text', 'boolean', 'text']::TEXT[], 'setof text', 'Function pgtap.check_test(text_boolean_text) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'check_test', ARRAY['text', 'boolean', 'text']::TEXT[], 'Function pgtap.check_test(text_boolean_text) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'check_test', ARRAY['text', 'boolean', 'text']::TEXT[], 'Function pgtap.check_test(text_boolean_text) should not be strict.');

  SELECT is_normal_function('pgtap', 'check_test', ARRAY['text', 'boolean', 'text']::TEXT[], 'Function pgtap.check_test(text_boolean_text) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'check_test', ARRAY['text', 'boolean', 'text']::TEXT[], 'Function pgtap.check_test(text_boolean_text) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'check_test', ARRAY['text', 'boolean', 'text']::TEXT[], 'Function pgtap.check_test(text_boolean_text) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'check_test', ARRAY['text', 'boolean', 'text']::TEXT[], 'Function pgtap.check_test(text_boolean_text) should not be a procedure.');

  SELECT volatility_is('pgtap', 'check_test', ARRAY['text', 'boolean', 'text']::TEXT[], 'v', 'Function pgtap.check_test(text_boolean_text) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
