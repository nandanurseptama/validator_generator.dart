import 'package:test/test.dart';
import 'package:validator_annotation/utils/classes/validator_options.dart';

void main() {
  late ValidatorOptions validatorOptionsToTest;
  late bool expectedStopWhenFirstError;
  setUpAll(() {
    expectedStopWhenFirstError = true;
    validatorOptionsToTest = ValidatorOptions(
      stopWhenFirstError: expectedStopWhenFirstError,
    );
  });

  group("ValidatorOptions", () {
    test("validator options cunstructor should run without error", () {
      expect(
        () => ValidatorOptions(),
        returnsNormally,
      );
    });

    test("all properties should be match with expected values", () {
      expect(
        validatorOptionsToTest.stopWhenFirstError,
        expectedStopWhenFirstError,
      );
    });

    test(
        "when two differences instance have difference property value, should not match",
        () {
      var validatorOptionsMatcher = ValidatorOptions();
      expect(
        validatorOptionsToTest.props == validatorOptionsMatcher.props,
        isFalse,
      );
      expect(
        validatorOptionsMatcher == validatorOptionsToTest,
        isFalse,
      );
    });
  });
}
