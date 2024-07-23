BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', '_expand_context', ARRAY['character']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', '_expand_context', ARRAY['character']::TEXT[], 'dbo', 'Function pgtap._expand_context(character) should have the correct owner.');

  SELECT function_lang_is('pgtap', '_expand_context', ARRAY['character']::TEXT[], 'sql', 'Function pgtap._expand_context(character) should have the correct language.');

  SELECT function_returns('pgtap', '_expand_context', ARRAY['character']::TEXT[], 'text', 'Function pgtap._expand_context(character) should have the correct return type.');

  SELECT isnt_definer('pgtap', '_expand_context', ARRAY['character']::TEXT[], 'Function pgtap._expand_context(character) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', '_expand_context', ARRAY['character']::TEXT[], 'Function pgtap._expand_context(character) should not be strict.');

  SELECT is_normal_function('pgtap', '_expand_context', ARRAY['character']::TEXT[], 'Function pgtap._expand_context(character) should be a normal function.');

  SELECT isnt_aggregate('pgtap', '_expand_context', ARRAY['character']::TEXT[], 'Function pgtap._expand_context(character) should not be an aggregate function.');

  SELECT isnt_window('pgtap', '_expand_context', ARRAY['character']::TEXT[], 'Function pgtap._expand_context(character) should not be a window function.');

  SELECT isnt_procedure('pgtap', '_expand_context', ARRAY['character']::TEXT[], 'Function pgtap._expand_context(character) should not be a procedure.');

  SELECT volatility_is('pgtap', '_expand_context', ARRAY['character']::TEXT[], 'i', 'Function pgtap._expand_context(character) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
