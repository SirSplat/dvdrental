BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'is', ARRAY['anyelement', 'anyelement', 'text']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'is', ARRAY['anyelement', 'anyelement', 'text']::TEXT[], 'dbo', 'Function pgtap.is(anyelement_anyelement_text) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'is', ARRAY['anyelement', 'anyelement', 'text']::TEXT[], 'plpgsql', 'Function pgtap.is(anyelement_anyelement_text) should have the correct language.');

  SELECT function_returns('pgtap', 'is', ARRAY['anyelement', 'anyelement', 'text']::TEXT[], 'text', 'Function pgtap.is(anyelement_anyelement_text) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'is', ARRAY['anyelement', 'anyelement', 'text']::TEXT[], 'Function pgtap.is(anyelement_anyelement_text) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'is', ARRAY['anyelement', 'anyelement', 'text']::TEXT[], 'Function pgtap.is(anyelement_anyelement_text) should not be strict.');

  SELECT is_normal_function('pgtap', 'is', ARRAY['anyelement', 'anyelement', 'text']::TEXT[], 'Function pgtap.is(anyelement_anyelement_text) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'is', ARRAY['anyelement', 'anyelement', 'text']::TEXT[], 'Function pgtap.is(anyelement_anyelement_text) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'is', ARRAY['anyelement', 'anyelement', 'text']::TEXT[], 'Function pgtap.is(anyelement_anyelement_text) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'is', ARRAY['anyelement', 'anyelement', 'text']::TEXT[], 'Function pgtap.is(anyelement_anyelement_text) should not be a procedure.');

  SELECT volatility_is('pgtap', 'is', ARRAY['anyelement', 'anyelement', 'text']::TEXT[], 'v', 'Function pgtap.is(anyelement_anyelement_text) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
