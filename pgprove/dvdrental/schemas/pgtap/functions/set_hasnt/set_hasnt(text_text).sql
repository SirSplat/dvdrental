BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'set_hasnt', ARRAY['text', 'text']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'set_hasnt', ARRAY['text', 'text']::TEXT[], 'dbo', 'Function pgtap.set_hasnt(text_text) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'set_hasnt', ARRAY['text', 'text']::TEXT[], 'sql', 'Function pgtap.set_hasnt(text_text) should have the correct language.');

  SELECT function_returns('pgtap', 'set_hasnt', ARRAY['text', 'text']::TEXT[], 'text', 'Function pgtap.set_hasnt(text_text) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'set_hasnt', ARRAY['text', 'text']::TEXT[], 'Function pgtap.set_hasnt(text_text) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'set_hasnt', ARRAY['text', 'text']::TEXT[], 'Function pgtap.set_hasnt(text_text) should not be strict.');

  SELECT is_normal_function('pgtap', 'set_hasnt', ARRAY['text', 'text']::TEXT[], 'Function pgtap.set_hasnt(text_text) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'set_hasnt', ARRAY['text', 'text']::TEXT[], 'Function pgtap.set_hasnt(text_text) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'set_hasnt', ARRAY['text', 'text']::TEXT[], 'Function pgtap.set_hasnt(text_text) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'set_hasnt', ARRAY['text', 'text']::TEXT[], 'Function pgtap.set_hasnt(text_text) should not be a procedure.');

  SELECT volatility_is('pgtap', 'set_hasnt', ARRAY['text', 'text']::TEXT[], 'v', 'Function pgtap.set_hasnt(text_text) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
