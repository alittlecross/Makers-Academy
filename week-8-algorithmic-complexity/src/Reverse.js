function myReverse(inputArray) {
  // create a space to put the output array
  var outputArray = [];
  // if there are still elements in the input array
  while (inputArray.length > 0) {
    // remove the last element from the input array and place in the output array
    outputArray.push(inputArray.pop());
  }
  return outputArray;
}
