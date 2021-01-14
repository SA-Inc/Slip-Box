import sqlite3

connection = sqlite3.connect('../slip_box.db')

def createTag (title):
    try:
        c = connection.cursor()
        c.execute('INSERT INTO Tag (title) VALUES (?)', (title,))
        connection.commit()
        return { 'status': 'tag_created', 'id': c.lastrowid }
    except sqlite3.IntegrityError:
        return { 'status': 'tag_exists' }

print(createTag('Node'))