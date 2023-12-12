// ignore_for_file: require_trailing_commas

import 'package:test/test.dart';
import 'package:validator_annotation/validator_annotation.dart';

void main() {
  late ValidationResult validationResultToTest;
  late List<ValidationError> expectedValidationErrors;
  late List<ValidationData> expectedValidationDatas;

  setUpAll(() {
    expectedValidationErrors = [
      ValidationError(
        fieldName: 'username',
        originalValue: '',
        errorMessage: 'cannot be empty',
      ),
    ];

    expectedValidationDatas = [
      const ValidationData(
        instanceMemberSymbol: 'username',
        valueToValidate: '',
        annotations: [
          IsNotEmptyStringValidator(
            fieldName: 'username',
          ),
        ],
      ),
    ];

    validationResultToTest = ValidationResult(
      errors: expectedValidationErrors,
      validationData: expectedValidationDatas,
    );
  });

  group('ValidationResult', () {
    test('constructor should run without any error', () {
      expect(
        () => ValidationResult(
          errors: expectedValidationErrors,
          validationData: expectedValidationDatas,
        ),
        returnsNormally,
      );
    });

    test('all properties value should match with expected value', () {
      expect(
        validationResultToTest.errors,
        expectedValidationErrors,
      );
      expect(
        validationResultToTest.validationData,
        expectedValidationDatas,
      );

      expect(
        validationResultToTest.firstError,
        expectedValidationErrors.first,
      );
      expect(
        validationResultToTest.firstErrorToString,
        '''${expectedValidationErrors.first.fieldName} : ${expectedValidationErrors.first.errorMessage}''',
      );
      expect(
        validationResultToTest.isError,
        true,
      );
    });

    test('when function', () {
      expect(
        validationResultToTest.when(
          error: (result) => result.firstErrorToString,
          noError: (result) => '',
        ),
        '''${expectedValidationErrors.first.fieldName} : ${expectedValidationErrors.first.errorMessage}''',
      );

      const validationResultWithoutError = ValidationResult(
        errors: [],
        validationData: [],
      );
      expect(
        () => validationResultWithoutError.firstError,
        throwsA(
          isA<Exception>(),
        ),
      );
      expect(
        () => validationResultWithoutError.firstErrorToString,
        throwsA(
          isA<Exception>(),
        ),
      );
      expect(
        validationResultWithoutError.when(
          error: (result) => result.firstErrorToString,
          noError: (result) => '',
        ),
        '',
      );

      expect(
        () => validationResultWithoutError.when(
          error: (result) => result.firstErrorToString,
          noError: (result) => result.firstErrorToString,
        ),
        throwsA(isA<Exception>()),
      );
    });

    test(
        '''two validation result instances with difference property values, should not match''',
        () {
      final validationResultMatcher = ValidationResult(
        errors: [
          ValidationError(
            fieldName: 'child',
            originalValue: -1,
            errorMessage: 'must higher than or equal to 0',
          )
        ],
        validationData: [
          const ValidationData(
            instanceMemberSymbol: 'child',
            valueToValidate: -1,
            annotations: [
              MinValueNumberValidator(
                value: 0,
              ),
            ],
          ),
        ],
      );

      expect(
        validationResultToTest == validationResultMatcher,
        isFalse,
      );
    });
  });
}
