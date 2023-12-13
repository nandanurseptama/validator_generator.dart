// ignore_for_file: avoid_dynamic_calls

import 'package:test/test.dart';
import 'package:validator_annotation/validator_annotation.dart';

void main() {
  late ValidationData validationDataToTest;
  late String expectedSymbol;
  late String expectedValueToValidate;
  late List<ValidatorAnnotation> expectedValidatorMetadatas;

  setUpAll(() {
    expectedSymbol = 'userName';
    expectedValueToValidate = 'nandanurseptama';

    expectedValidatorMetadatas = [
      const IsNotEmptyStringValidator(),
      const MinMaxStringLengthValidator(
        minLength: 3,
        maxLength: 24,
      ),
    ];

    validationDataToTest = ValidationData(
      instanceMemberSymbol: expectedSymbol,
      valueToValidate: expectedValueToValidate,
      annotations: expectedValidatorMetadatas,
    );
  });

  group('ValidationData', () {
    test('all properties should be same with expected', () {
      expect(
        expectedSymbol,
        validationDataToTest.instanceMemberSymbol,
      );
      expect(validationDataToTest.instanceMemberSymbol, isA<String>());

      expect(
        validationDataToTest.valueToValidate,
        expectedValueToValidate,
      );

      expect(
        validationDataToTest.annotations,
        expectedValidatorMetadatas,
      );

      expect(
        validationDataToTest.annotations,
        isA<List<ValidatorAnnotation>>(),
      );

      expect(
        validationDataToTest.annotations,
        expectedValidatorMetadatas,
      );

      expect(
        validationDataToTest.valueToValidate.runtimeType,
        expectedValueToValidate.runtimeType,
      );
    });

    });
}
