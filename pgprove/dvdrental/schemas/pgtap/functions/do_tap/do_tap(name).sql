BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'do_tap', ARRAY['name']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'do_tap', ARRAY['name']::TEXT[], 'dbo', 'Function pgtap.do_tap(name) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'do_tap', ARRAY['name']::TEXT[], 'sql', 'Function pgtap.do_tap(name) should have the correct language.');

  SELECT function_returns('pgtap', 'do_tap', ARRAY['name']::TEXT[], 'setof text', 'Function pgtap.do_tap(name) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'do_tap', ARRAY['name']::TEXT[], 'Function pgtap.do_tap(name) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'do_tap', ARRAY['name']::TEXT[], 'Function pgtap.do_tap(name) should not be strict.');

  SELECT is_normal_function('pgtap', 'do_tap', ARRAY['name']::TEXT[], 'Function pgtap.do_tap(name) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'do_tap', ARRAY['name']::TEXT[], 'Function pgtap.do_tap(name) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'do_tap', ARRAY['name']::TEXT[], 'Function pgtap.do_tap(name) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'do_tap', ARRAY['name']::TEXT[], 'Function pgtap.do_tap(name) should not be a procedure.');

  SELECT volatility_is('pgtap', 'do_tap', ARRAY['name']::TEXT[], 'v', 'Function pgtap.do_tap(name) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
