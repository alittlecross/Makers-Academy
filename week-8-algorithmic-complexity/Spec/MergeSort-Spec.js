describe("myMergeSort",  function() {
  it("Should sort [3,6,3,5,5,2,7,9,1,8] into the order [1,2,3,3,5,5,6,7,8,9]", function() {
    expect(myMergeSort([3,6,3,5,5,2,7,9,1,8])).toEqual([1,2,3,3,5,5,6,7,8,9]);
  })
})
