import 'package:test/test.dart';
import 'package:validator_annotation/utils/classes/validation_error.dart';

void main() {
  late ValidationError validationErrorToTest;

  late String expectedFieldName;
  late int expectedOriginalValue;
  late String expectedError;

  setUpAll(() {
    expectedFieldName = 'child';
    expectedOriginalValue = -1;
    expectedError = 'child should be higher or same with zero';

    validationErrorToTest = ValidationError(
      fieldName: expectedFieldName,
      originalValue: expectedOriginalValue,
      errorMessage: expectedError,
    );
  });

  group('ValidationError', () {
    test('constructor should not error', () {
      expect(
        () => ValidationError(
          fieldName: expectedFieldName,
          originalValue: expectedOriginalValue,
          errorMessage: expectedError,
        ),
        returnsNormally,
      );
    });
    test('all properties value must be same with expected value', () {
      expect(
        validationErrorToTest.fieldName,
        expectedFieldName,
      );
      expect(
        validationErrorToTest.errorMessage,
        expectedError,
      );
      expect(
        validationErrorToTest.originalValue,
        expectedOriginalValue,
      );
    });
  });
}
