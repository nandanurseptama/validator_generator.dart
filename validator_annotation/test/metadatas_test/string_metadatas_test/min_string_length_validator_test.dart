import 'package:test/test.dart';
import 'package:validator_annotation/annotations/string_annotations/min_string_length_validator.dart';

import '../metadata_test_helper.dart';

void main() {
  const expectedFieldName = 'userName';
  const expectedErrorMessage = 'userName length must be higher or equal to 5';
  const instanceToTest = MinStringLengthValidator(
    fieldName: expectedFieldName,
    errorMessage: expectedErrorMessage,
    length: 5,
  );

  group('MinStringLengthValidator', () {
    testValidatorMetadataFieldName(
      instanceToTest,
      expectedFieldName,
    );
    testValidatorMetadataErrorMessage(
      instanceToTest,
      expectedErrorMessage,
    );
    // equal to 5
    testValidatorMetadataSuccessValidate(
      instance: instanceToTest,
      expectedValidateResultValue: true,
      valueToValidate: 'kiasu',
    );

    testValidatorMetadataSuccessValidate(
      instance: instanceToTest,
      expectedValidateResultValue: true,
      valueToValidate: 'kiasu123',
    );

    testValidatorMetadataSuccessValidate(
      instance: instanceToTest,
      expectedValidateResultValue: false,
      valueToValidate: 'xxx',
      expectedErrorMessage: expectedErrorMessage,
    );

    testValidatorMetadataFailedValidate(
      instance: instanceToTest,
    );

    testValidatorMetadataFailedValidate(
      instance: instanceToTest,
      valueToValidate: 42,
    );

    testValidatorMetadataFailedValidate(
      instance: const MinStringLengthValidator(
        length: 0,
        errorMessage: expectedErrorMessage,
        fieldName: expectedFieldName,
      ),
      description:
          '''when min string length lower or equal to zero, should throw exception''',
      valueToValidate: 'nana',
    );
  });
}
