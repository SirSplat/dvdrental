BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'alike', ARRAY['anyelement', 'text', 'text']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'alike', ARRAY['anyelement', 'text', 'text']::TEXT[], 'dbo', 'Function pgtap.alike(anyelement_text_text) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'alike', ARRAY['anyelement', 'text', 'text']::TEXT[], 'sql', 'Function pgtap.alike(anyelement_text_text) should have the correct language.');

  SELECT function_returns('pgtap', 'alike', ARRAY['anyelement', 'text', 'text']::TEXT[], 'text', 'Function pgtap.alike(anyelement_text_text) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'alike', ARRAY['anyelement', 'text', 'text']::TEXT[], 'Function pgtap.alike(anyelement_text_text) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'alike', ARRAY['anyelement', 'text', 'text']::TEXT[], 'Function pgtap.alike(anyelement_text_text) should not be strict.');

  SELECT is_normal_function('pgtap', 'alike', ARRAY['anyelement', 'text', 'text']::TEXT[], 'Function pgtap.alike(anyelement_text_text) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'alike', ARRAY['anyelement', 'text', 'text']::TEXT[], 'Function pgtap.alike(anyelement_text_text) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'alike', ARRAY['anyelement', 'text', 'text']::TEXT[], 'Function pgtap.alike(anyelement_text_text) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'alike', ARRAY['anyelement', 'text', 'text']::TEXT[], 'Function pgtap.alike(anyelement_text_text) should not be a procedure.');

  SELECT volatility_is('pgtap', 'alike', ARRAY['anyelement', 'text', 'text']::TEXT[], 'v', 'Function pgtap.alike(anyelement_text_text) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
