import 'package:test/test.dart';
import 'package:validator_annotation/annotations/numeric_annotations/min_max_value_number_validator.dart';

import '../metadata_test_helper.dart';

void main() {
  const int minValue = 1;
  const int maxValue = 5;
  const int betweenValue = 4;
  const String expectedFieldName = "numOfChild";
  const String expectedErrorMessage =
      "num of child value must be between $minValue & $maxValue";
  const int lowerValue = 0;
  const int higherValue = 6;

  group("IsEmailValidator", () {
    testValidatorMetadataFieldName(
      MinMaxValueNumberValidator(
        minValue: minValue,
        maxValue: maxValue,
        fieldName: expectedFieldName,
      ),
      expectedFieldName,
    );

    testValidatorMetadataErrorMessage(
      MinMaxValueNumberValidator(
        minValue: minValue,
        maxValue: maxValue,
        errorMessage: expectedErrorMessage,
      ),
      expectedErrorMessage,
    );

    testValidatorMetadataSuccessValidate(
      instance: MinMaxValueNumberValidator(
        minValue: minValue,
        maxValue: maxValue,
      ),
      expectedValidateResultValue: true,
      valueToValidate: maxValue,
      description:
          "When value is equal to maxValue=$maxValue, should be success validate and return true",
    );

    testValidatorMetadataSuccessValidate(
      instance: MinMaxValueNumberValidator(
        minValue: minValue,
        maxValue: maxValue,
      ),
      expectedValidateResultValue: true,
      valueToValidate: minValue,
      description:
          "When value is equal to minValue=$minValue, should be success validate and return true",
    );

    testValidatorMetadataSuccessValidate(
      instance: MinMaxValueNumberValidator(
        minValue: minValue,
        maxValue: maxValue,
      ),
      expectedValidateResultValue: true,
      valueToValidate: betweenValue,
      description:
          "When value between minValue=$minValue & maxValue=$maxValue, should be success validate and return true",
    );

    testValidatorMetadataSuccessValidate(
      instance: MinMaxValueNumberValidator(
        minValue: minValue,
        maxValue: maxValue,
        errorMessage: expectedErrorMessage,
      ),
      expectedValidateResultValue: false,
      valueToValidate: lowerValue,
      description:
          "When value is higher than minValue=$minValue, should be success validate and return false",
      expectedErrorMessage: expectedErrorMessage,
    );

    testValidatorMetadataSuccessValidate(
      instance: MinMaxValueNumberValidator(
        minValue: minValue,
        maxValue: maxValue,
        errorMessage: expectedErrorMessage,
      ),
      expectedValidateResultValue: false,
      valueToValidate: higherValue,
      description:
          "When value is higher than maxValue=$maxValue, should be success validate and return false",
      expectedErrorMessage: expectedErrorMessage,
    );

    testValidatorMetadataFailedValidate(
      instance: MinMaxValueNumberValidator(
        minValue: minValue,
        maxValue: maxValue,
      ),
      description: "When value is null, should be throw exception",
      valueToValidate: null,
    );

    testValidatorMetadataFailedValidate(
      instance: MinMaxValueNumberValidator(
        minValue: minValue,
        maxValue: maxValue,
      ),
      description: "When value is not numeric, should be throw exception",
      valueToValidate: "42",
    );
  });
}
