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
