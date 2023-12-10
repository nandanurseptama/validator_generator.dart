import 'package:validator_annotation/utils/validation/validation.dart';
import 'package:test/test.dart';

void main() {
  var positiveTestCases = <String?>[
    null,
    "",
  ];

  var negativeTestCases = <String>["a", ";"];

  var whitespaceTestCases = [
    " ",
    "\t",
  ];

  group("Validate is empty test", () {
    test(
      "when excluding white space is false, should only accept null or string empty",
      () {
        for (var testCase in positiveTestCases) {
          var result = validateIsEmpty(
            excludeWhiteSpace: false,
            value: testCase,
          );
          expect(
            result,
            true,
          );
        }
      },
    );
    test("when excluding white space is true, accept white space too", () {
      for (var testCase in whitespaceTestCases) {
        var result = validateIsEmpty(
          excludeWhiteSpace: true,
          value: testCase,
        );
        expect(
          result,
          true,
        );
      }
    });

    test(
      "when excluding white space is false, should only accept null or string empty",
      () {
        for (var testCase in negativeTestCases) {
          var result = validateIsEmpty(
            excludeWhiteSpace: false,
            value: testCase,
          );
          expect(
            result,
            false,
          );
        }
      },
    );
  });
}
