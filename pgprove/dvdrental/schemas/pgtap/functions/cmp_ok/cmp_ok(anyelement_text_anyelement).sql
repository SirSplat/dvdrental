BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'cmp_ok', ARRAY['anyelement', 'text', 'anyelement']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'cmp_ok', ARRAY['anyelement', 'text', 'anyelement']::TEXT[], 'dbo', 'Function pgtap.cmp_ok(anyelement_text_anyelement) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'cmp_ok', ARRAY['anyelement', 'text', 'anyelement']::TEXT[], 'sql', 'Function pgtap.cmp_ok(anyelement_text_anyelement) should have the correct language.');

  SELECT function_returns('pgtap', 'cmp_ok', ARRAY['anyelement', 'text', 'anyelement']::TEXT[], 'text', 'Function pgtap.cmp_ok(anyelement_text_anyelement) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'cmp_ok', ARRAY['anyelement', 'text', 'anyelement']::TEXT[], 'Function pgtap.cmp_ok(anyelement_text_anyelement) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'cmp_ok', ARRAY['anyelement', 'text', 'anyelement']::TEXT[], 'Function pgtap.cmp_ok(anyelement_text_anyelement) should not be strict.');

  SELECT is_normal_function('pgtap', 'cmp_ok', ARRAY['anyelement', 'text', 'anyelement']::TEXT[], 'Function pgtap.cmp_ok(anyelement_text_anyelement) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'cmp_ok', ARRAY['anyelement', 'text', 'anyelement']::TEXT[], 'Function pgtap.cmp_ok(anyelement_text_anyelement) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'cmp_ok', ARRAY['anyelement', 'text', 'anyelement']::TEXT[], 'Function pgtap.cmp_ok(anyelement_text_anyelement) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'cmp_ok', ARRAY['anyelement', 'text', 'anyelement']::TEXT[], 'Function pgtap.cmp_ok(anyelement_text_anyelement) should not be a procedure.');

  SELECT volatility_is('pgtap', 'cmp_ok', ARRAY['anyelement', 'text', 'anyelement']::TEXT[], 'v', 'Function pgtap.cmp_ok(anyelement_text_anyelement) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
