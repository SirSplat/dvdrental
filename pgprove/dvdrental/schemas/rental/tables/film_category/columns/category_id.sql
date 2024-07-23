BEGIN;
  SELECT plan(8);

  SELECT has_schema('rental', 'Schema rental should exist.');

  SELECT has_table('rental', 'film_category', 'Table rental.film_category should exist.');

  SELECT has_column('rental', 'film_category', 'category_id', 'Column rental.film_category.category_id should exist.');

  SELECT has_schema('pg_catalog', 'Schema pg_catalog should exist.');

  SELECT has_type('pg_catalog', 'int2', 'Data type pg_catalog.int2 should exist.');

  SELECT col_not_null('rental', 'film_category', 'category_id', 'Column rental.film_category.category_id should be NOT NULL.');

  SELECT col_hasnt_default('rental', 'film_category', 'category_id', 'Column rental.film_category.category_id should not have DEFAULT.');

  SELECT col_type_is('rental', 'film_category', 'category_id', 'pg_catalog', 'smallint', 'Column rental.film_category.category_id should have the correct type.');

  SELECT * FROM finish();
ROLLBACK;
