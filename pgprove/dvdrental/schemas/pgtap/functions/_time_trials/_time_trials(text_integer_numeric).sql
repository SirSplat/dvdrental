BEGIN;
  SELECT plan(13);

  SELECT has_schema('pgtap', 'Schema pgtap should exist.');

  SELECT has_function('pgtap', '_time_trials', ARRAY['text', 'integer', 'numeric']::TEXT[], 'Function pgtap.None should exist.');

  SELECT has_role('dbo', 'Role dbo should exist.');

  SELECT function_owner_is('pgtap', '_time_trials', ARRAY['text', 'integer', 'numeric']::TEXT[], 'dbo', 'Function pgtap._time_trials(text_integer_numeric) should have the correct owner.');

  SELECT function_lang_is('pgtap', '_time_trials', ARRAY['text', 'integer', 'numeric']::TEXT[], 'plpgsql', 'Function pgtap._time_trials(text_integer_numeric) should have the correct language.');

  SELECT function_returns('pgtap', '_time_trials', ARRAY['text', 'integer', 'numeric']::TEXT[], 'setof _time_trial_type', 'Function pgtap._time_trials(text_integer_numeric) should have the correct return type.');

  SELECT isnt_definer('pgtap', '_time_trials', ARRAY['text', 'integer', 'numeric']::TEXT[], 'Function pgtap._time_trials(text_integer_numeric) should have the correct security invoker.');

  SELECT isnt_strict('pgtap', '_time_trials', ARRAY['text', 'integer', 'numeric']::TEXT[], 'Function pgtap._time_trials(text_integer_numeric) should not be strict.');

  SELECT is_normal_function('pgtap', '_time_trials', ARRAY['text', 'integer', 'numeric']::TEXT[], 'Function pgtap._time_trials(text_integer_numeric) should be a normal function.');

  SELECT isnt_aggregate('pgtap', '_time_trials', ARRAY['text', 'integer', 'numeric']::TEXT[], 'Function pgtap._time_trials(text_integer_numeric) should not be an aggregate function.');

  SELECT isnt_window('pgtap', '_time_trials', ARRAY['text', 'integer', 'numeric']::TEXT[], 'Function pgtap._time_trials(text_integer_numeric) should not be a window function.');

  SELECT isnt_procedure('pgtap', '_time_trials', ARRAY['text', 'integer', 'numeric']::TEXT[], 'Function pgtap._time_trials(text_integer_numeric) should not be a procedure.');

  SELECT volatility_is('pgtap', '_time_trials', ARRAY['text', 'integer', 'numeric']::TEXT[], 'v', 'Function pgtap._time_trials(text_integer_numeric) should have the correct volatility.');

  SELECT * FROM finish();
ROLLBACK;
