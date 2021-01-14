-- CREATE TABLE Link (
--     note_from_id INTEGER,
--     note_to_id INTEGER,
--     PRIMARY KEY (note_from_id, note_to_id),
--     FOREIGN KEY (note_from_id) 
--         REFERENCES Note (note_from_id)
--     FOREIGN KEY (note_to_id) 
--         REFERENCES Note (note_to_id)
-- );

CREATE TABLE Link (
    note_from_id INTEGER,
    note_to_id INTEGER
);

INSERT INTO Link (note_from_id, note_to_id) VALUES (1, 2);
INSERT INTO Link (note_from_id, note_to_id) VALUES (2, 3);

INSERT INTO Link (note_from_id, note_to_id) VALUES (4, 5);
INSERT INTO Link (note_from_id, note_to_id) VALUES (5, 6);

INSERT INTO Link (note_from_id, note_to_id) VALUES (7, 8);
INSERT INTO Link (note_from_id, note_to_id) VALUES (8, 9);

INSERT INTO Link (note_from_id, note_to_id) VALUES (10, 11);
INSERT INTO Link (note_from_id, note_to_id) VALUES (11, 12);

INSERT INTO Link (note_from_id, note_to_id) VALUES (13, 14);
INSERT INTO Link (note_from_id, note_to_id) VALUES (14, 15);

INSERT INTO Link (note_from_id, note_to_id) VALUES (5, 13);
INSERT INTO Link (note_from_id, note_to_id) VALUES (6, 9);
INSERT INTO Link (note_from_id, note_to_id) VALUES (12, 2);

INSERT INTO Link (note_from_id, note_to_id) VALUES (12, 3);
INSERT INTO Link (note_from_id, note_to_id) VALUES (12, 6);
INSERT INTO Link (note_from_id, note_to_id) VALUES (12, 7);
INSERT INTO Link (note_from_id, note_to_id) VALUES (12, 9);
INSERT INTO Link (note_from_id, note_to_id) VALUES (12, 15);