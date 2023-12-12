import 'package:test/test.dart';
import 'package:validator_annotation/utils/validation/numeric_validation/validate_min_max_value.dart';

void main() {
  group('validateMinMaxValue', () {
    test('should return true for values within the range', () {
      expect(validateMinMaxValue(value: 5, minValue: 0, maxValue: 10), isTrue);
      expect(
        validateMinMaxValue(value: 7.5, minValue: 5, maxValue: 10),
        isTrue,
      );
    });

    test('should return false for values outside the range', () {
      expect(
        validateMinMaxValue(value: 15, minValue: 0, maxValue: 10),
        isFalse,
      );
      expect(validateMinMaxValue(value: 3, minValue: 5, maxValue: 10), isFalse);
    });

    test('should throw assertion error for invalid range', () {
      expect(
        () => validateMinMaxValue(value: 5, minValue: 10, maxValue: 5),
        throwsA(isA<Exception>()),
      );
    });
  });

  group('validateMaxValue', () {
    test('should return true for values less than or equal to maxValue', () {
      expect(validateMaxValue(value: 5, maxValue: 10), isTrue);
      expect(validateMaxValue(value: 7.5, maxValue: 10), isTrue);
      expect(validateMaxValue(value: 10, maxValue: 10), isTrue);
    });

    test('should return false for values greater than maxValue', () {
      expect(validateMaxValue(value: 15, maxValue: 10), isFalse);
      expect(validateMaxValue(value: 12.5, maxValue: 10), isFalse);
    });
  });

  group('validateMinValue', () {
    test('should return true for values greater than or equal to minValue', () {
      expect(validateMinValue(value: 5, minValue: 0), isTrue);
      expect(validateMinValue(value: 7.5, minValue: 5), isTrue);
      expect(validateMinValue(value: 0, minValue: 0), isTrue);
    });

    test('should return false for values less than minValue', () {
      expect(validateMinValue(value: 3, minValue: 5), isFalse);
      expect(validateMinValue(value: -2.5, minValue: 0), isFalse);
    });
  });
}
