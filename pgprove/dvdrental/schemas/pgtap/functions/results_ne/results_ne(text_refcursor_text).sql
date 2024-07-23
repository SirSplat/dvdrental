BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'results_ne', ARRAY['text', 'refcursor', 'text']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'results_ne', ARRAY['text', 'refcursor', 'text']::TEXT[], 'dbo', 'Function pgtap.results_ne(text_refcursor_text) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'results_ne', ARRAY['text', 'refcursor', 'text']::TEXT[], 'plpgsql', 'Function pgtap.results_ne(text_refcursor_text) should have the correct language.');

  SELECT function_returns('pgtap', 'results_ne', ARRAY['text', 'refcursor', 'text']::TEXT[], 'text', 'Function pgtap.results_ne(text_refcursor_text) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'results_ne', ARRAY['text', 'refcursor', 'text']::TEXT[], 'Function pgtap.results_ne(text_refcursor_text) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'results_ne', ARRAY['text', 'refcursor', 'text']::TEXT[], 'Function pgtap.results_ne(text_refcursor_text) should not be strict.');

  SELECT is_normal_function('pgtap', 'results_ne', ARRAY['text', 'refcursor', 'text']::TEXT[], 'Function pgtap.results_ne(text_refcursor_text) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'results_ne', ARRAY['text', 'refcursor', 'text']::TEXT[], 'Function pgtap.results_ne(text_refcursor_text) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'results_ne', ARRAY['text', 'refcursor', 'text']::TEXT[], 'Function pgtap.results_ne(text_refcursor_text) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'results_ne', ARRAY['text', 'refcursor', 'text']::TEXT[], 'Function pgtap.results_ne(text_refcursor_text) should not be a procedure.');

  SELECT volatility_is('pgtap', 'results_ne', ARRAY['text', 'refcursor', 'text']::TEXT[], 'v', 'Function pgtap.results_ne(text_refcursor_text) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
