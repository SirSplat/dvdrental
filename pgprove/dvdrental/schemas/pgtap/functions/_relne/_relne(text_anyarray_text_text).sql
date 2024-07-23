BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', '_relne', ARRAY['text', 'anyarray', 'text', 'text']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', '_relne', ARRAY['text', 'anyarray', 'text', 'text']::TEXT[], 'dbo', 'Function pgtap._relne(text_anyarray_text_text) should have the correct owner.');

  SELECT function_lang_is('pgtap', '_relne', ARRAY['text', 'anyarray', 'text', 'text']::TEXT[], 'sql', 'Function pgtap._relne(text_anyarray_text_text) should have the correct language.');

  SELECT function_returns('pgtap', '_relne', ARRAY['text', 'anyarray', 'text', 'text']::TEXT[], 'text', 'Function pgtap._relne(text_anyarray_text_text) should have the correct return type.');

  SELECT isnt_definer('pgtap', '_relne', ARRAY['text', 'anyarray', 'text', 'text']::TEXT[], 'Function pgtap._relne(text_anyarray_text_text) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', '_relne', ARRAY['text', 'anyarray', 'text', 'text']::TEXT[], 'Function pgtap._relne(text_anyarray_text_text) should not be strict.');

  SELECT is_normal_function('pgtap', '_relne', ARRAY['text', 'anyarray', 'text', 'text']::TEXT[], 'Function pgtap._relne(text_anyarray_text_text) should be a normal function.');

  SELECT isnt_aggregate('pgtap', '_relne', ARRAY['text', 'anyarray', 'text', 'text']::TEXT[], 'Function pgtap._relne(text_anyarray_text_text) should not be an aggregate function.');

  SELECT isnt_window('pgtap', '_relne', ARRAY['text', 'anyarray', 'text', 'text']::TEXT[], 'Function pgtap._relne(text_anyarray_text_text) should not be a window function.');

  SELECT isnt_procedure('pgtap', '_relne', ARRAY['text', 'anyarray', 'text', 'text']::TEXT[], 'Function pgtap._relne(text_anyarray_text_text) should not be a procedure.');

  SELECT volatility_is('pgtap', '_relne', ARRAY['text', 'anyarray', 'text', 'text']::TEXT[], 'v', 'Function pgtap._relne(text_anyarray_text_text) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
