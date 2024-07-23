BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'can', ARRAY['name[]']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'can', ARRAY['name[]']::TEXT[], 'dbo', 'Function pgtap.can(name[]) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'can', ARRAY['name[]']::TEXT[], 'sql', 'Function pgtap.can(name[]) should have the correct language.');

  SELECT function_returns('pgtap', 'can', ARRAY['name[]']::TEXT[], 'text', 'Function pgtap.can(name[]) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'can', ARRAY['name[]']::TEXT[], 'Function pgtap.can(name[]) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'can', ARRAY['name[]']::TEXT[], 'Function pgtap.can(name[]) should not be strict.');

  SELECT is_normal_function('pgtap', 'can', ARRAY['name[]']::TEXT[], 'Function pgtap.can(name[]) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'can', ARRAY['name[]']::TEXT[], 'Function pgtap.can(name[]) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'can', ARRAY['name[]']::TEXT[], 'Function pgtap.can(name[]) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'can', ARRAY['name[]']::TEXT[], 'Function pgtap.can(name[]) should not be a procedure.');

  SELECT volatility_is('pgtap', 'can', ARRAY['name[]']::TEXT[], 'v', 'Function pgtap.can(name[]) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
