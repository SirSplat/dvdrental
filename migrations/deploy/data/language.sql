-- Deploy db_design_intro_data:data/language to pg
-- requires: db_design_intro:@v0.1-pre-data

BEGIN;

INSERT INTO rental."language" (language_id,"name",last_update) VALUES
	 (1,'English             ','2006-02-15 10:02:19'),
	 (2,'Italian             ','2006-02-15 10:02:19'),
	 (3,'Japanese            ','2006-02-15 10:02:19'),
	 (4,'Mandarin            ','2006-02-15 10:02:19'),
	 (5,'French              ','2006-02-15 10:02:19'),
	 (6,'German              ','2006-02-15 10:02:19');

COMMIT;
