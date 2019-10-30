function NoteSetup () {
  note = new Note('A')
  noteView = new NoteView(note)
}

function MultiNoteSetup () {
  list.list.push(new Note('B'))
  list.list.push(new Note('C'))
}

function ListSetup () {
  list = new List()
  listView = new ListView(list)
}

function ControllerSetup () {
  list = new List()
  list.list.push(new Note('D'))
  controller = new Controller(list)
}
