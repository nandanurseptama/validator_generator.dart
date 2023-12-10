import 'package:test/test.dart';
import 'package:validator_annotation/annotations/numeric_annotations/max_value_number_validator.dart';

import '../metadata_test_helper.dart';

void main() {
  const int maxValue = 5;
  const String expectedFieldName = "numOfChild";
  const String expectedErrorMessage = "max value for num of child is $maxValue";
  const int lowerValue = 4;
  const int higherValue = 12;

  group("IsEmailValidator", () {
    testValidatorMetadataFieldName(
      MaxValueNumberValidator(
        value: maxValue,
        fieldName: expectedFieldName,
      ),
      expectedFieldName,
    );

    testValidatorMetadataErrorMessage(
      MaxValueNumberValidator(
        value: maxValue,
        errorMessage: expectedErrorMessage,
      ),
      expectedErrorMessage,
    );

    testValidatorMetadataSuccessValidate(
      instance: MaxValueNumberValidator(
        value: maxValue,
      ),
      expectedValidateResultValue: true,
      valueToValidate: maxValue,
      description:
          "When value is equal to maxValue=$maxValue, should be success validate and return true",
    );

    testValidatorMetadataSuccessValidate(
      instance: MaxValueNumberValidator(
        value: maxValue,
      ),
      expectedValidateResultValue: true,
      valueToValidate: lowerValue,
      description:
          "When value is lower to maxValue=$maxValue, should be success validate and return true",
    );

    testValidatorMetadataSuccessValidate(
      instance: MaxValueNumberValidator(
        value: maxValue,
        errorMessage: expectedErrorMessage,
      ),
      expectedValidateResultValue: false,
      valueToValidate: higherValue,
      description:
          "When value is higher than maxValue=$maxValue, should be success validate and return false",
      expectedErrorMessage: expectedErrorMessage,
    );

    testValidatorMetadataFailedValidate(
      instance: MaxValueNumberValidator(
        value: maxValue,
      ),
      description: "When value is null, should be throw exception",
      valueToValidate: null,
    );

    testValidatorMetadataFailedValidate(
      instance: MaxValueNumberValidator(
        value: maxValue,
      ),
      description: "When value is not numeric, should be throw exception",
      valueToValidate: "42",
    );
  });
}
