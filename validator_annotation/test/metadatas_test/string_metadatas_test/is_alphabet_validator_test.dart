import 'package:test/test.dart';
import 'package:validator_annotation/validator_annotation.dart';

void main() {
  internalMetadataTest();
}

void internalMetadataTest() {
  group('Internal IsAlphabetValidator Test', () {
    test('should pass for valid alphabets', () {
      const validator = IsAlphabetValidator();

      expect(validator.validate('abc'), isTrue);
      expect(validator.validate('xyz'), isTrue);
      expect(validator.validate('ABC'), isTrue);
      expect(validator.validate('XYZ'), isTrue);
      expect(validator.validate('a b c'), isTrue, reason: 'Whitespace allowed');
      expect(validator.validate('a\nb\nc'), isTrue,
          reason: 'Multiline allowed',);
      expect(validator.validate('aBc'), isTrue, reason: 'Mixed case allowed');
    });

    test('should fail for invalid alphabets', () {
      const validator = IsAlphabetValidator();

      expect(() => validator.validate(123), throwsA(isA<Exception>()));

      expect(validator.validate('123'), isFalse);
      expect(validator.validate('abc123'), isFalse);
      expect(validator.validate('abc 123'), isFalse,
          reason: 'Numeric not allowed',);
      expect(validator.validate('a_b_c'), isFalse,
          reason: 'Special characters not allowed',);
    });

    test('should replace whitespace if trimWhiteSpace is true', () {
      const validator = IsAlphabetValidator();
      expect(validator.validate('a b c'), isTrue, reason: 'Whitespace trimmed');
    });

    test('should not replace whitespace if trimWhiteSpace is false', () {
      const validator = IsAlphabetValidator(trimWhiteSpace: false);
      expect(validator.validate('a b c'), isFalse,
          reason: 'Whitespace not trimmed',);
    });

    test('should have custom error message', () {
      const validator =
          IsAlphabetValidator(errorMessage: 'Custom error message');
      expect(validator.errorMessage, 'Custom error message');
    });

    test('should handle nullable values when allowNullable is true', () {
      const validator = IsAlphabetValidator();

      expect(
        () => validator.validate(null),
        throwsA(
          isA<Exception>(),
        ),
        reason: 'Nullable not allowed',
      );
      expect(
        validator.validate('abc'),
        isTrue,
        reason: 'Valid string',
      );
    });

    test(
        '''should throw exception for non-string values when allowNullable is false''',
        () {
      const validator = IsAlphabetValidator();

      expect(() => validator.validate(null), throwsA(isA<Exception>()));
      expect(() => validator.validate(123), throwsA(isA<Exception>()));
    });
  });
}
