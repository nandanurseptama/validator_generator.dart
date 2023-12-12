// ignore_for_file: unnecessary_type_check

import 'package:test/test.dart';
import 'package:validator_annotation/annotations/annotations.dart';

class _ValidatorMetadata extends ValidatorAnnotation {
  _ValidatorMetadata({
    super.fieldName,
    super.errorMessage,
  }) : super(
          name: '_ValidatorMetadata',
        );

  @override
  String get defaultErrorMessage => 'defaultErrorMessage';

  @override
  bool isValid(dynamic value) => true;
}

void main() {
  late _ValidatorMetadata validatorMetadataToTest;
  const expectedFieldName = 'userName';
  const expectedDefaultErrorMessage = 'defaultErrorMessage';
  const expectedErrorMessage = 'its validator metadata';
  const expectedValidatorName = '_ValidatorMetadata';

  setUpAll(() {
    validatorMetadataToTest = _ValidatorMetadata(
      fieldName: expectedFieldName,
      errorMessage: expectedErrorMessage,
    );
  });

  group('ValidatorMetadata Test', () {
    test('_ValidatorMetadata should be instance of ValidatorMetadata', () {
      expect(
        validatorMetadataToTest is ValidatorAnnotation,
        isTrue,
      );
    });

    test('_ValidatorMetadata should be have expected validatorName', () {
      expect(
        validatorMetadataToTest.name,
        expectedValidatorName,
      );
    });

    test('_ValidatorMetadata should be have expected fieldName', () {
      expect(
        validatorMetadataToTest.fieldName,
        expectedFieldName,
      );
    });

    test('_ValidatorMetadata should be have expected errorMessage', () {
      expect(
        validatorMetadataToTest.errorMessage,
        expectedErrorMessage,
      );
    });

    test(
        '''_ValidatorMetadata validate function should implements validate function''',
        () {
      expect(
        () => validatorMetadataToTest.validate(
          null,
        ),
        returnsNormally,
      );
    });

    test(
        '''_ValidatorMetadata defaultErrorMessage should same with expectedDefaultErrorMessage ''',
        () {
      expect(
        validatorMetadataToTest.defaultErrorMessage,
        expectedDefaultErrorMessage,
      );
    });

    test(
        '''when error message not supplied in _ValidatorMetadata, should return defaultErrorMessage''',
        () {
      final validatorMetadataWithoutErrorMessage = _ValidatorMetadata();
      expect(
        validatorMetadataWithoutErrorMessage.errorMessage,
        expectedDefaultErrorMessage,
      );
    });

    test(
        '''when error message not supplied in _ValidatorMetadata, should return defaultErrorMessage''',
        () {
      final validatorMetadataWithoutErrorMessage = _ValidatorMetadata();
      expect(
        validatorMetadataWithoutErrorMessage.fieldName,
        isNull,
      );
    });
  });
}
