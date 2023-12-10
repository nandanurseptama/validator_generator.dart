import 'package:test/test.dart';
import 'package:validator_annotation/utils/validation/numeric_validation/validate_is_not_positive.dart';

void main() {
  group('validateIsNotPositive Test', () {
    test('should return true for non-positive values', () {
      expect(validateIsNotPositive(0), isTrue);
      expect(validateIsNotPositive(-5), isTrue);
      expect(validateIsNotPositive(-10.5), isTrue);
    });

    test('should return false for positive values', () {
      expect(validateIsNotPositive(1), isFalse);
      expect(validateIsNotPositive(5), isFalse);
      expect(validateIsNotPositive(10.5), isFalse);
    });
  });
}
