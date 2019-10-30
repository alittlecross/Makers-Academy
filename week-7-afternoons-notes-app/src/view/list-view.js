(function (exports) {
  function ListView (list) {
    this.view = list
  }

  ListView.prototype.htmlString = function () {
    var i
    var string = '<div id="heading">Notes</div>' +
                 '<form action="#" method="POST" >' +
                   '<textarea id="note-text" name="note" rows="8" cols="23" placeholder="..."></textarea>' +
                   '<br>' +
                   '<button id="create" type="submit" name="submit">Create</button>' +
                 '</form>'

    var listLength = this.view.list.length

    for (i = 0; i < listLength; i++) {
      string += '<div class="note-link"><a href="#' + this.view.list[i].id + '">' +
                this.view.list[i].note.substring(0, 20) + '...' +
                '</a></div>'
    }

    return string
  }

  exports.ListView = ListView
})(this)
