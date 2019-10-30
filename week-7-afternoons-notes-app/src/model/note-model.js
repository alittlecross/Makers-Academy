(function (exports) {
  var i = 0

  function Note (string) {
    this.note = string
    this.id = i
    i++
  }

  exports.Note = Note
})(this)
