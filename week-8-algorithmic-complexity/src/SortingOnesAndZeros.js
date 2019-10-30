function mySortingOnesAndZeros(inputArray) {
  // create a space to put the output array
  var outputArray = [];
  // if there are still elements in the input array
  while (inputArray.length > 0) {
    // if the last element in the input array is 0 add 0 to the beginning of the output array, otherwise add 1 to the end of the input output array
    inputArray.pop() === 0 ? outputArray.unshift(0) : outputArray.push(1);
  }
  return outputArray
}
