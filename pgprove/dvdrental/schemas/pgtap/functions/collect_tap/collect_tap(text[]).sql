BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'collect_tap', ARRAY['text[]']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'collect_tap', ARRAY['text[]']::TEXT[], 'dbo', 'Function pgtap.collect_tap(text[]) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'collect_tap', ARRAY['text[]']::TEXT[], 'sql', 'Function pgtap.collect_tap(text[]) should have the correct language.');

  SELECT function_returns('pgtap', 'collect_tap', ARRAY['text[]']::TEXT[], 'text', 'Function pgtap.collect_tap(text[]) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'collect_tap', ARRAY['text[]']::TEXT[], 'Function pgtap.collect_tap(text[]) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'collect_tap', ARRAY['text[]']::TEXT[], 'Function pgtap.collect_tap(text[]) should not be strict.');

  SELECT is_normal_function('pgtap', 'collect_tap', ARRAY['text[]']::TEXT[], 'Function pgtap.collect_tap(text[]) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'collect_tap', ARRAY['text[]']::TEXT[], 'Function pgtap.collect_tap(text[]) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'collect_tap', ARRAY['text[]']::TEXT[], 'Function pgtap.collect_tap(text[]) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'collect_tap', ARRAY['text[]']::TEXT[], 'Function pgtap.collect_tap(text[]) should not be a procedure.');

  SELECT volatility_is('pgtap', 'collect_tap', ARRAY['text[]']::TEXT[], 'v', 'Function pgtap.collect_tap(text[]) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
