BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'enum_has_labels', ARRAY['name', 'name[]']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'enum_has_labels', ARRAY['name', 'name[]']::TEXT[], 'dbo', 'Function pgtap.enum_has_labels(name_name[]) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'enum_has_labels', ARRAY['name', 'name[]']::TEXT[], 'sql', 'Function pgtap.enum_has_labels(name_name[]) should have the correct language.');

  SELECT function_returns('pgtap', 'enum_has_labels', ARRAY['name', 'name[]']::TEXT[], 'text', 'Function pgtap.enum_has_labels(name_name[]) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'enum_has_labels', ARRAY['name', 'name[]']::TEXT[], 'Function pgtap.enum_has_labels(name_name[]) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'enum_has_labels', ARRAY['name', 'name[]']::TEXT[], 'Function pgtap.enum_has_labels(name_name[]) should not be strict.');

  SELECT is_normal_function('pgtap', 'enum_has_labels', ARRAY['name', 'name[]']::TEXT[], 'Function pgtap.enum_has_labels(name_name[]) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'enum_has_labels', ARRAY['name', 'name[]']::TEXT[], 'Function pgtap.enum_has_labels(name_name[]) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'enum_has_labels', ARRAY['name', 'name[]']::TEXT[], 'Function pgtap.enum_has_labels(name_name[]) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'enum_has_labels', ARRAY['name', 'name[]']::TEXT[], 'Function pgtap.enum_has_labels(name_name[]) should not be a procedure.');

  SELECT volatility_is('pgtap', 'enum_has_labels', ARRAY['name', 'name[]']::TEXT[], 'v', 'Function pgtap.enum_has_labels(name_name[]) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
