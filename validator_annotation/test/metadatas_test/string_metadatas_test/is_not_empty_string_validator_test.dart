import 'package:test/test.dart';
import 'package:validator_annotation/annotations/string_annotations/is_not_empty_string_validator.dart';

import '../metadata_test_helper.dart';

void main() {
  group('IsNotEmptyStringValidator', () {
    testValidatorMetadataFieldName(
      const IsNotEmptyStringValidator(
        fieldName: 'userName',
      ),
      'userName',
    );

    testValidatorMetadataErrorMessage(
      const IsNotEmptyStringValidator(
        errorMessage: 'userName required',
      ),
      'userName required',
    );

    testValidatorMetadataSuccessValidate(
      instance: const IsNotEmptyStringValidator(),
      expectedValidateResultValue: true,
      valueToValidate: 'nanda nur',
      description:
          'When value is not empty, should be success validate and return true',
    );

    testValidatorMetadataSuccessValidate(
      instance: const IsNotEmptyStringValidator(
        errorMessage: 'required',
      ),
      expectedValidateResultValue: false,
      valueToValidate: '',
      description:
          '''When value is string empty, should be success validate and return false''',
      expectedErrorMessage: 'required',
    );

    testValidatorMetadataFailedValidate(
      instance: const IsNotEmptyStringValidator(),
      description: 'When value is not string, should be throw exception',
      valueToValidate: 42,
    );

    testValidatorMetadataFailedValidate(
      instance: const IsNotEmptyStringValidator(),
      description: 'When value is null, should be throw exception',
    );
  });
}
