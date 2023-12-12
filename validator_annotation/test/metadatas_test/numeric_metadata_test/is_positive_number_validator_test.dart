import 'package:test/test.dart';
import 'package:validator_annotation/annotations/numeric_annotations/is_positive_number_validator.dart';

import '../metadata_test_helper.dart';

void main() {
  group('IsPositiveNumberValidator', () {
    testValidatorMetadataFieldName(
      const IsPositiveNumberValidator(
        fieldName: 'postiveNumber',
      ),
      'postiveNumber',
    );

    testValidatorMetadataErrorMessage(
      const IsPositiveNumberValidator(
        errorMessage: 'must be positive',
      ),
      'must be positive',
    );

    testValidatorMetadataSuccessValidate(
      instance: const IsPositiveNumberValidator(),
      expectedValidateResultValue: true,
      valueToValidate: 1,
      description:
          'When value is positive, should be success validate and return true',
    );

    testValidatorMetadataSuccessValidate(
      instance: const IsPositiveNumberValidator(
        errorMessage: 'must be positive',
      ),
      expectedValidateResultValue: false,
      valueToValidate: 0,
      description:
          'When value is zero, should be success validate and return false',
      expectedErrorMessage: 'must be positive',
    );

    testValidatorMetadataSuccessValidate(
      instance: const IsPositiveNumberValidator(
        errorMessage: 'must be positive',
      ),
      expectedValidateResultValue: false,
      valueToValidate: -1,
      description:
          'When value is negative, should be success validate and return false',
      expectedErrorMessage: 'must be positive',
    );

    testValidatorMetadataFailedValidate(
      instance: const IsPositiveNumberValidator(),
      description: 'When value is null, should be throw exception',
    );

    testValidatorMetadataFailedValidate(
      instance: const IsPositiveNumberValidator(),
      description: 'When value is not numeric, should be throw exception',
      valueToValidate: '42',
    );
  });
}
