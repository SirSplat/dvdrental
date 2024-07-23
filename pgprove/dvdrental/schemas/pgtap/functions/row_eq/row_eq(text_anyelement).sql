BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'row_eq', ARRAY['text', 'anyelement']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'row_eq', ARRAY['text', 'anyelement']::TEXT[], 'dbo', 'Function pgtap.row_eq(text_anyelement) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'row_eq', ARRAY['text', 'anyelement']::TEXT[], 'sql', 'Function pgtap.row_eq(text_anyelement) should have the correct language.');

  SELECT function_returns('pgtap', 'row_eq', ARRAY['text', 'anyelement']::TEXT[], 'text', 'Function pgtap.row_eq(text_anyelement) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'row_eq', ARRAY['text', 'anyelement']::TEXT[], 'Function pgtap.row_eq(text_anyelement) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'row_eq', ARRAY['text', 'anyelement']::TEXT[], 'Function pgtap.row_eq(text_anyelement) should not be strict.');

  SELECT is_normal_function('pgtap', 'row_eq', ARRAY['text', 'anyelement']::TEXT[], 'Function pgtap.row_eq(text_anyelement) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'row_eq', ARRAY['text', 'anyelement']::TEXT[], 'Function pgtap.row_eq(text_anyelement) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'row_eq', ARRAY['text', 'anyelement']::TEXT[], 'Function pgtap.row_eq(text_anyelement) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'row_eq', ARRAY['text', 'anyelement']::TEXT[], 'Function pgtap.row_eq(text_anyelement) should not be a procedure.');

  SELECT volatility_is('pgtap', 'row_eq', ARRAY['text', 'anyelement']::TEXT[], 'v', 'Function pgtap.row_eq(text_anyelement) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
