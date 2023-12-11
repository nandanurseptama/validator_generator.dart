String lowerFirstLetter(String input) {
  if (input.isEmpty) {
    return input; // Return the input unchanged if it's an empty string
  }

  // Convert the first character to lowercase and
  // concatenate the rest of the string
  return input[0].toLowerCase() + input.substring(1);
}

String upperFirstLetter(String input) {
  if (input.isEmpty) {
    return input; // Return the input unchanged if it's an empty string
  }

  // Convert the first character to lowercase and
  // concatenate the rest of the string
  return input[0].toUpperCase() + input.substring(1);
}

String toPascalCase(String input) {
  List<String> words;

  if (input.contains('_')) {
    // If input contains '_', assume it's in snake_case
    words = input.split('_');
  } else {
    // Otherwise, assume it's in camelCase
    // Use a regular expression to split camelCase
    words = input
        .replaceAllMapped(RegExp(r'([A-Z])'), (match) => '_${match.group(0)}')
        .toLowerCase()
        .split('_')
      ..removeAt(0); // Remove the empty string at the beginning
  }

  for (var i = 0; i < words.length; i++) {
    final word = words[i];
    words[i] = word[0].toUpperCase() + word.substring(1);
  }

  return words.join();
}

String toCamelCase(String input) {
  List<String> words;

  if (input.contains('_')) {
    // If input contains '_', assume it's in snake_case
    words = input.split('_');
  } else {
    // Otherwise, assume it's in PascalCase
    // Use a regular expression to split PascalCase
    words = input
        .replaceAllMapped(RegExp(r'([A-Z])'), (match) => '_${match.group(0)}')
        .toLowerCase()
        .split('_')
      ..removeAt(0); // Remove the empty string at the beginning
  }

  for (var i = 1; i < words.length; i++) {
    final word = words[i];
    words[i] = word[0].toUpperCase() + word.substring(1);
  }

  return words.join();
}

String toSnakeCase(String input) {
  final words = <String>[];

  // Use a regular expression to split PascalCase or camelCase
  final matches = RegExp(r'[A-Za-z0-9]+')
      .allMatches(input)
      .map(
        (match) => match.group(0) ?? '',
      )
      .toList();

  for (var i = 0; i < matches.length; i++) {
    var word = matches[i].toLowerCase();
    if (i > 0) {
      // Capitalize the first letter of each word except the first one
      word = '_$word';
    }
    words.add(word);
  }

  return words.join();
}
