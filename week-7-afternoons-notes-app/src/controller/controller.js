(function (exports) {
  function Controller (list) {
    this.view = list
    this.listView = new ListView(this.view)
  }

  Controller.prototype.html = function (elementId) {
    var control = this
    document.addEventListener('DOMContentLoaded', function () {
      control.updateListView(elementId)
      control.submitNote(elementId)
      control.hashChange(elementId)
    })
  }

  Controller.prototype.updateListView = function (elementId) {
    document.getElementById(elementId).innerHTML = this.listView.htmlString()
  }

  Controller.prototype.submitNote = function (elementId) {
    var control = this
    document.addEventListener('submit', function (event) {
      event.preventDefault()
      control.view.createNote(document.getElementById('note-text').value)
      control.updateListView(elementId)
    })
  }

  Controller.prototype.hashChange = function (elementId) {
    var control = this
    window.addEventListener('hashchange', function () {
      var noteId = window.location.hash.split('#')[1]
      if (noteId === undefined) {
        control.updateListView(elementId)
      } else {
        var note = control.view.list.filter(note => note.id === parseInt(noteId))
        var noteView = new NoteView(note[0])
        document.getElementById(elementId).innerHTML = noteView.htmlString()
      }
    })
  }

  exports.Controller = Controller
})(this)
