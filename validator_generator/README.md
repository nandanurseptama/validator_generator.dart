[![Pub Package](https://img.shields.io/pub/v/validator_generator.svg)](https://pub.dev/packages/validator_generator)

Provides [Dart Build System] builders for create validator class.

The builders generate validator class when they find class annotated with [`ClassValidator`].

To generate validator class, you need to :

- Annotate class with [`ClassValidator`]. You can provide arguments to [`ClassValidator`] to
  configure the generated code.

- Annotate each field that you want to be validate with one or more annotation. You can check supported annotation for field [Here].

## Setup

To configure your project for the latest released version of `validator_generator`, see the [example].

## Example

Given a library `example.dart` with an `UserModel` class annotated with
[`ClassValidator`]:

```dart
import 'package:validator_annotation/validator_annotation.dart';

part 'example.validator.dart';

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
Building creates the corresponding part `example.validator.dart`:

```dart
// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'example.dart';

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

# Running the code generator

Once you have added the annotations to your code you then need to run the code
generator to generate the missing `.validator.dart` generated dart files.

Run `dart run build_runner build` in the package directory.

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

[More](../validator_annotation/lib/annotations/string_annotations/string_metadatas.dart)

### Numeric

These are example supported annotation for numeric member :

```dart
IsZeroValidator
IsNegativeNumberValidator
IsPostiveNumberValidator
```

[More](../validator_annotation/lib/annotations/string_annotations/string_metadatas.dart)


[example]: https://github.com/nandanurseptama/validator_generator.dart/tree/master/example_dart
[Here]: (../validator_annotation/lib/annotations/annotations.dart)
[`ClassValidator`]: https://pub.dev/packages/validator_annotation