function myFindDuplicatesA(inputArray) {
  // create an object to store unique elements as keys
  var anObject = new Object();
  // if we're not at the end of the input array
  for (var i = 0; i < inputArray.length; i++) {
    // if the object does not already have a key for that element, create one
    if (anObject[inputArray[i]] === undefined) { anObject[inputArray[i]] = inputArray[i] }
  }
  // create an array of the objects keys
  outputArray = Object.keys(anObject);
  // compare the length of the input array and the output array
  // if they do not have the same length there were duplicates and it will return true
  return inputArray.length != outputArray.length;
}
