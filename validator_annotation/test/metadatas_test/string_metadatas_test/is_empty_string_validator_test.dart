import 'package:test/test.dart';
import 'package:validator_annotation/validator_annotation.dart';

import '../metadata_test_helper.dart';

void main() {
  group('IsEmptyStringValidator', () {
    testValidatorMetadataFieldName(
      const IsEmptyStringValidator(
        fieldName: 'userName',
      ),
      'userName',
    );

    testValidatorMetadataErrorMessage(
      const IsEmptyStringValidator(
        errorMessage: 'userName must be empty',
      ),
      'userName must be empty',
    );

    testValidatorMetadataSuccessValidate(
      instance: const IsEmptyStringValidator(),
      expectedValidateResultValue: true,
      valueToValidate: '',
      description:
          '''When value is string empty, should be success validate and return true''',
    );

    testValidatorMetadataSuccessValidate(
      instance: const IsEmptyStringValidator(
        errorMessage: 'not string empty',
      ),
      expectedValidateResultValue: false,
      valueToValidate: 'no name',
      description:
          '''When string is not empty, should be success validate and return false''',
      expectedErrorMessage: 'not string empty',
    );

    testValidatorMetadataSuccessValidate(
      instance: const IsEmptyStringValidator(),
      expectedValidateResultValue: true,
      description:
          '''When value is string null and allow nullable, should be success validate and return true''',
    );

    testValidatorMetadataFailedValidate(
      instance: const IsEmptyStringValidator(),
      description: 'When value is not string, should be throw exception',
      valueToValidate: 42,
    );

    testValidatorMetadataFailedValidate(
      instance: const IsEmptyStringValidator(
        allowNullable: false,
      ),
      description:
          '''When value is null and do not allow nullable, should be throw exception''',
    );
  });
}
