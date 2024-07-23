BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', '_types_are', ARRAY['name', 'name[]', 'text', 'character[]']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', '_types_are', ARRAY['name', 'name[]', 'text', 'character[]']::TEXT[], 'dbo', 'Function pgtap._types_are(name_name[]_text_character[]) should have the correct owner.');

  SELECT function_lang_is('pgtap', '_types_are', ARRAY['name', 'name[]', 'text', 'character[]']::TEXT[], 'sql', 'Function pgtap._types_are(name_name[]_text_character[]) should have the correct language.');

  SELECT function_returns('pgtap', '_types_are', ARRAY['name', 'name[]', 'text', 'character[]']::TEXT[], 'text', 'Function pgtap._types_are(name_name[]_text_character[]) should have the correct return type.');

  SELECT isnt_definer('pgtap', '_types_are', ARRAY['name', 'name[]', 'text', 'character[]']::TEXT[], 'Function pgtap._types_are(name_name[]_text_character[]) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', '_types_are', ARRAY['name', 'name[]', 'text', 'character[]']::TEXT[], 'Function pgtap._types_are(name_name[]_text_character[]) should not be strict.');

  SELECT is_normal_function('pgtap', '_types_are', ARRAY['name', 'name[]', 'text', 'character[]']::TEXT[], 'Function pgtap._types_are(name_name[]_text_character[]) should be a normal function.');

  SELECT isnt_aggregate('pgtap', '_types_are', ARRAY['name', 'name[]', 'text', 'character[]']::TEXT[], 'Function pgtap._types_are(name_name[]_text_character[]) should not be an aggregate function.');

  SELECT isnt_window('pgtap', '_types_are', ARRAY['name', 'name[]', 'text', 'character[]']::TEXT[], 'Function pgtap._types_are(name_name[]_text_character[]) should not be a window function.');

  SELECT isnt_procedure('pgtap', '_types_are', ARRAY['name', 'name[]', 'text', 'character[]']::TEXT[], 'Function pgtap._types_are(name_name[]_text_character[]) should not be a procedure.');

  SELECT volatility_is('pgtap', '_types_are', ARRAY['name', 'name[]', 'text', 'character[]']::TEXT[], 'v', 'Function pgtap._types_are(name_name[]_text_character[]) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
