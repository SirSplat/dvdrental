BEGIN;

DROP TABLE rental.rating;
CREATE TABLE rental.rating (
    rating_id INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY CONSTRAINT rating_pk PRIMARY KEY,
    country_id INTEGER NOT NULL CONSTRAINT rating_country_id_fk REFERENCES rental.country ( country_id ) ON DELETE NO ACTION ON UPDATE NO ACTION DEFERRABLE INITIALLY IMMEDIATE,
    rating TEXT NOT NULL,
    description TEXT,
    CONSTRAINT rating_country_id_rating_uidx UNIQUE ( country_id, rating )
);
COMMENT ON TABLE rental.rating IS 'Contains all goverment assigned film ratings by country.';
COMMENT ON COLUMN rating.rating_id IS 'An auto incrementing surrogate key, used for foreign key constraints.';
COMMENT ON COLUMN rating.country_id IS 'Used by the rating_country_id_fk to ensure data referencial integrity, referenced countries need to exist in rental.country.';
COMMENT ON COLUMN rating.rating IS 'The goverment assigned film rating.';
COMMENT ON COLUMN rating.description IS 'The description of the goverment assigned rating, includes the link to the goverment standards website if one exists.';
COMMENT ON CONSTRAINT rating_pk ON rental.rating IS 'The surrogate key for this table.';
COMMENT ON CONSTRAINT rating_country_id_fk ON rental.rating IS 'The foreign key between rental.rating and rental.country.';
COMMENT ON CONSTRAINT rating_country_id_rating_uidx ON rental.rating IS 'The natural primay key for this table.';

INSERT INTO rental.rating (
    country_id,
    rating,
    description
) VALUES 
( ( SELECT country_id FROM rental.country WHERE country = 'United States' ), 'G', 'General Audiences: All ages admitted. Nothing that would offend parents for viewing by children.' ),
( ( SELECT country_id FROM rental.country WHERE country = 'United States' ), 'PG', 'Parental Guidance Suggested: Some material may not be suitable for children. Parents urged to give "parental guidance". May contain some material parents might not like for their young children.' ),
( ( SELECT country_id FROM rental.country WHERE country = 'United States' ), 'PG-13', 'Parents Strongly Cautioned: Some material may be inappropriate for children under 13. Parents are urged to be cautious. Some material may be inappropriate for pre-teenagers.' ),
( ( SELECT country_id FROM rental.country WHERE country = 'United States' ), 'R', 'Restricted: Under 17 requires accompanying parent or adult guardian. Contains some adult material. Parents are urged to learn more about the film before taking their young children with them.' ),
( ( SELECT country_id FROM rental.country WHERE country = 'United States' ), 'NC-17', 'Adults Only: No one 17 and under admitted. Clearly adult. Children are not admitted.' ),
( ( SELECT country_id FROM rental.country WHERE country = 'United Kingdom' ), 'U', 'Universal: Suitable for all. A U film should be suitable for audiences aged four years and over.' ),
( ( SELECT country_id FROM rental.country WHERE country = 'United Kingdom' ), 'PG', 'Parental Guidance: General viewing, but some scenes may be unsuitable for young children. A PG film should not unsettle a child aged around eight or older.' ),
( ( SELECT country_id FROM rental.country WHERE country = 'United Kingdom' ), '12A', 'Cinema release suitable for those aged 12 years and over. No one younger than 12 may see a 12A film in a cinema unless accompanied by an adult. ' ),
( ( SELECT country_id FROM rental.country WHERE country = 'United Kingdom' ), '12', 'Home video release suitable only for 12 years and over. No one younger than 12 may rent or buy a 12 rated video work. ' ),
( ( SELECT country_id FROM rental.country WHERE country = 'United Kingdom' ), '15', 'Suitable only for 15 years and over. No one younger than 15 may see a 15 film in a cinema. No one younger than 15 may rent or buy a 15 rated video work. ' ),
( ( SELECT country_id FROM rental.country WHERE country = 'United Kingdom' ), '18', 'Suitable only for adults. No one younger than 18 years may see an 18 film in a cinema. No one younger than 18 may rent or buy an 18 rated video work. ' ),
( ( SELECT country_id FROM rental.country WHERE country = 'United Kingdom' ), 'R18', 'To be shown only in specially licensed cinemas, or supplied only in licensed sex shops, and to adults only. R18 video works may not be supplied by mail order.' );

SELECT * FROM rental.rating;


DROP TABLE rental.film_rating;
CREATE TABLE rental.film_rating (
    film_id INTEGER NOT NULL,
    country_id INTEGER NOT NULL,
    rating_id INTEGER NOT NULL,
    CONSTRAINT film_rating_pk PRIMARY KEY ( country_id, film_id, rating_id )
);

ROLLBACK;
COMMIT;
