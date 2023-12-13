[![Pub Package](https://img.shields.io/pub/v/validator_generator.svg)](https://pub.dev/packages/validator_generator)

Defines annotations that will be used by packaged [`validator_generator`] to build class validator.

# Annotation Values

## Class

```dart
ClassValidator // Annotation in class level
```

## Field Member

### String

These are example supported annotation for string member :

```dart
IsStringValidator
IsNotEmptyStringValidator
IsEmptyStringValidator
MinStringLengthValidator
MaxStringLengthValidator
```

[More](lib/annotations/string_annotations/string_metadatas.dart)

### Numeric

These are example supported annotation for numeric member :

```dart
IsZeroValidator
IsNegativeNumberValidator
IsPostiveNumberValidator
```

[More](lib/annotations/numeric_annotations/numeric_metadatas.dart)

# Usages

## Install

```bash
dart pub get validator_annotation
dart pub get --dev validator_generator
```

## Example

Define a class, let say `UserModel` with file name `user_model.dart`. Then annotated `UserModel` with `ClassValidator`:

```dart
import 'package:validator_annotation/validator_annotation.dart';

part 'user_model.validator.dart';

@ClassValidator(
  // Stop validating the rest of instance members.
  // Only get the first error
  stopWhenFirstError: false,
  // Naming convention on each validator function
  namingConvention: NamingConvention.snackCase,
)
class UserModel {
  // apply not empty rule on email field
  @IsNotEmptyStringValidator()
  // apply email rule on email field
  @IsEmailValidator(
    // customize field name
    // when null it will take declaration name
    fieldName: 'email',
    // customize error message
    errorMessage: 'is not email',
  )
  // `validator_generator` will generate `validate_email` function,
  // to validate this field.
  // Take a look on example.validator.dart
  final String email;

  @IsNotEmptyStringValidator()
  final String password;

  const UserModel({
    required this.email,
    required this.password,
  });
}
```

Run `validator_generator` to generate validator class

```bash
dart pub run build_runner build
```

The `validator_generator` creates the corresponding part `user_model.validator.dart`:

```dart
// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'user_model.dart';

// **************************************************************************
// ValidatorModelGenerator
// **************************************************************************

class UserModelValidator {
  static String? validate_email(String value) {
    final validatorAnnotations = [
      const IsNotEmptyStringValidator(),
      const IsEmailValidator(fieldName: 'email', errorMessage: 'is not email')
    ];
    return validateField(
      value,
      validatorAnnotations,
    );
  }

  static String? validate_password(String value) {
    final validatorAnnotations = [const IsNotEmptyStringValidator()];
    return validateField(
      value,
      validatorAnnotations,
    );
  }

  static ValidationResult validate(UserModel instance) {
    // validation data
    final validationDatas = [
      ValidationData(
        instanceMemberSymbol: 'email',
        valueToValidate: instance.email,
        annotations: [
          const IsNotEmptyStringValidator(),
          const IsEmailValidator(
              fieldName: 'email', errorMessage: 'is not email')
        ],
      ),
      ValidationData(
        instanceMemberSymbol: 'password',
        valueToValidate: instance.password,
        annotations: [const IsNotEmptyStringValidator()],
      )
    ];

    // validator options
    const stopWhenFirstError = false;
    return validateInstance(
      validationDatas,
      stopWhenFirstError: stopWhenFirstError,
    );
  }
}
```

[`validator_generator`] : https://pub.dev/packages/validator_generator