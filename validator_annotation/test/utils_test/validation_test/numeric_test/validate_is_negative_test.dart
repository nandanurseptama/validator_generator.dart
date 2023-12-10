import 'package:validator_annotation/utils/validation/numeric_validation/validate_is_negative.dart';
import 'package:test/test.dart';

void main() {
  group('validateIsNegative Test', () {
    test('should return true for negative values', () {
      expect(validateIsNegative(-5), isTrue);
      expect(validateIsNegative(-10.5), isTrue);
      expect(validateIsNegative(-0.01), isTrue);
    });

    test('should return false for non-negative values', () {
      expect(validateIsNegative(0), isFalse);
      expect(validateIsNegative(5), isFalse);
      expect(validateIsNegative(10.5), isFalse);
    });
  });
}
