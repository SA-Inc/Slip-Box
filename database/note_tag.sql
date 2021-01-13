CREATE TABLE Note_Tag (
    note_id INTEGER,
    tag_id INTEGER,
    PRIMARY KEY (note_id, tag_id),
    FOREIGN KEY (note_id) 
        REFERENCES Note (note_id)
    FOREIGN KEY (tag_id) 
        REFERENCES Tag (tag_id)
);

CREATE TABLE Note_Tag (
    note_id INTEGER,
    tag_id INTEGER
);

INSERT INTO Note_Tag (note_id, tag_id) VALUES (1, 1);
INSERT INTO Note_Tag (note_id, tag_id) VALUES (2, 1);
INSERT INTO Note_Tag (note_id, tag_id) VALUES (3, 1);

INSERT INTO Note_Tag (note_id, tag_id) VALUES (10, 1);
INSERT INTO Note_Tag (note_id, tag_id) VALUES (10, 2);

INSERT INTO Note_Tag (note_id, tag_id) VALUES (11, 5);
INSERT INTO Note_Tag (note_id, tag_id) VALUES (11, 2);
INSERT INTO Note_Tag (note_id, tag_id) VALUES (11, 8);
