function myFindDuplicatesB(inputArray) {
  // create a space to put the output array
  var outputArray = [];
  // sort the list of elements
  inputArray.sort();
  // identify the index of the first element
  var i = 0;
  // if we're not at the end of the input array
  while (i < inputArray.length) {
    // compare the first element and second element
    if (inputArray[i] === inputArray[i + 1]) {
      // if they are the same remove the second from the input array, store it in the output array
      outputArray.push(inputArray.splice(i + 1, 1)[0]);
      // the return to the beginning of the input array
      i = 0;
    }
    // if they are not the same move on to the next element
    else { i++; }
  }
  return outputArray;
}
