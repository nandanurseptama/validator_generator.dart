import 'package:test/test.dart';
import 'package:validator_annotation/annotations/string_annotations/min_max_string_length_validator.dart';

import '../metadata_test_helper.dart';

void main() {
  final String expectedFieldName = "userName";
  final String expectedErrorMessage = "userName length must be between 5 and 8";
  final MinMaxStringLengthValidator instanceToTest =
      MinMaxStringLengthValidator(
    fieldName: expectedFieldName,
    errorMessage: expectedErrorMessage,
    maxLength: 8,
    minLength: 5,
  );

  group("MaxStringLengthValidator", () {
    testValidatorMetadataFieldName(
      instanceToTest,
      expectedFieldName,
    );

    testValidatorMetadataErrorMessage(
      instanceToTest,
      expectedErrorMessage,
    );

    // equal to minLength
    testValidatorMetadataSuccessValidate(
      instance: instanceToTest,
      expectedValidateResultValue: true,
      valueToValidate: "kiasu",
      description: "when value length between equal to min, should return true",
    );

    // between to minLength and maxLength
    testValidatorMetadataSuccessValidate(
      instance: instanceToTest,
      expectedValidateResultValue: true,
      valueToValidate: "kiasu1",
      description:
          "when value length between minLength and maxLength, should return true",
    );

    // equal to maxLength
    testValidatorMetadataSuccessValidate(
      instance: instanceToTest,
      expectedValidateResultValue: true,
      valueToValidate: "kiasu123",
      description: "when value length equal to maxLength, should return true",
    );

    // higher than 8
    testValidatorMetadataSuccessValidate(
      instance: instanceToTest,
      expectedValidateResultValue: false,
      valueToValidate: "nandanurseptama",
      expectedErrorMessage: expectedErrorMessage,
    );

    // lower than 5
    testValidatorMetadataSuccessValidate(
      instance: instanceToTest,
      expectedValidateResultValue: false,
      valueToValidate: "xxx",
      expectedErrorMessage: expectedErrorMessage,
    );

    // invalid value to validate
    testValidatorMetadataFailedValidate(
      instance: instanceToTest,
      valueToValidate: null,
      description: "when value is null, should throw exception",
    );

    // invalid value to validate
    testValidatorMetadataFailedValidate(
      instance: instanceToTest,
      valueToValidate: 42,
      description: "when value not string, should throw exception",
    );

    // invalid minLength parameter
    testValidatorMetadataFailedValidate(
      instance: MinMaxStringLengthValidator(
        minLength: 0,
        maxLength: 8,
      ),
      valueToValidate: "xxx",
      description: "when minLength equal to zero, should throw exception",
    );

    // invalid maxLength parameter
    testValidatorMetadataFailedValidate(
      instance: MinMaxStringLengthValidator(
        minLength: 3,
        maxLength: 0,
      ),
      valueToValidate: "xxx",
      description: "when maxLength equal to zero, should throw exception",
    );

    // invalid maxLength and minLength parameter. maxLength should be higher than minLength
    testValidatorMetadataFailedValidate(
      instance: MinMaxStringLengthValidator(
        minLength: 3,
        maxLength: 3,
      ),
      valueToValidate: "xxx",
      description: "when minLength equal to maxLength, should throw exception",
    );
  });
}
