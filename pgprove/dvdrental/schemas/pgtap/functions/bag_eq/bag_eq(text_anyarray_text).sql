BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'bag_eq', ARRAY['text', 'anyarray', 'text']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'bag_eq', ARRAY['text', 'anyarray', 'text']::TEXT[], 'dbo', 'Function pgtap.bag_eq(text_anyarray_text) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'bag_eq', ARRAY['text', 'anyarray', 'text']::TEXT[], 'sql', 'Function pgtap.bag_eq(text_anyarray_text) should have the correct language.');

  SELECT function_returns('pgtap', 'bag_eq', ARRAY['text', 'anyarray', 'text']::TEXT[], 'text', 'Function pgtap.bag_eq(text_anyarray_text) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'bag_eq', ARRAY['text', 'anyarray', 'text']::TEXT[], 'Function pgtap.bag_eq(text_anyarray_text) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'bag_eq', ARRAY['text', 'anyarray', 'text']::TEXT[], 'Function pgtap.bag_eq(text_anyarray_text) should not be strict.');

  SELECT is_normal_function('pgtap', 'bag_eq', ARRAY['text', 'anyarray', 'text']::TEXT[], 'Function pgtap.bag_eq(text_anyarray_text) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'bag_eq', ARRAY['text', 'anyarray', 'text']::TEXT[], 'Function pgtap.bag_eq(text_anyarray_text) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'bag_eq', ARRAY['text', 'anyarray', 'text']::TEXT[], 'Function pgtap.bag_eq(text_anyarray_text) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'bag_eq', ARRAY['text', 'anyarray', 'text']::TEXT[], 'Function pgtap.bag_eq(text_anyarray_text) should not be a procedure.');

  SELECT volatility_is('pgtap', 'bag_eq', ARRAY['text', 'anyarray', 'text']::TEXT[], 'v', 'Function pgtap.bag_eq(text_anyarray_text) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
