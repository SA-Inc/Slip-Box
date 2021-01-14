import sqlite3

connection = sqlite3.connect('../slip_box.db')

def createNote (title, text):
    c = connection.cursor()
    c.execute('INSERT INTO Note (text_data) VALUES (?)', (text,))
    id = c.lastrowid
    c.execute('INSERT INTO Index_Card (note_id, note_title) VALUES (?, ?)', (id, title))
    connection.commit()
    return c.lastrowid

print(createNote('Python Title 1', 'Python Note 1'))

# conn.commit()
# conn.close()