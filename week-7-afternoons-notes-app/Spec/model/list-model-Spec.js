'use strict'

describe('List Model', function () {
  ListSetup()

  describe('.createNote()', function () {
    it('Should create a note and add it to the notes array', function () {
      list.createNote('Bonjour le monde')
      expect(list.list[0].note).toEqual('Hello World')
    })
  })
})
