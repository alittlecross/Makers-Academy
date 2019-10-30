function myGrouping(inputArray, numberOfGroups) {
  // create a space to put the output array
  var outputArray = [];
  // identify the index of the first group
  var group = 0;
  // if there are still cohort members in the inputArray
  while (inputArray.length > 0) {
    // take the next cohort member and put them in the current group
    outputArray[group] === undefined ? outputArray.push([inputArray.shift()]) : outputArray[group].push(inputArray.shift());
    // set the index of the next group
    group = (group + 1) % numberOfGroups;
  }
  return outputArray;
}
