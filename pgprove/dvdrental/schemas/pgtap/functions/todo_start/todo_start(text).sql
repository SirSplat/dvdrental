BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'todo_start', ARRAY['text']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'todo_start', ARRAY['text']::TEXT[], 'dbo', 'Function pgtap.todo_start(text) should have the correct owner.');

  SELECT function_lang_is('pgtap', 'todo_start', ARRAY['text']::TEXT[], 'plpgsql', 'Function pgtap.todo_start(text) should have the correct language.');

  SELECT function_returns('pgtap', 'todo_start', ARRAY['text']::TEXT[], 'setof boolean', 'Function pgtap.todo_start(text) should have the correct return type.');

  SELECT isnt_definer('pgtap', 'todo_start', ARRAY['text']::TEXT[], 'Function pgtap.todo_start(text) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'todo_start', ARRAY['text']::TEXT[], 'Function pgtap.todo_start(text) should not be strict.');

  SELECT is_normal_function('pgtap', 'todo_start', ARRAY['text']::TEXT[], 'Function pgtap.todo_start(text) should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'todo_start', ARRAY['text']::TEXT[], 'Function pgtap.todo_start(text) should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'todo_start', ARRAY['text']::TEXT[], 'Function pgtap.todo_start(text) should not be a window function.');

  SELECT isnt_procedure('pgtap', 'todo_start', ARRAY['text']::TEXT[], 'Function pgtap.todo_start(text) should not be a procedure.');

  SELECT volatility_is('pgtap', 'todo_start', ARRAY['text']::TEXT[], 'v', 'Function pgtap.todo_start(text) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
