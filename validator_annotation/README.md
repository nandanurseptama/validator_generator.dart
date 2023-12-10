# validator_metadata

[![Dart](https://github.com/nandanurseptama/dart_validator_metadata/actions/workflows/.dart.yml/badge.svg?branch=master)](https://github.com/nandanurseptama/dart_validator_metadata/actions/workflows/.dart.yml)
![Coverage](https://raw.githubusercontent.com/nandanurseptama/dart_validator_metadata/master/code_coverage.svg?sanitize=true)

A validator metadata package that will help you to validate your instance model/DTO


## Features

- Declare validation rule in class with ValidatorMetadata
- Validate instance of class with declared ValidatorMetadata
- Validate a `value` with validation function
- Create new Validator Metadata by extending ValidatorMetadata

## Getting started

```bash
dart pub add validator_metadata
```

## Usage

### Declare a class with validator metadata
```dart
import 'package:validator_annotation/validator_metadata.dart';

class User {
  // validation on each instance member will start from the top
  @IsNotEmptyStringValidator(
    fieldName: "fullName",
    trimWhiteSpace: true, // will trimmed all white space
  )
  // check if full name only contain alphabet or not
  @IsAlphabetValidator(
    fieldName: "fullName",
    trimWhiteSpace: true,
  )
  @MinMaxStringLengthValidator(
    minLength: 4,
    maxLength: 10,
    // when you do not supply fieldName in metadata, validate function will take property name
    fieldName: "fullName",
    
  )
  final String fullName;

  const User({
    required this.fullName,
  });
}

```

### Validate instance

```dart
import 'package:validator_annotation/validator_metadata.dart';

void main() {
  validateWithoutError();
  validateWithError();
  validateWithError2();
}

void validateWithoutError() {
  const user1 = User(
    fullName: "Nanda Nur Septama",
  );
  var validationResult = validate(
    user1,
  );

  // check if there are any error or not
  if (!validationResult.isError) {
    print(
      "success",
    );
    return;
  }
}

void validateWithError() {
  const user1 = User(
    fullName: "",
  );
  var validationResult = validate(
    user1,
  );

  // check if there are any error or not
  if (validationResult.isError) {
    print(validationResult
        .firstErrorToString); // get first error in string format
    var validationError = validationResult
        .firstError; // get first error as ValidationError instance
    print(
        "${validationError.fieldName} ${validationError.errorMessage}. The value you supplied ${validationError.originalValue}");
    return;
  }
}

void validateWithError2() {
  const user1 = User(
    fullName: "kekek; dsads;",
  );
  var validationResult = validate(
    user1,
  );

  // check if there are any error or not
  if (validationResult.isError) {
    // it will print `fullName : must be alphabet`
    print(validationResult
        .firstErrorToString); // get first error in string format
    var validationError = validationResult
        .firstError; // get first error as ValidationError instance

    // it will print `fullName must be alphabet. The value you supplied kekek; dsads;`
    print(
        "${validationError.fieldName} ${validationError.errorMessage}. The value you supplied ${validationError.originalValue}");

    var allErrors = validationResult.errors
        .map((e) => "${e.fieldName} ${e.errorMessage}")
        .toList();

    // it will print. `[fullName must be alphabet, fullName value length should be between 4 & 10]`
    print(allErrors);
    return;
  }
}
```

## Additional information

You can make a pull request to create a new feature or bug fixing