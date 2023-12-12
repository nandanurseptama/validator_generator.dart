// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// ValidatorModelGenerator
// **************************************************************************

class ProfileModelValidator {
  static String? validateFullName(String value) {
    final validatorAnnotations = [
      IsNotEmptyStringValidator(),
      MaxStringLengthValidator(length: 64)
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
          IsNotEmptyStringValidator(),
          MaxStringLengthValidator(length: 64)
        ],
      )
    ];

    // validator options
    final stopWhenFirstError = true;
    return validateInstance(
      validationDatas,
      stopWhenFirstError: stopWhenFirstError,
    );
  }
}
