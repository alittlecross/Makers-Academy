function myBubbleSort(inputArray) {
  // identify the index of the first element
  var i = 0;
  // if we're not at the end of the input array
  while (i < inputArray.length) {
    // compare the current element with the next one
    if (inputArray[i] > inputArray[i + 1]) {
      // if the first element is higher hold the first element
      var hold = inputArray[i];
      // put the second element where the first element was
      inputArray[i] = inputArray[i + 1];
      // put the first element where the second element was
      inputArray[i + 1] = hold;
      // go back to the beginning
      i = 0;
    }
    // if the second element is higher move on to the next element
    else { i++; }
  }
  return inputArray;
}
