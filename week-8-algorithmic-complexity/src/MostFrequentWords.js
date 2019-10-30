function myMostFrequentWords(inputArray) {
  // create an object to store unique elements and frequency count
  var anObject = new Object();
  // if we're not at the end of the input array
  for (var i = 0; i < inputArray.length; i++) {
    // if the object does not already have a key for that element, create one with a frequency of 1
    if (anObject[inputArray[i]] === undefined) { anObject[inputArray[i]] = 1; }
    // if the object does already have a key for that element, add 1 to the frequency
    else { anObject[inputArray[i]] += 1; }
  }
  // create an array of the objects keys
  outputArrayKeys = Object.keys(anObject);
  // create an array of the objects values
  outputArrayValues = Object.values(anObject);
  // create a space to put the output array
  var outputArray = []
  // if there are not two elements in the output array
  for (var i = 0; i < 2; i++) {
    // find the highest frequency
    mostFrequent = Math.max(...outputArrayValues);
    // and then the word it correlates to
    indexOfMostFrequent = outputArrayValues.indexOf(mostFrequent);
    // store that word
    outputArray.push(outputArrayKeys[indexOfMostFrequent])
    // remove the word from the array of object keys
    outputArrayKeys.splice(indexOfMostFrequent,1)
    // and the count from the array of object values
    outputArrayValues.splice(indexOfMostFrequent,1)
  }
  return outputArray;
}
