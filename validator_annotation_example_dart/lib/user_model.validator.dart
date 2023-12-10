// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// _UnifiedGenerator
// **************************************************************************

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
    final options = const ValidatorOptions(stopWhenFirstError: true);
    return validateInstance(validationDatas, options);
  }
}
