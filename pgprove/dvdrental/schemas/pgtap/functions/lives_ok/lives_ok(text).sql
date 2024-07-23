BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'lives_ok', ARRAY['text']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'lives_ok', ARRAY['text']::TEXT[], 'dbo', 'Function pgtap.lives_ok(text) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'lives_ok', ARRAY['text']::TEXT[], 'sql', 'Function pgtap.lives_ok(text) should have the correct language.');

  SELECT function_returns('pgtap', 'lives_ok', ARRAY['text']::TEXT[], 'text', 'Function pgtap.lives_ok(text) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'lives_ok', ARRAY['text']::TEXT[], 'Function pgtap.lives_ok(text) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'lives_ok', ARRAY['text']::TEXT[], 'Function pgtap.lives_ok(text) should not be strict.');

  SELECT is_normal_function('pgtap', 'lives_ok', ARRAY['text']::TEXT[], 'Function pgtap.lives_ok(text) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'lives_ok', ARRAY['text']::TEXT[], 'Function pgtap.lives_ok(text) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'lives_ok', ARRAY['text']::TEXT[], 'Function pgtap.lives_ok(text) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'lives_ok', ARRAY['text']::TEXT[], 'Function pgtap.lives_ok(text) should not be a procedure.');

  SELECT volatility_is('pgtap', 'lives_ok', ARRAY['text']::TEXT[], 'v', 'Function pgtap.lives_ok(text) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
