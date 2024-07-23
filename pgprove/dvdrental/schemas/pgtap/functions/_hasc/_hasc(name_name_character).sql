BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', '_hasc', ARRAY['name', 'name', 'character']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', '_hasc', ARRAY['name', 'name', 'character']::TEXT[], 'dbo', 'Function pgtap._hasc(name_name_character) should have the correct owner.');

  SELECT function_lang_is('pgtap', '_hasc', ARRAY['name', 'name', 'character']::TEXT[], 'sql', 'Function pgtap._hasc(name_name_character) should have the correct language.');

  SELECT function_returns('pgtap', '_hasc', ARRAY['name', 'name', 'character']::TEXT[], 'boolean', 'Function pgtap._hasc(name_name_character) should have the correct return type.');

  SELECT isnt_definer('pgtap', '_hasc', ARRAY['name', 'name', 'character']::TEXT[], 'Function pgtap._hasc(name_name_character) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', '_hasc', ARRAY['name', 'name', 'character']::TEXT[], 'Function pgtap._hasc(name_name_character) should not be strict.');

  SELECT is_normal_function('pgtap', '_hasc', ARRAY['name', 'name', 'character']::TEXT[], 'Function pgtap._hasc(name_name_character) should be a normal function.');

  SELECT isnt_aggregate('pgtap', '_hasc', ARRAY['name', 'name', 'character']::TEXT[], 'Function pgtap._hasc(name_name_character) should not be an aggregate function.');

  SELECT isnt_window('pgtap', '_hasc', ARRAY['name', 'name', 'character']::TEXT[], 'Function pgtap._hasc(name_name_character) should not be a window function.');

  SELECT isnt_procedure('pgtap', '_hasc', ARRAY['name', 'name', 'character']::TEXT[], 'Function pgtap._hasc(name_name_character) should not be a procedure.');

  SELECT volatility_is('pgtap', '_hasc', ARRAY['name', 'name', 'character']::TEXT[], 'v', 'Function pgtap._hasc(name_name_character) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
