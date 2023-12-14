import 'package:validator_annotation/validator_annotation.dart';

part 'user_model.validator.dart';

@ClassValidator()
class UserModel {
  @IsEmailValidator()
  final String email;

  @MinMaxStringLengthValidator(
    minLength: 6,
    maxLength: 8,
  )
  final String password;

  @MinValueNumberValidator(value: 1)
  final int id;

  const UserModel({
    required this.id,
    required this.email,
    required this.password,
  });
}
