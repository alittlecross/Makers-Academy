describe("myFindDuplicatesA", function() {
  it("Should return true for ['Pikachu', 'Snorlax', 'Charmander', 'Snorlax', 'Mewtwo', 'Mewtwo']", function() {
    expect(myFindDuplicatesA(['Pikachu', 'Snorlax', 'Charmander', 'Snorlax', 'Mewtwo', 'Mewtwo'])).toEqual(true);
  })
  it("Should return false for ['Anna','Ben','Clare','Dirk']", function() {
    expect(myFindDuplicatesA(['Anna','Ben','Clare','Dirk'])).toEqual(false);
  })
})
