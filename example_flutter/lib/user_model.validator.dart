// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// ValidatorModelGenerator
// **************************************************************************

class UserModelValidator {
  static String? validateEmail(dynamic value) {
    final validatorAnnotations = [const IsEmailValidator()];
    return validateField(
      value,
      validatorAnnotations,
    );
  }

  static String? validatePassword(dynamic value) {
    final validatorAnnotations = [
      const MinMaxStringLengthValidator(minLength: 6, maxLength: 8)
    ];
    return validateField(
      value,
      validatorAnnotations,
    );
  }

  static String? validateId(dynamic value) {
    final validatorAnnotations = [const MinValueNumberValidator(value: 1)];
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
        annotations: [const IsEmailValidator()],
      ),
      ValidationData(
        instanceMemberSymbol: 'password',
        valueToValidate: instance.password,
        annotations: [
          const MinMaxStringLengthValidator(minLength: 6, maxLength: 8)
        ],
      ),
      ValidationData(
        instanceMemberSymbol: 'id',
        valueToValidate: instance.id,
        annotations: [const MinValueNumberValidator(value: 1)],
      )
    ];

    // validator options
    const stopWhenFirstError = true;
    return validateInstance(
      validationDatas,
      stopWhenFirstError: stopWhenFirstError,
    );
  }
}
