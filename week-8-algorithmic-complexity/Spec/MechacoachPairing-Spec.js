describe("myMechacoachPairing", function() {
  it("Should return [['Pikachu', 'Snorlax'], ['Pikachu', 'Charmander'], ['Snorlax', 'Charmander']] from list ['Pikachu', 'Snorlax', 'Charmander']", function() {
    expect(myMechacoachPairing(['Pikachu', 'Snorlax', 'Charmander'])).toEqual([['Pikachu', 'Snorlax'], ['Pikachu', 'Charmander'], ['Snorlax', 'Charmander']]);
  })
})

