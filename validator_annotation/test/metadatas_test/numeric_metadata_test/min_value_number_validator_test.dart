import 'package:test/test.dart';
import 'package:validator_annotation/annotations/numeric_annotations/min_value_number_validator.dart';

import '../metadata_test_helper.dart';

void main() {
  const int minValue = 0;
  const String expectedFieldName = "numOfChild";
  const String expectedErrorMessage = "min value for num of child is $minValue";
  const int lowerValue = -1;
  const int higherValue = 2;

  group("IsEmailValidator", () {
    testValidatorMetadataFieldName(
      MinValueNumberValidator(
        value: minValue,
        fieldName: expectedFieldName,
      ),
      expectedFieldName,
    );

    testValidatorMetadataErrorMessage(
      MinValueNumberValidator(
        value: minValue,
        errorMessage: expectedErrorMessage,
      ),
      expectedErrorMessage,
    );

    testValidatorMetadataSuccessValidate(
      instance: MinValueNumberValidator(
        value: minValue,
      ),
      expectedValidateResultValue: true,
      valueToValidate: minValue,
      description:
          "When value is equal to minValue=$minValue, should be success validate and return true",
    );

    testValidatorMetadataSuccessValidate(
      instance: MinValueNumberValidator(
        value: minValue,
      ),
      expectedValidateResultValue: true,
      valueToValidate: higherValue,
      description:
          "When value is higher to minValue=$minValue, should be success validate and return true",
    );

    testValidatorMetadataSuccessValidate(
      instance: MinValueNumberValidator(
        value: minValue,
        errorMessage: expectedErrorMessage,
      ),
      expectedValidateResultValue: false,
      valueToValidate: lowerValue,
      description:
          "When value is lower than minValue=$minValue, should be success validate and return false",
      expectedErrorMessage: expectedErrorMessage,
    );

    testValidatorMetadataFailedValidate(
      instance: MinValueNumberValidator(
        value: minValue,
      ),
      description: "When value is null, should be throw exception",
      valueToValidate: null,
    );

    testValidatorMetadataFailedValidate(
      instance: MinValueNumberValidator(
        value: minValue,
      ),
      description: "When value is not numeric, should be throw exception",
      valueToValidate: "42",
    );
  });
}
