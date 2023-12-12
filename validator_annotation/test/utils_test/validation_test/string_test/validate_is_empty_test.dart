import 'package:test/test.dart';
import 'package:validator_annotation/utils/validation/validation.dart';

void main() {
  final positiveTestCases = <String?>[
    null,
    '',
  ];

  final negativeTestCases = <String>['a', ';'];

  final whitespaceTestCases = [
    ' ',
    '\t',
  ];

  group('Validate is empty test', () {
    test(
      '''when excluding white space is false, should only accept null or string empty''',
      () {
        for (var testCase in positiveTestCases) {
          final result = validateIsEmpty(
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
    test('when excluding white space is true, accept white space too', () {
      for (var testCase in whitespaceTestCases) {
        final result = validateIsEmpty(
          value: testCase,
        );
        expect(
          result,
          true,
        );
      }
    });

    test(
      '''when excluding white space is false, should only accept null or string empty''',
      () {
        for (var testCase in negativeTestCases) {
          final result = validateIsEmpty(
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
