BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', '_runem', ARRAY['text[]', 'boolean']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', '_runem', ARRAY['text[]', 'boolean']::TEXT[], 'dbo', 'Function pgtap._runem(text[]_boolean) should have the correct owner.');

  SELECT function_lang_is('pgtap', '_runem', ARRAY['text[]', 'boolean']::TEXT[], 'plpgsql', 'Function pgtap._runem(text[]_boolean) should have the correct language.');

  SELECT function_returns('pgtap', '_runem', ARRAY['text[]', 'boolean']::TEXT[], 'setof text', 'Function pgtap._runem(text[]_boolean) should have the correct return type.');

  SELECT isnt_definer('pgtap', '_runem', ARRAY['text[]', 'boolean']::TEXT[], 'Function pgtap._runem(text[]_boolean) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', '_runem', ARRAY['text[]', 'boolean']::TEXT[], 'Function pgtap._runem(text[]_boolean) should not be strict.');

  SELECT is_normal_function('pgtap', '_runem', ARRAY['text[]', 'boolean']::TEXT[], 'Function pgtap._runem(text[]_boolean) should be a normal function.');

  SELECT isnt_aggregate('pgtap', '_runem', ARRAY['text[]', 'boolean']::TEXT[], 'Function pgtap._runem(text[]_boolean) should not be an aggregate function.');

  SELECT isnt_window('pgtap', '_runem', ARRAY['text[]', 'boolean']::TEXT[], 'Function pgtap._runem(text[]_boolean) should not be a window function.');

  SELECT isnt_procedure('pgtap', '_runem', ARRAY['text[]', 'boolean']::TEXT[], 'Function pgtap._runem(text[]_boolean) should not be a procedure.');

  SELECT volatility_is('pgtap', '_runem', ARRAY['text[]', 'boolean']::TEXT[], 'v', 'Function pgtap._runem(text[]_boolean) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
