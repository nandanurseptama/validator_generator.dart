import 'package:source_gen_test/source_gen_test.dart';
import 'package:validator_annotation/validator_annotation.dart';

@ShouldThrow('`@ClassValidator` can only be used on classes.')
@ClassValidator() // ignore: invalid_annotation_target
const topLevelVariabel = 2;

@ShouldThrow(
  '''`@ClassValidator` there are no field that annotated with `@ValidatorAnnotation`''',
)
@ClassValidator()
class ProfileModel {}

@ShouldGenerate('''class UserModelValidator {
  static String? validate_email(dynamic value) {
    final validatorAnnotations = [
      const IsNotEmptyStringValidator(),
      const IsEmailValidator(fieldName: 'email', errorMessage: 'is not email')
    ];
    return validateField(
      value,
      validatorAnnotations,
    );
  }

  static String? validate_password(dynamic value) {
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
''')
@ClassValidator(
  stopWhenFirstError: false,
  namingConvention: NamingConvention.snackCase,
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
