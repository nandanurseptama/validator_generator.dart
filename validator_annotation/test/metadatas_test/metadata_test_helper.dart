import 'package:test/test.dart';
import 'package:validator_annotation/validator_annotation.dart';

/// Test wrapper to check [ValidatorAnnotation] `fieldName`
void testValidatorMetadataFieldName(
  ValidatorAnnotation instance,
  String expectedFieldName,
) {
  test(
    '''Validator metadadata ${instance.runtimeType} should have fieldName=$expectedFieldName''',
    () {
      expect(
        instance.fieldName,
        expectedFieldName,
      );
    },
  );
}

/// Test wrapper to check [ValidatorAnnotation] `errorMessage` getter function
void testValidatorMetadataErrorMessage(
  ValidatorAnnotation instance,
  String expectedErrorMessage,
) {
  test(
    '''Validator metadadata ${instance.runtimeType} should have errorMessage=$expectedErrorMessage''',
    () {
      expect(
        instance.errorMessage,
        expectedErrorMessage,
      );
    },
  );
}

/// Test wrapper when validator metadata success validate
/// [valueToValidate] a.k.a not throwing exception
///
/// Either [expectedValidateResultValue] is `true` or `false`
///
/// when [expectedValidateResultValue] is `
/// false`, [expectedErrorMessage] should be provided
void testValidatorMetadataSuccessValidate({
  required ValidatorAnnotation instance,
  required bool expectedValidateResultValue,
  dynamic valueToValidate,
  String? description,
  String? expectedErrorMessage,
}) {
  assert(
    expectedValidateResultValue ||
        (!expectedValidateResultValue && expectedErrorMessage != null),
    '',
  );
  test(
    description ??
        '''Validator metadata ${instance.runtimeType} function validate should return `$expectedValidateResultValue`, when value to validate has value=$valueToValidate and value type is ${valueToValidate.runtimeType}''',
    () {
      expect(
        instance.isValid(
          valueToValidate,
        ),
        expectedValidateResultValue,
      );
      expect(
        () => instance.validate(valueToValidate),
        returnsNormally,
      );
      if (!expectedValidateResultValue) {
        expect(
          instance.errorMessage,
          expectedErrorMessage,
        );
      }
    },
  );
}

/// Test wrapper when validator metadata failed validate [valueToValidate]
/// a.k.a throwing exception
void testValidatorMetadataFailedValidate({
  String? description,
  required ValidatorAnnotation instance,
  dynamic valueToValidate,
}) {
  test(
      description ??
          '''Validator metadata ${instance.runtimeType} function validate should throw Exception, when value to validate has value=$valueToValidate and value type is ${valueToValidate.runtimeType}''',
      () {
    expect(
      () => instance.isValid(valueToValidate),
      throwsA(isA<Exception>()),
    );
  });
}
