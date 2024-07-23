BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'throws_matching', ARRAY['text', 'text']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'throws_matching', ARRAY['text', 'text']::TEXT[], 'dbo', 'Function pgtap.throws_matching(text_text) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'throws_matching', ARRAY['text', 'text']::TEXT[], 'sql', 'Function pgtap.throws_matching(text_text) should have the correct language.');

  SELECT function_returns('pgtap', 'throws_matching', ARRAY['text', 'text']::TEXT[], 'text', 'Function pgtap.throws_matching(text_text) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'throws_matching', ARRAY['text', 'text']::TEXT[], 'Function pgtap.throws_matching(text_text) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'throws_matching', ARRAY['text', 'text']::TEXT[], 'Function pgtap.throws_matching(text_text) should not be strict.');

  SELECT is_normal_function('pgtap', 'throws_matching', ARRAY['text', 'text']::TEXT[], 'Function pgtap.throws_matching(text_text) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'throws_matching', ARRAY['text', 'text']::TEXT[], 'Function pgtap.throws_matching(text_text) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'throws_matching', ARRAY['text', 'text']::TEXT[], 'Function pgtap.throws_matching(text_text) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'throws_matching', ARRAY['text', 'text']::TEXT[], 'Function pgtap.throws_matching(text_text) should not be a procedure.');

  SELECT volatility_is('pgtap', 'throws_matching', ARRAY['text', 'text']::TEXT[], 'v', 'Function pgtap.throws_matching(text_text) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
