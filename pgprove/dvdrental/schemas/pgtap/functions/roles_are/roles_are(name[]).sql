BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'roles_are', ARRAY['name[]']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'roles_are', ARRAY['name[]']::TEXT[], 'dbo', 'Function pgtap.roles_are(name[]) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'roles_are', ARRAY['name[]']::TEXT[], 'sql', 'Function pgtap.roles_are(name[]) should have the correct language.');

  SELECT function_returns('pgtap', 'roles_are', ARRAY['name[]']::TEXT[], 'text', 'Function pgtap.roles_are(name[]) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'roles_are', ARRAY['name[]']::TEXT[], 'Function pgtap.roles_are(name[]) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'roles_are', ARRAY['name[]']::TEXT[], 'Function pgtap.roles_are(name[]) should not be strict.');

  SELECT is_normal_function('pgtap', 'roles_are', ARRAY['name[]']::TEXT[], 'Function pgtap.roles_are(name[]) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'roles_are', ARRAY['name[]']::TEXT[], 'Function pgtap.roles_are(name[]) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'roles_are', ARRAY['name[]']::TEXT[], 'Function pgtap.roles_are(name[]) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'roles_are', ARRAY['name[]']::TEXT[], 'Function pgtap.roles_are(name[]) should not be a procedure.');

  SELECT volatility_is('pgtap', 'roles_are', ARRAY['name[]']::TEXT[], 'v', 'Function pgtap.roles_are(name[]) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
