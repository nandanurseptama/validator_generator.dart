// GENERATED CODE - DO NOT MODIFY BY HAND

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
