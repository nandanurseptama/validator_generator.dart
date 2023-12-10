bool isCamelCase(String input) => RegExp(r'^[a-z][a-zA-Z]*$').hasMatch(input);
bool isSnakeCase(String input) => RegExp(r'^[a-z]+(?:_[a-z]+)*$').hasMatch(
      input,
    );

bool isPascalCase(String input) => RegExp(r'^[A-Z][a-zA-Z]*$').hasMatch(
      input,
    );
bool isFirstLetterUppercase(String input) =>
    input.isNotEmpty && input[0] == input[0].toUpperCase();
