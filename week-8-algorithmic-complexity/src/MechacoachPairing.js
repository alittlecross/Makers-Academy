function myMechacoachPairing(inputArray) {
  // create a space to put the output array
  var outputArray = []
  // get the first element in the input array, iterating through to the last element in the input array -1
  for (var indexOne = 0; indexOne < inputArray.length - 1; indexOne++) {
    // get the next element in the input array, iterating through to the last element in the input array
    for (var indexTwo = indexOne + 1; indexTwo < inputArray.length; indexTwo++) {
      // add the current indexOne element and the current indexTwo element to the output array
      outputArray.push([inputArray[indexOne], inputArray[indexTwo]])
    }
  }
  return outputArray;
}
