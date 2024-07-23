BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', 'in_todo', ARRAY[]::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', 'in_todo', ARRAY[]::TEXT[], 'dbo', 'Function pgtap.() should have the correct owner.');

  SELECT function_lang_is('pgtap', 'in_todo', ARRAY[]::TEXT[], 'plpgsql', 'Function pgtap.() should have the correct language.');

  SELECT function_returns('pgtap', 'in_todo', ARRAY[]::TEXT[], 'boolean', 'Function pgtap.() should have the correct return type.');

  SELECT isnt_definer('pgtap', 'in_todo', ARRAY[]::TEXT[], 'Function pgtap.() should have the correct security invoker.');

  SELECT isnt_strict('pgtap', 'in_todo', ARRAY[]::TEXT[], 'Function pgtap.() should not be strict.');

  SELECT is_normal_function('pgtap', 'in_todo', ARRAY[]::TEXT[], 'Function pgtap.() should be a normal function.');

  SELECT isnt_aggregate('pgtap', 'in_todo', ARRAY[]::TEXT[], 'Function pgtap.() should not be an aggregate function.');

  SELECT isnt_window('pgtap', 'in_todo', ARRAY[]::TEXT[], 'Function pgtap.() should not be a window function.');

  SELECT isnt_procedure('pgtap', 'in_todo', ARRAY[]::TEXT[], 'Function pgtap.() should not be a procedure.');

  SELECT volatility_is('pgtap', 'in_todo', ARRAY[]::TEXT[], 'v', 'Function pgtap.() should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
