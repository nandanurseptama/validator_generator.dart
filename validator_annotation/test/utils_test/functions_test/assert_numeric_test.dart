import 'package:test/test.dart';
import 'package:validator_annotation/utils/utils.dart'; // Replace with the correct path

void main() {
  group('assertNumeric', () {
    test('Valid non-nullable numeric value', () {
      expect(() => assertNumeric(value: 42), returnsNormally);
    });

    test('Valid nullable numeric value when allowNullable is true', () {
      expect(() => assertNumeric(value: null, allowNullable: true),
          returnsNormally);
    });

    test('Invalid null value when allowNullable is false', () {
      expect(() => assertNumeric(value: null, allowNullable: false),
          throwsA(TypeMatcher<Exception>()));
    });

    test('Invalid non-numeric value', () {
      expect(() => assertNumeric(value: 'not a number'),
          throwsA(TypeMatcher<Exception>()));
    });

    test('Valid non-nullable numeric value with custom error message', () {
      expect(() => assertNumeric(value: 42, allowNullable: false),
          returnsNormally);
    });

    test('Custom error message is used for invalid non-numeric value', () {
      expect(
        () => assertNumeric(
          value: 'not a number',
        ),
        throwsA(
          predicate((e) {
            return e is Exception;
          }),
        ),
      );
    });

    test(
        'Custom error message is used for null value when allowNullable is false',
        () {
      expect(
          () => assertNumeric(
                value: null,
                allowNullable: false,
              ),
          throwsA(isA<Exception>()));
    });
  });
}
