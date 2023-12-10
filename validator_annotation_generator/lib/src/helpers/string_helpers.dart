String lowerFirstLetter(String input) {
  if (input.isEmpty) {
    return input; // Return the input unchanged if it's an empty string
  }

  // Convert the first character to lowercase and
  // concatenate the rest of the string
  return input[0].toLowerCase() + input.substring(1);
}
String upperFirstLetter(String input){
  if (input.isEmpty) {
    return input; // Return the input unchanged if it's an empty string
  }

  // Convert the first character to lowercase and
  // concatenate the rest of the string
  return input[0].toUpperCase() + input.substring(1);
}
