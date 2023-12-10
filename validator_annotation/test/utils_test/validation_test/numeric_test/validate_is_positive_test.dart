import 'package:validator_annotation/utils/validation/numeric_validation/validate_is_positive.dart';
import 'package:test/test.dart';

void main() {
  group('validateIsPositive Test', () {
    test('should return true for positive values', () {
      expect(validateIsPositive(5), isTrue);
      expect(validateIsPositive(10.5), isTrue);
      expect(validateIsPositive(0.01), isTrue);
    });

    test('should return false for non-positive values', () {
      expect(validateIsPositive(0), isFalse);
      expect(validateIsPositive(-5), isFalse);
      expect(validateIsPositive(-10.5), isFalse);
    });
  });
}
