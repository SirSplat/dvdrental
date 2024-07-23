BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'skip', ARRAY['text', 'integer']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'skip', ARRAY['text', 'integer']::TEXT[], 'dbo', 'Function pgtap.skip(text_integer) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'skip', ARRAY['text', 'integer']::TEXT[], 'plpgsql', 'Function pgtap.skip(text_integer) should have the correct language.');

  SELECT function_returns('pgtap', 'skip', ARRAY['text', 'integer']::TEXT[], 'text', 'Function pgtap.skip(text_integer) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'skip', ARRAY['text', 'integer']::TEXT[], 'Function pgtap.skip(text_integer) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'skip', ARRAY['text', 'integer']::TEXT[], 'Function pgtap.skip(text_integer) should not be strict.');

  SELECT is_normal_function('pgtap', 'skip', ARRAY['text', 'integer']::TEXT[], 'Function pgtap.skip(text_integer) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'skip', ARRAY['text', 'integer']::TEXT[], 'Function pgtap.skip(text_integer) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'skip', ARRAY['text', 'integer']::TEXT[], 'Function pgtap.skip(text_integer) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'skip', ARRAY['text', 'integer']::TEXT[], 'Function pgtap.skip(text_integer) should not be a procedure.');

  SELECT volatility_is('pgtap', 'skip', ARRAY['text', 'integer']::TEXT[], 'v', 'Function pgtap.skip(text_integer) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
