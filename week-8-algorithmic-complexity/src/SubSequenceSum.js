function mySubSequenceSum(inputArray, total) {
  // set the default return
  var outputBoolean = false
  // keep a running total of summed elements less than the total
  var runningTotal = 0;
  // keep a record of the index of to go back to if the total is exceeded
  var goBackTo = 0;
  // if we're not at the end of the input array
  for (var i = 0; i < inputArray.length; i++) {
    // add the current element to the running total
    runningTotal += inputArray[i];
    // if the total has been reached exactly
    if (runningTotal === total) {
      // change the detault return to true
      outputBoolean = true;
      //  break out of the for loop
      break; 
    }
    // if the total has been exceeded
    else if (runningTotal > total) {
      // reset the running total
      runningTotal = 0;
      // go back to the index of the first element to be part of the sum
      i = goBackTo;
      // increment the record of the index to go back to if the total is exceeded
      goBackTo++;
    }
  }
  return outputBoolean;
}
