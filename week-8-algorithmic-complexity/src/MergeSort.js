function myMergeSort(inputArray) {
  // create a space to put the output array
  var outputArray = []
  // if the input array is empty or only one element
  if (inputArray.length < 2) {
    // set the output array to the input array
    outputArray = inputArray;
  }
  // if the input array is two elements long
  else if (inputArray.length === 2) {
    // compare the current element with the next one
    if (inputArray[0] > inputArray[1]) {
      // if the first element is higher hold the first element
      var hold = inputArray[0];
      // put the second element where the first element was
      inputArray[0] = inputArray[1];
      // put the first element where the second element was
      inputArray[1] = hold;
    }
    // set the output array to the input array
    outputArray = inputArray;
  }
  else {
    // split the input array in two and store the second (possibly shorter) half
    var secondHalfOfInputArray = inputArray.splice(Math.ceil(inputArray.length/2), Math.floor(inputArray.length/2));
    // recursively run this function with each half of the input array
    var secondHalfOfOutputArray = myMergeSort(secondHalfOfInputArray);
    var firstHalfOfOutputArray = myMergeSort(inputArray);
    // identify the index of the first element in each half array
    var f = s = 0;
    // if we're not at the end of each half array
    while ((f < firstHalfOfOutputArray.length) || (s < secondHalfOfOutputArray.length)) {
      // if we're at the end of the first half
      if (firstHalfOfOutputArray[f] === undefined) {
        // take the next element from the second half and put in the output array
        outputArray.push(secondHalfOfOutputArray[s]);
        // increase the index of the second half
        s++;
      }
      // if we're at the end of the second half
      else if (secondHalfOfOutputArray[s] === undefined) {
        // take the next element from the first half and put in the output array
        outputArray.push(firstHalfOfOutputArray[f]);
        // increase the index of the first half
        f++;
      }
      // if the next element in the first half is less than the next element in the second half
      else if (firstHalfOfOutputArray[f] < secondHalfOfOutputArray[s]) {
        // put the next element from the first half in the output array
        outputArray.push(firstHalfOfOutputArray[f]);
        // increase the index of the first half
        f++;
      }
      // put the element from the second half in the output array
      else { 
        outputArray.push(secondHalfOfOutputArray[s]);
        // increase the index of the second half
        s++;
      }
    }
  }
  return outputArray;
}
