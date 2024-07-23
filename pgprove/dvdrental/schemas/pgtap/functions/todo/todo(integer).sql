BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'todo', ARRAY['integer']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'todo', ARRAY['integer']::TEXT[], 'dbo', 'Function pgtap.todo(integer) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'todo', ARRAY['integer']::TEXT[], 'plpgsql', 'Function pgtap.todo(integer) should have the correct language.');

  SELECT function_returns('pgtap', 'todo', ARRAY['integer']::TEXT[], 'setof boolean', 'Function pgtap.todo(integer) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'todo', ARRAY['integer']::TEXT[], 'Function pgtap.todo(integer) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'todo', ARRAY['integer']::TEXT[], 'Function pgtap.todo(integer) should not be strict.');

  SELECT is_normal_function('pgtap', 'todo', ARRAY['integer']::TEXT[], 'Function pgtap.todo(integer) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'todo', ARRAY['integer']::TEXT[], 'Function pgtap.todo(integer) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'todo', ARRAY['integer']::TEXT[], 'Function pgtap.todo(integer) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'todo', ARRAY['integer']::TEXT[], 'Function pgtap.todo(integer) should not be a procedure.');

  SELECT volatility_is('pgtap', 'todo', ARRAY['integer']::TEXT[], 'v', 'Function pgtap.todo(integer) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
