import 'package:test/test.dart';
import 'package:validator_annotation/annotations/string_annotations/max_string_length_validator.dart';

import '../metadata_test_helper.dart';

void main() {
  final String expectedFieldName = "userName";
  final String expectedErrorMessage =
      "userName length must be lower or equal to 8";
  final MaxStringLengthValidator instanceToTest = MaxStringLengthValidator(
    fieldName: expectedFieldName,
    errorMessage: expectedErrorMessage,
    length: 5,
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
    testValidatorMetadataSuccessValidate(
      instance: instanceToTest,
      expectedValidateResultValue: true,
      valueToValidate: "kiasu",
    );

    testValidatorMetadataSuccessValidate(
      instance: instanceToTest,
      expectedValidateResultValue: false,
      valueToValidate: "kiasu123",
      expectedErrorMessage: expectedErrorMessage,
    );

    testValidatorMetadataFailedValidate(
      instance: instanceToTest,
      valueToValidate: null,
    );

    testValidatorMetadataFailedValidate(
      instance: instanceToTest,
      valueToValidate: 42,
    );

    testValidatorMetadataFailedValidate(
      instance: MaxStringLengthValidator(
        length: 0,
        errorMessage: expectedErrorMessage,
        fieldName: expectedFieldName,
      ),
      description:
          "when max string length lower or equal to zero, should throw exception",
      valueToValidate: "nana",
    );
  });
}
