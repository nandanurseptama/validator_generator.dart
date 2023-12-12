import 'package:test/test.dart';
import 'package:validator_annotation/annotations/string_annotations/is_email_validator.dart';

import '../metadata_test_helper.dart';

void main() {
  group('IsEmailValidator', () {
    testValidatorMetadataFieldName(
      const IsEmailValidator(
        fieldName: 'email',
      ),
      'email',
    );

    testValidatorMetadataErrorMessage(
      const IsEmailValidator(
        errorMessage: "is'nt valid email",
      ),
      "is'nt valid email",
    );

    testValidatorMetadataSuccessValidate(
      instance: const IsEmailValidator(),
      expectedValidateResultValue: true,
      valueToValidate: 'bard@gmail.com',
      description:
          '''When value is valid email, should be success validate and return true''',
          
    );

    testValidatorMetadataSuccessValidate(
      instance: const IsEmailValidator(
        errorMessage: "is'nt valid email",
      ),
      expectedValidateResultValue: false,
      valueToValidate: 'bard@gmail@com',
      description:
          '''When value not valid email, should be success validate and return false''',
      expectedErrorMessage: "is'nt valid email",
    );

    testValidatorMetadataSuccessValidate(
      instance: const IsEmailValidator(
        errorMessage: "is'nt valid email",
      ),
      expectedValidateResultValue: false,
      description:
          'When value is null, should be success validate and return false',
      expectedErrorMessage: "is'nt valid email",
    );

    testValidatorMetadataFailedValidate(
      instance: const IsEmailValidator(),
      description: 'When value is not string, should be throw exception',
      valueToValidate: 42,
    );
  });
}
