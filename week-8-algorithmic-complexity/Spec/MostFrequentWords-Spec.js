describe("myMostFrequentWords", function() {
  it("Should return ['Snorlax','Mewtwo'] from the list ['Pikachu', 'Snorlax', 'Charmander', 'Snorlax', 'Mewtwo', 'Mewtwo']", function() {
    expect(myMostFrequentWords(['Pikachu', 'Snorlax', 'Charmander', 'Snorlax', 'Mewtwo', 'Mewtwo'])).toEqual(['Snorlax','Mewtwo']);
  })
})
