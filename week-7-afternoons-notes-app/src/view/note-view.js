(function (exports) {
  function NoteView (note) {
    this.view = note
  }

  NoteView.prototype.htmlString = function () {
    var string = '<div id="heading">Notes</div>' +
                 '<div id="note">' + this.view.note + '</div>'
    return string
  }

  exports.NoteView = NoteView
})(this)
