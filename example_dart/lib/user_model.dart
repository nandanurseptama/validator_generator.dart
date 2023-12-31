import 'package:validator_annotation/validator_annotation.dart';
import 'package:example_dart/base_model.dart';

part 'user_model.validator.dart';

@ClassValidator(
  stopWhenFirstError: false,
  namingConvention: NamingConvention.snackCase,
)
class UserModel extends BaseModel {
  @IsNotEmptyStringValidator()
  @IsEmailValidator(
    fieldName: 'email',
    errorMessage: 'is not email',
  )
  final String email;

  @IsNotEmptyStringValidator()
  final String password;

  const UserModel({
    required super.id,
    required this.email,
    required this.password,
  });
}
