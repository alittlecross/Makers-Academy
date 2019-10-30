describe("myGrouping", function() {
  it("Should create groups [['Anna','Clare'],['Ben','Dirk']] from cohort list ['Anna','Ben','Clare','Dirk']", function() {
    expect(myGrouping(['Anna','Ben','Clare','Dirk'],2)).toEqual([['Anna','Clare'],['Ben','Dirk']]);
  })
})
