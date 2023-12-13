// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// ValidatorModelGenerator
// **************************************************************************

class ProfileModelValidator {
  static String? validateFullName(String value) {
    final validatorAnnotations = [
      const IsNotEmptyStringValidator(),
      const MaxStringLengthValidator(length: 64)
    ];
    return validateField(
      value,
      validatorAnnotations,
    );
  }

  static ValidationResult validate(ProfileModel instance) {
    // validation data
    final validationDatas = [
      ValidationData(
        instanceMemberSymbol: 'fullName',
        valueToValidate: instance.fullName,
        annotations: [
          const IsNotEmptyStringValidator(),
          const MaxStringLengthValidator(length: 64)
        ],
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
