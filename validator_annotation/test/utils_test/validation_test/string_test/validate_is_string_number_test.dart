import 'package:test/test.dart';
import 'package:validator_annotation/utils/validation/string_validation/validate_is_string_number.dart';

void main() {
  group('validate is string number tests', () {
    late List<String> positiveTestCases;
    late List<String> positiveTestCasesInt;
    late List<String> positiveTestCaseDouble;

    late List<String> negativeTestCases;
    late List<String> negativeTestCasesInt;
    late List<String> negativeTestCasesDouble;

    setUpAll(() {
      positiveTestCasesInt = ['1', '2', '100', '200', '-1', '-2'];
      positiveTestCaseDouble = [
        '1.0',
        '222.0',
        '33.000',
        '0.1',
        '0.0001',
        '-200.0',
        '-0.001',
      ];

      positiveTestCases = [
        ...positiveTestCasesInt,
        ...positiveTestCaseDouble,
      ];

      negativeTestCases = [
        'aaa.aaa.aaa',
        ';;--',
        '    ',
        '\t',
        'N a N D.A',
        '1.000.000.000',
        '00.00.001',
        '0.0.1',
        '1.2.3.4',
      ];

      negativeTestCasesInt = [
        '1.0',
        '0.22',
        '1.0000.000....0',
        ...negativeTestCases,
      ];

      negativeTestCasesDouble = [
        '1.000.000',
        '0.000.1',
        '-',
        ...negativeTestCases,
      ];
    });

    test('all positive test cases should valid numeric', () {
      for (var v in positiveTestCases) {
        final result = validateIsStringNumber(
          value: v,
        );
        expect(
          result,
          true,
        );
      }
    });

    test('all positive test cases int should be valid int', () {
      for (var v in positiveTestCasesInt) {
        final result = validateIsStringInteger(
          value: v,
        );
        expect(
          result,
          true,
        );
      }
    });

    test('all positive test cases double should be valid double', () {
      for (var v in positiveTestCaseDouble) {
        final result = validateIsStringDouble(
          value: v,
        );
        expect(
          result,
          true,
        );
      }
    });

    test('all negative cases should be invalid numeric', () {
      for (var v in negativeTestCases) {
        final result = validateIsStringNumber(
          value: v,
        );
        expect(
          result,
          false,
        );
      }
    });

    test('all negative cases int should be invalid int', () {
      for (var v in negativeTestCasesInt) {
        final result = validateIsStringInteger(
          value: v,
        );
        expect(
          result,
          false,
        );
      }
    });

    test('all negative cases double should be invalid double', () {
      for (var v in negativeTestCasesDouble) {
        final result = validateIsStringDouble(
          value: v,
        );
        expect(
          result,
          false,
        );
      }
    });
  });
}
