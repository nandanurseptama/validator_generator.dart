import 'package:test/test.dart';
import 'package:validator_annotation/annotations/numeric_annotations/min_value_number_validator.dart';

import '../metadata_test_helper.dart';

void main() {
  const minValue = 0;
  const expectedFieldName = 'numOfChild';
  const expectedErrorMessage = 'min value for num of child is $minValue';
  const lowerValue = -1;
  const higherValue = 2;

  group('IsEmailValidator', () {
    testValidatorMetadataFieldName(
      const MinValueNumberValidator(
        value: minValue,
        fieldName: expectedFieldName,
      ),
      expectedFieldName,
    );

    testValidatorMetadataErrorMessage(
      const MinValueNumberValidator(
        value: minValue,
        errorMessage: expectedErrorMessage,
      ),
      expectedErrorMessage,
    );

    testValidatorMetadataSuccessValidate(
      instance: const MinValueNumberValidator(
        value: minValue,
      ),
      expectedValidateResultValue: true,
      valueToValidate: minValue,
      description:
          '''When value is equal to minValue=$minValue, should be success validate and return true''',
    );

    testValidatorMetadataSuccessValidate(
      instance: const MinValueNumberValidator(
        value: minValue,
      ),
      expectedValidateResultValue: true,
      valueToValidate: higherValue,
      description:
          '''When value is higher to minValue=$minValue, should be success validate and return true''',
    );

    testValidatorMetadataSuccessValidate(
      instance: const MinValueNumberValidator(
        value: minValue,
        errorMessage: expectedErrorMessage,
      ),
      expectedValidateResultValue: false,
      valueToValidate: lowerValue,
      description:
          '''When value is lower than minValue=$minValue, should be success validate and return false''',
      expectedErrorMessage: expectedErrorMessage,
    );

    testValidatorMetadataFailedValidate(
      instance: const MinValueNumberValidator(
        value: minValue,
      ),
      description: '''When value is null, should be throw exception''',
    );

    testValidatorMetadataSuccessValidate(
      instance: const MinValueNumberValidator(
        value: minValue,
      ),
      description: '''When value is not numeric, should be throw exception''',
      valueToValidate: '42',
      expectedValidateResultValue: true,
    );
  });
}
