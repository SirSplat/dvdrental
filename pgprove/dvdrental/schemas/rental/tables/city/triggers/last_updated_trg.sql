BEGIN;
  SELECT plan(6);

  SELECT has_schema('rental', 'Schema rental should exist.');

  SELECT has_table('rental', 'city', 'Table rental.city should exist.');

  SELECT has_schema('rental', 'Schema rental should exist.');

  SELECT has_function('rental', 'last_updated_trg_func', ARRAY[]::TEXT[], 'Function rental.None should exist.');

  SELECT has_trigger('rental', 'city', 'last_updated_trg', 'Trigger rental.city.last_updated_trg should exist.');

  SELECT trigger_is('rental', 'city', 'last_updated_trg', 'rental', 'last_updated_trg_func', 'Trigger rental.city.last_updated_trg should exist.');

  SELECT * FROM finish();
ROLLBACK;
