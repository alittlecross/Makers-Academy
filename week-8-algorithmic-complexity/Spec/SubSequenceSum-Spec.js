describe("mySubSequenceSum", function() {
  it("Should find whether the given total can be made from the numbers in sequence", function() {
    expect(mySubSequenceSum([10,3,1,7], 8)).toEqual(true);
    expect(mySubSequenceSum([10,3,1,7], 10)).toEqual(true);
    expect(mySubSequenceSum([10,3,1,7], 21)).toEqual(true);
    expect(mySubSequenceSum([10,3,1,7], 22)).toEqual(false);
    expect(mySubSequenceSum([10,3,1,7], 17)).toEqual(false);
  })
})
