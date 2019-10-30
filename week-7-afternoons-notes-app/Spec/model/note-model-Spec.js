describe('Note Model', function () {
  NoteSetup()

  describe('.returnNote()', function () {
    it('Should return the note contents', function () {
      expect(note.note).toEqual('A')
    })
  })
})
