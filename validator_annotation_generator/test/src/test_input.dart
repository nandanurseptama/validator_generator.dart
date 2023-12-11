import 'package:source_gen_test/source_gen_test.dart';
import 'package:validator_annotation/validator_annotation.dart';

@ShouldThrow('`@ClassValidator` can only be used on classes.')
@ClassValidator()
const topLevelVariabel = 2;

@ShouldGenerate(
  '''
class UserModelValidator {
  static String? validateEmail(String value) {
    final validatorAnnotations = [
      IsNotEmptyStringValidator(),
      IsEmailValidator(fieldName: 'email', errorMessage: 'is not email')
    ];
    return validateField(
      value,
      validatorAnnotations,
    );
  }

  static String? validatePassword(String value) {
    final validatorAnnotations = [IsNotEmptyStringValidator()];
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
          IsNotEmptyStringValidator(),
          IsEmailValidator(fieldName: 'email', errorMessage: 'is not email')
        ],
      ),
      ValidationData(
        instanceMemberSymbol: 'password',
        valueToValidate: instance.password,
        annotations: [IsNotEmptyStringValidator()],
      )
    ];

    // validator options
    final stopWhenFirstError = false;
    return validateInstance(
      validationDatas,
      stopWhenFirstError: stopWhenFirstError,
    );
  }
}
''',
)
@ClassValidator(
  stopWhenFirstError: false,
)
class UserModel {
  @IsNotEmptyStringValidator()
  @IsEmailValidator(
    fieldName: 'email',
    errorMessage: 'is not email',
  )
  final String email;

  @IsNotEmptyStringValidator()
  final String password;

  const UserModel({
    required this.email,
    required this.password,
  });
}
