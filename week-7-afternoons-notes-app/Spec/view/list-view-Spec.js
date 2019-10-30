'use strict'

describe('List View', function () {
  ListSetup()

  describe('.htmlString()', function () {
    list.list.push(note)
    MultiNoteSetup()
    it('Should return html for all notes, 20 characters long with an ellipsis', function () {
      list.list.push(new Note('qwertyuiopasdfghjklzxcvbnm'))
      expect(listView.htmlString()).toEqual(
        '<div id="heading">Notes</div>' +
        '<form action="#" method="POST" >' +
        '<textarea id="note-text" name="note" rows="8" cols="23" placeholder="...">' +
        '</textarea>' +
        '<br>' +
        '<button id="create" type="submit" name="submit">Create</button>' +
        '</form>' +
        '<div class="note-link"><a href="#' + listView.view.list[0].id + '">A...</a></div>' +
        '<div class="note-link"><a href="#' + listView.view.list[1].id + '">B...</a></div>' +
        '<div class="note-link"><a href="#' + listView.view.list[2].id + '">C...</a></div>' +
        '<div class="note-link"><a href="#' + listView.view.list[3].id + '">qwertyuiopasdfghjklz...</a></div>'
      )
    })
  })
})
