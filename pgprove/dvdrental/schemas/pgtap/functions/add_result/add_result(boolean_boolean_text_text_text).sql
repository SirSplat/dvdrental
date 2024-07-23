BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'add_result', ARRAY['boolean', 'boolean', 'text', 'text', 'text']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'add_result', ARRAY['boolean', 'boolean', 'text', 'text', 'text']::TEXT[], 'dbo', 'Function pgtap.add_result(boolean_boolean_text_text_text) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'add_result', ARRAY['boolean', 'boolean', 'text', 'text', 'text']::TEXT[], 'plpgsql', 'Function pgtap.add_result(boolean_boolean_text_text_text) should have the correct language.');

  SELECT function_returns('pgtap', 'add_result', ARRAY['boolean', 'boolean', 'text', 'text', 'text']::TEXT[], 'integer', 'Function pgtap.add_result(boolean_boolean_text_text_text) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'add_result', ARRAY['boolean', 'boolean', 'text', 'text', 'text']::TEXT[], 'Function pgtap.add_result(boolean_boolean_text_text_text) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'add_result', ARRAY['boolean', 'boolean', 'text', 'text', 'text']::TEXT[], 'Function pgtap.add_result(boolean_boolean_text_text_text) should not be strict.');

  SELECT is_normal_function('pgtap', 'add_result', ARRAY['boolean', 'boolean', 'text', 'text', 'text']::TEXT[], 'Function pgtap.add_result(boolean_boolean_text_text_text) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'add_result', ARRAY['boolean', 'boolean', 'text', 'text', 'text']::TEXT[], 'Function pgtap.add_result(boolean_boolean_text_text_text) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'add_result', ARRAY['boolean', 'boolean', 'text', 'text', 'text']::TEXT[], 'Function pgtap.add_result(boolean_boolean_text_text_text) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'add_result', ARRAY['boolean', 'boolean', 'text', 'text', 'text']::TEXT[], 'Function pgtap.add_result(boolean_boolean_text_text_text) should not be a procedure.');

  SELECT volatility_is('pgtap', 'add_result', ARRAY['boolean', 'boolean', 'text', 'text', 'text']::TEXT[], 'v', 'Function pgtap.add_result(boolean_boolean_text_text_text) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
