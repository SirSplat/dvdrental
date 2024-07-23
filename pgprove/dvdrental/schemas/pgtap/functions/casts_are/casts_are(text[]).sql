BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'casts_are', ARRAY['text[]']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'casts_are', ARRAY['text[]']::TEXT[], 'dbo', 'Function pgtap.casts_are(text[]) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'casts_are', ARRAY['text[]']::TEXT[], 'sql', 'Function pgtap.casts_are(text[]) should have the correct language.');

  SELECT function_returns('pgtap', 'casts_are', ARRAY['text[]']::TEXT[], 'text', 'Function pgtap.casts_are(text[]) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'casts_are', ARRAY['text[]']::TEXT[], 'Function pgtap.casts_are(text[]) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'casts_are', ARRAY['text[]']::TEXT[], 'Function pgtap.casts_are(text[]) should not be strict.');

  SELECT is_normal_function('pgtap', 'casts_are', ARRAY['text[]']::TEXT[], 'Function pgtap.casts_are(text[]) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'casts_are', ARRAY['text[]']::TEXT[], 'Function pgtap.casts_are(text[]) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'casts_are', ARRAY['text[]']::TEXT[], 'Function pgtap.casts_are(text[]) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'casts_are', ARRAY['text[]']::TEXT[], 'Function pgtap.casts_are(text[]) should not be a procedure.');

  SELECT volatility_is('pgtap', 'casts_are', ARRAY['text[]']::TEXT[], 'v', 'Function pgtap.casts_are(text[]) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
