BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'format_type_string', ARRAY['text']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'format_type_string', ARRAY['text']::TEXT[], 'dbo', 'Function pgtap.format_type_string(text) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'format_type_string', ARRAY['text']::TEXT[], 'plpgsql', 'Function pgtap.format_type_string(text) should have the correct language.');

  SELECT function_returns('pgtap', 'format_type_string', ARRAY['text']::TEXT[], 'text', 'Function pgtap.format_type_string(text) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'format_type_string', ARRAY['text']::TEXT[], 'Function pgtap.format_type_string(text) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'format_type_string', ARRAY['text']::TEXT[], 'Function pgtap.format_type_string(text) should not be strict.');

  SELECT is_normal_function('pgtap', 'format_type_string', ARRAY['text']::TEXT[], 'Function pgtap.format_type_string(text) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'format_type_string', ARRAY['text']::TEXT[], 'Function pgtap.format_type_string(text) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'format_type_string', ARRAY['text']::TEXT[], 'Function pgtap.format_type_string(text) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'format_type_string', ARRAY['text']::TEXT[], 'Function pgtap.format_type_string(text) should not be a procedure.');

  SELECT volatility_is('pgtap', 'format_type_string', ARRAY['text']::TEXT[], 's', 'Function pgtap.format_type_string(text) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
