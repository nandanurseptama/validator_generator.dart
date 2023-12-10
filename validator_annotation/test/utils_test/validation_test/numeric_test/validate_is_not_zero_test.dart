import 'package:validator_annotation/utils/validation/numeric_validation/validate_is_not_zero.dart';
import 'package:test/test.dart';

void main() {
  group('validateIsNotZero', () {
    test('should return true for non-zero values', () {
      expect(validateIsNotZero(-5), isTrue);
      expect(validateIsNotZero(5), isTrue);
      expect(validateIsNotZero(-10.5), isTrue);
      expect(validateIsNotZero(10.5), isTrue);
    });

    test('should return false for zero values', () {
      expect(validateIsNotZero(0), isFalse);
      expect(validateIsNotZero(0.0), isFalse);
    });
  });
}
