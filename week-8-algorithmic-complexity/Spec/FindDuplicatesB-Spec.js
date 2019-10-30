describe("myFindDuplicatesB", function() {
  it("Should return ['Snorlax','Mewtwo'] from list ['Pikachu', 'Snorlax', 'Charmander', 'Snorlax', 'Mewtwo', 'Mewtwo']", function() {
    expect(myFindDuplicatesB(['Pikachu', 'Snorlax', 'Charmander', 'Snorlax', 'Mewtwo', 'Mewtwo'])).toEqual(["Mewtwo", "Snorlax"]);
  })
})