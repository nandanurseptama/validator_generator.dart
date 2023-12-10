import 'package:test/test.dart';
import 'package:validator_annotation/annotations/string_annotations/is_string_number_validator.dart';

import '../metadata_test_helper.dart';

void main() {
  final String expectedFieldName = "salary";
  final String expectedErrorMessage = "salary must be number";
  final IsStringNumberValidator instanceToTest = IsStringNumberValidator(
    fieldName: expectedFieldName,
    errorMessage: expectedErrorMessage,
  );

  group("IsStringNumberValidator", () {
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
      valueToValidate: "1000",
    );

    testValidatorMetadataSuccessValidate(
      instance: instanceToTest,
      expectedValidateResultValue: false,
      valueToValidate: "a",
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
  });
}
