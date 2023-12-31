import 'package:test/test.dart';
import 'package:validator_annotation/annotations/numeric_annotations/is_negative_number_validator.dart';

import '../metadata_test_helper.dart';

void main() {
  group('IsEmailValidator', () {
    testValidatorMetadataFieldName(
      const IsNegativeNumberValidator(
        fieldName: 'negativeNumber',
      ),
      'negativeNumber',
    );

    testValidatorMetadataErrorMessage(
      const IsNegativeNumberValidator(
        errorMessage: 'must be negative',
      ),
      'must be negative',
    );

    testValidatorMetadataSuccessValidate(
      instance: const IsNegativeNumberValidator(),
      expectedValidateResultValue: true,
      valueToValidate: -1,
      description:
          'When value is negative, should be success validate and return true',
    );

    testValidatorMetadataSuccessValidate(
      instance: const IsNegativeNumberValidator(
        errorMessage: 'must be negative',
      ),
      expectedValidateResultValue: false,
      valueToValidate: 0,
      description:
          'When value is zero, should be success validate and return false',
      expectedErrorMessage: 'must be negative',
    );

    testValidatorMetadataSuccessValidate(
      instance: const IsNegativeNumberValidator(
        errorMessage: 'must be negative',
      ),
      expectedValidateResultValue: false,
      valueToValidate: 1,
      description:
          'When value is positive, should be success validate and return false',
      expectedErrorMessage: 'must be negative',
    );

    testValidatorMetadataFailedValidate(
      instance: const IsNegativeNumberValidator(),
      description: 'When value is null, should be throw exception',
    );

    testValidatorMetadataSuccessValidate(
      instance: const IsNegativeNumberValidator(),
      description: 'When value is not numeric, should be throw exception',
      valueToValidate: '42',
      expectedErrorMessage: 'must be negative',
      expectedValidateResultValue: false,
    );
  });
}
