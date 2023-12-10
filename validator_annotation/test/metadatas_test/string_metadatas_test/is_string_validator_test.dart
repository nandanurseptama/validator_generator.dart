import 'package:test/test.dart';
import 'package:validator_annotation/validator_annotation.dart';

import '../metadata_test_helper.dart';

void main() {
  group("IsStringValidator Test", () {
    metadataValidatorInternalTest();
  });
}

void metadataValidatorInternalTest() {
  group('IsStringValidator Internal Test', () {
    testValidatorMetadataSuccessValidate(
      instance: isStringValidator,
      valueToValidate: "hello",
      expectedValidateResultValue: true,
      description: "Valid non-nullable string value",
    );

    testValidatorMetadataSuccessValidate(
      instance: IsStringValidator(),
      valueToValidate: null,
      expectedValidateResultValue: true,
      description: "Valid nullable string value when allowNullable is true",
    );

    group("", () {
      var expectedErrorMessage = "string cannot be null";
      testValidatorMetadataSuccessValidate(
        instance: IsStringValidator(
          allowNullable: false,
          errorMessage: expectedErrorMessage,
        ),
        valueToValidate: null,
        expectedValidateResultValue: false,
        description: "Invalid null value when allowNullable is false",
        expectedErrorMessage: expectedErrorMessage,
      );
    });

    group("", () {
      const expectedErrorMessage = "value not string";
      testValidatorMetadataSuccessValidate(
        instance: IsStringValidator(
            allowNullable: false, errorMessage: expectedErrorMessage),
        valueToValidate: 42,
        expectedValidateResultValue: false,
        description: "Invalid non-string value should be return false",
        expectedErrorMessage: expectedErrorMessage,
      );
    });
  });
}
