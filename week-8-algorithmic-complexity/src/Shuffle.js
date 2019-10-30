function myShuffle(inputArray) {
  // create a space to put the output array
  var outputArray = [];
  // if there are still elements in the input array
  while (inputArray.length > 0) {
    // generate a random number to act as the index of an element to be removed from the input array and placed in the output array
    outputArray.push(inputArray.splice((Math.floor(Math.random() * inputArray.length)), 1)[0]);
  }
  return outputArray;
}
