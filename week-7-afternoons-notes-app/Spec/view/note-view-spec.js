'use strict'

describe('Note View', function () {
  NoteSetup()

  describe('.htmlString()', function () {
    it('Should return html for a single note', function () {
      expect(noteView.htmlString()).toEqual('<div id="heading">Notes</div><div id="note">A</div>')
    })
  })
})
