-- Revert db_design_intro:triggers/store_last_updated_trg from pg

BEGIN;

DROP TRIGGER last_updated_trg ON rental.store;

COMMIT;
