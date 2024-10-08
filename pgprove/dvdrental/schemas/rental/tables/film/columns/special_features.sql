BEGIN;
  SELECT plan(8);

  SELECT has_schema('rental', 'Schema rental should exist.');

  SELECT has_table('rental', 'film', 'Table rental.film should exist.');

  SELECT has_column('rental', 'film', 'special_features', 'Column rental.film.special_features should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', '_text', 'Data type pg_catalog._text should exist.');

  SELECT col_is_null('rental', 'film', 'special_features', 'Column rental.film.special_features should not be NOT NULL.');

  SELECT col_hasnt_default('rental', 'film', 'special_features', 'Column rental.film.special_features should not have DEFAULT.');

  SELECT col_type_is('rental', 'film', 'special_features', 'pg_catalog', 'text[]', 'Column rental.film.special_features should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
