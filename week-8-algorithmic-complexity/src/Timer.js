function timer() {
  var arraySize, index, iteration;
  var repetitions = 99;
  var results = []
  
  for (arraySize = 50000; arraySize <= 1000000; arraySize += 50000) {
    var totals = [];

    for (iteration = 0; iteration < repetitions; iteration++) {
      var startMilli, endMilli, durationMilli;
      var test_data = [];

      for (index = 0; index < arraySize; index++) {
        test_data.push(Math.floor(Math.random() * 100))
      }

      startMilli = performance.now();

      // INSERT FUNCTION TO BE TESTED
      (test_data)
      
      endMilli = performance.now();

      durationMilli = endMilli - startMilli;
      totals.push(durationMilli);
    }
    console.log([arraySize, totals.sort()[50]])
    results.push([arraySize, totals.sort()[50]]);
  }

  var i;
  var string = "<div>Iteration, Median</div>";

  for (i = 0; i < results.length; i++) {
    string += "<div>";
    string += results[i][0];
    string += ",";
    string += results[i][1];
    string += "</div>";
  }

  document.getElementById("app").innerHTML = string;
};
