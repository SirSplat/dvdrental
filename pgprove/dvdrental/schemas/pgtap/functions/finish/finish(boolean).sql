BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'finish', ARRAY['boolean']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'finish', ARRAY['boolean']::TEXT[], 'dbo', 'Function pgtap.finish(boolean) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'finish', ARRAY['boolean']::TEXT[], 'sql', 'Function pgtap.finish(boolean) should have the correct language.');

  SELECT function_returns('pgtap', 'finish', ARRAY['boolean']::TEXT[], 'setof text', 'Function pgtap.finish(boolean) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'finish', ARRAY['boolean']::TEXT[], 'Function pgtap.finish(boolean) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'finish', ARRAY['boolean']::TEXT[], 'Function pgtap.finish(boolean) should not be strict.');

  SELECT is_normal_function('pgtap', 'finish', ARRAY['boolean']::TEXT[], 'Function pgtap.finish(boolean) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'finish', ARRAY['boolean']::TEXT[], 'Function pgtap.finish(boolean) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'finish', ARRAY['boolean']::TEXT[], 'Function pgtap.finish(boolean) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'finish', ARRAY['boolean']::TEXT[], 'Function pgtap.finish(boolean) should not be a procedure.');

  SELECT volatility_is('pgtap', 'finish', ARRAY['boolean']::TEXT[], 'v', 'Function pgtap.finish(boolean) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
