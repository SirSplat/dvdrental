BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'groups_are', ARRAY['name[]']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'groups_are', ARRAY['name[]']::TEXT[], 'dbo', 'Function pgtap.groups_are(name[]) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'groups_are', ARRAY['name[]']::TEXT[], 'sql', 'Function pgtap.groups_are(name[]) should have the correct language.');

  SELECT function_returns('pgtap', 'groups_are', ARRAY['name[]']::TEXT[], 'text', 'Function pgtap.groups_are(name[]) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'groups_are', ARRAY['name[]']::TEXT[], 'Function pgtap.groups_are(name[]) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'groups_are', ARRAY['name[]']::TEXT[], 'Function pgtap.groups_are(name[]) should not be strict.');

  SELECT is_normal_function('pgtap', 'groups_are', ARRAY['name[]']::TEXT[], 'Function pgtap.groups_are(name[]) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'groups_are', ARRAY['name[]']::TEXT[], 'Function pgtap.groups_are(name[]) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'groups_are', ARRAY['name[]']::TEXT[], 'Function pgtap.groups_are(name[]) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'groups_are', ARRAY['name[]']::TEXT[], 'Function pgtap.groups_are(name[]) should not be a procedure.');

  SELECT volatility_is('pgtap', 'groups_are', ARRAY['name[]']::TEXT[], 'v', 'Function pgtap.groups_are(name[]) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
