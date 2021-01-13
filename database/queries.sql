-- All Notes
SELECT id, text_data FROM Note

-- All Notes with Tags
SELECT n.id, n.text_data, nt.note_id, nt.tag_id, t.title
FROM Note AS n
JOIN Note_Tag AS nt ON n.id == nt.note_id
JOIN Tag AS t ON nt.tag_id == t.id

-- All Notes with and without Tags
SELECT n.id, n.text_data, nt.note_id, nt.tag_id, t.title
FROM Note AS n
LEFT JOIN Note_Tag AS nt ON n.id == nt.note_id
LEFT JOIN Tag AS t ON nt.tag_id == t.id

-- All Notes Data
SELECT n.id, n.text_data, t.title, ic.note_title
FROM Note AS n
JOIN Note_Tag AS nt ON n.id == nt.note_id
JOIN Tag AS t ON nt.tag_id == t.id
JOIN Index_Card AS ic ON n.id == ic.note_id 
WHERE n.id == 11



-- get Note Separate Data
SELECT n.id, n.text_data
FROM Note AS n
WHERE n.id == 11

SELECT l.note_from_id, l.note_to_id
FROM Link AS l
WHERE l.note_from_id == 11

SELECT nt.note_id, nt.tag_id, t.title
FROM Note_Tag AS nt
JOIN Tag AS t ON nt.tag_id == t.id
WHERE nt.note_id == 11

SELECT ic.note_id, ic.note_title
FROM Index_Card AS ic
WHERE ic.note_id == 11