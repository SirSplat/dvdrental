BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'doesnt_imatch', ARRAY['anyelement', 'text']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'doesnt_imatch', ARRAY['anyelement', 'text']::TEXT[], 'dbo', 'Function pgtap.doesnt_imatch(anyelement_text) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'doesnt_imatch', ARRAY['anyelement', 'text']::TEXT[], 'sql', 'Function pgtap.doesnt_imatch(anyelement_text) should have the correct language.');

  SELECT function_returns('pgtap', 'doesnt_imatch', ARRAY['anyelement', 'text']::TEXT[], 'text', 'Function pgtap.doesnt_imatch(anyelement_text) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'doesnt_imatch', ARRAY['anyelement', 'text']::TEXT[], 'Function pgtap.doesnt_imatch(anyelement_text) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'doesnt_imatch', ARRAY['anyelement', 'text']::TEXT[], 'Function pgtap.doesnt_imatch(anyelement_text) should not be strict.');

  SELECT is_normal_function('pgtap', 'doesnt_imatch', ARRAY['anyelement', 'text']::TEXT[], 'Function pgtap.doesnt_imatch(anyelement_text) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'doesnt_imatch', ARRAY['anyelement', 'text']::TEXT[], 'Function pgtap.doesnt_imatch(anyelement_text) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'doesnt_imatch', ARRAY['anyelement', 'text']::TEXT[], 'Function pgtap.doesnt_imatch(anyelement_text) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'doesnt_imatch', ARRAY['anyelement', 'text']::TEXT[], 'Function pgtap.doesnt_imatch(anyelement_text) should not be a procedure.');

  SELECT volatility_is('pgtap', 'doesnt_imatch', ARRAY['anyelement', 'text']::TEXT[], 'v', 'Function pgtap.doesnt_imatch(anyelement_text) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
