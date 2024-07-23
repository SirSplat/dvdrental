BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', '_contract_on', ARRAY['text']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', '_contract_on', ARRAY['text']::TEXT[], 'dbo', 'Function pgtap._contract_on(text) should have the correct owner.');

  SELECT function_lang_is('pgtap', '_contract_on', ARRAY['text']::TEXT[], 'sql', 'Function pgtap._contract_on(text) should have the correct language.');

  SELECT function_returns('pgtap', '_contract_on', ARRAY['text']::TEXT[], '"char"', 'Function pgtap._contract_on(text) should have the correct return type.');

  SELECT isnt_definer('pgtap', '_contract_on', ARRAY['text']::TEXT[], 'Function pgtap._contract_on(text) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', '_contract_on', ARRAY['text']::TEXT[], 'Function pgtap._contract_on(text) should not be strict.');

  SELECT is_normal_function('pgtap', '_contract_on', ARRAY['text']::TEXT[], 'Function pgtap._contract_on(text) should be a normal function.');

  SELECT isnt_aggregate('pgtap', '_contract_on', ARRAY['text']::TEXT[], 'Function pgtap._contract_on(text) should not be an aggregate function.');

  SELECT isnt_window('pgtap', '_contract_on', ARRAY['text']::TEXT[], 'Function pgtap._contract_on(text) should not be a window function.');

  SELECT isnt_procedure('pgtap', '_contract_on', ARRAY['text']::TEXT[], 'Function pgtap._contract_on(text) should not be a procedure.');

  SELECT volatility_is('pgtap', '_contract_on', ARRAY['text']::TEXT[], 'i', 'Function pgtap._contract_on(text) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
