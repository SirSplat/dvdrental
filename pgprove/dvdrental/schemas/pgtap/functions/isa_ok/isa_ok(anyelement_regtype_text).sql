BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'isa_ok', ARRAY['anyelement', 'regtype', 'text']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'isa_ok', ARRAY['anyelement', 'regtype', 'text']::TEXT[], 'dbo', 'Function pgtap.isa_ok(anyelement_regtype_text) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'isa_ok', ARRAY['anyelement', 'regtype', 'text']::TEXT[], 'plpgsql', 'Function pgtap.isa_ok(anyelement_regtype_text) should have the correct language.');

  SELECT function_returns('pgtap', 'isa_ok', ARRAY['anyelement', 'regtype', 'text']::TEXT[], 'text', 'Function pgtap.isa_ok(anyelement_regtype_text) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'isa_ok', ARRAY['anyelement', 'regtype', 'text']::TEXT[], 'Function pgtap.isa_ok(anyelement_regtype_text) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'isa_ok', ARRAY['anyelement', 'regtype', 'text']::TEXT[], 'Function pgtap.isa_ok(anyelement_regtype_text) should not be strict.');

  SELECT is_normal_function('pgtap', 'isa_ok', ARRAY['anyelement', 'regtype', 'text']::TEXT[], 'Function pgtap.isa_ok(anyelement_regtype_text) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'isa_ok', ARRAY['anyelement', 'regtype', 'text']::TEXT[], 'Function pgtap.isa_ok(anyelement_regtype_text) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'isa_ok', ARRAY['anyelement', 'regtype', 'text']::TEXT[], 'Function pgtap.isa_ok(anyelement_regtype_text) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'isa_ok', ARRAY['anyelement', 'regtype', 'text']::TEXT[], 'Function pgtap.isa_ok(anyelement_regtype_text) should not be a procedure.');

  SELECT volatility_is('pgtap', 'isa_ok', ARRAY['anyelement', 'regtype', 'text']::TEXT[], 'v', 'Function pgtap.isa_ok(anyelement_regtype_text) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
