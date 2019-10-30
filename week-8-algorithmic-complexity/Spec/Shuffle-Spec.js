describe("myShuffle", function() {
  it("Should shuffle [0,1,2,3,4,5,6,7,8,9] into a different order", function() {
    test = myShuffle([0,1,2,3,4,5,6,7,8,9])
    expect(test).not.toEqual([0,1,2,3,4,5,6,7,8,9]);
    expect(test.length).toEqual(10);
    expect(test.sort()).toEqual([0,1,2,3,4,5,6,7,8,9]);
  })
})
