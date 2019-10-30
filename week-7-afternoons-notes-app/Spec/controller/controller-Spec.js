'use strict'

describe('Controller', function () {
  ControllerSetup()

  describe('.html()', function () {
    it('Should update the html of the page', function () {
      controller.html('test')
      document.addEventListener('DOMContentLoaded', function () {
        expect(document.getElementById('test').innerHTML).toEqual(
          '<div id="heading">Notes</div>' +
          '<form action="#" method="POST">' +
          '<textarea id="note-text" name="note" rows="8" cols="23" placeholder="..."></textarea>' +
          '<br>' +
          '<button id="create" type="submit" name="submit">Create</button>' +
          '</form>' +
          '<div class="note-link">' +
          '<a href="#' + list.list[0].id + '">D...</a></div>'
        )
      })
    })
  })
})
