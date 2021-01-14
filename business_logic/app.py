from flask import Flask, render_template, request
import sqlite3

connection = sqlite3.connect('../slip_box.db', check_same_thread = False)
app = Flask(__name__, template_folder = 'template')

def insertNote (title, text):
    c = connection.cursor()
    c.execute('INSERT INTO Note (text_data) VALUES (?)', (text,))
    id = c.lastrowid
    c.execute('INSERT INTO Index_Card (note_id, note_title) VALUES (?, ?)', (id, title))
    connection.commit()
    return c.lastrowid

def selectAllNotes():
    c = connection.cursor()
    c.execute('''
        SELECT n.id, ic.note_title, n.create_date, n.read_date, n.update_date
        FROM Index_Card AS ic
        JOIN Note AS n ON ic.note_id == n.id
        ORDER BY n.create_date DESC
    ''')
    data = c.fetchall()
    return data

def selectNoteById(id):
    c = connection.cursor()
    c.execute('UPDATE Note SET read_date = datetime("now", "localtime") WHERE id == ?', (id,))
    c.execute('SELECT n.id, n.text_data FROM Note AS n WHERE n.id == ?', (id,))
    data = c.fetchone()
    return data

def selectNoteTitleById(id):
    c = connection.cursor()
    c.execute('SELECT ic.note_id, ic.note_title FROM Index_Card AS ic WHERE ic.note_id == ?', (id,))
    data = c.fetchone()
    return data


def selectNoteLinksById(id):
    c = connection.cursor()
    c.execute('SELECT l.note_from_id, l.note_to_id, ic.note_title FROM Link AS l JOIN Index_Card AS ic ON l.note_to_id == ic.note_id WHERE l.note_from_id == ?', (id,))
    data = c.fetchall()
    return data


def selectNoteTagsById(id):
    c = connection.cursor()
    c.execute('SELECT nt.note_id, nt.tag_id, t.title FROM Note_Tag AS nt JOIN Tag AS t ON nt.tag_id == t.id WHERE nt.note_id == ?', (id,))
    data = c.fetchall()
    return data

@app.route('/', methods = ['GET'])
def indexCard():
    notes = selectAllNotes()
    return render_template('index_card.html', data = notes)

@app.route('/create', methods = ['GET'])
def createPage():
    return render_template('create.html')

@app.route('/create_note', methods = ['GET', 'POST'])
def createNote():
    if request.method == 'GET':
        return render_template('create_note.html')
    if request.method == 'POST':
        insertNote(request.form['title'], request.form['text'])
        notes = selectAllNotes()
        return render_template('index_card.html', data = notes)

@app.route('/note/<note_id>', methods = ['GET'])
def note(note_id):
    title = selectNoteTitleById(note_id)
    note = selectNoteById(note_id)
    links = selectNoteLinksById(note_id)
    tags = selectNoteTagsById(note_id)
    return render_template('note.html', title = title, note = note, links = links, tags = tags)

if __name__ == "__main__":
    app.run(host= '0.0.0.0', debug = True)