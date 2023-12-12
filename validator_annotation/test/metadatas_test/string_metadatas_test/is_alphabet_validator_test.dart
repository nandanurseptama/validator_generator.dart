import 'package:test/test.dart';
import 'package:validator_annotation/validator_annotation.dart';

void main() {
  internalMetadataTest();
}

void internalMetadataTest() {
  group('Internal IsAlphabetValidator Test', () {
    test('should pass for valid alphabets', () {
      const validator = IsAlphabetValidator();

      expect(validator.isValid('abc'), isTrue);
      expect(validator.isValid('xyz'), isTrue);
      expect(validator.isValid('ABC'), isTrue);
      expect(validator.isValid('XYZ'), isTrue);
      expect(
        validator.isValid('a b c'),
        isTrue,
        reason: 'Whitespace allowed',
      );
      expect(
        validator.isValid('a\nb\nc'),
        isTrue,
        reason: 'Multiline allowed',
      );
      expect(
        validator.isValid('aBc'),
        isTrue,
        reason: 'Mixed case allowed',
      );
    });

    test('should fail for invalid alphabets', () {
      const validator = IsAlphabetValidator();

      expect(() => validator.isValid(123), throwsA(isA<Exception>()));

      expect(validator.isValid('123'), isFalse);
      expect(validator.isValid('abc123'), isFalse);
      expect(
        validator.isValid('abc 123'),
        isFalse,
        reason: 'Numeric not allowed',
      );
      expect(
        validator.isValid('a_b_c'),
        isFalse,
        reason: 'Special characters not allowed',
      );
    });

    test('should replace whitespace if trimWhiteSpace is true', () {
      const validator = IsAlphabetValidator();
      expect(validator.isValid('a b c'), isTrue, reason: 'Whitespace trimmed');
    });

    test('should not replace whitespace if trimWhiteSpace is false', () {
      const validator = IsAlphabetValidator(trimWhiteSpace: false);
      expect(
        validator.isValid('a b c'),
        isFalse,
      );
    });

    test('should have custom error message', () {
      const validator =
          IsAlphabetValidator(errorMessage: 'Custom error message');
      expect(validator.errorMessage, 'Custom error message');
    });

    test('should handle nullable values when allowNullable is true', () {
      const validator = IsAlphabetValidator();

      expect(
        () => validator.isValid(null),
        returnsNormally,
        reason: 'Nullable not allowed',
      );
      expect(
        validator.isValid('abc'),
        true,
        reason: 'Valid string',
      );
    });

    test(
        '''should throw exception for non-string values when allowNullable is false''',
        () {
      const validator = IsAlphabetValidator();

      expect(() => validator.isValid(null), returnsNormally);
      expect(() => validator.isValid(123), throwsA(isA<Exception>()));
    });
  });
}
