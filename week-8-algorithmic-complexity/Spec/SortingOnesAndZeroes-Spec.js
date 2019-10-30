describe("mySortingOnesAndZeros", function() {
  it("Should sort [1,0,1,0,1,0,1,0,1,0] into the order [0,0,0,0,0,1,1,1,1,1]", function() {
    expect(mySortingOnesAndZeros([1,0,1,0,1,0,1,0,1,0])).toEqual([0,0,0,0,0,1,1,1,1,1]);
  })
})
