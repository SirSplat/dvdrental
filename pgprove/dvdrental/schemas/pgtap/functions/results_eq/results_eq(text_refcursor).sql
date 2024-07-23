BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'results_eq', ARRAY['text', 'refcursor']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'results_eq', ARRAY['text', 'refcursor']::TEXT[], 'dbo', 'Function pgtap.results_eq(text_refcursor) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'results_eq', ARRAY['text', 'refcursor']::TEXT[], 'sql', 'Function pgtap.results_eq(text_refcursor) should have the correct language.');

  SELECT function_returns('pgtap', 'results_eq', ARRAY['text', 'refcursor']::TEXT[], 'text', 'Function pgtap.results_eq(text_refcursor) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'results_eq', ARRAY['text', 'refcursor']::TEXT[], 'Function pgtap.results_eq(text_refcursor) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'results_eq', ARRAY['text', 'refcursor']::TEXT[], 'Function pgtap.results_eq(text_refcursor) should not be strict.');

  SELECT is_normal_function('pgtap', 'results_eq', ARRAY['text', 'refcursor']::TEXT[], 'Function pgtap.results_eq(text_refcursor) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'results_eq', ARRAY['text', 'refcursor']::TEXT[], 'Function pgtap.results_eq(text_refcursor) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'results_eq', ARRAY['text', 'refcursor']::TEXT[], 'Function pgtap.results_eq(text_refcursor) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'results_eq', ARRAY['text', 'refcursor']::TEXT[], 'Function pgtap.results_eq(text_refcursor) should not be a procedure.');

  SELECT volatility_is('pgtap', 'results_eq', ARRAY['text', 'refcursor']::TEXT[], 'v', 'Function pgtap.results_eq(text_refcursor) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
