BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'has_enum', ARRAY['name']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'has_enum', ARRAY['name']::TEXT[], 'dbo', 'Function pgtap.has_enum(name) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'has_enum', ARRAY['name']::TEXT[], 'sql', 'Function pgtap.has_enum(name) should have the correct language.');

  SELECT function_returns('pgtap', 'has_enum', ARRAY['name']::TEXT[], 'text', 'Function pgtap.has_enum(name) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'has_enum', ARRAY['name']::TEXT[], 'Function pgtap.has_enum(name) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'has_enum', ARRAY['name']::TEXT[], 'Function pgtap.has_enum(name) should not be strict.');

  SELECT is_normal_function('pgtap', 'has_enum', ARRAY['name']::TEXT[], 'Function pgtap.has_enum(name) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'has_enum', ARRAY['name']::TEXT[], 'Function pgtap.has_enum(name) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'has_enum', ARRAY['name']::TEXT[], 'Function pgtap.has_enum(name) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'has_enum', ARRAY['name']::TEXT[], 'Function pgtap.has_enum(name) should not be a procedure.');

  SELECT volatility_is('pgtap', 'has_enum', ARRAY['name']::TEXT[], 'v', 'Function pgtap.has_enum(name) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
