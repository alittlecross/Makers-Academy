(function (exports) {
  function List () {
    this.list = []
  }

  List.prototype.createNote = function (string) {
    this.list.push(new Note(string))
  }

  exports.List = List
})(this)
