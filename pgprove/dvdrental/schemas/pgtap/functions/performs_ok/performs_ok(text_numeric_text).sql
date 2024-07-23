BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'performs_ok', ARRAY['text', 'numeric', 'text']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'performs_ok', ARRAY['text', 'numeric', 'text']::TEXT[], 'dbo', 'Function pgtap.performs_ok(text_numeric_text) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'performs_ok', ARRAY['text', 'numeric', 'text']::TEXT[], 'plpgsql', 'Function pgtap.performs_ok(text_numeric_text) should have the correct language.');

  SELECT function_returns('pgtap', 'performs_ok', ARRAY['text', 'numeric', 'text']::TEXT[], 'text', 'Function pgtap.performs_ok(text_numeric_text) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'performs_ok', ARRAY['text', 'numeric', 'text']::TEXT[], 'Function pgtap.performs_ok(text_numeric_text) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'performs_ok', ARRAY['text', 'numeric', 'text']::TEXT[], 'Function pgtap.performs_ok(text_numeric_text) should not be strict.');

  SELECT is_normal_function('pgtap', 'performs_ok', ARRAY['text', 'numeric', 'text']::TEXT[], 'Function pgtap.performs_ok(text_numeric_text) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'performs_ok', ARRAY['text', 'numeric', 'text']::TEXT[], 'Function pgtap.performs_ok(text_numeric_text) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'performs_ok', ARRAY['text', 'numeric', 'text']::TEXT[], 'Function pgtap.performs_ok(text_numeric_text) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'performs_ok', ARRAY['text', 'numeric', 'text']::TEXT[], 'Function pgtap.performs_ok(text_numeric_text) should not be a procedure.');

  SELECT volatility_is('pgtap', 'performs_ok', ARRAY['text', 'numeric', 'text']::TEXT[], 'v', 'Function pgtap.performs_ok(text_numeric_text) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
