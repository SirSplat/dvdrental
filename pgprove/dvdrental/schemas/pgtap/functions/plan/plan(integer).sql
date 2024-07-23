BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'plan', ARRAY['integer']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'plan', ARRAY['integer']::TEXT[], 'dbo', 'Function pgtap.plan(integer) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'plan', ARRAY['integer']::TEXT[], 'plpgsql', 'Function pgtap.plan(integer) should have the correct language.');

  SELECT function_returns('pgtap', 'plan', ARRAY['integer']::TEXT[], 'text', 'Function pgtap.plan(integer) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'plan', ARRAY['integer']::TEXT[], 'Function pgtap.plan(integer) should have the correct security invoker.');

  SELECT is_strict('pgtap', 'plan', ARRAY['integer']::TEXT[], 'Function pgtap.plan(integer) should be strict.');

  SELECT is_normal_function('pgtap', 'plan', ARRAY['integer']::TEXT[], 'Function pgtap.plan(integer) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'plan', ARRAY['integer']::TEXT[], 'Function pgtap.plan(integer) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'plan', ARRAY['integer']::TEXT[], 'Function pgtap.plan(integer) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'plan', ARRAY['integer']::TEXT[], 'Function pgtap.plan(integer) should not be a procedure.');

  SELECT volatility_is('pgtap', 'plan', ARRAY['integer']::TEXT[], 'v', 'Function pgtap.plan(integer) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
